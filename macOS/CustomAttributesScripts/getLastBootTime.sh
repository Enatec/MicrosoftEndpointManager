#!/usr/bin/env bash

############################################################################################
# Extension Attribute script to return the last boot time in the format "YYYY-MM-DD HH:MM:SS"
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

BootDate=$(/bin/date -jf "%s" "$(/usr/sbin/sysctl kern.boottime | /usr/bin/awk -F'[= |,]' '{print $6}')" +"%Y-%m-%d %T")

echo "$BootDate"
