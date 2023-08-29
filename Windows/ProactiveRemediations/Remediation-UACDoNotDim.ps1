﻿#requires -Version 1.0

# UAC "Notify me only when apps try to make changes to my computer (don't dim my desktop)"
# Remediation-UACDoNotDim

$RegPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'

if ((Test-Path -LiteralPath $RegPath -ErrorAction SilentlyContinue) -ne $true)
{
   $paramNewItem = @{
      Path        = $RegPath
      Force       = $true
      Confirm     = $false
      ErrorAction = 'SilentlyContinue'
   }
   $null = (New-Item @paramNewItem)
}

$paramNewItemProperty = @{
   LiteralPath  = $RegPath
   Name         = 'PromptOnSecureDesktop'
   Value        = 0
   PropertyType = 'DWord'
   Force        = $true
   Confirm      = $false
   ErrorAction  = 'SilentlyContinue'
}
$null = (New-ItemProperty @paramNewItemProperty)

$paramNewItemProperty = @{
   LiteralPath  = $RegPath
   Name         = 'EnableLUA'
   Value        = 1
   PropertyType = 'DWord'
   Force        = $true
   Confirm      = $false
   ErrorAction  = 'SilentlyContinue'
}
$null = (New-ItemProperty @paramNewItemProperty)

$paramNewItemProperty = @{
   LiteralPath  = $RegPath
   Name         = 'ConsentPromptBehaviorAdmin'
   Value        = 5
   PropertyType = 'DWord'
   Force        = $true
   Confirm      = $false
   ErrorAction  = 'SilentlyContinue'
}
$null = (New-ItemProperty @paramNewItemProperty)
