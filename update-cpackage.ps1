[CmdletBinding()]
param (
	[parameter(Mandatory)][string] $NuspecPath,
	[parameter(Mandatory)][string] $Version
)
try {
	$outputPath = Split-Path $NuspecPath
	choco pack $NuspecPath --version $Version configuration=release --outputdirectory=$($outputPath)
}
catch {
	Write-Error $_.Exception.Message
}