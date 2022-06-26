# Check Enable Photo Viewer

#region Defaults
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
   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.bmp' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.gif' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.ico' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpeg' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpg' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Classes\.png' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithProgids' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ico\OpenWithProgids' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpeg\OpenWithProgids' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bmp\OpenWithProgids' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithProgids' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not (Test-Path -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.png\OpenWithProgids' -ErrorAction $STP))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.bmp' -Name '(default)' -ErrorAction $STP) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.gif' -Name '(default)' -ErrorAction $STP) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.ico' -Name '(default)' -ErrorAction $STP) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpeg' -Name '(default)' -ErrorAction $STP) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.jpg' -Name '(default)' -ErrorAction $STP) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Classes\.png' -Name '(default)' -ErrorAction $STP) -eq 'PhotoViewer.FileAssoc.Tiff'))
   {
      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction $STP).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error -Message $_ -ErrorAction $STP

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ico\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction $STP).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error -Message $_ -ErrorAction $STP

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpeg\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction $STP).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error -Message $_ -ErrorAction $STP

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.bmp\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction $STP).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error -Message $_ -ErrorAction $STP

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction $STP).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error -Message $_ -ErrorAction $STP

      Exit 1
   }

   try
   {
      if (-not ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.png\OpenWithProgids' -Name 'PhotoViewer.FileAssoc.Tiff ' -ErrorAction $STP).length -eq 0))
      {
         Exit 1
      }
   }
   catch
   {
      Write-Error -Message $_ -ErrorAction $STP
      Exit 1
   }
}
catch
{
   Write-Error -Message $_ -ErrorAction $STP

   Exit 1
}

Exit 0