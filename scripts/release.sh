#!/usr/bin/env bash

set -ex

if [ -z "$PACKAGE_VERSION" ]; then
  echo "Error: PACKAGE_VERSION is not set." >&2
  exit 1
fi

git tag "$PACKAGE_VERSION"
git push origin "$PACKAGE_VERSION"
