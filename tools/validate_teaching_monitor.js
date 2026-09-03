#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const patchPath = path.resolve(process.argv[2] || path.join(__dirname, '..', 'Nostos_Performance_v01.maxpat'));
const root = JSON.parse(fs.readFileSync(patchPath, 'utf8'));
const errors = [];
const globalNames = new Map();

function walk(patcher, location) {
  const boxes = new Map();
  for (const entry of patcher.boxes || []) {
    const box = entry.box;
    boxes.set(box.id, box);
    if (!box.varname) errors.push(`${location}: ${box.id} has no Scripting Name`);
    else if (globalNames.has(box.varname)) errors.push(`${location}: duplicate Scripting Name ${box.varname}`);
    else globalNames.set(box.varname, `${location}/${box.id}`);
    if (box.patcher) walk(box.patcher, `${location}/${box.varname || box.id}`);
  }
  for (const entry of patcher.lines || []) {
    const { source, destination } = entry.patchline;
    const sourceBox = boxes.get(source[0]);
    const destinationBox = boxes.get(destination[0]);
    if (!sourceBox || !destinationBox) {
      errors.push(`${location}: broken line ${source[0]} -> ${destination[0]}`);
      continue;
    }
    if (source[1] >= sourceBox.numoutlets) errors.push(`${location}: invalid outlet ${sourceBox.varname}[${source[1]}]`);
    if (destination[1] >= destinationBox.numinlets) errors.push(`${location}: invalid inlet ${destinationBox.varname}[${destination[1]}]`);
  }
}

walk(root.patcher, 'root');

const expectedRows = [
  's1_voice', 's1_reverse', 's1_lurch', 's1_bed',
  's2_grains', 's2_storm', 's2_hold', 's2_metal', 's2_recall', 's2_debris',
  's3_voice', 's3_oracle', 's3_recall', 's3_bed', 's3_wave',
];
const topBoxes = new Map(root.patcher.boxes.map((entry) => [entry.box.varname, entry.box]));
for (const key of expectedRows) {
  for (const suffix of ['control_flash', 'active_light', 'meter', 'peak_value', 'audio_light']) {
    const name = `teach_row_${key}_${suffix}`;
    if (!topBoxes.has(name)) errors.push(`missing teaching row object ${name}`);
  }
}

for (const entry of root.patcher.lines) {
  const source = String(entry.patchline.source[0]);
  const destination = String(entry.patchline.destination[0]);
  if (source.startsWith('teach_') && !destination.startsWith('teach_')) {
    errors.push(`teaching layer writes into production chain: ${source} -> ${destination}`);
  }
}

const teachingBoxes = root.patcher.boxes
  .map((entry) => entry.box)
  .filter((box) => String(box.id).startsWith('teach_') && box.id !== 'teach_status_logic' && box.patching_rect);
for (let i = 0; i < teachingBoxes.length; i += 1) {
  for (let j = i + 1; j < teachingBoxes.length; j += 1) {
    const a = teachingBoxes[i];
    const b = teachingBoxes[j];
    const A = a.patching_rect;
    const B = b.patching_rect;
    const overlaps = A[0] < B[0] + B[2] && A[0] + A[2] > B[0] && A[1] < B[1] + B[3] && A[1] + A[3] > B[1];
    if (overlaps) errors.push(`teaching layout overlap: ${a.varname} / ${b.varname}`);
  }
}

const productionBoxes = root.patcher.boxes
  .map((entry) => entry.box)
  .filter((box) => !String(box.id).startsWith('teach_') && box.patching_rect);
for (const local of teachingBoxes.filter((box) => String(box.id).startsWith('teach_local_'))) {
  const A = local.patching_rect;
  for (const production of productionBoxes) {
    const B = production.patching_rect;
    const overlaps = A[0] < B[0] + B[2] && A[0] + A[2] > B[0] && A[1] < B[1] + B[3] && A[1] + A[3] > B[1];
    if (overlaps) errors.push(`local status overlaps production object: ${local.varname} / ${production.varname}`);
  }
}

if (errors.length) {
  console.error(errors.join('\n'));
  process.exit(1);
}

console.log(JSON.stringify({
  patchPath,
  monitoredModules: expectedRows.length,
  namedObjects: globalNames.size,
  teachingObjects: teachingBoxes.length + 1,
  result: 'ok',
}, null, 2));
