#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# SCRIPT INFO
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

#Name:      	BuildEA
#Version:       1.0
#Date: 			12JAN2018
#Author: 		LW
#Purpose: 		Gets build type for Jamf EA
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
    build=$(defaults read "${macmd_plist}" Build)
elif [ -f ${qmac_plist} ]; then
    build="QMAC"
else
    build="Unknown"
fi

if [ -n "${build}" ]; then
    echo "<result>${build}</result>"
fi

exit 0
