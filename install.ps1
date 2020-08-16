$choco_home_path = 'C:\ProgramData\chocolatey'
$soapui_home_path = 'C:\Program Files\SmartBear\SoapUI-5.5.0'
$ant_home_path = 'C:\temp\QA'
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
choco install soapui --vesion 5.5.0 -y 
}

$exitCode = $LASTEXITCODE

Write-Verbose "Exit code was $exitCode"
$validExitCodes = @(0, 1605, 1614, 1641, 3010)
if ($validExitCodes -contains $exitCode) {
  Exit 0
}
Exit $exitCode
Write-Verbose "$exitCode"


choco install ant -y 


