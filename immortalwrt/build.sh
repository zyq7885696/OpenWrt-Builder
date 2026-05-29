#!/bin/bash

# 解决挂载目录权限问题，直接在构建脚本里创建目标目录
mkdir -p /home/build/immortalwrt/bin/targets
chmod 777 /home/build/immortalwrt/bin

PACKAGES=""

# 基础工具
PACKAGES="$PACKAGES curl wget ca-certificates"

# 中文语言包（24.10 正确包名）
PACKAGES="$PACKAGES luci-i18n-base-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"
PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn"

# Argon 主题
PACKAGES="$PACKAGES luci-theme-argon"
PACKAGES="$PACKAGES luci-i18n-argon-config-zh-cn"

# 你要的插件（无 PassWall）
PACKAGES="$PACKAGES luci-app-openclash"        # 科学上网
PACKAGES="$PACKAGES luci-app-diskman"          # 磁盘管理
PACKAGES="$PACKAGES luci-app-ttyd"             # 网页终端
PACKAGES="$PACKAGES luci-app-netdata"          # 系统监控

# 构建：x86_64 + 1024MB 根分区
make image \
  PROFILE="generic" \
  PACKAGES="$PACKAGES" \
  ROOTFS_PARTSIZE="1024"
