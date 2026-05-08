# Remediate: Prevent Google Chrome's 4GB AI model from reinstalling itself
# Remediation-ChromeGenAILocalFoundationalModelSettings.ps1

$RegPath = 'HKLM:\SOFTWARE\Policies\Google\Chrome'
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
