# Enable Automatically Lock Computer after Inactivity

#region ARM64Handling
# Restart Process using PowerShell 64-bit

if ($ENV:PROCESSOR_ARCHITEW6432 -eq 'AMD64')
{
   try
   {
      &"$ENV:WINDIR\SysNative\WindowsPowershell\v1.0\PowerShell.exe" -File $PSCOMMANDPATH
   }
   catch
   {
      Throw ('Failed to start {0}' -f $PSCOMMANDPATH)
   }

   exit
}
#endregion ARM64Handling

#region Remediation
$TimeoutSeconds = 900
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'

if ((Test-Path -LiteralPath $RegistryPath -ErrorAction SilentlyContinue) -ne $true)
{
   $null = (New-Item -Path $RegistryPath -Force -Confirm:$false -ErrorAction SilentlyContinue)
}

$null = (New-ItemProperty -LiteralPath $RegistryPath -Name 'InactivityTimeoutSecs' -Value $TimeoutSeconds -PropertyType DWord -Force -Confirm:$false -ErrorAction SilentlyContinue)
#endregion Remediation
