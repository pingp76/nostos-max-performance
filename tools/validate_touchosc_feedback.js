#!/usr/bin/env node

const fs = require('fs');
const zlib = require('zlib');

const root = JSON.parse(fs.readFileSync('Nostos_Performance_v01.maxpat', 'utf8'));
const missing = [];
const duplicates = [];
const broken = [];

function walk(patcher, path) {
  const ids = new Set();
  const names = new Set();
  for (const entry of patcher.boxes || []) {
    const box = entry.box;
    ids.add(box.id);
    if (!box.varname) missing.push(`${path}:${box.id}`);
    else if (names.has(box.varname)) duplicates.push(`${path}:${box.varname}`);
    else names.add(box.varname);
    if (box.patcher) walk(box.patcher, `${path}/${box.varname || box.id}`);
  }
  for (const entry of patcher.lines || []) {
    const patchline = entry.patchline;
    if (!ids.has(patchline.source[0]) || !ids.has(patchline.destination[0])) {
      broken.push(`${path}:${patchline.source[0]}->${patchline.destination[0]}`);
    }
  }
}

walk(root.patcher, 'root');

const feedback = root.patcher.boxes.find((entry) => entry.box.varname === 'touchosc_feedback').box.patcher;
const namesById = new Map(feedback.boxes.map((entry) => [entry.box.id, entry.box.varname]));
const transportLines = feedback.lines
  .filter((entry) => {
    const patchline = entry.patchline;
    return (namesById.get(patchline.source[0]) || '').includes('transport')
      || (namesById.get(patchline.destination[0]) || '').includes('transport');
  })
  .map((entry) => {
    const patchline = entry.patchline;
    return [namesById.get(patchline.source[0]), patchline.source[1], namesById.get(patchline.destination[0]), patchline.destination[1]];
  });

const xml = zlib.inflateSync(fs.readFileSync('nostos_full.tosc')).toString('utf8');
const nodeIds = [...xml.matchAll(/<node ID='([^']+)'/g)].map((match) => match[1]);

console.log(JSON.stringify({
  maxpat: {
    missing: missing.length,
    duplicates: duplicates.length,
    broken: broken.length,
    transportLines,
  },
  touchosc: {
    xmlVersion6: xml.includes("<lexml version='6'>"),
    transportPath: xml.includes('/nostos/state/transport'),
    transportSecondArgument: xml.includes('setTimer(argumentValue(message, 2))'),
    updatesTopAndFeedbackStage: xml.includes("setText('status_label', text)"),
    nodes: nodeIds.length,
    uniqueNodeIds: new Set(nodeIds).size,
  },
}, null, 2));
