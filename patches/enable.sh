#!/bin/sh

cd "$(dirname $0)"

set -xe

TARGET=../debian/patches

mkdir -p "$TARGET"
ls *.patch > "$TARGET/series"
ln *.patch "$TARGET"
