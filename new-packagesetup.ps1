[CmdletBinding()]
param (
	[parameter(Mandatory)][ValidateNotNullOrEmpty()][string] $Name,
	[parameter(Mandatory)][ValidateNotNullOrEmpty()][string] $Version,
	[parameter()][ValidateSet('exe','msi')][string] $Type = 'msi',
	[parameter()][switch]$ForceUpdate
)
try {
	if (Test-Path "$PSScriptRoot\$Name") {
		if ($ForceUpdate) {
			choco new $Name packageversion="$Version" installertype="$Type" maintainername="David Stein" --force	
		} else {
			Write-Warning "Path exists. Use -ForceUpdate to overwrite"
		}
	} else {
		choco new $Name packageversion="$Version" installertype="$Type" maintainername="David Stein"
	}
}
catch {
	Write-Error $_.Exception.Message
}