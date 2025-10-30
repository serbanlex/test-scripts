#!/bin/sh
mkdir -p /root/test-data
cd /root/test-data
while true; do
  ts=$(date +%s)
  fname="data_$ts.txt"
  {
    echo "=== Test Data File ==="
    echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Epoch: $ts"
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime)"
    echo ""
    echo "Random data block:"
    dd if=/dev/urandom bs=1K count=100 2>/dev/null | base64
  } > "$fname"
  sleep 30
done
