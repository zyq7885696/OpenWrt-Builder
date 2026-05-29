#!/bin/bash
set -e

# 1. 本地创建 bin 目录并设为 777 权限
mkdir -p ./bin
chmod 777 ./bin

# 2. 运行构建容器，去掉容器内的 chmod，直接运行 build.sh
docker run --rm \
  -v "$(pwd)/bin:/home/build/immortalwrt/bin" \
  -v "$(pwd)/files:/home/build/immortalwrt/files" \
  -v "$(pwd)/build.sh:/home/build/immortalwrt/build.sh" \
  immortalwrt/imagebuilder:x86-64-openwrt-24.10.6 \
  /home/build/immortalwrt/build.sh
