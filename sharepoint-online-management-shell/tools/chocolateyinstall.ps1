$packageName = "sharepoint-online-management-shell"
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'msi'
	url           = 'https://download.microsoft.com/download/0/2/e/02e7e5ba-2190-44a8-b407-bc73ca0d6b87/SharePointOnlineManagementShell_25814-12000_en-us.msi'
	softwareName  = 'SharePoint Online Management Shell 16.0.25814.12000'
	checksum      = '7AB3C0A13E47E4C59339173354530F37CFB7E64566C296F1F2C68B737B058B17'
	checksumType  = 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 