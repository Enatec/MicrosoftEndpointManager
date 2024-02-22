#!/usr/bin/env bash

############################################################################################
# Extension Attribute script to return the Uptime of the Mac as a string
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

uptime=$(/usr/bin/uptime)

echo "$uptime"
