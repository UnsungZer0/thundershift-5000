# Changelog

## 0.2.0
- Tested all gears on RTX 3090 host.
- Removed qwen3:32b — does not fit fully in 24GB VRAM.
- Dropped Gear 3, renumbered: Gear 3 is now Local Coding (qwen3-coder:30b).
- Confirmed Gear 1 (qwen3:14b), Gear 2 (gemma3:27b), Gear 3 (qwen3-coder:30b) all run 100% GPU.
- Updated config and script to match confirmed model lineup.

## 0.1.0
- Added starter implementation.
- Added mechanical gear script.
- Added OpenClaw skill stub.
- Added state and handoff templates.
