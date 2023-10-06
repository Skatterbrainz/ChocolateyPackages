[CmdletBinding()]
param (
	[parameter(Mandatory)][string]$NuSpecFile
)
if ($env:ChocolateyInstall) {
	if (Test-Path $NuSpecFile) {
		if ($env:ChocoApiKey) {
			choco pack $NuSpecFile
			choco push --source "https://chocolatey.org/" -apikey "'$($env:ChocoApiKey)'"
			Write-Host "submitted for review"
		} else {
			Write-Warning "ChocoApiKey environment variable is not defined."
		}
	} else {
		Write-Warning "Your stupid-ass .nuspec file couldn't be found because you don't know what you're doing."
	}
} else {
	Write-Warning "Well, well, well. What do we have here? Someone trying to publish a Chocolatey package and they haven't installed Chocolatey yet?! wtaf?"
}