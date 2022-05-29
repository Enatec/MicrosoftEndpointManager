<#
      .SYNOPSIS
      Automates the PSWindowsUpdate module to install OS updates

      .DESCRIPTION
      Automates the PSWindowsUpdate module to install all pending OS and driver updates

      .PARAMETER PSWindowsUpdateVersion
      Module Version to use

      .EXAMPLE
      PS C:\> .\InstallpendingWindowsUpdates.ps1

      .LINK
      https://www.powershellgallery.com/packages/PSWindowsUpdate/

      .LINK
      https://github.com/mgajda83/PSWindowsUpdate

      .NOTES
      Based on PSWindowsUpdate by Michal Gajda
      Created for Endpoint Manager usage
#>
[CmdletBinding(ConfirmImpact = 'Low')]
param
(
   [Parameter(ValueFromPipeline = $true,
              ValueFromPipelineByPropertyName = $true)]
   [ValidateNotNullOrEmpty()]
   [version]
   $PSWindowsUpdateVersion = 2.2.0.3
)

begin
{
   #region Global
   $SCT = 'SilentlyContinue'
   #endregion Global
   
   #region NuGetPackageProvider
   if (-not (Get-PackageProvider -Name NuGet -ErrorAction $SCT -WarningAction $SCT))
   {
      $null = Install-PackageProvider -Name NuGet -Force
   }
   #endregion NuGetPackageProvider
   
   #region MakePSGalleryTrusted
   if (Get-PSRepository -Name PSGallery | Where-Object -FilterScript {
         $PSItem.InstallationPolicy -ne 'Trusted'
      })
   {
      $null = (Set-PSRepository -Name PSGallery -InstallationPolicy Trusted)
   }
   #endregion MakePSGalleryTrusted
   
   #region CheckPSWindowsUpdate
   # Check if we have the latest version installed
   if (-not (Get-Module -Name PSWindowsUpdate -ListAvailable -ErrorAction $SCT -WarningAction $SCT | Sort-Object -Descending -Property Version | Select-Object -First 1 | Where-Object -FilterScript {
            $PSItem.Version -cge $PSWindowsUpdateVersion
         }))
   {
      # Get the latest
      $null = (Install-Module -Name PSWindowsUpdate -Force -MinimumVersion $PSWindowsUpdateVersion -Repository PSGallery -AllowClobber:$true)
   }
   #endregion CheckPSWindowsUpdate
   
   #region ImportPSWindowsUpdate
   $null = (Import-Module -Name PSWindowsUpdate -Force -DisableNameChecking -NoClobber -MinimumVersion $PSWindowsUpdateVersion -ErrorAction $SCT -WarningAction $SCT)
   #endregion ImportPSWindowsUpdate
}

process
{
   #region InstallPendingDrivers
   try
   {
      Write-Output -InputObject 'Install all available drivers'
      
      $null = (Get-WindowsUpdate -Install -MicrosoftUpdate -UpdateType Driver -IgnoreUserInput -AcceptAll -IgnoreReboot -ForceInstall -ComputerName $env:ComputerName -Confirm:$false -ErrorAction $SCT -WarningAction $SCT)
   }
   catch
   {
      Write-Verbose -Message 'Install all available drivers issue'
   }
   #endregion InstallPendingDrivers
   
   #region InstallPendingUpdates
   try
   {
      Write-Output -InputObject 'Install all available updates, except SilverLight'
      
      $null = (Get-WindowsUpdate -Install -MicrosoftUpdate -NotKBArticleID KB4481252 -IgnoreUserInput -AcceptAll -IgnoreReboot -ForceDownload -ComputerName $env:ComputerName -Confirm:$false -ErrorAction $SCT -WarningAction $SCT)
   }
   catch
   {
      Write-Verbose -Message 'Install all available updates issue'
   }
   #endregion InstallPendingUpdates
}

end
{
   $needReboot = ((Get-WURebootStatus -ComputerName $env:ComputerName -Silent -ErrorAction $SCT -WarningAction $SCT).RebootRequired)
   
   if ($needReboot)
   {
      Write-Output -InputObject 'Reboot required'
      
      # Set return code 3010. As long as this happens during device ESP, the computer will automatically reboot at the end of device ESP.
      exit 3010
   }
   else
   {
      Write-Output -InputObject 'No reboot required'
      
      exit 0
   }
}