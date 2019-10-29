$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/E/C/7/EC7CDC27-3750-4F12-8DB4-ABFDFDF7DA5C/ReadinessToolkitForOffice_1.2.19231.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  softwareName  = 'Readiness Toolkit for Office Add-ins and VBA' 
  checksum      = 'CA23818C79AA66EC636A2887E008AFBCA0808C19F0C8468A7470CA0E43193357'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 