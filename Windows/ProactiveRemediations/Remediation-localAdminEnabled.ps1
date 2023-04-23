#requires -Version 2.0 -Modules CimCmdlets, Microsoft.PowerShell.LocalAccounts

# Enables the default administrator account on the local machine
# Intune remediation script for Cloud based LAPS

# Get the data
$DefaultAdminSID = ((Get-CimInstance -ClassName Win32_UserAccount -Filter "LocalAccount = TRUE and SID like 'S-1-5-%-500'").SID)

# Check if the account is disabled. If it is, enable it.
if (((Get-LocalUser -SID $DefaultAdminSID -ErrorAction SilentlyContinue).Enabled) -ne $true)
{
   Enable-LocalUser -SID $DefaultAdminSID -ErrorAction Stop -Confirm:$false
}
