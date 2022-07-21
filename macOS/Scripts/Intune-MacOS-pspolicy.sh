#!/usr/bin/env bash
###
# Clear the password mess (caused by Endpoint manager when the device is re-enrolled)
###

# Load some defaults
. /etc/bashrc

# Make sure the path is OK
PATH=/usr/local/bin:/usr/local/sbin/:/var/root/bin/:$PATH
export PATH

# Remove all Policies
/usr/bin/pwpolicy pwpolicy -clearaccountpolicies >/dev/null 2>&1

# Remove the Policies for all user
for n in $(/usr/bin/dscl . list /Users | grep -v '^_' | grep -v 'daemon' | grep -v 'nobody'); do
   /usr/bin/pwpolicy -u $n -clearaccountpolicies >/dev/null 2>&1
done

# Make a clean exit
exit 0
