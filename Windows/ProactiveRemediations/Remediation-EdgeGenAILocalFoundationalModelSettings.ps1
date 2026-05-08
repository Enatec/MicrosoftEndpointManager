# Remediate: Prevent Microsoft Edge's 4GB AI model from reinstalling itself
# Remediation-EdgeGenAILocalFoundationalModelSettings.ps1

$RegPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Edge'
$paramTestPath = @{
   LiteralPath = $RegPath
   ErrorAction = 'SilentlyContinue'
}
if ((Test-Path @paramTestPath ) -ne $true)
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
   Name         = 'GenAILocalFoundationalModelSettings'
   Value        = 1
   PropertyType = 'DWord'
   Force        = $true
   Confirm      = $false
   ErrorAction  = 'SilentlyContinue'
}
$null = (New-ItemProperty @paramNewItemProperty)
