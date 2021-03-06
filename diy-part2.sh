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

# Modify default IP
sed -i 's/192.168.1.1/192.168.188.254/g' package/base-files/files/bin/config_generate
# Modify default hostname
sed -i 's/OpenWrt/MKTECH/g' package/base-files/files/bin/config_generate
# Modify default timezone
sed -i 's/UTC/CST-8/g' package/base-files/files/bin/config_generate
# Modify default theme
sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/Bootstrap/Argon/g' feeds/luci/collections/luci/Makefile
cd package/lean  
rm -rf luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
cd ../..
# Modify default banner
cat > package/base-files/files/etc/banner <<-EOF 
______       _ _     _   _            ___  ___ _   _______ _____ _____  _   _ 
| ___ \     (_) |   | | | |           |  \/  || | / /_   _|  ___/  __ \| | | |
| |_/ /_   _ _| | __| | | |__  _   _  | .  . || |/ /  | | | |__ | /  \/| |_| |
| ___ \ | | | | |/ _\` | | '_ \| | | | | |\/| ||    \  | | |  __|| |    |  _  |
| |_/ / |_| | | | (_| | | |_) | |_| | | |  | || |\  \ | | | |___| \__/\| | | |
\____/ \__,_|_|_|\__,_| |_.__/ \__, | \_|  |_/\_| \_/ \_/ \____/ \____/\_| |_/
                                __/ |                                         
                               |___/                                          
------------------------------------------------------------------------------
 %D %V, %C
------------------------------------------------------------------------------
EOF
# Modify default network connect
echo 'net.netfilter.nf_conntrack_max=65535' | tee -a package/base-files/files/etc/sysctl.conf
