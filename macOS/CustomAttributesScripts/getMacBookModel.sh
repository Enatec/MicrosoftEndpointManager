#!/usr/bin/env bash

############################################################################################
# Extension Attribute script to return the Apple Model of the Mac (e.g., MacBookPro17,1)
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

model=$(/usr/sbin/sysctl hw.model | /usr/bin/awk '{ print $2 }')

echo "$model"
