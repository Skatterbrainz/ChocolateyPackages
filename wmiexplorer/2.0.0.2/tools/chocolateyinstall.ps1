$ErrorActionPreference = 'Stop'; # stop on all errors
$InstallDir = "$(Split-Path $MyInvocation.MyCommand.Definition)"

if ($pp.InstallDir -or $pp.InstallationPath) { $InstallDir = $pp.InstallDir + $pp.InstallationPath }
Write-Host "WMI Explorer is going to be installed in '$installDir'"

$packageArgs = @{
	PackageName   = 'wmiexplorer'
	Url           = 'https://github.com/vinaypamnani/wmie2/releases/download/v2.0.0.2/WmiExplorer_2.0.0.2.zip'
	Checksum      = '343695AE7BCD048DA51EBE0949BDF746F7C16F648746D9A4554B2CB888007851'
	ChecksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
	UnzipLocation = $InstallDir
}
Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyPath $InstallDir

$shortCutPath = Join-Path $([Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)) 'WMI Explorer.lnk'
$targetPath = Join-Path $InstallDir "WMIExplorer.exe"
Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $targetPath
