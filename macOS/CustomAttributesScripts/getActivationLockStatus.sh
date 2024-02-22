#!/usr/bin/env bash

############################################################################################
# Extension Attribute script to return the Activation Lock Status (Enabled/Disabled)
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

lockstatus=$(/usr/sbin/system_profiler SPHardwareDataType | /usr/bin/grep "Activation Lock Status:" | /usr/bin/awk '{print $4}')

echo "$lockstatus"
