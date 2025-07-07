#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <CHANNEL> <DEB_PATH>"
  exit 1
fi

CHANNEL="$1"
DEB_PATH="$2"

REPO_ROOT="${CHANNEL}/apt"
POOL_DIR="${REPO_ROOT}/pool/main"
DIST_BASE="${REPO_ROOT}/dists/${CHANNEL}"
DIST_DIR="${DIST_BASE}/main/binary-amd64"

mkdir -p "$POOL_DIR" "$DIST_DIR"

cp "$DEB_PATH" "$POOL_DIR/"

pushd "$REPO_ROOT" > /dev/null
dpkg-scanpackages -m pool /dev/null | tee dists/${CHANNEL}/main/binary-amd64/Packages | gzip -9c > dists/${CHANNEL}/main/binary-amd64/Packages.gz
popd > /dev/null

apt-ftparchive -c="$REPO_ROOT/apt-release.conf" release "$DIST_BASE" > "$DIST_BASE/Release"

echo "$GPG_PRIVATE_KEY" | gpg --batch --yes --import

gpg --batch --yes --pinentry-mode loopback --passphrase "$GPG_PASSPHRASE" -abs -o "$DIST_BASE/Release.gpg" "$DIST_BASE/Release"
gpg --batch --yes --pinentry-mode loopback --passphrase "$GPG_PASSPHRASE" --clearsign -o "$DIST_BASE/InRelease" "$DIST_BASE/Release"

