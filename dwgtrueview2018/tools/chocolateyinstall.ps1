$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#$fileLocation = Join-Path $toolsDir 'NAME_OF_EMBEDDED_INSTALLER_FILE'
#$fileLocation = '\\SHARE_LOCATION\to\INSTALLER_FILE'
$url        = 'http://download.autodesk.com/esd/dwgtrueview/2018/DWGTrueView_2018_ENU_32bit.sfx.exe'
$url64      = 'http://download.autodesk.com/esd/dwgtrueview/2018/DWGTrueView_2018_ENU_64bit.sfx.exe'

$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $toolsDir
	fileType      = 'EXE'
	url           = $url
	url64bit      = $url64
	#file         = $fileLocation
	softwareName  = 'dwgtrueview2018*'
	checksum      = '97CC041C7E8F225C121EAB5EC7E087868B6745E396D1EF12B5848D528ED0EB99'
	checksumType  = 'sha256'
	checksum64    = 'C38B760215BB51475A62CB56E1E54BF291B435FDB4C54901585C82BBACF2C32E'
	checksumType64= 'sha256'
	silentArgs    = "-suppresslaunch -d $ToolsDir -silent"
	validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
$osBitness = Get-ProcessorBits

$fileLocation = Join-Path $toolsDir $('DWGTrueView_2018_ENU_'+$osBitness+'bit\x'+$osBitness+'\dwgviewr\dwgviewr.msi')

$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $toolsDir
	fileType      = 'MSI'
	file          = $fileLocation
	softwareName  = 'dwgtrueview2018*'
	checksum      = ''
	checksumType  = 'sha256'
	checksum64    = '08C880BA14BA1FB03A7C652F61F24C6380A379DE34F98832CD145A48AC54EBE4'
	checksumType64= 'sha256'
	silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
	validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
