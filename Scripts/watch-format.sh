#!/bin/bash

# watch-format.sh
# Watches for file changes and runs make format with queueing

set -e

LOCK_FILE="/tmp/swiftuiml-format.lock"
QUEUE_FILE="/tmp/swiftuiml-format.queue"

# Cleanup on exit
trap "rm -f $LOCK_FILE $QUEUE_FILE" EXIT INT TERM

# Clean any stale lock files
rm -f "$LOCK_FILE" "$QUEUE_FILE"

echo "Watching for file changes... (press Ctrl+C to stop)"
echo "Requires fswatch: brew install fswatch"
echo ""

fswatch -o \
  --exclude ".*\.git/.*" \
  --exclude ".*\.build/.*" \
  --exclude ".*node_modules/.*" \
  --exclude ".*\.swiftpm/.*" \
  --exclude ".*__Snapshots__/.*" \
  Sources/ Tests/ TypeScript/src/ TypeScript/tests/ | while read -r; do

  if [ -f "$LOCK_FILE" ]; then
    # Already running, queue another run
    touch "$QUEUE_FILE"
    echo "[$(date +%H:%M:%S)] Formatting in progress, queued another run."
  else
    # Start formatting
    touch "$LOCK_FILE"
    echo "[$(date +%H:%M:%S)] Running make format..."
    make format 2>&1 | sed 's/^/  /'
    echo "[$(date +%H:%M:%S)] Formatting complete."
    rm -f "$LOCK_FILE"

    # Check if another run was queued
    if [ -f "$QUEUE_FILE" ]; then
      rm -f "$QUEUE_FILE"
      echo "[$(date +%H:%M:%S)] Running queued format..."
      touch "$LOCK_FILE"
      make format 2>&1 | sed 's/^/  /'
      echo "[$(date +%H:%M:%S)] Formatting complete."
      rm -f "$LOCK_FILE"
    fi
  fi
done
