#region
$STP = 'Stop'
#endregion

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
   $Registry = ((Get-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\OneDrive\Accounts\Business1' -Name 'Timerautomount' -ErrorAction $STP).Timerautomount)

   if ($Registry -eq 1)
   {
      Exit 0
   }

   Exit 1
}
catch
{
   Write-Error -Message $_ -ErrorAction $STP

   Exit 1
}
