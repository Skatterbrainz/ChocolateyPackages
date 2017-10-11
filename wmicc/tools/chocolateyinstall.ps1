$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/0/C/A/0CA7691C-6335-4143-8F9F-6708969F8212/WMICodeCreator.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'wmicc*'
  checksum      = '1C03644806593310A409695D8114D25660F9CB3A6BD6BAD7EDA9D8F051184069'
  checksumType  = 'sha256'
  checksum64    = '1C03644806593310A409695D8114D25660F9CB3A6BD6BAD7EDA9D8F051184069'
  checksumType64= 'sha256'
  silentArgs    = ''
  validExitCodes= @(0)
}
Install-ChocolateyZipPackage -PackageName 'wmicc' -Url $url -UnzipLocation "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$target = Join-Path $toolsDir "WMICodeCreator.exe"
Install-ChocolateyShortcut -shortcutFilePath "$($env:USERPROFILE)\Desktop\WMICC.lnk" -targetPath "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\WMICodeCreator.exe" -workDirectory "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" -iconLocation "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\WMICodeCreator.exe" -description "WMI Code Creator"
