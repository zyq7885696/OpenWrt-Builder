#!/bin/bash

# 提前创建目录，避免权限问题
mkdir -p /home/build/immortalwrt/bin/targets
chmod 777 /home/build/immortalwrt/bin

# 只保留 100% 官方源里的包
PACKAGES=""
PACKAGES="$PACKAGES luci-i18n-base-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"
PACKAGES="$PACKAGES luci-theme-argon"

# 构建命令（generic + 1024MB）
make image \
  PROFILE="generic" \
  PACKAGES="$PACKAGES" \
  ROOTFS_PARTSIZE="1024"
