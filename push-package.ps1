[CmdletBinding()]
param (
	[parameter(Mandatory)][ValidateNotNullOrEmpty()][string] $NuPkgPath,
	[parameter()][string] $ApiKey = '798f13de-c87c-44aa-987e-8acac023a3a1'
)
try {
	choco push $NuPkgPath --source 'https://chocolatey.org/' -k="$ApiKey" --timeout=500
}
catch {
	Write-Error $_.Exception.Message
}