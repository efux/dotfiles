#!/usr/bin/env bash
set -euo pipefail

if pgrep -x wf-recorder >/dev/null 2>&1; then
    jq -nc \
        --arg text 'Press $mod+Escape to stop recording <span foreground="#f53c3c">●</span>' \
        --arg tooltip 'Click to stop the recording' \
        '{text: $text, tooltip: $tooltip, class: "recording"}'
else
    jq -nc '{text: "", tooltip: "", class: ""}'
fi
