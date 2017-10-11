$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/B/A/A/BAA58D37-F8D9-4A92-8321-15CAB1DEFF51/LingeringObjectLiquidator.msi' # download url, HTTPS preferred
$url64      = 'https://download.microsoft.com/download/B/A/A/BAA58D37-F8D9-4A92-8321-15CAB1DEFF51/LingeringObjectLiquidator.msi' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64

  softwareName  = 'Lingering Object Liquidator*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = 'D68D6438A2558DEFEF348FBD51A70D11DD1A885B8DD8B4FF8C3963D2496E12C6'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = 'D68D6438A2558DEFEF348FBD51A70D11DD1A885B8DD8B4FF8C3963D2496E12C6'
  checksumType64= 'sha256' #default is checksumType

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
