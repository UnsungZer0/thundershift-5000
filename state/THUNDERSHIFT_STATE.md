# ThunderShift State

Current Gear: 0
Current Brain: none
Previous Gear: unknown
Previous Brain: unknown

Active Task: none
Last Action: Phase 2 complete — all gears tested and verified on hrvstr
Next Action: Phase 3 — failure detection, BLINKER stack, GAS/BRAKE classifier

GPU Status: RTX 3090 24GB VRAM — idle at Gear 0

Loaded Ollama Models: none

Comfy Mode: inactive

## Gear Map (confirmed)
- Gear 0: Neutral / Garage — GPU free
- Gear 1: qwen3:14b — 14GB, 100% GPU
- Gear 2: gemma3:27b — 22GB, 100% GPU
- Gear 3: qwen3-coder:30b — 21GB, 100% GPU
- Gear 4: Cloud/API — metadata only, no model swap yet
- Gear 5: Comfy Mode — unloads Ollama, GPU reserved for ComfyUI

## Notes
- qwen3:32b removed — does not fit fully in 24GB VRAM
- openclaw-gateway.service wired to shift Gear 1 on start (ExecStartPre)
- Gear 4 sub-gears (Codex, Claude, Grok) defined in config but not yet active
- Gear 5 does not auto-launch ComfyUI — clears GPU only

Last Updated: 2026-05-29
