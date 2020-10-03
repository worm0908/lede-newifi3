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

# 添加atmaterial主题'
#[ -e package/lean/luci-theme-atmaterial ] && rm -rf package/lean/luci-theme-atmaterial
#git clone https://github.com/kenzok8/openwrt-packages package/kenzok8
#mv package/kenzok8/luci-theme-atmaterial package/lean
#rm -rf package/kenzok8

# Passwall from kenzok8
git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
git clone https://github.com/kenzok8/small package/small

# 添加lua-maxminddb依赖'
#[ -e package/lean/lua-maxminddb ] && rm -rf package/lean/lua-maxminddb
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb
# 添加Hellow world'
#[ -e package/lean/luci-app-vssr ] && rm -rf package/lean/luci-app-vssr
#git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr

# 更改默认设置'
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/RT-HOME/g' package/base-files/files/bin/config_generate
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/\+luci-theme-bootstrap/+luci-theme-atmaterial/g' feeds/luci/collections/luci/Makefile
sed -i 's/bootstrap/atmaterial_Brown/g' feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's~$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.~$1$5p2C0aMa$F75x3a/k3vM24iMXmb1d71~' package/lean/default-settings/files/zzz-default-settings
sed -i -e '/echo.+authorized_keys$/,+1d' -e "/wgetrc$/a\\\\necho 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDikWAn\\/vJiuyknfrq\\/cfxtmLxbCulfgdV67TKVHV5b5CyOkt2z7ycSPy90ige3KiFpP6OAQ\\/VTv6eL7hALUtx0+vdesYDJah6DgHGRQNt+FNC5jl6u1BnViGgnu3rGcq+l6scK0213VifZMYNqks3IkOhR11dWhapTXgHVbuCPsr8uGJSwDlPs4jCBhPTN5VCC9vuDSKR4KBKw33YDY\\/fN778G6ReDezLWe3d3xVjGGD5yKJxoVgwsHFyjCwAzwkbhdaFPZLFZgXL+WWiLSwqUsgHKpebL7uDuqHRtIBDkAindx+p+d81+5ZIWX6NWMwebI8KhsR7NHOgiNbwVdN9D Newifi3' > \/etc\/dropbear\/authorized_keys" package/lean/default-settings/files/zzz-default-settings

# 更改 /lib/functions/service.sh，修正vssr启动kcptun问题
sed -i 's/$ssd${1:+\ --\ "$@"}/$ssd${1:+ -- ${@}}/' package/base-files/files/lib/functions/service.sh
