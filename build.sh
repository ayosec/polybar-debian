#!/bin/sh

BRANCH="${VERSION:-3.4.1}"
TARGET="$PWD"
DEBIAN_FRONTEND=noninteractive
DEB_BUILD_OPTIONS=parallel=$(nproc)

export DEBIAN_FRONTEND DEB_BUILD_OPTIONS

set -xeu

# Base dependencies

apt-get update
apt-get install -y devscripts equivs git

# Download sources

cd "$(mktemp -d)"

git clone --depth 1 -b "$BRANCH" https://github.com/polybar/polybar.git

cd polybar
git submodule update --init --recursive

# Build package

cp -a "$TARGET/debian" .

yes | mk-build-deps -i
dpkg-source --before-build .
debian/rules binary

# Copy .deb files

TARGET_UID="$(stat --printf %u "$TARGET")"
TARGET_GID="$(stat --printf %g "$TARGET")"

install -o "$TARGET_UID" -g "$TARGET_GID" -t "$TARGET/target" ../*.deb
