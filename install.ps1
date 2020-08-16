$choco_home_path = 'C:\ProgramData\chocolatey'
$soapui_home_path = 'C:\Program Files\SmartBear\SoapUI-5.5.0'
$ant_home_path = 'C:\ProgramData\chocolatey\lib\ant'
$destination = "https://chocolatey.org/install.ps1"
$client = new-object System.Net.WebClient

if(test-path $choco_home-path) {
Write-Output "choco already installed..skipping the script"
}
else {
Set-ExecutionPolicy ByPass -Scope Process -Force; iex (($client).DownloadString($destination))
}

$exitCode = $LASTEXITCODE
Write-Verbose "$exitCode"

if(test-path $soapui_home_path) {
Write-Output "Soapui already installed..skipping the script"
}
else {
choco install soapui --force --version 5.5.0
}

$exitCode = $LASTEXITCODE

Write-Verbose "$exitCode"

if(test-path $ant_home_path) {
Write-Output "Ant already installed..skipping the script"
}
else {
choco install ant -y
}

$exitCode = $LASTEXITCODE

Write-Verbose "$exitCode"

