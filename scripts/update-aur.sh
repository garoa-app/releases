#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <VERSION> <CHANNEL> <DEB_PATH>"
  exit 1
fi

VERSION="$1"
CHANNEL="$2"
DEB_PATH="$3"

PKGVER="${VERSION#v}"
PKG_DIR="${CHANNEL}/aur"
PKGBUILD="${PKG_DIR}/PKGBUILD"

if [[ "$CHANNEL" == "beta" ]]; then
  PKGVER_TILDE="${PKGVER/-/\~}"

  sed -i \
    -e "s|^pkgver=.*|pkgver=${PKGVER_TILDE}|" \
    -e "s|^_upstream=.*|_upstream=${PKGVER}|" \
    "$PKGBUILD"
else
  sed -i \
    -e "s|^pkgver=.*|pkgver=${PKGVER}|" \
    "$PKGBUILD"
fi

SHA256=$(sha256sum "$DEB_PATH" | awk '{print $1}')

sed -i \
  -e "s|^sha256sums_x86_64=.*|sha256sums_x86_64=('${SHA256}')|" \
  "$PKGBUILD"

pushd "$PKG_DIR" > /dev/null
makepkg --printsrcinfo > .SRCINFO
popd > /dev/null
