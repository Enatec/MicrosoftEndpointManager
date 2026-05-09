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

   # Microsoft Edge policy: GenAILocalFoundationalModelSettings
   # This detection expects the policy value to be 1, which represents the
   # managed state that prevents the local foundational model from being used
   # or reinstalled. See the Edge policy reference for the supported values:
   # https://learn.microsoft.com/en-us/deployedge/microsoft-edge-browser-policies/genailocalfoundationalmodelsettings
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