#!/usr/bin/env bash

set -ex

if [ -z "$PACKAGE_VERSION" ]; then
  echo "Error: PACKAGE_VERSION is not set." >&2
  exit 1
fi

rm -rf build
pkl project package packages/* --output-path build
