
$SourceURI = 'https://repo.saltstack.com/windows/Salt-Minion-2016.11.5-AMD64-Setup.exe'

Write-Verbose 'Installing Salt... please wait'
$InstallerFile = 'C:\Packages\Salt.exe'

Write-Verbose "Downloading salt installer from $SourceURI to $InstallerFile"
$WebClient = New-Object System.Net.WebClient
$webclient.DownloadFile($SourceURI, $InstallerFile)
Write-Verbose 'Salt installer downloaded.'

Write-Verbose 'Installing Salt'

$minionId = $env:COMPUTERNAME.ToLower()

Start-Process $InstallerFile -Wait `
                             -NoNewWindow `
                             -PassThru `
                             -ArgumentList "/S /minion-name=$minionId"
Write-Verbose "Salt is installed"
