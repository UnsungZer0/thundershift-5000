# ThunderShift 5000

Mechanical gear shifting for local AI agents.

ThunderShift switches between local Ollama models, cloud/API modes, and ComfyUI GPU mode while preserving state.

## Quick start

```bash
chmod +x tools/thundershift.sh
./tools/thundershift.sh dash
./tools/thundershift.sh gear 0
./tools/thundershift.sh gear 1
```

## Safety

ThunderShift does not delete models, wipe volumes, edit secrets, or expose API keys.
