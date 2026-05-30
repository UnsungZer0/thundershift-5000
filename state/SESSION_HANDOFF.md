# Session Handoff

Project: ACE / OpenClaw / ThunderShift 5000

Last Completed:
Phase 2 — all gears tested and verified on RTX 3090 host. qwen3:32b removed (spills VRAM). Gears renumbered. openclaw-gateway.service wired to shift Gear 1 on startup.

Current Gear Map:
- Gear 0: Neutral
- Gear 1: qwen3:14b (14GB, 100% GPU)
- Gear 2: gemma3:27b (22GB, 100% GPU)
- Gear 3: qwen3-coder:30b (21GB, 100% GPU)
- Gear 4: Cloud/API (metadata only)
- Gear 5: Comfy Mode (clears GPU, does not launch ComfyUI)

Next Step:
Phase 3 — add failure detection, BLINKER stack, GAS/BRAKE task classifier.

Open Items:
- Gear 4 does not yet swap OpenClaw's active provider — needs openclaw.json integration.
- Gear 5 does not auto-launch ComfyUI — manual start required after shifting.

Do Not Forget:
No shift without save, execute, verify, resume.
