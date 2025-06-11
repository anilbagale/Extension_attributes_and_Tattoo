#!/bin/bash

# Get the currently logged in user
currentUser=$(stat -f%Su /dev/console)

# Exit if root or no user is logged in
if [[ "$currentUser" == "root" || -z "$currentUser" ]]; then
    echo "<result>None</result>"
    exit 0
fi

# Check for iCloud account info
icloudAccount=$(sudo -u "$currentUser" defaults read MobileMeAccounts Accounts 2>/dev/null | awk -F'= ' '/AccountID =/ {gsub(/[\";]/, "", $2); print $2}')

# Output result
if [[ -n "$icloudAccount" ]]; then
    echo "<result>$icloudAccount</result>"
else
    echo "<result>None</result>"
fi
