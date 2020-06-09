$ErrorActionPreference = 'Stop'
 
$applicationName = 'WMI Explorer'
$targetPath = Join-Path $installDir "WMIExplorer.exe"
if (Test-Path $targetPath) {
	Remove-Item $targetPath -Force
}

$shortcutPath = Join-Path $([Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)) 'WMI Explorer.lnk'
If (Test-Path $shortcutPath) {
	Remove-Item $shortcutPath
}
