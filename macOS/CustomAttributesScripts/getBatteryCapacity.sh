#!/usr/bin/env bash

############################################################################################
# Extension Attribute script to return the Maximum Capacity of the Battery as a percentage (string)
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

maximumcapacity=$(/usr/sbin/system_profiler SPPowerDataType | /usr/bin/grep "Maximum Capacity")

echo "$maximumcapacity"
