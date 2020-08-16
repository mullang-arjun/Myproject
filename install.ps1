$Installdir = 'C:\temp\QA'
New-Item -Path $Installdir -ItemType Directory
cd -Path $Installdir
$destination = "https://chocolatey.org/install.ps1"
$client = new-object System.Net.WebClient
Set-ExecutionPolicy ByPass -Scope Process -Force; iex (($client).DownloadString($destination))

choco install soapui --vesion 5.5.0 -y 
$exitCode = $LASTEXITCODE

Write-Verbose "Exit code was $exitCode"
$validExitCodes = @(0, 1605, 1614, 1641, 3010)
if ($validExitCodes -contains $exitCode) {
  Exit 0
}
Exit $exitCode


choco install ant -y 
$exitCode = $LASTEXITCODE

Write-Verbose "$exitCode"
$validExitCodes = @(0, 1605, 1614, 1641, 3010)
if ($validExitCodes -contains $exitCode) {
  Exit 0
}
Exit $exitCode

Write-Output "$exitCode"