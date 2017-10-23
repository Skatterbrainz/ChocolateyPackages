$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsPath  = Split-Path $MyInvocation.MyCommand.Definition
$pp         = Get-PackageParameters
$installDir = $toolsPath

if ($pp.InstallDir -or $pp.InstallationPath) { $InstallDir = $pp.InstallDir + $pp.InstallationPath }
Write-Host "WMI Explorer is going to be installed in '$installDir'"

$packageArgs = @{
  packageName   = 'wmiexplorer'
  url           = 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=wmie&DownloadId=924042&FileTime=130588611924570000&Build=21063'
  checksum      = 'F353C06DE8188A820FF7AC6FFD1CC296C44834EF4CF6BC248EF86D418D201B2E'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  unzipLocation = $installDir
}
Install-ChocolateyZipPackage $packageArgs
if ($installDir -ne $toolsPath) { Install-ChocolateyPath $installDir }

$shortCutPath = Join-Path $([Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)) 'WMI Explorer.lnk'
$targetPath = Join-Path $installDir "WMIExplorer.exe"
Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $targetPath
