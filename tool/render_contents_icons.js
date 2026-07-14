#!/usr/bin/env node
/**
 * Render Sotong Contents Promo brand icons from SVG sources.
 * Requires: npm install --prefix tool @resvg/resvg-js
 */
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { Resvg } = require('@resvg/resvg-js');

const ROOT = path.resolve(__dirname, '..');
const SRC_ICON = path.join(ROOT, 'web', 'icons', 'sotong_contents_icon.svg');
const SRC_MASKABLE = path.join(ROOT, 'web', 'icons', 'sotong_contents_icon_maskable.svg');
const BRAND_COPY = path.join(ROOT, 'assets', 'branding', 'sotong_contents_icon.svg');

const OUTPUTS = [
  { svg: SRC_ICON, out: path.join(ROOT, 'web', 'favicon.png'), size: 48 },
  { svg: SRC_ICON, out: path.join(ROOT, 'web', 'icons', 'Icon-192.png'), size: 192 },
  { svg: SRC_ICON, out: path.join(ROOT, 'web', 'icons', 'Icon-512.png'), size: 512 },
  { svg: SRC_MASKABLE, out: path.join(ROOT, 'web', 'icons', 'Icon-maskable-192.png'), size: 192 },
  { svg: SRC_MASKABLE, out: path.join(ROOT, 'web', 'icons', 'Icon-maskable-512.png'), size: 512 },
];

function sha256(filePath) {
  return crypto.createHash('sha256').update(fs.readFileSync(filePath)).digest('hex');
}

function pngSize(buf) {
  if (buf[0] !== 0x89 || buf[1] !== 0x50) {
    throw new Error('Not a PNG');
  }
  const width = buf.readUInt32BE(16);
  const height = buf.readUInt32BE(20);
  return { width, height };
}

function renderOne({ svg, out, size }) {
  const svgData = fs.readFileSync(svg);
  const resvg = new Resvg(svgData, {
    fitTo: { mode: 'width', value: size },
  });
  const pngData = resvg.render().asPng();
  fs.mkdirSync(path.dirname(out), { recursive: true });
  fs.writeFileSync(out, pngData);

  const { width, height } = pngSize(pngData);
  if (width !== size || height !== size) {
    throw new Error(`${out} size is ${width}x${height}, expected ${size}x${size}`);
  }
  if (pngData.length <= 0) {
    throw new Error(`${out} is empty`);
  }

  const rel = path.relative(ROOT, out);
  console.log(
    `OK ${rel} ${width}x${height} bytes=${pngData.length} sha256=${sha256(out).slice(0, 12)}`
  );
}

function main() {
  if (!fs.existsSync(SRC_ICON)) throw new Error(`Missing ${SRC_ICON}`);
  if (!fs.existsSync(SRC_MASKABLE)) throw new Error(`Missing ${SRC_MASKABLE}`);

  fs.mkdirSync(path.dirname(BRAND_COPY), { recursive: true });
  fs.copyFileSync(SRC_ICON, BRAND_COPY);
  console.log('Copied branding SVG');

  console.log('Rendering icons...');
  for (const job of OUTPUTS) {
    renderOne(job);
  }
  console.log('Done.');
}

main();
