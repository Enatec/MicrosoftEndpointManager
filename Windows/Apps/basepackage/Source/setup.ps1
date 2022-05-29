<#
      HKEY_LOCAL_MACHINE\SOFTWARE\enabling Technology\Packages\BasePackage
#>

#region Global
$SCT = 'SilentlyContinue'

$paramRemoveItemProperty = @{
   Force       = $true
   Confirm     = $false
   ErrorAction = $SCT
}
#endregion Global

#region
$RegistryPath = 'HKLM:\SOFTWARE\enabling Technology\Packages\BasePackage'

if ((Test-Path -LiteralPath $RegistryPath -ErrorAction $SCT) -ne $true)
{
   $null = (New-Item -Path $RegistryPath -Force -Confirm:$false -ErrorAction $SCT)
}

$null = (New-ItemProperty -LiteralPath $RegistryPath -Name 'Installed' -Value 1 -PropertyType DWord -Force -Confirm:$false -ErrorAction $SCT)
#endregion


#region HelperFunction
function Confirm-RegistryItemProperty
{
   <#
         .SYNOPSIS
         Enforce that an item property in the registry

         .DESCRIPTION
         Enforce that an item property in the registry

         .PARAMETER Path
         Registry Path

         .PARAMETER PropertyType
         The Property Type

         .PARAMETER Value
         The Registry Value to set

         .EXAMPLE
         PS C:\> Confirm-RegistryItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\PimIndexMaintenanceSvc\Start' -PropertyType 'DWord' -Value '1'

         .NOTES
         Fixed version of the Helper:
         Recreate the Key if the Type is wrong (Possible cause the old version had a glitsch)
   #>
   [CmdletBinding(ConfirmImpact = 'None', SupportsShouldProcess)]
   param
   (
      [Parameter(Mandatory,
         ValueFromPipeline,
         ValueFromPipelineByPropertyName,
         HelpMessage = 'Add help message for user')]
      [ValidateNotNullOrEmpty()]
      [Alias('RegistryPath')]
      [string]
      $Path,
      [Parameter(Mandatory,
         ValueFromPipeline,
         ValueFromPipelineByPropertyName,
         HelpMessage = 'Add help message for user')]
      [ValidateNotNullOrEmpty()]
      [Alias('Property', 'Type')]
      [string]
      $PropertyType,
      [Parameter(ValueFromPipeline,
         ValueFromPipelineByPropertyName)]
      [AllowEmptyCollection()]
      [AllowEmptyString()]
      [AllowNull()]
      [Alias('RegistryValue')]
      $Value
   )

   begin
   {
      #region
      $SCT = 'SilentlyContinue'
      #endregion
   }

   process
   {
      $paramTestPath = @{
         Path          = ($Path | Split-Path)
         WarningAction = $SCT
         ErrorAction   = $SCT
      }
      if (-Not (Test-Path @paramTestPath))
      {
         $paramNewItem = @{
            Path          = ($Path | Split-Path)
            Force         = $true
            WarningAction = $SCT
            ErrorAction   = $SCT
         }
         $null = (New-Item @paramNewItem)
      }

      $paramGetItemProperty = @{
         Path          = ($Path | Split-Path)
         Name          = ($Path | Split-Path -Leaf)
         WarningAction = $SCT
         ErrorAction   = $SCT
      }
      if (-Not (Get-ItemProperty @paramGetItemProperty))
      {
         $paramNewItemProperty = @{
            Path          = ($Path | Split-Path)
            Name          = ($Path | Split-Path -Leaf)
            PropertyType  = $PropertyType
            Value         = $Value
            Force         = $true
            Confirm       = $false
            WarningAction = $SCT
            ErrorAction   = $SCT
         }
         $null = (New-ItemProperty @paramNewItemProperty)
      }
      else
      {
         #region Workaround
         $paramGetItem = @{
            Path          = ($Path | Split-Path)
            ErrorAction   = $SCT
            WarningAction = $SCT
         }
         if (((Get-Item @paramGetItem).GetValueKind(($Path | Split-Path -Leaf))) -ne $PropertyType)
         {
            # The PropertyType is wrong! This might be an issue of our old version! Sorry for the glitsch
            $paramRemoveItemProperty = @{
               Path          = ($Path | Split-Path)
               Name          = ($Path | Split-Path -Leaf)
               Force         = $true
               Confirm       = $false
               WarningAction = $SCT
               ErrorAction   = $SCT
            }
            $null = (Remove-ItemProperty @paramRemoveItemProperty)

            $paramNewItemProperty = @{
               Path          = ($Path | Split-Path)
               Name          = ($Path | Split-Path -Leaf)
               PropertyType  = $PropertyType
               Value         = $Value
               Force         = $true
               Confirm       = $false
               WarningAction = $SCT
               ErrorAction   = $SCT
            }
            $null = (New-ItemProperty @paramNewItemProperty)
         }
         else
         {
            # Regular handling: PropertyType was correct
            $paramSetItemProperty = @{
               Path          = ($Path | Split-Path)
               Name          = ($Path | Split-Path -Leaf)
               Value         = $Value
               Force         = $true
               Confirm       = $false
               WarningAction = $SCT
               ErrorAction   = $SCT
            }
            $null = (Set-ItemProperty @paramSetItemProperty)
         }
         #endregion Workaround
      }
   }
}
#endregion HelperFunction

#region DirectoryStructure
$DirectoryStructure = @(
   'c:\Temp'
   'C:\Scripts'
   'C:\Scripts\Batch'
   'C:\Scripts\PowerShell'
   'C:\Scripts\PowerShell\export'
   'C:\Scripts\PowerShell\import'
   'C:\Scripts\PowerShell\logs'
   'C:\Scripts\PowerShell\reports'
   'C:\Tools'
   'C:\windows\Provisioning\Autopilot'
)

foreach ($Path in $DirectoryStructure)
{
   if (-not (Test-Path -Path $Path -ErrorAction SilentlyContinue))
   {
      try
      {
         $null = (New-Item -Path $Path -ItemType Directory -Force -Confirm:$false -ErrorAction SilentlyContinue)
      }
      catch
      {
         [Management.Automation.ErrorRecord]$e = $_
         $info = [PSCustomObject]@{
            Exception = $e.Exception.Message
            Reason    = $e.CategoryInfo.Reason
            Target    = $e.CategoryInfo.TargetName
            Script    = $e.InvocationInfo.ScriptName
            Line      = $e.InvocationInfo.ScriptLineNumber
            Column    = $e.InvocationInfo.OffsetInLine
         }
         Write-Verbose -Message $info
      }
   }
}
#endregion DirectoryStructure

#region Wallpapers
$TargetDirectory = "$env:windir\Web\Wallpaper\Windows\"

foreach ($Wallpaper in ((Get-Item -Path ('{0}\Wallpaper\*' -f $PSScriptRoot))))
{
   try
   {
      $null = (Copy-Item -Path $Wallpaper.FullName -Destination ($TargetDirectory + $Wallpaper.Name) -Force -Confirm:$false -ErrorAction SilentlyContinue)
   }
   catch
   {
      [Management.Automation.ErrorRecord]$e = $_
      $info = [PSCustomObject]@{
         Exception = $e.Exception.Message
         Reason    = $e.CategoryInfo.Reason
         Target    = $e.CategoryInfo.TargetName
         Script    = $e.InvocationInfo.ScriptName
         Line      = $e.InvocationInfo.ScriptLineNumber
         Column    = $e.InvocationInfo.OffsetInLine
      }
      Write-Verbose -Message $info
   }
}
#endregion Wallpapers

#region PowerShelScripts
$TargetDirectory = "$env:HOMEDRIVE\Scripts\PowerShell\"

foreach ($PowerShelScript in ((Get-Item -Path ('{0}\PowerShell\*' -f $PSScriptRoot))))
{
   try
   {
      $null = (Copy-Item -Path $PowerShelScript.FullName -Destination ($TargetDirectory + $PowerShelScript.Name) -Force -Confirm:$false -ErrorAction SilentlyContinue)
   }
   catch
   {
      [Management.Automation.ErrorRecord]$e = $_
      $info = [PSCustomObject]@{
         Exception = $e.Exception.Message
         Reason    = $e.CategoryInfo.Reason
         Target    = $e.CategoryInfo.TargetName
         Script    = $e.InvocationInfo.ScriptName
         Line      = $e.InvocationInfo.ScriptLineNumber
         Column    = $e.InvocationInfo.OffsetInLine
      }
      Write-Verbose -Message $info
   }
}
#endregion PowerShelScripts

#region Tools
$TargetDirectory = 'C:\Tools\'

foreach ($Tool in ((Get-Item -Path ('{0}\Tools\*' -f $PSScriptRoot))))
{
   try
   {
      $null = (Copy-Item -Path $Tool.FullName -Destination ($TargetDirectory + $Tool.Name) -Force -Confirm:$false -ErrorAction SilentlyContinue)
   }
   catch
   {
      [Management.Automation.ErrorRecord]$e = $_
      $info = [PSCustomObject]@{
         Exception = $e.Exception.Message
         Reason    = $e.CategoryInfo.Reason
         Target    = $e.CategoryInfo.TargetName
         Script    = $e.InvocationInfo.ScriptName
         Line      = $e.InvocationInfo.ScriptLineNumber
         Column    = $e.InvocationInfo.OffsetInLine
      }
      Write-Verbose -Message $info
   }
}
#endregion Tools

#region Autopilot
$TargetDirectory = "$env:windir\Provisioning\Autopilot\"
$ConfigurationFile = 'AutopilotConfigurationFile.json'

if (Test-Path -Path ($TargetDirectory + $ConfigurationFile) -ErrorAction SilentlyContinue)
{
   $null = (Remove-Item -Path ($TargetDirectory + $ConfigurationFile) -Force -Confirm:$false -ErrorAction SilentlyContinue)
}

<#
foreach ($Tool in ((Get-Item -Path ('{0}\Autopilot\*' -f $PSScriptRoot))))
{
   try
   {
      $null = (Copy-Item -Path $Tool.FullName -Destination ($TargetDirectory + $Tool.Name) -Force -Confirm:$false -ErrorAction SilentlyContinue)
   }
   catch
   {
      [Management.Automation.ErrorRecord]$e = $_
      $info = [PSCustomObject]@{
         Exception = $e.Exception.Message
         Reason    = $e.CategoryInfo.Reason
         Target    = $e.CategoryInfo.TargetName
         Script    = $e.InvocationInfo.ScriptName
         Line      = $e.InvocationInfo.ScriptLineNumber
         Column    = $e.InvocationInfo.OffsetInLine
      }
      Write-Verbose -Message $info
   }
}
#>
#endregion Autopilot

#region System32
$TargetDirectory = "$env:windir\System32\"

foreach ($Tool in ((Get-Item -Path ('{0}\System32\*' -f $PSScriptRoot))))
{
   try
   {
      $null = (Copy-Item -Path $Tool.FullName -Destination ($TargetDirectory + $Tool.Name) -Force -Confirm:$false -ErrorAction SilentlyContinue)
   }
   catch
   {
      [Management.Automation.ErrorRecord]$e = $_
      $info = [PSCustomObject]@{
         Exception = $e.Exception.Message
         Reason    = $e.CategoryInfo.Reason
         Target    = $e.CategoryInfo.TargetName
         Script    = $e.InvocationInfo.ScriptName
         Line      = $e.InvocationInfo.ScriptLineNumber
         Column    = $e.InvocationInfo.OffsetInLine
      }
      Write-Verbose -Message $info
   }
}
#endregion System32

#region etc
$TargetDirectory = "$env:windir\System32\drivers\etc\"

foreach ($Tool in ((Get-Item -Path ('{0}\etc\*' -f $PSScriptRoot))))
{
   try
   {
      $null = (Copy-Item -Path $Tool.FullName -Destination ($TargetDirectory + $Tool.Name) -Force -Confirm:$false -ErrorAction SilentlyContinue)
   }
   catch
   {
      [Management.Automation.ErrorRecord]$e = $_
      $info = [PSCustomObject]@{
         Exception = $e.Exception.Message
         Reason    = $e.CategoryInfo.Reason
         Target    = $e.CategoryInfo.TargetName
         Script    = $e.InvocationInfo.ScriptName
         Line      = $e.InvocationInfo.ScriptLineNumber
         Column    = $e.InvocationInfo.OffsetInLine
      }
      Write-Verbose -Message $info
   }
}
#endregion etc

#region remediation
try
{
   if ((Test-Path -LiteralPath 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Communications' -ErrorAction SilentlyContinue) -ne $true)
   {
      $null = (New-Item -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Communications' -Confirm:$false -Force -ErrorAction SilentlyContinue)
   }

   $null = (New-ItemProperty -LiteralPath 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Communications' -Name 'ConfigureChatAutoInstall' -Value 0 -PropertyType DWord -Confirm:$false -Force -ErrorAction SilentlyContinue)
}
catch
{
   Write-Verbose -Message 'This is ok for us'
}
#endregion remediation

#region
try
{
   $null = (Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue | Where-Object { $PSItem.Name -eq 'Microsoftteams' } | Remove-AppxPackage -AllUsers -Confirm:$false -ErrorAction SilentlyContinue)
   $null = (Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object { $PSItem.DisplayName -eq 'MicrosoftTeams' } | Remove-AppxProvisionedPackage -Online -AllUsers -ErrorAction SilentlyContinue)
}
catch
{
   Write-Verbose -Message 'Did NOT see this one comming!'
}
#endregion