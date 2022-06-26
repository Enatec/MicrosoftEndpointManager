# Lock Screen Check

#region Defaults
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'
$SCT = 'SilentlyContinue'
$STP = 'Stop'
#endregion Defaults

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

try
{
   if (-not (Test-Path -LiteralPath $RegistryPath -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'LockScreenOverlaysDisabled' -ErrorAction $SCT) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'NoLockScreen' -ErrorAction $SCT) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'NoLockScreenSlideshow' -ErrorAction $SCT) -eq 1))
   {
      Exit 1
   }
}
catch
{
   Write-Error -Message $_ -ErrorAction $STP

   Exit 1
}

Exit 0