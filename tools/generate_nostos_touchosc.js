#!/usr/bin/env node

const crypto = require('crypto');
const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

const projectRoot = path.resolve(__dirname, '..');
const templatePath = path.join(projectRoot, 'nostos.blank.tosc');
const outputPath = path.join(projectRoot, 'nostos.tosc');
const previewPath = path.join(projectRoot, 'docs', 'images', 'touchosc-interface-simple.svg');

const palette = {
  bg: [0.025, 0.035, 0.07, 1],
  panel: [0.07, 0.09, 0.16, 1],
  text: [0.9, 0.93, 1, 1],
  muted: [0.55, 0.62, 0.75, 1],
  purple: [0.62, 0.24, 0.86, 1],
  blue: [0.15, 0.48, 0.95, 1],
  orange: [0.92, 0.38, 0.12, 1],
  sand: [0.8, 0.65, 0.28, 1],
  green: [0.13, 0.68, 0.5, 1],
  red: [0.88, 0.15, 0.23, 1],
  cyan: [0.1, 0.68, 0.78, 1],
  gray: [0.28, 0.32, 0.42, 1],
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

function valueXml(key, defaultValue) {
  return `<value><key>${cdata(key)}</key><locked>0</locked><lockedDefaultCurrent>0</lockedDefaultCurrent><default>${cdata(defaultValue)}</default><defaultPull>0</defaultPull></value>`;
}

const typeDefaults = {
  BOX: { background: ['b', true], outline: ['b', false], shape: ['i', 1] },
  LABEL: { background: ['b', false], font: ['i', 0], outline: ['b', false], shape: ['i', 1], textAlignH: ['i', 1], textAlignV: ['i', 1], textClip: ['b', true], textColor: ['c', palette.text], textLength: ['i', 0], textSize: ['i', 14] },
  BUTTON: { background: ['b', true], buttonType: ['i', 0], press: ['b', true], release: ['b', true], shape: ['i', 1], valuePosition: ['b', false] },
  FADER: { background: ['b', true], bar: ['b', true], barDisplay: ['i', 0], cursor: ['b', true], cursorDisplay: ['i', 0], grid: ['b', false], gridSteps: ['i', 10], response: ['i', 0], responseFactor: ['i', 100], shape: ['i', 1], valuePosition: ['b', false] },
};

const propertyTypes = {
  background: 'b', outline: 'b', bar: 'b', cursor: 'b', grid: 'b', press: 'b', release: 'b', valuePosition: 'b', textClip: 'b',
  buttonType: 'i', shape: 'i', textSize: 'i', textAlignH: 'i', textAlignV: 'i', font: 'i', textLength: 'i', barDisplay: 'i', cursorDisplay: 'i', gridSteps: 'i', response: 'i', responseFactor: 'i', orientation: 'i', outlineStyle: 'i', pointerPriority: 'i',
  cornerRadius: 'f', color: 'c', textColor: 'c', frame: 'r', name: 's', script: 's', tag: 's',
};

function node(def) {
  const props = { ...(typeDefaults[def.type] || {}) };
  props.color = ['c', def.color || palette.gray];
  props.cornerRadius = ['f', def.cornerRadius ?? 3];
  props.frame = ['r', def.frame];
  props.grabFocus = ['b', def.interactive !== false];
  props.interactive = ['b', def.interactive !== false];
  props.locked = ['b', false];
  props.name = ['s', def.name];
  props.orientation = ['i', def.orientation ?? 0];
  props.outlineStyle = ['i', 0];
  props.pointerPriority = ['i', 0];
  props.script = ['s', def.script || ''];
  props.tag = ['s', def.tag || ''];
  props.visible = ['b', true];
  for (const [key, value] of Object.entries(def.properties || {})) props[key] = [propertyTypes[key] || 's', value];

  const values = def.type === 'LABEL'
    ? [valueXml('text', def.text || '') , valueXml('touch', 'false')]
    : def.type === 'BUTTON' || def.type === 'FADER'
      ? [valueXml('x', def.defaultValue ?? 0), valueXml('touch', 'false')]
      : [valueXml('touch', 'false')];

  return `<node ID='${stableId(def.name)}' type='${def.type}'><properties>${Object.keys(props).sort().map((key) => property(props[key][0], key, props[key][1])).join('')}</properties><values>${values.join('')}</values></node>`;
}

function sendValue(address) {
  return `function onValueChanged(key)\n  if key == 'x' then sendOSC('${address}', self.values.x) end\nend`;
}

function sendPulse(address, value) {
  return `function onValueChanged(key)\n  if key == 'x' and self.values.x > 0.5 then sendOSC('${address}', ${value}) end\nend`;
}

function stageScript(stage, preset, status) {
  return `local function setValue(name, value)\n  local control = root:findByName(name, true)\n  if control then control.values.x = value end\nend\n\nfunction onValueChanged(key)\n  if key == 'x' and self.values.x > 0.5 then\n    setValue('transform_fader', ${preset.transform})\n    setValue('density_fader', ${preset.density})\n    setValue('voice_fader', ${preset.voice})\n    setValue('bed_fader', ${preset.bed})\n    setValue('auto_voice_toggle', ${preset.auto})\n    local statusLabel = root:findByName('status_label', true)\n    if statusLabel then statusLabel.values.text = '${status}' end\n    sendOSC('/nostos/stage', ${stage})\n  end\nend`;
}

function button(def) {
  return node({
    type: 'BUTTON', name: def.name, frame: def.frame, color: def.color, script: def.script,
    defaultValue: def.defaultValue ?? 0,
    properties: { buttonType: def.toggle ? 2 : 0, press: true, release: !def.toggle },
  });
}

function label(name, text, frame, size = 14, color = palette.text, align = 1) {
  return node({ type: 'LABEL', name, text, frame, color: palette.bg, interactive: false, properties: { background: false, outline: false, textSize: size, textColor: color, textAlignH: align, textAlignV: 1 } });
}

function labelledButton(name, text, frame, color, script, toggle = false, defaultValue = 0) {
  return button({ name, frame, color, script, toggle, defaultValue }) + label(`label_${name}`, text, frame, text.length > 12 ? 13 : 15);
}

function fader(name, address, frame, color, defaultValue) {
  return node({ type: 'FADER', name, frame, color, orientation: 1, script: sendValue(address), defaultValue, properties: { bar: true, cursor: true, response: 0, valuePosition: false } });
}

const children = [];
children.push(node({ type: 'BOX', name: 'main_panel', frame: [8, 8, 624, 844], color: palette.panel, interactive: false, properties: { background: true, outline: true } }));
children.push(label('title_label', 'NOSTOS · 一句话的返航', [16, 14, 608, 34], 22, palette.text));
children.push(label('status_label', 'WAITING · 等待录音', [16, 48, 608, 24], 14, palette.muted));

children.push(label('transport_section_label', 'RECORD / PLAY / SAFETY', [16, 76, 608, 20], 12, palette.muted, 0));
children.push(labelledButton('record_toggle', 'RECORD', [16, 100, 140, 58], palette.red, sendValue('/nostos/record'), true));
children.push(labelledButton('play_original_button', 'PLAY ORIGINAL', [172, 100, 140, 58], palette.cyan, sendPulse('/nostos/play', 1)));
children.push(labelledButton('reset_button', 'RESET', [328, 100, 140, 58], palette.gray, sendPulse('/nostos/reset', 1)));
children.push(labelledButton('mute_toggle', 'MUTE', [484, 100, 140, 58], palette.red, sendValue('/nostos/mute'), true));

children.push(label('stage_section_label', 'SCENES · 场景', [16, 168, 608, 20], 12, palette.muted, 0));
children.push(labelledButton('stage_1_button', 'STAGE 1', [16, 192, 140, 64], palette.blue, stageScript(1, { transform: 0.25, density: 0.35, voice: 0.75, bed: 0.55, auto: 1 }, 'STAGE 1 · 出发／战争')));
children.push(labelledButton('stage_2_button', 'STAGE 2', [172, 192, 140, 64], palette.orange, stageScript(2, { transform: 0.70, density: 0.55, voice: 0.70, bed: 0.45, auto: 1 }, 'STAGE 2 · 破碎／漂流')));
children.push(labelledButton('stage_3_button', 'STAGE 3', [328, 192, 140, 64], palette.sand, stageScript(3, { transform: 0.85, density: 0.30, voice: 0.80, bed: 0.40, auto: 1 }, 'STAGE 3 · 重组／归返')));
children.push(labelledButton('return_button', 'RETURN', [484, 192, 140, 64], palette.green, stageScript(4, { transform: 0, density: 0.30, voice: 0.80, bed: 0.20, auto: 0 }, 'RETURN · 完整原句')));

children.push(label('transform_label', 'TRANSFORM · 主要表演推子  0 清晰 — 1 强变形', [16, 270, 608, 26], 15, palette.text, 0));
children.push(fader('transform_fader', '/nostos/transform', [16, 302, 608, 72], palette.purple, 0.25));

children.push(label('events_section_label', 'EVENTS · 事件', [16, 388, 608, 20], 12, palette.muted, 0));
children.push(labelledButton('event_a_button', 'EVENT A', [16, 414, 136, 62], palette.purple, sendPulse('/nostos/event', 1)));
children.push(labelledButton('event_b_button', 'EVENT B', [164, 414, 136, 62], palette.blue, sendPulse('/nostos/event', 2)));
children.push(labelledButton('bed_particle_button', 'BED PARTICLE', [312, 414, 172, 62], palette.orange, sendPulse('/nostos/bed_particle', 1)));
children.push(labelledButton('auto_voice_toggle', 'AUTO VOICE', [496, 414, 128, 62], palette.green, sendValue('/nostos/auto'), true, 1));

children.push(label('mixer_section_label', 'REHEARSAL MIX · 排练调试（正式简化谱通常不移动）', [16, 492, 608, 22], 12, palette.muted, 0));
children.push(label('density_label', 'DENSITY · 密度', [16, 522, 190, 22], 13, palette.text, 0));
children.push(label('voice_label', 'VOICE · 人声', [224, 522, 190, 22], 13, palette.text, 0));
children.push(label('bed_label', 'BED · 背景', [432, 522, 192, 22], 13, palette.text, 0));
children.push(fader('density_fader', '/nostos/density', [16, 550, 190, 66], palette.orange, 0.35));
children.push(fader('voice_fader', '/nostos/voice', [224, 550, 190, 66], palette.blue, 0.75));
children.push(fader('bed_fader', '/nostos/bed', [432, 550, 192, 66], palette.sand, 0.55));

children.push(label('performance_note_1', '简化谱：S1 调 TRANSFORM＋A；S2 AUTO 关＋BED PARTICLE＋B', [16, 646, 608, 28], 13, palette.text, 0));
children.push(label('performance_note_2', 'S3 只把 TRANSFORM 85→0；3:05 按 RETURN', [16, 676, 608, 28], 13, palette.text, 0));
children.push(label('connection_note', 'SEND → Max 9000   ·   RECEIVE ← Max 9001', [16, 722, 608, 24], 12, palette.muted, 0));
children.push(label('safety_note', '异常声音：立即按 MUTE；需要重来：MUTE → RESET', [16, 770, 608, 34], 16, palette.red));
children.push(label('footer_label', 'NOSTOS TouchOSC v0.1 · input-only prototype', [16, 816, 608, 20], 11, palette.muted));

if (!fs.existsSync(templatePath)) {
  if (!fs.existsSync(outputPath)) throw new Error('nostos.tosc template not found');
  fs.copyFileSync(outputPath, templatePath);
}

const templateXml = zlib.inflateSync(fs.readFileSync(templatePath)).toString('utf8');
if (!templateXml.includes("<lexml version='6'>")) throw new Error('Expected a TouchOSC lexml version 6 template');
if (templateXml.includes('<children>')) throw new Error('Template must be empty');

const rootClose = templateXml.lastIndexOf('</node></lexml>');
if (rootClose < 0) throw new Error('Root close marker not found');
let xml = templateXml.slice(0, rootClose) + `<children>${children.join('')}</children>` + templateXml.slice(rootClose);
xml = xml.replace('<r>0</r><g>0</g><b>0</b><a>1</a>', `<r>${palette.bg[0]}</r><g>${palette.bg[1]}</g><b>${palette.bg[2]}</b><a>1</a>`);

fs.writeFileSync(outputPath, zlib.deflateSync(Buffer.from(xml, 'utf8'), { level: 9 }));

function rgba(color) {
  const [r, g, b, a] = color;
  return `rgba(${Math.round(r * 255)},${Math.round(g * 255)},${Math.round(b * 255)},${a})`;
}
const svg = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="640" height="860" viewBox="0 0 640 860">
  <rect width="640" height="860" fill="${rgba(palette.bg)}"/>
  <rect x="8" y="8" width="624" height="844" rx="10" fill="${rgba(palette.panel)}" stroke="${rgba(palette.muted)}"/>
  <text x="320" y="39" fill="white" font-size="22" text-anchor="middle">NOSTOS · 一句话的返航</text>
  <text x="320" y="66" fill="${rgba(palette.muted)}" font-size="14" text-anchor="middle">WAITING · 等待录音</text>
  ${[
    [16,100,140,58,palette.red,'RECORD'],[172,100,140,58,palette.cyan,'PLAY ORIGINAL'],[328,100,140,58,palette.gray,'RESET'],[484,100,140,58,palette.red,'MUTE'],
    [16,192,140,64,palette.blue,'STAGE 1'],[172,192,140,64,palette.orange,'STAGE 2'],[328,192,140,64,palette.sand,'STAGE 3'],[484,192,140,64,palette.green,'RETURN'],
    [16,414,136,62,palette.purple,'EVENT A'],[164,414,136,62,palette.blue,'EVENT B'],[312,414,172,62,palette.orange,'BED PARTICLE'],[496,414,128,62,palette.green,'AUTO VOICE'],
  ].map(([x,y,w,h,c,t]) => `<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="8" fill="${rgba(c)}"/><text x="${x+w/2}" y="${y+h/2+5}" fill="white" font-size="14" font-weight="bold" text-anchor="middle">${t}</text>`).join('\n')}
  <text x="16" y="291" fill="white" font-size="15">TRANSFORM · 主要表演推子</text>
  <rect x="16" y="302" width="608" height="72" rx="8" fill="${rgba(palette.purple)}"/><rect x="166" y="302" width="8" height="72" fill="white" opacity=".8"/>
  <text x="16" y="510" fill="${rgba(palette.muted)}" font-size="12">REHEARSAL MIX · 排练调试</text>
  ${[[16,'DENSITY',palette.orange],[224,'VOICE',palette.blue],[432,'BED',palette.sand]].map(([x,t,c]) => `<text x="${x}" y="542" fill="white" font-size="13">${t}</text><rect x="${x}" y="550" width="190" height="66" rx="7" fill="${rgba(c)}" opacity=".9"/>`).join('\n')}
  <text x="16" y="668" fill="white" font-size="13">简化谱：S1 TRANSFORM＋A；S2 AUTO关＋PARTICLE＋B</text>
  <text x="16" y="698" fill="white" font-size="13">S3 TRANSFORM 85→0；3:05 RETURN</text>
  <text x="320" y="794" fill="${rgba(palette.red)}" font-size="16" text-anchor="middle">异常声音：立即按 MUTE</text>
</svg>`;
fs.writeFileSync(previewPath, svg);

console.log(JSON.stringify({ outputPath, templatePath, previewPath, xmlBytes: Buffer.byteLength(xml), compressedBytes: fs.statSync(outputPath).size, childNodes: children.length }, null, 2));
