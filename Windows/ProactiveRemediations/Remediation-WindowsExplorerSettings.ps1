# Remediation-WindowsExplorerSettings

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
   if ((Test-Path -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Force -Confirm:$false -ErrorAction Stop)
   }

   $null = (New-ItemProperty -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'AddSearchInternetLinkInStartMenu' -Value 0 -PropertyType DWord -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'GoToDesktopOnSignIn' -Value 1 -PropertyType DWord -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'NoStartMenuHomegroup' -Value 1 -PropertyType DWord -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'NoStartMenuRecordedTV' -Value 1 -PropertyType DWord -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'ShowRunAsDifferentUserInStart' -Value 1 -PropertyType DWord -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\Software\Policies\Microsoft\Windows\Explorer' -Name 'DisableSearchBoxSuggestions' -Value 1 -PropertyType DWord -Force -Confirm:$false -ErrorAction Stop)
}
catch
{
   Write-Error $_ -ErrorAction Stop

   Exit 1
}