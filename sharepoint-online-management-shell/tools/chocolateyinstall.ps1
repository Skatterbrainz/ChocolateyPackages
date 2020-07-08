$packageName = "sharepoint-online-management-shell"
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
	packageName   = $packageName
	fileType      = 'msi'
	url           = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_20212-12000_x86_en-us.msi'
	url64         = 'https://download.microsoft.com/download/0/2/E/02E7E5BA-2190-44A8-B407-BC73CA0D6B87/SharePointOnlineManagementShell_20212-12000_x64_en-us.msi'
	softwareName  = 'SharePoint Online Management Shell 16.0.20212.12000' 
	checksum      = 'DDA85E801A6754931705986F89E70A4A53E6D5DC1C9AED3746CB57FC422FFD34'
	checksum64    = '50B8E70A73058E4F713DB03E64EEA44E99EF979F31064F341F06A611027DD095'
	checksumType  = 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 