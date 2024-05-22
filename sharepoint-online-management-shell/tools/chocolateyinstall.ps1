$packageName = "sharepoint-online-management-shell"
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'msi'
	url           = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_24810-12000_en-us.msi'
	softwareName  = 'SharePoint Online Management Shell 16.0.24713.12007'
	checksum      = '4C5BCE8C8E853173FBAB0BB4B308E4C37A4FDF5D30434D6B1CB629403BF15B4C'
	checksumType  = 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 