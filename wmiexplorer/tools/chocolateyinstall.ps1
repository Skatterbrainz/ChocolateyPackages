$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsPath  = Split-Path $MyInvocation.MyCommand.Definition
$pp         = Get-PackageParameters
$installDir = $toolsPath

if ($pp.InstallDir -or $pp.InstallationPath) { $InstallDir = $pp.InstallDir + $pp.InstallationPath }
Write-Host "WMI Explorer is going to be installed in '$installDir'"

$packageArgs = @{
  packageName   = 'wmiexplorer'
  url           = 'https://github.com/vinaypamnani/wmie2/releases/download/v2.0.0.2/WmiExplorer_2.0.0.2.zip'
  checksum      = '64B5BBCF609F86383B7CAF1FF8C4562D1362BA694A511F1C25BF50349979AA73'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  unzipLocation = $installDir
}
Install-ChocolateyZipPackage $packageArgs
if ($installDir -ne $toolsPath) { Install-ChocolateyPath $installDir }

$shortCutPath = Join-Path $([Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)) 'WMI Explorer.lnk'
$targetPath = Join-Path $installDir "WMIExplorer.exe"
Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $targetPath
