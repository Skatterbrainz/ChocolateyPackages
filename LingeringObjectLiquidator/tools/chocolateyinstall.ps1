$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/B/A/A/BAA58D37-F8D9-4A92-8321-15CAB1DEFF51/LingeringObjectLiquidatorInstaller.msi'
$url64      = 'https://download.microsoft.com/download/B/A/A/BAA58D37-F8D9-4A92-8321-15CAB1DEFF51/LingeringObjectLiquidatorInstaller.msi' 

$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $toolsDir
	fileType      = 'MSI'
	url           = $url
	url64bit      = $url64
	softwareName  = 'Lingering Object Liquidator*' 
	checksum      = '8B69CD3E64AA08FA3688109C861EAF8534F46CF569633C69FEDCA5048BE6FF01'
	checksumType  = 'sha256'
	checksum64    = '8B69CD3E64AA08FA3688109C861EAF8534F46CF569633C69FEDCA5048BE6FF01'
	checksumType64= 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 
