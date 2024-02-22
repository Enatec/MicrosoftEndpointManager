#!/usr/bin/env bash

############################################################################################
# Extension Attribute script to return the version of Microsoft Company Portal
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

# User Defined variables
app="Company Portal.app"

# Fixed Variables
attribute="CFBundleShortVersionString"
InfoPlistPath="/Applications/$app/Contents/Info.plist"

# Attempt to read CFBundleStringShortVersionString and return it
if [[ -f "$InfoPlistPath" ]]; then
   ver=$(/usr/bin/plutil -p "$InfoPlistPath" | /usr/bin/grep "$attribute" | /usr/bin/awk -F'"' '{ print $4 }')
   echo "$ver"
else
   echo "not installed"
fi
