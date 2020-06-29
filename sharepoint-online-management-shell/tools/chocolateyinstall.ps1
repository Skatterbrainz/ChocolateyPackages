$packageName = "sharepoint-online-management-shell"
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'msi'
	url           = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_20122-12000_x86_en-us.msi'
	url64         = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_20122-12000_x64_en-us.msi'
	softwareName  = 'SharePoint Online Management Shell 16.0.20122.12000' 
	checksum      = '8896B9270843661E16D67D5F2962D53E954829CADD34CD22E95F3EB2C57B60B3'
	checksum64    = '004AD669D9DDF981DD37FBEF705BA9EB281DAA55D321ED280D24BEBAFDB72831'
	checksumType  = 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 