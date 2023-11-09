$packageName = "sharepoint-online-management-shell"
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'msi'
	url           = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_24211-12000_en-us.msi'
	softwareName  = 'SharePoint Online Management Shell 16.0.24211.12000' 
	checksum      = 'FE2BBE6D5E4C73E07F4F54CF913A5E5E8ADD2FCC9C78697871FDFBEC1BC763E3'
	checksumType  = 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 