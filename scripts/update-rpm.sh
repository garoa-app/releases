#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <CHANNEL> <RPM_PATH>"
  exit 1
fi

CHANNEL="$1"
RPM_PATH="$2"

REPO_ROOT="${CHANNEL}/rpm"
PACKAGES_DIR="${REPO_ROOT}/Packages"
mkdir -p "$PACKAGES_DIR"

cp "$RPM_PATH" "$PACKAGES_DIR/"

pushd "$REPO_ROOT" > /dev/null

RPM_BASENAME="$(basename "$RPM_PATH")"
EXISTING_RPM_COUNT=$(find . -name "*.rpm" ! -name "$RPM_BASENAME" | wc -l)

if [[ $EXISTING_RPM_COUNT -gt 0 ]]; then
  createrepo_c --update .
else
  createrepo_c .
fi

popd > /dev/null
