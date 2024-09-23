#!/usr/bin/env bash

# Script for testing all Pkl packages.
# Usage: ./scripts/test.sh [update]
#
# If the "update" argument is passed, the script will overwrite the existing
# snapshots.
#
# It must be executed from the project's root directory.

set -e

failed=false
overwrite=false

for arg in "$@"; do
  if [ "$arg" = "update" ]; then
    overwrite=true
    break
  fi
done

for dir in packages/*/; do
  if [ -d "$dir" ]; then
    args=("test" "--project-dir" "$dir" "--junit-reports" "report")

    if [ "$overwrite" = "true" ]; then
      args+=("--overwrite")
    fi

    pkl "${args[@]}"

    if [ $? -ne 0 ]; then
      failed=true
    fi
  fi
done

if [ "$failed" = true ]; then
  exit 1
fi
