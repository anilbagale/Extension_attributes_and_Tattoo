#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# SCRIPT INFO
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

#Name:      	BuildVersionEA
#Version:       1.0
#Date: 			12JAN2018
#Author: 		LW
#Purpose: 		Gets build version for Jamf EA
#Ver history:   1.0 - Initial


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# VARIABLES
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

macmd_plist="/usr/local/MacMD/MacMD.plist"
qmac_plist="/Library/Preferences/com.quintiles.QMac.plist"


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# MAIN
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

if [ -f "${macmd_plist}" ]; then
    build_ver=$(defaults read "${macmd_plist}" BuildVer)
elif [ -f ${qmac_plist} ]; then
    build_ver=$(defaults read "${qmac_plist}" BuildVer)
else
    build_ver="Unknown"
fi

if [ -n "${build_ver}" ]; then
    echo "<result>${build_ver}</result>"
fi

exit 0
