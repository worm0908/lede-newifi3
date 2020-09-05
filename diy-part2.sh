#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 添加atmaterial主题
git clone https://github.com/kenzok8/openwrt-packages package/kenzok8
mv package/kenzok8/luci-theme-atmaterial package/lean
rm -rf package/kenzok8

# 修改默认配置
sed -i -e 's/192.168.1.1/192.168.5.1/' -e 's/OpenWrt/RT-DF/' package/base-files/files/bin/config_generate
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/\+luci-theme-bootstrap/+luci-theme-atmaterial/' feeds/luci/collections/luci/Makefile
sed -i 's/mediaurlbase \/luci-static\/bootstrap/mediaurlbase \/luci-static\/atmaterial_Brown/' feeds/luci/modules/luci-base/root/etc/config/luci

# 添加Hellow world
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
#git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
