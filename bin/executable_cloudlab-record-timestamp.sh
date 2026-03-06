#!/usr/bin/env bash
# Records prompt submission timestamp per session
set -euo pipefail
payload=$(cat)
session_id=$(echo "$payload" | jq -r '.session_id // "default"')
date +%s > "/tmp/claude-prompt-timestamp-${session_id}"
