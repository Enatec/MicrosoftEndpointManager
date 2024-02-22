#!/usr/bin/env bash

############################################################################################
# Extension Attribute script to return the Processor Type of the Mac (string)
# (e.g., Intel Core i7 or Apple M1)
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

processor=$(/usr/sbin/sysctl -n machdep.cpu.brand_string)

echo "$processor"
