#!/bin/sh
mkdir -p /root/test-data
cd /root/test-data

# Set timezone to Rome
export TZ="Europe/Rome"

while true; do
  fname="data_$(date '+%d_%b_%H_%M_%S').txt"
  {
    echo "=== Test Data File ==="
    echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Epoch: $(date +%s)"
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime)"
    echo ""
    echo "Random data block:"
    dd if=/dev/urandom bs=1K count=100 2>/dev/null | base64
  } > "$fname"
  sleep 30
done
