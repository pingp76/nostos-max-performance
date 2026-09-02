#!/usr/bin/env node

const crypto = require('crypto');
const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

const projectRoot = path.resolve(__dirname, '..');
const simplePath = path.join(projectRoot, 'nostos.tosc');
const outputPath = path.join(projectRoot, 'nostos_full.tosc');
const previewPath = path.join(projectRoot, 'docs', 'images', 'touchosc-interface.svg');

// Prefer a full rebuild when the simple source layout exists. If only the
// already generated full layout remains, preserve all of its controls and
// update just the root feedback script below.
if (fs.existsSync(simplePath)) require('./generate_nostos_touchosc.js');

const palette = {
  bg: [0.025, 0.035, 0.07, 1], panel: [0.07, 0.09, 0.16, 1], text: [0.9, 0.93, 1, 1],
  muted: [0.55, 0.62, 0.75, 1], purple: [0.62, 0.24, 0.86, 1], blue: [0.15, 0.48, 0.95, 1],
  orange: [0.92, 0.38, 0.12, 1], green: [0.13, 0.68, 0.5, 1], red: [0.88, 0.15, 0.23, 1],
  cyan: [0.1, 0.68, 0.78, 1], gray: [0.28, 0.32, 0.42, 1],
};

function cdata(value) {
  const text = String(value);
  if (text.includes(']]>')) throw new Error('CDATA terminator is not allowed');
  return `<![CDATA[${text}]]>`;
}

function stableId(name) {
  const hex = crypto.createHash('sha1').update(`nostos-touchosc:${name}`).digest('hex').slice(0, 32).split('');
  hex[12] = '5';
  hex[16] = ((parseInt(hex[16], 16) & 0x3) | 0x8).toString(16);
  const joined = hex.join('');
  return `${joined.slice(0, 8)}-${joined.slice(8, 12)}-${joined.slice(12, 16)}-${joined.slice(16, 20)}-${joined.slice(20)}`;
}

function property(type, key, value) {
  if (type === 's') return `<property type='s'><key>${cdata(key)}</key><value>${cdata(value)}</value></property>`;
  if (type === 'b') return `<property type='b'><key>${cdata(key)}</key><value>${value ? 1 : 0}</value></property>`;
  if (type === 'i' || type === 'f') return `<property type='${type}'><key>${cdata(key)}</key><value>${value}</value></property>`;
  if (type === 'c') {
    const [r, g, b, a] = value;
    return `<property type='c'><key>${cdata(key)}</key><value><r>${r}</r><g>${g}</g><b>${b}</b><a>${a}</a></value></property>`;
  }
  if (type === 'r') {
    const [x, y, w, h] = value;
    return `<property type='r'><key>${cdata(key)}</key><value><x>${x}</x><y>${y}</y><w>${w}</w><h>${h}</h></value></property>`;
  }
  throw new Error(`Unsupported property type ${type}`);
}

function valueXml(key, defaultValue, lockedDefaultCurrent = 0) {
  return `<value><key>${cdata(key)}</key><locked>0</locked><lockedDefaultCurrent>${lockedDefaultCurrent}</lockedDefaultCurrent><default>${cdata(defaultValue)}</default><defaultPull>0</defaultPull></value>`;
}

const defaults = {
  LABEL: { background: ['b', false], font: ['i', 0], outline: ['b', false], shape: ['i', 1], textAlignH: ['i', 1], textAlignV: ['i', 1], textClip: ['b', true], textColor: ['c', palette.text], textLength: ['i', 0], textSize: ['i', 14] },
  BUTTON: { background: ['b', true], buttonType: ['i', 0], press: ['b', true], release: ['b', true], shape: ['i', 1], valuePosition: ['b', false] },
  FADER: { background: ['b', true], bar: ['b', true], barDisplay: ['i', 0], cursor: ['b', true], cursorDisplay: ['i', 0], grid: ['b', false], gridSteps: ['i', 10], response: ['i', 0], responseFactor: ['i', 100], shape: ['i', 1], valuePosition: ['b', false] },
};

function node(def) {
  const props = { ...(defaults[def.type] || {}) };
  Object.assign(props, {
    color: ['c', def.color || palette.gray], cornerRadius: ['f', 3], frame: ['r', def.frame],
    grabFocus: ['b', def.interactive !== false], interactive: ['b', def.interactive !== false], locked: ['b', false],
    name: ['s', def.name], orientation: ['i', def.orientation || 0], outlineStyle: ['i', 0], pointerPriority: ['i', 0],
    script: ['s', def.script || ''], tag: ['s', ''], visible: ['b', true],
  });
  for (const [key, typedValue] of Object.entries(def.properties || {})) props[key] = typedValue;
  const values = def.type === 'LABEL'
    ? [valueXml('text', def.text || '', 1), valueXml('touch', 'false')]
    : [valueXml('x', def.defaultValue || 0), valueXml('touch', 'false')];
  return `<node ID='${stableId(def.name)}' type='${def.type}'><properties>${Object.keys(props).sort().map((key) => property(props[key][0], key, props[key][1])).join('')}</properties><values>${values.join('')}</values></node>`;
}

function label(name, text, frame, size = 14, color = palette.text, align = 1) {
  return node({ type: 'LABEL', name, text, frame, color: palette.bg, interactive: false, properties: { background: ['b', false], outline: ['b', false], textSize: ['i', size], textColor: ['c', color], textAlignH: ['i', align], textAlignV: ['i', 1] } });
}

function sendValue(address) {
  return `function onValueChanged(key)\n  if key == 'x' and self.values.touch then sendOSC('${address}', self.values.x) end\nend`;
}

function sendPulse(address, value) {
  return `function onValueChanged(key)\n  if key == 'x' and self.values.touch and self.values.x > 0.5 then sendOSC('${address}', ${value}) end\nend`;
}

function button(name, frame, color, script, toggle = false, defaultValue = 0) {
  return node({ type: 'BUTTON', name, frame, color, script, defaultValue, properties: { buttonType: ['i', toggle ? 2 : 0], press: ['b', true], release: ['b', !toggle] } });
}

function labelledButton(name, text, frame, color, script, toggle = false, defaultValue = 0) {
  return button(name, frame, color, script, toggle, defaultValue) + label(`label_${name}`, text, frame, text.length > 10 ? 13 : 15);
}

function fader(name, address, frame, color, defaultValue) {
  return node({ type: 'FADER', name, frame, color, orientation: 1, script: sendValue(address), defaultValue, properties: { bar: ['b', true], cursor: ['b', true], response: ['i', 0], valuePosition: ['b', false] } });
}

function replaceFrame(xml, name, frame) {
  const id = stableId(name);
  const start = xml.indexOf(`<node ID='${id}'`);
  if (start < 0) throw new Error(`Node not found: ${name}`);
  const end = xml.indexOf('</node>', start);
  const before = xml.slice(0, start);
  const block = xml.slice(start, end + 7);
  const rect = `<value><x>${frame[0]}</x><y>${frame[1]}</y><w>${frame[2]}</w><h>${frame[3]}</h></value>`;
  const updated = block.replace(/<value><x>[^<]+<\/x><y>[^<]+<\/y><w>[^<]+<\/w><h>[^<]+<\/h><\/value>/, rect);
  return before + updated + xml.slice(end + 7);
}

const receiveScript = `local function find(name)\n  return root:findByName(name, true)\nend\n\nlocal function clamp(value)\n  return math.max(0, math.min(1, tonumber(value) or 0))\nend\n\nlocal function setX(name, value)\n  local control = find(name)\n  if control then control.values.x = value end\nend\n\nlocal function setText(name, value)\n  local control = find(name)\n  if control then control.values.text = tostring(value) end\nend\n\nlocal function argumentValue(message, index)\n  local arguments = message[2]\n  if not arguments or not arguments[index] then return nil end\n  return arguments[index].value\nend\n\nlocal function setStage(value)\n  local stage = math.floor(tonumber(value) or 0)\n  local names = { [0] = 'WAITING', [1] = 'STAGE 1 · 出发／战争', [2] = 'STAGE 2 · 破碎／漂流', [3] = 'STAGE 3 · 重组／归返', [4] = 'RETURN · 完整原句' }\n  local text = names[stage] or ('STAGE ' .. tostring(stage))\n  setText('stage_value_label', text)\n  setText('status_label', text)\nend\n\nlocal function setTimer(value)\n  local total = math.max(0, math.floor(tonumber(value) or 0))\n  setText('timer_value_label', string.format('%02d:%02d', math.floor(total / 60), total % 60))\nend\n\nfunction onReceiveOSC(message, connections)\n  local path = message[1]\n  local value = argumentValue(message, 1)\n  if value == nil then return false end\n\n  if path == '/nostos/state/transport' then\n    setStage(value)\n    setTimer(argumentValue(message, 2))\n  elseif path == '/nostos/state/stage' then setStage(value)\n  elseif path == '/nostos/state/transform' then setX('transform_fader', clamp(value))\n  elseif path == '/nostos/state/density' then setX('density_fader', clamp(value))\n  elseif path == '/nostos/state/voice' then setX('voice_fader', clamp(value))\n  elseif path == '/nostos/state/bed' then setX('bed_fader', clamp(value))\n  elseif path == '/nostos/state/auto' then setX('auto_voice_toggle', clamp(value))\n  elseif path == '/nostos/state/hold' then setX('hold_toggle', clamp(value))\n  elseif path == '/nostos/state/mute' then setX('mute_toggle', clamp(value))\n  elseif path == '/nostos/state/record' then setX('record_toggle', clamp(value))\n  elseif path == '/nostos/state/dsp' then setX('dsp_toggle', clamp(value))\n  elseif path == '/nostos/state/master_db' then\n    local db = tonumber(value) or -70\n    setX('master_fader', clamp((db + 70) / 76))\n    setText('master_db_value_label', string.format('%.1f dB', db))\n  elseif path == '/nostos/state/timer_seconds' then setTimer(value)\n  end\n\n  setText('feedback_status_label', 'MAX FEEDBACK · ONLINE')\n  return false\nend`;

if (!fs.existsSync(simplePath)) {
  if (!fs.existsSync(outputPath)) throw new Error('Neither nostos.tosc nor nostos_full.tosc exists');
  let existingXml = zlib.inflateSync(fs.readFileSync(outputPath)).toString('utf8');
  const scriptMarker = "<property type='s'><key><![CDATA[script]]></key><value><![CDATA[";
  const callbackIndex = existingXml.indexOf('function onReceiveOSC(message, connections)');
  const propertyStart = existingXml.lastIndexOf(scriptMarker, callbackIndex);
  const scriptStart = propertyStart + scriptMarker.length;
  const scriptEnd = existingXml.indexOf(']]></value></property>', scriptStart);
  if (callbackIndex < 0 || propertyStart < 0 || scriptEnd < 0) throw new Error('Existing root TouchOSC feedback script not found');
  existingXml = existingXml.slice(0, scriptStart) + receiveScript + existingXml.slice(scriptEnd);
  fs.writeFileSync(outputPath, zlib.deflateSync(Buffer.from(existingXml, 'utf8'), { level: 9 }));
  console.log(JSON.stringify({ outputPath, mode: 'updated-existing-feedback-script', xmlBytes: Buffer.byteLength(existingXml), compressedBytes: fs.statSync(outputPath).size }, null, 2));
  process.exit(0);
}

let xml = zlib.inflateSync(fs.readFileSync(simplePath)).toString('utf8');
xml = xml.replace("<property type='b'><key><![CDATA[visible]]></key><value>1</value></property></properties>", `${property('s', 'script', receiveScript)}<property type='b'><key><![CDATA[visible]]></key><value>1</value></property></properties>`);
xml = xml.replace('<w>640</w><h>860</h>', '<w>640</w><h>1160</h>');
xml = replaceFrame(xml, 'main_panel', [8, 8, 624, 1144]);
xml = replaceFrame(xml, 'performance_note_1', [16, 992, 608, 26]);
xml = replaceFrame(xml, 'performance_note_2', [16, 1022, 608, 26]);
xml = replaceFrame(xml, 'connection_note', [16, 1052, 608, 24]);
xml = replaceFrame(xml, 'safety_note', [16, 1082, 608, 34]);
xml = replaceFrame(xml, 'footer_label', [16, 1124, 608, 20]);

xml = xml.replaceAll("if key == 'x' then sendOSC", "if key == 'x' and self.values.touch then sendOSC");
xml = xml.replaceAll("if key == 'x' and self.values.x > 0.5 then sendOSC", "if key == 'x' and self.values.touch and self.values.x > 0.5 then sendOSC");

const added = [];
added.push(label('full_status_section_label', 'MAX STATUS FEEDBACK · UDP 9001', [16, 632, 608, 20], 12, palette.muted, 0));
added.push(label('stage_value_label', 'WAITING', [16, 658, 190, 52], 16, palette.text));
added.push(label('timer_value_label', '00:00', [224, 654, 190, 60], 32, palette.cyan));
added.push(label('feedback_status_label', 'MAX FEEDBACK · WAITING', [432, 658, 192, 52], 13, palette.orange));
added.push(label('master_label', 'MASTER · 总输出  -70—+6 dB', [16, 726, 608, 24], 14, palette.text, 0));
added.push(fader('master_fader', '/nostos/master', [16, 756, 608, 64], palette.purple, 58 / 76));
added.push(label('master_db_value_label', '-12.0 dB', [16, 824, 608, 26], 16, palette.text));
added.push(labelledButton('hold_toggle', 'HOLD', [16, 864, 180, 64], palette.blue, sendValue('/nostos/hold'), true));
added.push(labelledButton('dsp_toggle', 'DSP', [216, 864, 180, 64], palette.green, sendValue('/nostos/dsp'), true));
added.push(labelledButton('sync_button', 'SYNC FROM MAX', [416, 864, 208, 64], palette.cyan, sendPulse('/nostos/sync', 1)));
added.push(label('full_connection_help', 'Max底部先设置iPad IP；然后按SYNC取得全部当前状态', [16, 942, 608, 28], 13, palette.muted));

const insertAt = xml.lastIndexOf('</children></node></lexml>');
if (insertAt < 0) throw new Error('Root children close marker not found');
xml = xml.slice(0, insertAt) + added.join('') + xml.slice(insertAt);

fs.writeFileSync(outputPath, zlib.deflateSync(Buffer.from(xml, 'utf8'), { level: 9 }));

function rgba(color) {
  const [r, g, b, a] = color;
  return `rgba(${Math.round(r * 255)},${Math.round(g * 255)},${Math.round(b * 255)},${a})`;
}

const svg = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="640" height="1160" viewBox="0 0 640 1160">
  <rect width="640" height="1160" fill="${rgba(palette.bg)}"/>
  <rect x="8" y="8" width="624" height="1144" rx="10" fill="${rgba(palette.panel)}" stroke="${rgba(palette.muted)}"/>
  <text x="320" y="38" fill="white" font-size="22" text-anchor="middle">NOSTOS FULL · 一句话的返航</text>
  <text x="320" y="66" fill="${rgba(palette.muted)}" font-size="14" text-anchor="middle">双向 OSC：SEND 9000 · RECEIVE 9001</text>
  ${[
    [16,100,140,58,palette.red,'RECORD'],[172,100,140,58,palette.cyan,'PLAY ORIGINAL'],[328,100,140,58,palette.gray,'RESET'],[484,100,140,58,palette.red,'MUTE'],
    [16,192,140,64,palette.blue,'STAGE 1'],[172,192,140,64,palette.orange,'STAGE 2'],[328,192,140,64,[0.8,0.65,0.28,1],'STAGE 3'],[484,192,140,64,palette.green,'RETURN'],
    [16,414,136,62,palette.purple,'EVENT A'],[164,414,136,62,palette.blue,'EVENT B'],[312,414,172,62,palette.orange,'BED PARTICLE'],[496,414,128,62,palette.green,'AUTO VOICE'],
  ].map(([x,y,w,h,c,t]) => `<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="8" fill="${rgba(c)}"/><text x="${x+w/2}" y="${y+h/2+5}" fill="white" font-size="13" font-weight="bold" text-anchor="middle">${t}</text>`).join('\n')}
  <rect x="16" y="302" width="608" height="72" rx="8" fill="${rgba(palette.purple)}"/><text x="16" y="291" fill="white" font-size="15">TRANSFORM</text>
  ${[[16,'DENSITY',palette.orange],[224,'VOICE',palette.blue],[432,'BED',[0.8,0.65,0.28,1]]].map(([x,t,c]) => `<text x="${x}" y="542" fill="white" font-size="13">${t}</text><rect x="${x}" y="550" width="190" height="66" rx="7" fill="${rgba(c)}"/>`).join('\n')}
  <text x="16" y="647" fill="${rgba(palette.muted)}" font-size="12">MAX STATUS FEEDBACK · UDP 9001</text>
  <text x="111" y="690" fill="white" font-size="16" text-anchor="middle">WAITING</text>
  <text x="319" y="697" fill="${rgba(palette.cyan)}" font-size="32" text-anchor="middle">00:00</text>
  <text x="528" y="690" fill="${rgba(palette.orange)}" font-size="13" text-anchor="middle">FEEDBACK WAITING</text>
  <text x="16" y="746" fill="white" font-size="14">MASTER · -70—+6 dB</text><rect x="16" y="756" width="608" height="64" rx="8" fill="${rgba(palette.purple)}"/>
  <text x="320" y="846" fill="white" font-size="16" text-anchor="middle">-12.0 dB</text>
  ${[[16,180,palette.blue,'HOLD'],[216,180,palette.green,'DSP'],[416,208,palette.cyan,'SYNC FROM MAX']].map(([x,w,c,t]) => `<rect x="${x}" y="864" width="${w}" height="64" rx="8" fill="${rgba(c)}"/><text x="${x+w/2}" y="902" fill="white" font-size="14" font-weight="bold" text-anchor="middle">${t}</text>`).join('\n')}
  <text x="320" y="960" fill="${rgba(palette.muted)}" font-size="13" text-anchor="middle">Max底部设置iPad IP，然后按SYNC</text>
  <text x="320" y="1106" fill="${rgba(palette.red)}" font-size="16" text-anchor="middle">异常声音：立即按 MUTE</text>
</svg>`;
fs.writeFileSync(previewPath, svg);

console.log(JSON.stringify({ outputPath, previewPath, xmlBytes: Buffer.byteLength(xml), compressedBytes: fs.statSync(outputPath).size, addedNodes: added.length }, null, 2));
