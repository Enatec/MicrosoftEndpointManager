# Check-WindowsExplorerSettings

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
   if (-not (Test-Path -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'AddSearchInternetLinkInStartMenu' -ErrorAction SilentlyContinue) -eq 0))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'GoToDesktopOnSignIn' -ErrorAction SilentlyContinue) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'NoStartMenuHomegroup' -ErrorAction SilentlyContinue) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'NoStartMenuRecordedTV' -ErrorAction SilentlyContinue) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'ShowRunAsDifferentUserInStart' -ErrorAction SilentlyContinue) -eq 1))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'DisableSearchBoxSuggestions' -ErrorAction SilentlyContinue) -eq 1))
   {
      Exit 1
   }
}
catch
{
   Write-Error $_ -ErrorAction Stop

   Exit 1
}

Exit 0