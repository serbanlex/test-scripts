#!/bin/sh
mkdir -p /root/test-data
cd /root/test-data

# Force Italy as UTC+1 always (no DST)
offset_sec=$((1 * 3600))

while true; do
  now_utc=$(date -u +%s)
  italy_ts=$((now_utc + offset_sec))

  # Format filename time as UTC+2
  fname="data_$(date -u -d "@$italy_ts" '+%d_%b_%H_%M_%S' 2>/dev/null \
        || date -u -D %s -d "$italy_ts" '+%d_%b_%H_%M_%S').txt"

  {
    echo "=== Test Data File ==="
    echo "UTC Timestamp:        $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo "Forced Italy (UTC+2): $(date -u -d "@$italy_ts" '+%Y-%m-%d %H:%M:%S' 2>/dev/null \
                                || date -u -D %s -d "$italy_ts" '+%Y-%m-%d %H:%M:%S')"
    echo "Fixed Offset:         +2h"
    echo "Epoch (UTC):          $now_utc"
    echo "Epoch (Italy fake):   $italy_ts"
    echo "Hostname:             $(hostname)"
    echo "Uptime:               $(uptime)"
    echo ""
    echo "Random data block:"
    dd if=/dev/urandom bs=1K count=100 2>/dev/null | base64
  } > "$fname"

  sleep 30
done
