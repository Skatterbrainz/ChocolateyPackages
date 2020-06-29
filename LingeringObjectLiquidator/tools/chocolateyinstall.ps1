$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/B/A/A/BAA58D37-F8D9-4A92-8321-15CAB1DEFF51/LingeringObjectLiquidator.msi' 
$url64      = 'https://download.microsoft.com/download/B/A/A/BAA58D37-F8D9-4A92-8321-15CAB1DEFF51/LingeringObjectLiquidator.msi' 

$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $toolsDir
	fileType      = 'MSI'
	url           = $url
	url64bit      = $url64
	softwareName  = 'Lingering Object Liquidator*' 
	checksum      = 'D68D6438A2558DEFEF348FBD51A70D11DD1A885B8DD8B4FF8C3963D2496E12C6'
	checksumType  = 'sha256'
	checksum64    = 'D68D6438A2558DEFEF348FBD51A70D11DD1A885B8DD8B4FF8C3963D2496E12C6'
	checksumType64= 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 
