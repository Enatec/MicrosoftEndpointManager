#!/usr/bin/env bash

############################################################################################
# Extension Attribute script to return the Battery Cycle Count (integer)
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

battery=$(/usr/sbin/system_profiler SPPowerDataType | /usr/bin/grep "Cycle Count" | /usr/bin/awk '{print $3}')

echo "$battery"
