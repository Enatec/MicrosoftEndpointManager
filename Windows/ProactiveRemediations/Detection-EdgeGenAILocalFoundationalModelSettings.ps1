# Check: Prevent Microsoft Edge's 4GB AI model from reinstalling itself
# Detection-EdgeGenAILocalFoundationalModelSettings.ps1

$RegPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Edge'

try 
{
   $paramTestPath = @{
      LiteralPath = $RegPath
      ErrorAction = 'SilentlyContinue'
   }
   if (!(Test-Path @paramTestPath))
   {
      exit 1
   }
   
   $paramGetItemPropertyValue = @{
      LiteralPath = $RegPath
      Name        = 'GenAILocalFoundationalModelSettings'
      ErrorAction = 'SilentlyContinue'
   }
   if (!((Get-ItemPropertyValue @paramGetItemPropertyValue ) -eq 1))
   {
      exit 1
   }
}
catch
{
   exit 1
}

exit 0