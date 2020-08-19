﻿#!/usr/bin/pwsh

$INSTALL_FOLDER="C:\Windows"
$NXXM_URL="https://github.com/nxxm/nxxm/releases/download/v0.0.8/nxxm-v0.0.8-windows-win64.zip"
$NXXM_EXE="C:\Windows\nxxm.exe"
$INSTALL_FORDEPS = "C:\ProgramData\install_nxxm"

$texte = '#include <iostream>
int main()
{
std::cout<<"Welcome in nxxm"<<std::endl;
return 0;
}'

function Abort {
    param (
        $Message
    )
   Write-Output " $Message "
  exit 1
}

function Info {
    param (
        $Message
    )
  Write-Output "---> $Message "
}

info "Downloading nxxm..."
mkdir ~/nxxm
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $NXXM_URL -OutFile ~/nxxm/nxxm.zip

if(!$?) {
    Abort("Could not download nxxm")
}

info "Installing nxxm in  $INSTALL_FOLDER"
Expand-Archive -Force -path ~/nxxm/nxxm.zip -destinationpath ~/nxxm
Copy-Item -Force "~/nxxm/bin/nxxm.exe" -Destination $INSTALL_FOLDER

if (!$?){
    Abort("Could not install nxxm")
}
rm -R ~/nxxm

info "nxxm is setting up its dependencies"
New-Item -ItemType "file" -Path $INSTALL_FORDEPS"\installdeps.cpp" -Force
add-content $INSTALL_FORDEPS"\installdeps.cpp" $texte

$command = "cmd.exe /C ""$NXXM_EXE $INSTALL_FORDEPS """
$shell = New-Object -Com WScript.Shell
$objExec = $shell.Exec($command)

Do { 
	$line = $objExec.StdOut.ReadLine()
    Write-Host $line
} while ($objExec.StdOut.AtEndOfStream -ne $true)
   
if ($?){
    info "nxxm and its dependencies have been successfully installed"
    rm -R $INSTALL_FORDEPS
}else{
    rm - $INSTALL_FORDEPS
    abort "Installation failed"
}
