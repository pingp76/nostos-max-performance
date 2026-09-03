#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const inputPath = path.resolve(process.argv[2] || path.join(__dirname, '..', 'Nostos_Performance_v01.maxpat'));
const outputPath = path.resolve(process.argv[3] || inputPath);
const root = JSON.parse(fs.readFileSync(inputPath, 'utf8'));
const patcher = root.patcher;

const PURPLE = [0.72, 0.22, 0.88, 1.0];
const YELLOW = [0.96, 0.72, 0.12, 1.0];
const GREEN = [0.18, 0.78, 0.34, 1.0];
const BLUE = [0.22, 0.48, 0.9, 1.0];
const GREY = [0.22, 0.22, 0.24, 1.0];

function newobj(id, text, rect, numinlets = 1, numoutlets = 1, outlettype = ['']) {
  return { box: { id, maxclass: 'newobj', numinlets, numoutlets, outlettype, patching_rect: rect, text, varname: id } };
}

function comment(id, text, rect, options = {}) {
  return { box: { id, maxclass: 'comment', numinlets: 1, numoutlets: 0, patching_rect: rect, text, varname: id, ...options } };
}

function message(id, text, rect) {
  return { box: { id, maxclass: 'message', numinlets: 2, numoutlets: 1, outlettype: [''], patching_rect: rect, text, varname: id } };
}

function button(id, rect, color = PURPLE) {
  return { box: { id, maxclass: 'button', numinlets: 1, numoutlets: 1, outlettype: ['bang'], parameter_enable: 0, patching_rect: rect, bgcolor: GREY, fgcolor: color, varname: id } };
}

function toggle(id, rect, color) {
  return { box: { id, maxclass: 'toggle', numinlets: 1, numoutlets: 1, outlettype: ['int'], parameter_enable: 0, patching_rect: rect, bgcolor: GREY, checkedcolor: color, uncheckedcolor: [0.12, 0.12, 0.13, 1.0], varname: id } };
}

function flonum(id, rect) {
  return { box: { id, maxclass: 'flonum', numinlets: 1, numoutlets: 2, outlettype: ['', 'bang'], parameter_enable: 0, patching_rect: rect, varname: id } };
}

function number(id, rect) {
  return { box: { id, maxclass: 'number', numinlets: 1, numoutlets: 2, outlettype: ['', 'bang'], parameter_enable: 0, patching_rect: rect, varname: id } };
}

function meter(id, rect) {
  return { box: { id, maxclass: 'meter~', numinlets: 1, numoutlets: 1, outlettype: ['float'], patching_rect: rect, varname: id } };
}

function line(source, destination, sourceOutlet = 0, destinationInlet = 0, hidden = false) {
  const patchline = { source: [source, sourceOutlet], destination: [destination, destinationInlet] };
  if (hidden) patchline.hidden = 1;
  return { patchline };
}

function requireBox(varname) {
  const box = patcher.boxes.find((entry) => entry.box.varname === varname)?.box;
  if (!box) throw new Error(`Required box not found: ${varname}`);
  return box;
}

// Idempotency: remove only an earlier generated teaching layer.
const removedIds = new Set(
  patcher.boxes
    .filter((entry) => String(entry.box.id || '').startsWith('teach_'))
    .map((entry) => entry.box.id),
);
patcher.boxes = patcher.boxes.filter((entry) => !removedIds.has(entry.box.id));
patcher.lines = patcher.lines.filter((entry) => {
  const { source, destination } = entry.patchline;
  return !removedIds.has(source[0]) && !removedIds.has(destination[0]);
});

const modules = [
  { key: 's1_voice', id: 'S1-01', label: 'VOICE LOOP 连续语音', stage: 1, kind: 'persistent', control: 'ctl_auto_voice', threshold: 0.5, signal: 'teach_s1_voice_sig' },
  { key: 's1_reverse', id: 'S1-02', label: 'REVERSE 倒放冲击', stage: 1, kind: 'event', control: 'ctl_event_a', duration: 1200, signal: 'teach_s1_voice_sig' },
  { key: 's1_lurch', id: 'S1-03', label: 'LURCH 短暂失速', stage: 1, kind: 'event', control: 'ctl_event_b', duration: 700, signal: 'teach_s1_voice_sig' },
  { key: 's1_bed', id: 'S1-04', label: 'MARCH BED 战争脉动', stage: 1, kind: 'persistent', control: 'ctl_bed', threshold: 0.01, signal: 'teach_s1_bed_sig' },
  { key: 's2_grains', id: 'S2-01', label: 'AUTO GRAINS 自动粒子', stage: 2, kind: 'persistent', control: 'ctl_auto_voice', threshold: 0.5, signal: 'teach_s2_grain_sig' },
  { key: 's2_storm', id: 'S2-02', label: 'PARTICLE STORM 粒子风暴', stage: 2, kind: 'event', control: 'ctl_event_a', duration: 1300, signal: 'teach_s2_grain_sig' },
  { key: 's2_hold', id: 'S2-03', label: 'HOLD LOOP 抓取残片', stage: 2, kind: 'persistent', control: 'ctl_hold', threshold: 0.5, signal: 'teach_s2_hold_sig' },
  { key: 's2_metal', id: 'S2-04', label: 'METAL BED 金属底噪', stage: 2, kind: 'persistent', control: 'ctl_bed', threshold: 0.01, signal: 'teach_s2_metal_sig' },
  { key: 's2_recall', id: 'S2-05', label: 'CLEAR RECALL 清晰召回', stage: 2, kind: 'event', control: 'ctl_event_b', duration: 1900, signal: 'teach_s2_recall_sig' },
  { key: 's2_debris', id: 'S2-06', label: 'METAL DEBRIS 金属碎屑', stage: 2, kind: 'event', control: 'ctl_bed_particle', duration: 700, signal: 'teach_s2_debris_sig' },
  { key: 's3_voice', id: 'S3-01', label: 'RETURN VOICE 重组语音', stage: 3, kind: 'persistent', control: 'ctl_auto_voice', threshold: 0.5, signal: 'teach_s3_voice_sig' },
  { key: 's3_oracle', id: 'S3-02', label: 'ORACLE OPEN 神谕显现', stage: 3, kind: 'event', control: 'ctl_event_a', duration: 3200, signal: 'teach_s3_voice_sig' },
  { key: 's3_recall', id: 'S3-03', label: 'CLEAR RECALL 原句召回', stage: 3, kind: 'event', control: 'ctl_event_b', duration: 1900, signal: 'teach_s3_recall_sig' },
  { key: 's3_bed', id: 'S3-04', label: 'WIND/SAND BED 风沙底噪', stage: 3, kind: 'persistent', control: 'ctl_bed', threshold: 0.01, signal: 'teach_s3_bed_sig' },
  { key: 's3_wave', id: 'S3-05', label: 'SAND WAVE 沙浪事件', stage: 3, kind: 'event', control: 'ctl_bed_particle', duration: 1600, signal: 'teach_s3_wave_sig' },
];

const labelPrefixes = {
  label_note_s1_auto_receive: 'S1-01',
  label_note_s1_event_a: 'S1-02',
  label_note_s1_event_b: 'S1-03',
  label_note_s1_bed_receive: 'S1-04',
  label_note_s2_auto_receive: 'S2-01',
  label_note_s2_event_a: 'S2-02',
  label_note_s2_hold: 'S2-03',
  label_note_s2_bed_receive: 'S2-04',
  label_note_s2_event_b: 'S2-05',
  label_note_s2_bed_particle_receive: 'S2-06',
  label_note_s3_auto_receive: 'S3-01',
  label_note_s3_event_a: 'S3-02',
  label_note_s3_event_b: 'S3-03',
  label_note_s3_bed_receive: 'S3-04',
  label_note_s3_bed_particle_receive: 'S3-05',
};
for (const [varname, prefix] of Object.entries(labelPrefixes)) {
  const box = requireBox(varname);
  box.text = `${prefix} | ${String(box.text).replace(/^S\d-\d+\s*\|\s*/, '')}`;
  box.fontface = 1;
  box.textcolor = BLUE;
}

function buildStatusLogic() {
  const boxes = [];
  const lines = [];
  boxes.push(comment('teach_logic_label', 'B版教学状态逻辑：只监听控制与场景，不进入声音链', [20, 10, 700, 22]));

  boxes.push(newobj('teach_logic_scene_receive', 'r nostos_scene', [20, 50, 105, 22], 0, 1));
  boxes.push(newobj('teach_logic_scene_select', 'sel 1 2 3', [150, 50, 75, 22], 1, 4, ['bang', 'bang', 'bang', '']));
  boxes.push(message('teach_logic_scene1_text', 'set STAGE_1_DEPARTURE', [250, 30, 155, 22]));
  boxes.push(message('teach_logic_scene2_text', 'set STAGE_2_DRIFT', [250, 60, 145, 22]));
  boxes.push(message('teach_logic_scene3_text', 'set STAGE_3_RETURN', [250, 90, 150, 22]));
  boxes.push(newobj('teach_logic_last_event_send', 's teach_last_event', [430, 60, 130, 22], 1, 0, []));
  lines.push(line('teach_logic_scene_receive', 'teach_logic_scene_select'));
  lines.push(line('teach_logic_scene_select', 'teach_logic_scene1_text', 0));
  lines.push(line('teach_logic_scene_select', 'teach_logic_scene2_text', 1));
  lines.push(line('teach_logic_scene_select', 'teach_logic_scene3_text', 2));
  lines.push(line('teach_logic_scene1_text', 'teach_logic_last_event_send'));
  lines.push(line('teach_logic_scene2_text', 'teach_logic_last_event_send'));
  lines.push(line('teach_logic_scene3_text', 'teach_logic_last_event_send'));

  modules.forEach((module, index) => {
    const x = 20 + (index % 3) * 570;
    const y = 150 + Math.floor(index / 3) * 150;
    const prefix = `teach_logic_${module.key}`;
    boxes.push(comment(`${prefix}_label`, `${module.id} ${module.label}`, [x, y, 300, 20], { fontface: 1 }));
    boxes.push(newobj(`${prefix}_scene`, 'r nostos_scene', [x, y + 28, 105, 22], 0, 1));
    boxes.push(newobj(`${prefix}_control`, `r ${module.control}`, [x + 120, y + 28, 125, 22], 0, 1));

    if (module.kind === 'persistent') {
      boxes.push(newobj(`${prefix}_state`, 'pak 0 0.', [x + 260, y + 28, 75, 22], 2, 1));
      boxes.push(newobj(`${prefix}_active_expr`, `expr ($i1 == ${module.stage}) && ($f2 > ${module.threshold})`, [x + 350, y + 28, 190, 22], 2, 1));
      boxes.push(newobj(`${prefix}_active_change`, 'change', [x + 350, y + 60, 55, 22]));
      boxes.push(newobj(`${prefix}_active_send`, `s teach_${module.key}_active`, [x + 420, y + 60, 145, 22], 1, 0, []));
      boxes.push(newobj(`${prefix}_stage_equal`, `== ${module.stage}`, [x, y + 60, 45, 22]));
      boxes.push(newobj(`${prefix}_control_gate`, 'gate 1', [x + 120, y + 60, 50, 22], 2, 1));
      boxes.push(newobj(`${prefix}_control_trigger`, 't b b', [x + 185, y + 60, 45, 22], 1, 2, ['bang', 'bang']));
      boxes.push(newobj(`${prefix}_control_send`, `s teach_${module.key}_control`, [x + 245, y + 92, 150, 22], 1, 0, []));
      boxes.push(message(`${prefix}_last_text`, `set ${module.id}_${module.label.split(' ')[0]}`, [x + 245, y + 60, 165, 22]));
      lines.push(line(`${prefix}_scene`, `${prefix}_state`, 0, 0));
      lines.push(line(`${prefix}_control`, `${prefix}_state`, 0, 1));
      lines.push(line(`${prefix}_state`, `${prefix}_active_expr`));
      lines.push(line(`${prefix}_active_expr`, `${prefix}_active_change`));
      lines.push(line(`${prefix}_active_change`, `${prefix}_active_send`));
      lines.push(line(`${prefix}_scene`, `${prefix}_stage_equal`));
      lines.push(line(`${prefix}_stage_equal`, `${prefix}_control_gate`, 0, 0));
      lines.push(line(`${prefix}_control`, `${prefix}_control_gate`, 0, 1));
      lines.push(line(`${prefix}_control_gate`, `${prefix}_control_trigger`));
      lines.push(line(`${prefix}_control_trigger`, `${prefix}_last_text`, 0));
      lines.push(line(`${prefix}_control_trigger`, `${prefix}_control_send`, 1));
      lines.push(line(`${prefix}_last_text`, 'teach_logic_last_event_send'));
    } else {
      boxes.push(newobj(`${prefix}_stage_equal`, `== ${module.stage}`, [x, y + 60, 45, 22]));
      boxes.push(newobj(`${prefix}_control_gate`, 'gate 1', [x + 120, y + 60, 50, 22], 2, 1));
      boxes.push(newobj(`${prefix}_trigger`, 't b b b b b', [x + 185, y + 60, 80, 22], 1, 5, ['bang', 'bang', 'bang', 'bang', 'bang']));
      boxes.push(message(`${prefix}_delay_stop`, 'stop', [x + 280, y + 28, 42, 22]));
      boxes.push(message(`${prefix}_active_on`, '1', [x + 335, y + 28, 32, 22]));
      boxes.push(newobj(`${prefix}_control_send`, `s teach_${module.key}_control`, [x + 380, y + 28, 150, 22], 1, 0, []));
      boxes.push(message(`${prefix}_last_text`, `set ${module.id}_${module.label.split(' ')[0]}`, [x + 280, y + 60, 165, 22]));
      boxes.push(newobj(`${prefix}_delay`, `delay ${module.duration}`, [x + 280, y + 92, 80, 22]));
      boxes.push(message(`${prefix}_active_off`, '0', [x + 375, y + 92, 32, 22]));
      boxes.push(newobj(`${prefix}_active_send`, `s teach_${module.key}_active`, [x + 420, y + 92, 145, 22], 1, 0, []));
      lines.push(line(`${prefix}_scene`, `${prefix}_stage_equal`));
      lines.push(line(`${prefix}_stage_equal`, `${prefix}_control_gate`, 0, 0));
      lines.push(line(`${prefix}_control`, `${prefix}_control_gate`, 0, 1));
      lines.push(line(`${prefix}_control_gate`, `${prefix}_trigger`));
      lines.push(line(`${prefix}_trigger`, `${prefix}_delay_stop`, 4));
      lines.push(line(`${prefix}_delay_stop`, `${prefix}_delay`));
      lines.push(line(`${prefix}_trigger`, `${prefix}_active_on`, 3));
      lines.push(line(`${prefix}_active_on`, `${prefix}_active_send`));
      lines.push(line(`${prefix}_trigger`, `${prefix}_control_send`, 2));
      lines.push(line(`${prefix}_trigger`, `${prefix}_last_text`, 1));
      lines.push(line(`${prefix}_last_text`, 'teach_logic_last_event_send'));
      lines.push(line(`${prefix}_trigger`, `${prefix}_delay`, 0));
      lines.push(line(`${prefix}_delay`, `${prefix}_active_off`));
      lines.push(line(`${prefix}_active_off`, `${prefix}_active_send`));
    }
  });

  boxes.push(newobj('teach_logic_reset_receive', 'r ctl_reset', [20, 920, 85, 22], 0, 1));
  boxes.push(message('teach_logic_reset_text', 'set RESET', [125, 920, 75, 22]));
  lines.push(line('teach_logic_reset_receive', 'teach_logic_reset_text'));
  lines.push(line('teach_logic_reset_text', 'teach_logic_last_event_send'));
  for (const module of modules.filter((entry) => entry.kind === 'event')) {
    const prefix = `teach_logic_${module.key}`;
    lines.push(line('teach_logic_reset_receive', `${prefix}_delay_stop`));
    lines.push(line('teach_logic_reset_receive', `${prefix}_active_off`));
  }

  return {
    fileversion: 1,
    appversion: patcher.appversion,
    classnamespace: 'box',
    rect: [80, 80, 1750, 1020],
    boxes,
    lines,
  };
}

patcher.boxes.push({
  box: {
    id: 'teach_status_logic', maxclass: 'newobj', numinlets: 0, numoutlets: 0, outlettype: [],
    patcher: buildStatusLogic(), patching_rect: [2180, 6045, 170, 22],
    text: 'p teaching_status_logic', varname: 'teach_status_logic',
  },
});

patcher.boxes.push(comment('teach_section_label', '8｜B版教学监视器：从控制到真实声音', [40, 6030, 1800, 34], { fontface: 1, fontsize: 20, textcolor: BLUE }));
patcher.boxes.push(comment('teach_section_help', '读法：紫灯＝控制消息刚到达；黄灯＝模块处于作用期；绿灯＝作用期内确有音频。峰值为线性振幅0—1。相同编号也标在上方声音模块入口。', [40, 6075, 1800, 24]));
patcher.boxes.push(comment('teach_legend_control', '● 紫：控制', [40, 6110, 110, 22], { fontface: 1, textcolor: PURPLE }));
patcher.boxes.push(comment('teach_legend_active', '● 黄：工作中', [165, 6110, 120, 22], { fontface: 1, textcolor: YELLOW }));
patcher.boxes.push(comment('teach_legend_audio', '● 绿：有声音', [300, 6110, 120, 22], { fontface: 1, textcolor: GREEN }));

const stateItems = [
  ['stage', 'r nostos_scene', 'STAGE', false],
  ['timer', 'r nostos_timer_seconds', 'TIME(s)', false],
  ['transform', 'r ctl_transform', 'TRANSFORM', true],
  ['density', 'r ctl_density', 'DENSITY', true],
  ['voice', 'r ctl_voice', 'VOICE', true],
  ['bed', 'r ctl_bed', 'BED', true],
  ['master', 'r ctl_master_db', 'MASTER dB', true],
  ['mute', 'r ctl_mute', 'MUTE', false],
];
stateItems.forEach(([key, receiveText, labelText, isFloat], index) => {
  const x = 500 + index * 205;
  patcher.boxes.push(comment(`teach_state_${key}_label`, labelText, [x, 6105, 110, 20], { fontface: 1 }));
  patcher.boxes.push(newobj(`teach_state_${key}_receive`, receiveText, [x, 6130, 130, 22], 0, 1));
  patcher.boxes.push(isFloat ? flonum(`teach_state_${key}_value`, [x + 140, 6130, 58, 22]) : number(`teach_state_${key}_value`, [x + 140, 6130, 58, 22]));
  patcher.lines.push(line(`teach_state_${key}_receive`, `teach_state_${key}_value`));
});
patcher.boxes.push(comment('teach_last_event_label', 'LAST EVENT／最近动作', [40, 6158, 180, 20], { fontface: 1 }));
patcher.boxes.push(newobj('teach_last_event_receive', 'r teach_last_event', [225, 6156, 130, 22], 0, 1));
patcher.boxes.push(message('teach_last_event_display', '等待场景或事件', [370, 6156, 270, 22]));
patcher.lines.push(line('teach_last_event_receive', 'teach_last_event_display'));

function addMonitorRow(module, x, y) {
  const p = `teach_row_${module.key}`;
  patcher.boxes.push(comment(`${p}_label`, `${module.id}  ${module.label}`, [x, y, 255, 22], { fontface: 1 }));
  patcher.boxes.push(newobj(`${p}_control_receive`, `r teach_${module.key}_control`, [x + 260, y, 145, 22], 0, 1));
  patcher.boxes.push(button(`${p}_control_flash`, [x + 415, y, 22, 22]));
  patcher.boxes.push(newobj(`${p}_active_receive`, `r teach_${module.key}_active`, [x + 445, y, 140, 22], 0, 1));
  patcher.boxes.push(toggle(`${p}_active_light`, [x + 595, y, 22, 22], YELLOW));
  patcher.lines.push(line(`${p}_control_receive`, `${p}_control_flash`));
  patcher.lines.push(line(`${p}_active_receive`, `${p}_active_light`));

  patcher.boxes.push(newobj(`${p}_signal_receive`, `receive~ ${module.signal}`, [x, y + 27, 175, 22], 0, 1, ['signal']));
  patcher.boxes.push(meter(`${p}_meter`, [x + 185, y + 27, 18, 28]));
  patcher.boxes.push(newobj(`${p}_peak`, 'peakamp~ 100', [x + 215, y + 27, 90, 22], 1, 1, ['float']));
  patcher.boxes.push(flonum(`${p}_peak_value`, [x + 315, y + 27, 65, 22]));
  patcher.boxes.push(newobj(`${p}_threshold`, '> 0.002', [x + 390, y + 27, 60, 22]));
  patcher.boxes.push(newobj(`${p}_audible_state`, 'pak 0 0', [x + 460, y + 27, 65, 22], 2, 1));
  patcher.boxes.push(newobj(`${p}_audible_expr`, 'expr $i1 && $i2', [x + 535, y + 27, 105, 22], 2, 1));
  patcher.boxes.push(newobj(`${p}_audible_change`, 'change', [x + 650, y + 27, 55, 22]));
  patcher.boxes.push(toggle(`${p}_audio_light`, [x + 715, y + 27, 22, 22], GREEN));
  patcher.lines.push(line(`${p}_signal_receive`, `${p}_meter`));
  patcher.lines.push(line(`${p}_signal_receive`, `${p}_peak`));
  patcher.lines.push(line(`${p}_peak`, `${p}_peak_value`));
  patcher.lines.push(line(`${p}_peak`, `${p}_threshold`));
  patcher.lines.push(line(`${p}_threshold`, `${p}_audible_state`, 0, 0));
  patcher.lines.push(line(`${p}_active_receive`, `${p}_audible_state`, 0, 1));
  patcher.lines.push(line(`${p}_audible_state`, `${p}_audible_expr`));
  patcher.lines.push(line(`${p}_audible_expr`, `${p}_audible_change`));
  patcher.lines.push(line(`${p}_audible_change`, `${p}_audio_light`));
}

const columns = [
  { stage: 1, x: 40, title: 'STAGE 1｜出发／战争' },
  { stage: 2, x: 820, title: 'STAGE 2｜破碎／漂流' },
  { stage: 3, x: 1600, title: 'STAGE 3｜重组／归返' },
];
columns.forEach((column) => {
  patcher.boxes.push(comment(`teach_stage_${column.stage}_header`, column.title, [column.x, 6200, 600, 26], { fontface: 1, fontsize: 16, textcolor: BLUE }));
  modules.filter((module) => module.stage === column.stage).forEach((module, row) => addMonitorRow(module, column.x, 6240 + row * 66));
});

// A compact copy of the same three states is placed beside each numbered
// production-module label. Hidden patch cords reuse the dashboard's already
// computed values, so these locator lights add no duplicate audio analysis.
const localStatusPositions = {
  s1_voice: [1364, 2029],
  s1_reverse: [946, 1948],
  s1_lurch: [678, 2004],
  s1_bed: [308, 2201],
  s2_grains: [792, 2633],
  s2_storm: [135, 2780],
  s2_hold: [1041, 2710],
  s2_metal: [308, 3025],
  s2_recall: [1507, 2640],
  s2_debris: [308, 3414],
  s3_voice: [924, 4170],
  s3_oracle: [1628, 3970],
  s3_recall: [1628, 4042],
  s3_bed: [308, 4279],
  s3_wave: [1065, 4680],
};
modules.forEach((module) => {
  const [x, y] = localStatusPositions[module.key];
  const p = `teach_local_${module.key}`;
  patcher.boxes.push(comment(`${p}_label`, '状态', [x, y, 35, 18], { fontsize: 10 }));
  patcher.boxes.push(button(`${p}_control_flash`, [x + 40, y, 16, 16]));
  patcher.boxes.push(toggle(`${p}_active_light`, [x + 62, y, 16, 16], YELLOW));
  patcher.boxes.push(toggle(`${p}_audio_light`, [x + 84, y, 16, 16], GREEN));
  patcher.boxes.push(comment(`${p}_peak_label`, '峰', [x + 106, y, 16, 18], { fontsize: 10 }));
  patcher.boxes.push(flonum(`${p}_peak_value`, [x + 124, y, 60, 18]));
  patcher.lines.push(line(`teach_row_${module.key}_control_receive`, `${p}_control_flash`, 0, 0, true));
  patcher.lines.push(line(`teach_row_${module.key}_active_receive`, `${p}_active_light`, 0, 0, true));
  patcher.lines.push(line(`teach_row_${module.key}_audible_change`, `${p}_audio_light`, 0, 0, true));
  patcher.lines.push(line(`teach_row_${module.key}_peak`, `${p}_peak_value`, 0, 0, true));
});

patcher.boxes.push(comment('teach_output_header', '舞台／总输出：这里确认“模块有声”是否真的经过场景增益到达扬声器', [40, 6660, 1200, 26], { fontface: 1, fontsize: 16, textcolor: BLUE }));
const outputs = [
  ['s1', 'receive~ nostos_s1_l', 'STAGE 1 OUT'],
  ['s2_l', 'receive~ nostos_s2_l', 'STAGE 2 L'],
  ['s2_r', 'receive~ nostos_s2_r', 'STAGE 2 R'],
  ['s3', 'receive~ nostos_s3_l', 'STAGE 3 OUT'],
  ['master_l', 'receive~ teach_master_l_sig', 'MASTER L'],
  ['master_r', 'receive~ teach_master_r_sig', 'MASTER R'],
];
outputs.forEach(([key, receiveText, labelText], index) => {
  const x = 40 + index * 370;
  patcher.boxes.push(comment(`teach_output_${key}_label`, labelText, [x, 6700, 150, 22], { fontface: 1 }));
  patcher.boxes.push(newobj(`teach_output_${key}_receive`, receiveText, [x, 6728, 180, 22], 0, 1, ['signal']));
  patcher.boxes.push(meter(`teach_output_${key}_meter`, [x + 190, 6700, 18, 80]));
  patcher.boxes.push(newobj(`teach_output_${key}_peak`, 'peakamp~ 100', [x, 6760, 90, 22], 1, 1, ['float']));
  patcher.boxes.push(flonum(`teach_output_${key}_value`, [x + 105, 6760, 65, 22]));
  patcher.lines.push(line(`teach_output_${key}_receive`, `teach_output_${key}_meter`));
  patcher.lines.push(line(`teach_output_${key}_receive`, `teach_output_${key}_peak`));
  patcher.lines.push(line(`teach_output_${key}_peak`, `teach_output_${key}_value`));
});

patcher.boxes.push(comment('teach_signal_taps_header', '内部只读监听总线（隐藏连线只为保持主流程清楚；源对象见右侧说明）', [40, 6840, 1200, 24], { fontface: 1, textcolor: BLUE }));
const taps = [
  ['s1_voice', 's1_auto_gain', null, 'teach_s1_voice_sig'],
  ['s1_bed', 's1_bed_user_gain', null, 'teach_s1_bed_sig'],
  ['s2_grain', 's2_slice_level', 's2_voice_line', 'teach_s2_grain_sig'],
  ['s2_recall', 's2_recall_level', 's2_voice_line', 'teach_s2_recall_sig'],
  ['s2_hold', 's2_hold_level', 's2_voice_line', 'teach_s2_hold_sig'],
  ['s2_metal', 's2_metal_level', 's2_bed_line', 'teach_s2_metal_sig'],
  ['s2_debris', 's2_bed_particle_event_mix', 's2_bed_line', 'teach_s2_debris_sig'],
  ['s3_voice', 's3_auto_gain', null, 'teach_s3_voice_sig'],
  ['s3_recall', 's3_recall_level', null, 'teach_s3_recall_sig'],
  ['s3_bed', 's3_bed_add_sand', 's3_bed_line', 'teach_s3_bed_sig'],
  ['s3_wave', 's3_bed_particle_level', 's3_bed_line', 'teach_s3_wave_sig'],
  ['master_l', 'out_gain_l', null, 'teach_master_l_sig'],
  ['master_r', 'out_gain_r', null, 'teach_master_r_sig'],
];
taps.forEach(([key, sourceVarname, gainVarname, bus], index) => {
  const col = index % 4;
  const row = Math.floor(index / 4);
  const x = 40 + col * 570;
  const y = 6880 + row * 45;
  const source = requireBox(sourceVarname);
  const monitorGainId = `teach_tap_${key}_gain`;
  const sendId = `teach_tap_${key}_send`;
  patcher.boxes.push(newobj(monitorGainId, '*~ 1.', [x, y, 40, 22], 2, 1, ['signal']));
  patcher.boxes.push(newobj(sendId, `send~ ${bus}`, [x + 50, y, 190, 22], 1, 0, []));
  patcher.boxes.push(comment(`teach_tap_${key}_source`, `← ${sourceVarname}${gainVarname ? ` × ${gainVarname}` : ''}`, [x + 250, y, 270, 22]));
  patcher.lines.push(line(source.id, monitorGainId, 0, 0, true));
  if (gainVarname) patcher.lines.push(line(requireBox(gainVarname).id, monitorGainId, 0, 1, true));
  patcher.lines.push(line(monitorGainId, sendId));
});

fs.writeFileSync(outputPath, `${JSON.stringify(root, null, 4)}\n`);
console.log(JSON.stringify({ inputPath, outputPath, modules: modules.length, boxes: patcher.boxes.length, lines: patcher.lines.length }, null, 2));
