#!/usr/bin/env zsh

############################################################################################
# Extension Attribute script to return the Bootstrap Token Escrow Status (Yes/No)
############################################################################################
# Base Script: Copyright (c) 2020 Microsoft Corp. All rights reserved.
#
# Copyright (c) 2023 enabling Technology GmbH. All rights reserved.
############################################################################################

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

result=$(/usr/bin/profiles status -type bootstraptoken)

if [[ "$result" == *"Bootstrap Token escrowed to server: YES"* ]]; then
   echo "Yes"
else
   echo "No"
fi
