# Remediation Enable Photo Viewer

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
   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.bmp' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Classes\.bmp' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.gif' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Classes\.gif' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.ico' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Classes\.ico' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpeg' -ErrorAction SilentlyContinue) -ne $true)
   {
      N$null = (ew-Item 'HKCU:\SOFTWARE\Classes\.jpeg' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpg' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Classes\.jpg' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.png' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Classes\.png' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithProgids' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithProgids' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ico\OpenWithProgids' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ico\OpenWithProgids' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpeg\OpenWithProgids' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpeg\OpenWithProgids' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bmp\OpenWithProgids' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bmp\OpenWithProgids' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithProgids' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithProgids' -Force -Confirm:$false -ErrorAction Stop)
   }

   if ((Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.png\OpenWithProgids' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.png\OpenWithProgids' -Force -Confirm:$false -ErrorAction Stop)
   }

   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\.bmp' -Name '(default)' -Value 'PhotoViewer.FileAssoc.Tiff' -PropertyType String -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\.gif' -Name '(default)' -Value 'PhotoViewer.FileAssoc.Tiff' -PropertyType String -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\.ico' -Name '(default)' -Value 'PhotoViewer.FileAssoc.Tiff' -PropertyType String -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpeg' -Name '(default)' -Value 'PhotoViewer.FileAssoc.Tiff' -PropertyType String -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpg' -Name '(default)' -Value 'PhotoViewer.FileAssoc.Tiff' -PropertyType String -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Classes\.png' -Name '(default)' -Value 'PhotoViewer.FileAssoc.Tiff' -PropertyType String -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff' -Value (New-Object Byte[] 0) -PropertyType None -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ico\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff' -Value (New-Object Byte[] 0) -PropertyType None -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpeg\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff' -Value (New-Object Byte[] 0) -PropertyType None -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bmp\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff' -Value (New-Object Byte[] 0) -PropertyType None -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff' -Value (New-Object Byte[] 0) -PropertyType None -Force -Confirm:$false -ErrorAction Stop)
   $null = (New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.png\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff' -Value (New-Object Byte[] 0) -PropertyType None -Force -Confirm:$false -ErrorAction Stop)
}
catch
{
   Write-Error $_ -ErrorAction Stop

   Exit 1
}