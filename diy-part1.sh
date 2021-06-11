#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Add a feed source
if [[ `grep -qiE "kenzo8" feeds.conf.default` -eq 1 ]] ; then
  sed -i 'src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
  sed -i 'src-git small https://github.com/kenzok8/small' feeds.conf.default
fi
