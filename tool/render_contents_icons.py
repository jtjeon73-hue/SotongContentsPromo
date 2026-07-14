#!/usr/bin/env python3
"""Render Sotong Contents Promo brand icons from SVG sources."""

from __future__ import annotations

import hashlib
import shutil
from pathlib import Path

import cairosvg
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
SRC_ICON = ROOT / "web" / "icons" / "sotong_contents_icon.svg"
SRC_MASKABLE = ROOT / "web" / "icons" / "sotong_contents_icon_maskable.svg"
BRAND_COPY = ROOT / "assets" / "branding" / "sotong_contents_icon.svg"

OUTPUTS = [
    (SRC_ICON, ROOT / "web" / "favicon.png", 48),
    (SRC_ICON, ROOT / "web" / "icons" / "Icon-192.png", 192),
    (SRC_ICON, ROOT / "web" / "icons" / "Icon-512.png", 512),
    (SRC_MASKABLE, ROOT / "web" / "icons" / "Icon-maskable-192.png", 192),
    (SRC_MASKABLE, ROOT / "web" / "icons" / "Icon-maskable-512.png", 512),
]


def render_png(svg_path: Path, out_path: Path, size: int) -> None:
    png_bytes = cairosvg.svg2png(
        url=str(svg_path),
        output_width=size,
        output_height=size,
    )
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_bytes(png_bytes)

    with Image.open(out_path) as img:
        if img.size != (size, size):
            raise RuntimeError(f"{out_path} size is {img.size}, expected {(size, size)}")
        if img.mode not in ("RGB", "RGBA", "P"):
            raise RuntimeError(f"{out_path} unexpected mode {img.mode}")
        if out_path.stat().st_size <= 0:
            raise RuntimeError(f"{out_path} is empty")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    if not SRC_ICON.exists():
        raise FileNotFoundError(SRC_ICON)
    if not SRC_MASKABLE.exists():
        raise FileNotFoundError(SRC_MASKABLE)

    BRAND_COPY.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(SRC_ICON, BRAND_COPY)

    print("Rendering icons...")
    for svg_path, out_path, size in OUTPUTS:
        render_png(svg_path, out_path, size)
        with Image.open(out_path) as img:
            print(
                f"OK {out_path.relative_to(ROOT)} "
                f"{img.size[0]}x{img.size[1]} mode={img.mode} "
                f"bytes={out_path.stat().st_size} sha256={sha256(out_path)[:12]}"
            )

    print("Done.")


if __name__ == "__main__":
    main()
