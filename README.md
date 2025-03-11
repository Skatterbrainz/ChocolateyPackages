# ChocolateyPackages

Chocolatey Packages Library

## Installing Chocolatey

```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Note: If you receive an error about "Could not create SSL/TLS secure channel." Then use the following:

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Noob Packaging

Compiling a nupkg
```powershell
cd $nuspecPath
choco pack $nuspecFile
```

Publishing
```powershell
choco push --source "https://chocolatey.org/" -apikey "'$($env:ChocoApiKey)'"
```