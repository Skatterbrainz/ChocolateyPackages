$packageName = "sharepoint-online-management-shell"
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'msi'
	url           = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_22111-12000_en-us.msi'
	url64         = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_22111-12000_en-us.msi'
	softwareName  = 'SharePoint Online Management Shell 16.0.22111.12000' 
	checksum      = '531E260A0C4A7F04F453A3BEBBC7DC516E0B091BF4BE2EDB78D135B66618E3FE'
	checksum64    = '531E260A0C4A7F04F453A3BEBBC7DC516E0B091BF4BE2EDB78D135B66618E3FE'
	checksumType  = 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 
