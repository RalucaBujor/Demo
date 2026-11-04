#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$SNAPSHOT_ACCEPT" = "1" ]; then
  RECORD_MODE="all"
  echo "🟢  Snapshot record mode (Record.all)"
else
  RECORD_MODE="never"
  echo "🧩  Snapshot verify mode (Record.never)"
fi
sourcery \
  --sources "$SCRIPT_DIR/../Sources" \
  --templates "$SCRIPT_DIR/PreviewProvider.stencil" \
  --output "$SCRIPT_DIR/../Tests/DesignSystemTests/SnapshotTests.swift" \
  --args recordMode="$RECORD_MODE" \
  --verbose
