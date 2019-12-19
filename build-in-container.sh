#!/bin/bash

set -eu

TARGET="$(dirname "$0" | xargs realpath)"
VERSION="3.4.1"
IMAGE="debian:buster"

while getopts "v:i:h" opt
do
  case "$opt" in
    v)
      VERSION="$OPTARG"
      ;;
    i)
      IMAGE="$OPTARG"
      ;;
    h)
      echo "Usage: $0 [-i image] [-v version]"
      exit 0
      ;;
    *)
      exit 1
      ;;
  esac
done

docker run --rm           \
  --name polybar-build-$$ \
  -v "$TARGET:/target"    \
  -w /target              \
  -e "VERSION=$VERSION"   \
  --user root             \
  "$IMAGE"                \
  sh build.sh
