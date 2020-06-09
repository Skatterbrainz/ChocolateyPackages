$ErrorActionPreference = 'Stop';
 
$toolsPath    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shortcutPath = 'c:\users\public\desktop\WMI Explorer.lnk'
$targetPath   = Join-Path $toolsPath 'WMIExplorer.exe'

if (Test-Path $shortcutPath) {
	Remove-Item $shortcutPath -Force
}
if (Test-Path $targetPath) {
	Remove-Item $targetPath -Force
}