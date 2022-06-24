# Check Enable Photo Viewer

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
   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.bmp' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.gif' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.ico' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpeg' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpg' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.png' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithProgids' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ico\OpenWithProgids' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpeg\OpenWithProgids' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bmp\OpenWithProgids' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithProgids' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.png\OpenWithProgids' -ErrorAction Stop))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.bmp' -Name '(default)' -ErrorAction Stop) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.gif' -Name '(default)' -ErrorAction Stop) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.ico' -Name '(default)' -ErrorAction Stop) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpeg' -Name '(default)' -ErrorAction Stop) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpg' -Name '(default)' -ErrorAction Stop) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.png' -Name '(default)' -ErrorAction Stop) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction Stop).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error $_ -ErrorAction Stop

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ico\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction Stop).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error $_ -ErrorAction Stop

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpeg\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction Stop).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error $_ -ErrorAction Stop

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bmp\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction Stop).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error $_ -ErrorAction Stop

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction Stop).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error $_ -ErrorAction Stop

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.png\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction Stop).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error $_ -ErrorAction Stop
      Exit 1
   }
}
catch
{
   Write-Error $_ -ErrorAction Stop

   Exit 1
}

Exit 0