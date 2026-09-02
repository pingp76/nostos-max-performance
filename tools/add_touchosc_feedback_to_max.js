#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const inputPath = path.resolve(process.argv[2] || path.join(__dirname, '..', 'Nostos_Performance_v01.maxpat'));
const outputPath = path.resolve(process.argv[3] || inputPath);
const root = JSON.parse(fs.readFileSync(inputPath, 'utf8'));
const patcher = root.patcher;

function newobj(id, text, rect, numinlets = 1, numoutlets = 1, outlettype = ['']) {
  return { box: { id, maxclass: 'newobj', numinlets, numoutlets, outlettype, patching_rect: rect, text, varname: id } };
}

function comment(id, text, rect) {
  return { box: { id, maxclass: 'comment', numinlets: 1, numoutlets: 0, patching_rect: rect, text, varname: id } };
}

function message(id, text, rect) {
  return { box: { id, maxclass: 'message', numinlets: 2, numoutlets: 1, outlettype: [''], patching_rect: rect, text, varname: id } };
}

function line(source, destination, sourceOutlet = 0, destinationInlet = 0) {
  return { patchline: { source: [source, sourceOutlet], destination: [destination, destinationInlet] } };
}

function addTopBox(entry) {
  if (!patcher.boxes.some((item) => item.box.id === entry.box.id)) patcher.boxes.push(entry);
}

function addTopLine(entry) {
  const key = JSON.stringify(entry.patchline);
  if (!patcher.lines.some((item) => JSON.stringify(item.patchline) === key)) patcher.lines.push(entry);
}

function feedbackSubpatch() {
  const boxes = [];
  const lines = [];
  const states = [
    ['stage', 'nostos_scene'],
    ['transform', 'ctl_transform'],
    ['density', 'ctl_density'],
    ['voice', 'ctl_voice'],
    ['bed', 'ctl_bed'],
    ['auto', 'ctl_auto_voice'],
    ['hold', 'ctl_hold'],
    ['mute', 'ctl_mute'],
    ['master_db', 'ctl_master_db'],
    ['record', 'rec_control'],
    ['timer_seconds', 'nostos_timer_seconds'],
  ];

  boxes.push(comment('osc_fb_label', 'Max → TouchOSC 状态回传：数值缓存、SYNC重发、UDP 9001', [20, 10, 620, 22]));
  boxes.push(newobj('osc_fb_sync_receive', 'r touchosc_sync_request', [20, 500, 155, 22], 0, 1));

  states.forEach(([key, source], index) => {
    const y = 45 + index * 40;
    const receiveId = `osc_fb_${key}_receive`;
    const valueId = `osc_fb_${key}_value`;
    const prependId = `osc_fb_${key}_prepend`;
    const sendId = `osc_fb_${key}_send`;
    boxes.push(newobj(receiveId, `r ${source}`, [20, y, 145, 22], 0, 1));
    if (key === 'timer_seconds') {
      const changeId = 'osc_fb_timer_seconds_change';
      boxes.push(newobj(changeId, 'change', [180, y, 55, 22]));
      lines.push(line(receiveId, changeId));
      boxes.push(newobj(valueId, 'int', [250, y, 45, 22]));
      lines.push(line(changeId, valueId));
    } else {
      const integerKeys = new Set(['stage', 'auto', 'hold', 'mute', 'record']);
      boxes.push(newobj(valueId, integerKeys.has(key) ? 'int' : 'float', [180, y, 55, 22]));
      lines.push(line(receiveId, valueId));
    }
    boxes.push(newobj(prependId, `prepend /nostos/state/${key}`, [440, y, 220, 22]));
    boxes.push(newobj(sendId, 's nostos_feedback_packet', [680, y, 165, 22], 1, 0, []));
    lines.push(line(valueId, prependId));
    lines.push(line(prependId, sendId));
    lines.push(line('osc_fb_sync_receive', valueId));
  });

  boxes.push(newobj('osc_fb_dsp_poll_start', 'loadmess 1', [20, 550, 75, 22]));
  boxes.push(newobj('osc_fb_dsp_poll_clock', 'qmetro 500', [110, 550, 75, 22]));
  boxes.push(newobj('osc_fb_dsp_status', 'adstatus switch', [200, 550, 100, 22]));
  boxes.push(newobj('osc_fb_dsp_value', 'int', [320, 550, 45, 22]));
  boxes.push(newobj('osc_fb_dsp_prepend', 'prepend /nostos/state/dsp', [475, 550, 195, 22]));
  boxes.push(newobj('osc_fb_dsp_send', 's nostos_feedback_packet', [690, 550, 165, 22], 1, 0, []));
  lines.push(line('osc_fb_dsp_poll_start', 'osc_fb_dsp_poll_clock'));
  lines.push(line('osc_fb_dsp_poll_clock', 'osc_fb_dsp_status'));
  lines.push(line('osc_fb_dsp_status', 'osc_fb_dsp_value'));
  lines.push(line('osc_fb_dsp_value', 'osc_fb_dsp_prepend'));
  lines.push(line('osc_fb_dsp_prepend', 'osc_fb_dsp_send'));
  lines.push(line('osc_fb_sync_receive', 'osc_fb_dsp_value'));

  // Stage and timer are also emitted together every 500 ms. This transport
  // heartbeat makes the two performance-critical displays self-healing after
  // an individual UDP packet is lost and keeps both values from one snapshot.
  boxes.push(newobj('osc_fb_transport_pack', 'pack 0 0', [20, 590, 70, 22], 2, 1));
  boxes.push(newobj('osc_fb_transport_prepend', 'prepend /nostos/state/transport', [110, 590, 235, 22]));
  boxes.push(newobj('osc_fb_transport_send', 's nostos_feedback_packet', [365, 590, 165, 22], 1, 0, []));
  lines.push(line('osc_fb_stage_receive', 'osc_fb_transport_pack', 0, 0));
  lines.push(line('osc_fb_timer_seconds_receive', 'osc_fb_transport_pack', 0, 1));
  lines.push(line('osc_fb_dsp_poll_clock', 'osc_fb_transport_pack', 0, 0));
  lines.push(line('osc_fb_transport_pack', 'osc_fb_transport_prepend'));
  lines.push(line('osc_fb_transport_prepend', 'osc_fb_transport_send'));

  boxes.push(newobj('osc_fb_packet_receive', 'r nostos_feedback_packet', [20, 650, 165, 22], 0, 1));
  boxes.push(newobj('osc_fb_udp_send', 'udpsend 127.0.0.1 9001', [210, 650, 165, 22], 1, 0, []));
  boxes.push(newobj('osc_fb_host_receive', 'r touchosc_feedback_host', [400, 650, 170, 22], 0, 1));
  boxes.push(newobj('osc_fb_host_trigger', 't b s', [590, 650, 45, 22], 1, 2, ['bang', '']))
  boxes.push(newobj('osc_fb_host_prepend', 'prepend host', [655, 650, 90, 22]));
  boxes.push(newobj('osc_fb_sync_send', 's touchosc_sync_request', [765, 690, 160, 22], 1, 0, []));
  boxes.push(newobj('osc_fb_host_default', 'loadmess 127.0.0.1', [400, 690, 135, 22]));
  boxes.push(newobj('osc_fb_host_default_send', 's touchosc_feedback_host', [555, 730, 170, 22], 1, 0, []));
  lines.push(line('osc_fb_packet_receive', 'osc_fb_udp_send'));
  lines.push(line('osc_fb_host_receive', 'osc_fb_host_trigger'));
  lines.push(line('osc_fb_host_trigger', 'osc_fb_host_prepend', 1));
  lines.push(line('osc_fb_host_prepend', 'osc_fb_udp_send'));
  lines.push(line('osc_fb_host_trigger', 'osc_fb_sync_send', 0));
  lines.push(line('osc_fb_host_default', 'osc_fb_host_default_send'));

  return {
    fileversion: 1,
    appversion: patcher.appversion,
    classnamespace: 'box',
    rect: [70, 100, 970, 810],
    boxes,
    lines,
  };
}

const route = patcher.boxes.find((entry) => entry.box.id === 'osc_route')?.box;
if (!route) throw new Error('osc_route not found');
route.text = 'route /nostos/stage /nostos/transform /nostos/density /nostos/voice /nostos/event /nostos/record /nostos/play /nostos/mute /nostos/hold /nostos/reset /nostos/bed /nostos/auto /nostos/bed_particle /nostos/master /nostos/dsp /nostos/sync';
route.numinlets = 1;
route.numoutlets = 17;
route.outlettype = Array(17).fill('');
route.patching_rect = [180, 5750, 1350, 22];

const oscLabel = patcher.boxes.find((entry) => entry.box.id === 'label_osc')?.box;
if (oscLabel) oscLabel.text = 'TouchOSC：输入UDP 9000；完整地址路由含stage、五个宏观参数、event、record/play、mute/hold、DSP、sync。状态回传使用UDP 9001。';

function removeTopLine(sourceId, sourceOutlet, destinationId) {
  patcher.lines = patcher.lines.filter((entry) => {
    const { source, destination } = entry.patchline;
    return !(source[0] === sourceId && source[1] === sourceOutlet && destination[0] === destinationId);
  });
}

addTopBox(newobj('osc_stage_int', 'int', [40, 5788, 40, 22]));
removeTopLine('osc_route', 0, 'osc_stage_send');
addTopLine(line('osc_route', 'osc_stage_int', 0));
addTopLine(line('osc_stage_int', 'osc_stage_send'));

addTopBox(newobj('osc_event_int', 'int', [820, 5788, 40, 22]));
removeTopLine('osc_route', 4, 'osc_event_sel');
addTopLine(line('osc_route', 'osc_event_int', 4));
addTopLine(line('osc_event_int', 'osc_event_sel'));

addTopBox(newobj('osc_record_int', 'int', [940, 5788, 40, 22]));
removeTopLine('osc_route', 5, 'osc_record_send');
addTopLine(line('osc_route', 'osc_record_int', 5));
addTopLine(line('osc_record_int', 'osc_record_send'));

addTopBox(newobj('osc_play_int', 'int', [1060, 5788, 40, 22]));
removeTopLine('osc_route', 6, 'osc_play_sel');
addTopLine(line('osc_route', 'osc_play_int', 6));
addTopLine(line('osc_play_int', 'osc_play_sel'));

addTopBox(newobj('osc_mute_int', 'int', [1250, 5788, 40, 22]));
removeTopLine('osc_route', 7, 'osc_mute_send');
addTopLine(line('osc_route', 'osc_mute_int', 7));
addTopLine(line('osc_mute_int', 'osc_mute_send'));

const holdSend = patcher.boxes.find((entry) => entry.box.id === 'osc_hold_send')?.box;
if (holdSend) holdSend.text = 's ui_hold_raw';
addTopBox(newobj('osc_hold_int', 'int', [1350, 5788, 40, 22]));
removeTopLine('osc_route', 8, 'osc_hold_send');
addTopLine(line('osc_route', 'osc_hold_int', 8));
addTopLine(line('osc_hold_int', 'osc_hold_send'));

addTopBox(newobj('osc_reset_int', 'int', [1555, 5788, 40, 22]));
removeTopLine('osc_route', 9, 'osc_reset_sel');
addTopLine(line('osc_route', 'osc_reset_int', 9));
addTopLine(line('osc_reset_int', 'osc_reset_sel'));

addTopBox(newobj('osc_auto_int', 'int', [2070, 5898, 40, 22]));
removeTopLine('osc_auto_clip', 0, 'osc_auto_ui_send');
addTopLine(line('osc_auto_clip', 'osc_auto_int'));
addTopLine(line('osc_auto_int', 'osc_auto_ui_send'));

const bedParticleSelect = patcher.boxes.find((entry) => entry.box.varname === 'osc_bed_particle_select')?.box;
if (!bedParticleSelect) throw new Error('osc_bed_particle_select not found');
addTopBox(newobj('osc_bed_particle_int', 'int', [1820, 5898, 40, 22]));
removeTopLine('osc_route', 12, bedParticleSelect.id);
addTopLine(line('osc_route', 'osc_bed_particle_int', 12));
addTopLine(line('osc_bed_particle_int', bedParticleSelect.id));

addTopBox(newobj('osc_master_clip', 'clip 0. 1.', [1570, 5822, 70, 22], 3, 1));
addTopBox(newobj('osc_master_scale', '* 127.', [1660, 5822, 55, 22], 2, 1));
addTopBox(newobj('osc_master_raw_send', 's ui_master_remote_raw', [1735, 5822, 145, 22], 1, 0, []));
addTopBox(newobj('osc_master_raw_receive', 'r ui_master_remote_raw', [420, 1015, 145, 22], 0, 1));
addTopLine(line('osc_route', 'osc_master_clip', 13));
addTopLine(line('osc_master_clip', 'osc_master_scale'));
addTopLine(line('osc_master_scale', 'osc_master_raw_send'));
addTopLine(line('osc_master_raw_receive', 'ui_master_remote'));

addTopBox(newobj('osc_dsp_clip', 'clip 0 1', [1570, 5860, 65, 22], 3, 1));
addTopBox(newobj('osc_dsp_int', 'int', [1655, 5860, 40, 22]));
const dspSend = patcher.boxes.find((entry) => entry.box.id === 'osc_dsp_send')?.box;
if (dspSend) dspSend.patching_rect = [1715, 5860, 75, 22];
else addTopBox(newobj('osc_dsp_send', 's ctl_dsp', [1715, 5860, 75, 22], 1, 0, []));
addTopBox(newobj('dsp_remote_receive', 'r ctl_dsp', [720, 1194, 75, 22], 0, 1));
addTopLine(line('osc_route', 'osc_dsp_clip', 14));
removeTopLine('osc_dsp_clip', 0, 'osc_dsp_send');
addTopLine(line('osc_dsp_clip', 'osc_dsp_int'));
addTopLine(line('osc_dsp_int', 'osc_dsp_send'));
addTopLine(line('dsp_remote_receive', 'ui_dsp_remote'));

addTopBox(newobj('osc_sync_int', 'int', [1570, 5898, 40, 22]));
const syncSelect = patcher.boxes.find((entry) => entry.box.id === 'osc_sync_select')?.box;
if (syncSelect) syncSelect.patching_rect = [1630, 5898, 45, 22];
else addTopBox(newobj('osc_sync_select', 'sel 1', [1630, 5898, 45, 22], 2, 2, ['bang', '']));
const syncSend = patcher.boxes.find((entry) => entry.box.id === 'osc_sync_send')?.box;
if (syncSend) syncSend.patching_rect = [1695, 5898, 160, 22];
else addTopBox(newobj('osc_sync_send', 's touchosc_sync_request', [1695, 5898, 160, 22], 1, 0, []));
removeTopLine('osc_route', 15, 'osc_sync_select');
addTopLine(line('osc_route', 'osc_sync_int', 15));
addTopLine(line('osc_sync_int', 'osc_sync_select'));
addTopLine(line('osc_sync_select', 'osc_sync_send'));

addTopBox(newobj('timer_feedback_send', 's nostos_timer_seconds', [1400, 1350, 155, 22], 1, 0, []));
addTopLine(line('timer_seconds_total', 'timer_feedback_send'));

const feedbackIndex = patcher.boxes.findIndex((entry) => entry.box.id === 'touchosc_feedback');
if (feedbackIndex < 0) {
  patcher.boxes.push({
    box: {
      id: 'touchosc_feedback',
      maxclass: 'newobj',
      numinlets: 0,
      numoutlets: 0,
      outlettype: [],
      patcher: feedbackSubpatch(),
      patching_rect: [1900, 5750, 155, 22],
      text: 'p touchosc_feedback',
      varname: 'touchosc_feedback',
    },
  });
} else {
  patcher.boxes[feedbackIndex].box.patcher = feedbackSubpatch();
}

addTopBox(comment('label_touchosc_feedback_host', '配置：直接输入iPad IP；按Enter或“应用IP”（回传端口固定9001）', [1900, 5790, 380, 22]));
const hostInputIndex = patcher.boxes.findIndex((entry) => entry.box.id === 'ui_touchosc_feedback_host');
const hostInput = {
  box: {
    id: 'ui_touchosc_feedback_host', maxclass: 'textedit', numinlets: 1, numoutlets: 3,
    outlettype: ['', 'int', ''], keymode: 1, lines: 1, outputmode: 1, parameter_enable: 0,
    patching_rect: [1900, 5820, 155, 28], text: '127.0.0.1', varname: 'ui_touchosc_feedback_host',
  },
};
if (hostInputIndex >= 0) patcher.boxes[hostInputIndex] = hostInput;
else patcher.boxes.push(hostInput);
addTopBox({ box: { id: 'ui_touchosc_feedback_apply', maxclass: 'button', numinlets: 1, numoutlets: 1, outlettype: ['bang'], parameter_enable: 0, patching_rect: [2075, 5820, 28, 28], varname: 'ui_touchosc_feedback_apply' } });
addTopBox(comment('label_touchosc_feedback_apply', '控: 应用 IP', [2115, 5822, 105, 24]));
addTopBox(newobj('touchosc_feedback_text_route', 'route text', [1900, 5862, 70, 22], 1, 2, ['', '']));
addTopBox(newobj('touchosc_feedback_tosymbol', 'tosymbol', [1990, 5862, 65, 22]));
addTopBox(newobj('touchosc_feedback_host_send', 's touchosc_feedback_host', [2075, 5862, 170, 22], 1, 0, []));
patcher.lines = patcher.lines.filter((entry) => {
  const { source, destination } = entry.patchline;
  return !(source[0] === 'ui_touchosc_feedback_host' && destination[0] === 'touchosc_feedback_host_send');
});
addTopLine(line('ui_touchosc_feedback_apply', 'ui_touchosc_feedback_host'));
addTopLine(line('ui_touchosc_feedback_host', 'touchosc_feedback_text_route'));
addTopLine(line('touchosc_feedback_text_route', 'touchosc_feedback_tosymbol'));
addTopLine(line('touchosc_feedback_tosymbol', 'touchosc_feedback_host_send'));

fs.writeFileSync(outputPath, `${JSON.stringify(root, null, 4)}\n`);
console.log(JSON.stringify({ inputPath, outputPath, boxes: patcher.boxes.length, lines: patcher.lines.length }, null, 2));
