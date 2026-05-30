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

## Gears

| Gear | Default model | Use for |
|------|---------------|---------|
| 0 | Neutral | GPU free — park between sessions or before ComfyUI |
| 1 | qwen3:14b | Default — general tasks, conversation, workspace ops |
| 2 | gemma3:27b | Vision — reading/analyzing images |
| 3 | qwen3-coder:30b | Coding — writing code, editing files, software projects |
| 4 | Cloud/API | Metadata only — stub for external provider switching |
| 5 | Comfy Mode | Unloads Ollama, reserves GPU for ComfyUI |

## When to shift

Add these rules to your agent's startup context:

- **Stay in Gear 1** for general tasks, memory, planning, conversation.
- **Shift to Gear 2** for vision tasks — images, screenshots, visual analysis.
- **Shift to Gear 3** for coding — writing or editing code, multi-file changes, software projects.
- **Shift to Gear 5** before ComfyUI work — clears the GPU, then start ComfyUI manually.
- **Return to Gear 1** after any heavy task. Don't leave a large model loaded unnecessarily.

## Driver controls

| Command | Meaning |
|---------|---------|
| `dash` | Show current state and GPU status |
| `gear <n>` | Shift to gear n (0–5) |
| `garage` | Alias for gear 0 |
| `tow` | Recovery — unload everything, return to Gear 0 |

## Safety

ThunderShift does not delete models, wipe volumes, edit secrets, or expose API keys.
