#!/usr/bin/env bash
set -euo pipefail

STATE_DIR="${THUNDERSHIFT_STATE_DIR:-$HOME/.openclaw/state}"
STATE_FILE="$STATE_DIR/THUNDERSHIFT_STATE.md"
HANDOFF_FILE="$STATE_DIR/SESSION_HANDOFF.md"
LOG_FILE="$STATE_DIR/THUNDERSHIFT_LOG.md"
mkdir -p "$STATE_DIR"

timestamp(){ date +"%Y-%m-%d %H:%M:%S"; }
log(){ echo "- $(timestamp) $*" >> "$LOG_FILE"; }

ollama_api(){
  curl -s http://localhost:11434/api/generate -d "$1" || true
}

unload_model(){
  local model="$1"
  echo "Unloading $model..."
  ollama_api "{\"model\":\"$model\",\"prompt\":\"\",\"keep_alive\":0}" >/dev/null
}

unload_known_models(){
  unload_model "qwen3:14b"
  unload_model "gemma3:27b"
  unload_model "qwen3-coder:30b"
}

save_handoff(){
  cat > "$HANDOFF_FILE" <<EOF
# Session Handoff

Project: ACE / OpenClaw / ThunderShift 5000

Last Completed:
$1

Next Step:
Check THUNDERSHIFT_STATE.md and continue.

Do Not Forget:
No shift without save, execute, verify, resume.
EOF
}

write_state(){
  local gear="$1"
  local brain="$2"
  local action="$3"
  cat > "$STATE_FILE" <<EOF
# ThunderShift State

Current Gear: $gear
Current Brain: $brain
Previous Gear: unknown
Previous Brain: unknown

Active Task: unknown
Last Action: $action
Next Action: unknown

GPU Status:
\`\`\`
$(nvidia-smi 2>/dev/null || echo "nvidia-smi unavailable")
\`\`\`

Loaded Ollama Models:
\`\`\`
$(ollama ps 2>/dev/null || echo "ollama ps unavailable")
\`\`\`

Comfy Mode: $([ "$gear" = "5" ] && echo "active" || echo "inactive")

Last Shift: $(timestamp)
Last Verification: $(timestamp)
EOF
}

verify(){
  echo
  echo "Ollama loaded models:"
  ollama ps || true
  echo
  echo "GPU status:"
  nvidia-smi || true
}

dash(){
  echo "ThunderShift 5000 Dashboard"
  echo "State: $STATE_FILE"
  echo "Handoff: $HANDOFF_FILE"
  verify
}

gear0(){
  echo "Shifting to Gear 0: Neutral / Garage"
  save_handoff "Preparing Gear 0."
  unload_known_models
  write_state "0" "none" "Shifted to Neutral / Garage"
  log "Shifted to Gear 0"
  verify
}

gear1(){
  echo "Shifting to Gear 1: Fast Local qwen3:14b"
  save_handoff "Preparing Gear 1."
  unload_known_models
  ollama run qwen3:14b "Reply with only: gear 1 ready" || true
  write_state "1" "qwen3:14b" "Shifted to Fast Local"
  log "Shifted to Gear 1"
  verify
}

gear2(){
  echo "Shifting to Gear 2: Balanced Local gemma3:27b"
  save_handoff "Preparing Gear 2."
  unload_known_models
  ollama run gemma3:27b "Reply with only: gear 2 ready" || true
  write_state "2" "gemma3:27b" "Shifted to Balanced Local"
  log "Shifted to Gear 2"
  verify
}

gear3(){
  echo "Shifting to Gear 3: Local Coding qwen3-coder:30b"
  save_handoff "Preparing Gear 3."
  unload_known_models
  ollama run qwen3-coder:30b "Reply with only: gear 3 ready" || true
  write_state "3" "qwen3-coder:30b" "Shifted to Local Coding"
  log "Shifted to Gear 3"
  verify
}

gear4(){
  echo "Shifting to Gear 4: Cloud/API metadata mode"
  save_handoff "Preparing Gear 4."
  write_state "4" "cloud/api" "Recorded Cloud/API mode"
  log "Shifted to Gear 4 metadata mode"
}

gear5(){
  echo "Shifting to Gear 5: Comfy Mode"
  save_handoff "Preparing Gear 5."
  unload_known_models
  write_state "5" "comfyui" "Shifted to Comfy Mode, GPU reserved"
  log "Shifted to Gear 5"
  verify
}

tow(){
  echo "Tow mode: basic recovery"
  save_handoff "Tow recovery started."
  unload_known_models
  write_state "0" "none" "Tow recovery completed, returned to Gear 0"
  log "Tow recovery completed"
  verify
}

usage(){
  cat <<EOF
ThunderShift 5000

Usage:
  $0 dash
  $0 gear 0
  $0 gear 1
  $0 gear 2
  $0 gear 3
  $0 gear 4
  $0 gear 5
  $0 garage
  $0 tow
EOF
}

case "${1:-}" in
  dash) dash ;;
  gear)
    case "${2:-}" in
      0) gear0 ;;
      1) gear1 ;;
      2) gear2 ;;
      3) gear3 ;;
      4) gear4 ;;
      5) gear5 ;;
      *) usage; exit 1 ;;
    esac ;;
  garage) gear0 ;;
  tow) tow ;;
  *) usage ;;
esac
