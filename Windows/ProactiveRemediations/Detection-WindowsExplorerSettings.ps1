# Check-WindowsExplorerSettings

#region Defaults
$RegistryPath = 'HKCU:\Software\Policies\Microsoft\Windows\Explorer'
$SCT = 'SilentlyContinue'
$STOP = 'Stop'
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
   if (-not (Test-Path -LiteralPath $RegistryPath -ErrorAction $STOP))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'AddSearchInternetLinkInStartMenu' -ErrorAction $SCT) -eq 0))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'GoToDesktopOnSignIn' -ErrorAction $SCT) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'NoStartMenuHomegroup' -ErrorAction $SCT) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'NoStartMenuRecordedTV' -ErrorAction $SCT) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'ShowRunAsDifferentUserInStart' -ErrorAction $SCT) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath $RegistryPath -Name 'DisableSearchBoxSuggestions' -ErrorAction $SCT) -eq 1))
   {
      Exit 1
   }
}
catch
{
   Write-Error -Message $_ -ErrorAction $STOP

   Exit 1
}

Exit 0