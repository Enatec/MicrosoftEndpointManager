$Installer = 'Folge-1.17.0.exe'
$null = (& "$env:ChocolateyInstall\bin\intunewinapputil.exe" -c ('{0}\Source' -f $PSScriptRoot) -s $Installer -o ('{0}\Output' -f $PSScriptRoot) -q)
