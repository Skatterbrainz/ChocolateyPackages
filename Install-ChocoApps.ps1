#Requires -RunAsAdministrator
#Requires -Version 5
[CmdletBinding(SupportsShouldProcess)]
$time1 = Get-Date
Write-Host "setting up chocolatey" -ForegroundColor Green
if (!(Test-Path "$env:PROGRAMDATA\chocolatey\choco.exe")) {
    Write-Verbose "installing chocolatey"
    try {
        Invoke-Expression ((System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        Write-Verbose "chocolatey has been installed. yay!"
    }
    catch {
        Write-Warning "failed to install chocolatey..."
        Write-Warning $_.Exception.Message
        break
    }
}
else {
    Write-Verbose "chocolatey is already installed. yay!"
}
Write-Verbose "installing packages from internal list"
$pkgs = "googlechrome,7zip,notepadplusplus,vlc,slack,sysinternals,azurepowershell,git,visualstudiocode,azurestorageexplorer,keepass,jing,office365proplus,paint.net,putty,wmicc,teamviewer"

foreach ($pkg in $pkgs -split ',') {
    if ($WhatIfPreference) {
        choco install $pkg -whatif
    }
    else {
        choco install $pkg -y
    }
}
Write-Host "finished!"-ForegroundColor Green
$time2 = Get-Date
$ts = $time2 - $time1
Write-Host $("elapsed time: {0:g}" -f $ts) -ForegroundColor Green
