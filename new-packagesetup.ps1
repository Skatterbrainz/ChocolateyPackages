[CmdletBinding()]
param (
	[parameter(Mandatory)][ValidateNotNullOrEmpty()][string] $Name,
	[parameter(Mandatory)][ValidateNotNullOrEmpty()][string] $Version,
	[parameter()][ValidateSet('exe','msi')][string] $Type = 'msi'
)
try {
	choco new $Name packageversion="$Version" installertype="$Type" maintainername="David Stein"
}
catch {
	Write-Error $_.Exception.Message
}