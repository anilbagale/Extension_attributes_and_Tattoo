#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# SCRIPT INFO
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

#Name:      	BuildDateEA
#Version:       1.0
#Date: 			12JAN2018
#Author: 		LW
#Purpose: 		Gets build date for Jamf EA
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
    build_date=$(defaults read "${macmd_plist}" BuildDate)
elif [ -f ${qmac_plist} ]; then
    build_date=$(defaults read "${qmac_plist}" BuildDate)
else
    build_date="Unknown"
fi

if [ -n "${build_date}" ]; then
    echo "<result>${build_date}</result>"
fi

exit 0
