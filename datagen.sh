#!/bin/sh
mkdir -p /root/test-data
cd /root/test-data

# Always force Italy as UTC+1 (no DST)
offset_hours=1

while true; do
  # File timestamp = UTC + 1 hour
  fname="data_$(date -u -d "${offset_hours} hour" '+%d_%b_%H_%M_%S').txt"

  {
    echo "=== Test Data File ==="

    echo "UTC Timestamp:        $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo "Forced Italy (UTC+1): $(date -u -d "${offset_hours} hour" '+%Y-%m-%d %H:%M:%S')"
    echo "Fixed Offset:         +1h"

    echo "Epoch:                $(date -u +%s)"
    echo "Hostname:             $(hostname)"
    echo "Uptime:               $(uptime)"
    echo ""
    echo "Random data block:"
    dd if=/dev/urandom bs=1K count=100 2>/dev/null | base64
  } > "$fname"

  sleep 30
done
