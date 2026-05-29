#!/bin/bash

# 初始化软件包列表
PACKAGES=""

# 基础工具
PACKAGES="$PACKAGES curl wget ca-certificates"

# 中文语言包（修正了包名，适配 24.10）
PACKAGES="$PACKAGES luci-i18n-base-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"
PACKAGES="$PACKAGES luci-i18n-opkg-zh-cn"
PACKAGES="$PACKAGES luci-i18n-admin-system-zh-cn"
PACKAGES="$PACKAGES luci-i18n-admin-status-zh-cn"

# 构建镜像，指定 1024MB（1GB）根分区大小
make image PACKAGES="$PACKAGES" ROOTFS_PARTSIZE="1024"
