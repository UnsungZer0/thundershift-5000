# Roadmap

## Phase 1 ✓
- Clone repo onto the host machine.
- Run `tools/thundershift.sh dash`.
- Test Gear 0 and Gear 1.

## Phase 2 ✓
- Tested all gears on the host machine.
- Dropped qwen3:32b (doesn't fit in 24GB GPU).
- Renumbered gears — Gear 3 is now Local Coding (qwen3-coder:30b).
- Confirmed Gears 1, 2, 3 all run 100% GPU.

## Phase 3
- Add better failure detection.
- Add BLINKER stack.
- Add GAS/BRAKE task classifier.

## Phase 4
- Integrate as an OpenClaw skill.
