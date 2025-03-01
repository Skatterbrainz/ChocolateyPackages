$packageName = "sharepoint-online-management-shell"
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'msi'
	url           = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_25715-12000_en-us.msi'
	softwareName  = 'SharePoint Online Management Shell 16.0.25715.12000'
	checksum      = '78F257CA96B0493E2D6D3C121705E494642A2504B9DC07D8A6071BC2650F4B17'
	checksumType  = 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 