<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<computer_extension_attribute>
    <id>32</id>
    <name>Build Entity</name>
    <enabled>true</enabled>
    <description></description>
    <data_type>String</data_type>
    <input_type>
        <type>script</type>
        <platform>Mac</platform>
        <script>#!/bin/bash

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
    echo "&lt;result&gt;${entity}&lt;/result&gt;"
fi

exit 0</script>
    </input_type>
    <inventory_display>Extension Attributes</inventory_display>
</computer_extension_attribute>
