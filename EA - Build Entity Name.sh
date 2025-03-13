#!/bin/bash

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# SCRIPT INFO
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

#Name:      	EntityEA
#Version:       1.0
#Date: 			12JAN2018
#Author: 		LW
#Purpose: 		Gets entity from build plist
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
    entity=$(defaults read "${macmd_plist}" Entity)
elif [ -f ${qmac_plist} ]; then
    entity="QuintilesIMS"
else
    entity="Unknown"
fi

if [ -n "${entity}" ]; then
    echo "<result>${entity}</result>"
fi

exit 0
