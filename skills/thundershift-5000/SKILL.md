---
name: thundershift-5000
description: Mechanical gear shifting across local models, cloud modes, and ComfyUI GPU mode.
---

# ThunderShift 5000 Skill

Use this skill when the agent needs to change operating mode, unload/load local models, reserve the GPU for ComfyUI, or check model/GPU status.

## Commands

```bash
tools/thundershift.sh dash
tools/thundershift.sh gear 0
tools/thundershift.sh gear 1
tools/thundershift.sh gear 2
tools/thundershift.sh gear 3
tools/thundershift.sh gear 4
tools/thundershift.sh gear 5
tools/thundershift.sh tow
```

## Rules

- Do not delete models.
- Do not wipe Docker volumes.
- Do not expose API keys.
- Verify every shift.
