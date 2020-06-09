$ErrorActionPreference = 'Stop';
 
$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageArgs = @{
    PackageName  = "wmiexplorer"
    File         = "$toolsPath\WMIExplorer_2.0.0.0.zip"
    File64       = "$toolsPath\WMIExplorer_2.0.0.0.zip"
	checksum     = 'F353C06DE8188A820FF7AC6FFD1CC296C44834EF4CF6BC248EF86D418D201B2E'
	checksum64   = 'F353C06DE8188A820FF7AC6FFD1CC296C44834EF4CF6BC248EF86D418D201B2E'
	checksumType = 'sha256'
    Destination  = $toolsPath
}
Get-ChocolateyUnzip @packageArgs

Remove-Item "$toolsPath\WMIExplorer_2.0.0.0.zip" -Force -ErrorAction Stop

$shortcutPath = 'c:\users\public\desktop\WMI Explorer.lnk'
$targetPath   = Join-Path $toolsPath 'WMIExplorer.exe'

if (-not (Test-Path $shortcutPath)) {
	Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $targetPath
}
