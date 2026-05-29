#!/bin/bash
set -e

mkdir -p ./bin
chmod 777 ./bin

docker run --rm \
  -v "$(pwd)/bin:/home/build/immortalwrt/bin" \
  -v "$(pwd)/files:/home/build/immortalwrt/files" \
  -v "$(pwd)/build.sh:/home/build/immortalwrt/build.sh" \
  immortalwrt/imagebuilder:x86-64-openwrt-24.10.6 \
  sh -c "chmod -R 777 /home/build/immortalwrt/bin && /home/build/immortalwrt/build.sh"
