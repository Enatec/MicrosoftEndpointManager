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

$RegistryPath = 'HKCU:\SOFTWARE\Microsoft\OneDrive\Accounts\Business1'
$RegistryName = 'Timerautomount'
$RegistryType = 'QWORD'
$RegistryValue = 1

$null = (New-ItemProperty -Path $RegistryPath -Name $RegistryName -Type $RegistryType -Value $RegistryValue -Force -Confirm:$false -ErrorAction Stop)
