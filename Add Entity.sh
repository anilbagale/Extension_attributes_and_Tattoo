#!/bin/bash

# Read the current value of the Entity field
current_entity=$(defaults read /usr/local/MacMD/MacMD.plist Entity 2>/dev/null)

# Check if the Entity is already set to "GOOGLE"
if [ "$current_entity" != "GOOGLE" ]; then
    # Update the Entity field if it is not set to "GOOGLE"
    defaults write /usr/local/MacMD/MacMD.plist Entity GOOGLE
    echo "Entity field updated to 'GOOGLE'."
else
    echo "Entity field is already set to 'GOOGLE'. No update needed."
fi
