#! /usr/bin/pwsh
#Requires -RunAsAdministrator


$INSTALL_FOLDER="C:\Windows"
$NXXM_URL="https://github.com/nxxm/nxxm/releases/download/v0.0.8/nxxm-v0.0.8-windows-win64.zip"
$NXXM_EXE="C:\Windows\nxxm.exe"
$fordeps = "C:\ProgramData\install"

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
if ($?){
    info "Nxxm is going to set up his dependencies"
    
   
}

 New-Item -ItemType "file" -Path "C:\ProgramData\install\installdeps.cpp" -Force
    add-content "C:\ProgramData\install\installdeps.cpp" $texte


$Commande = "cmd.exe /C ""$NXXM_EXE $fordeps """ #La commande à exécuter


$shell = New-Object -Com WScript.Shell
$ObjExec = $shell.Exec($Commande)



$i=1
Do { 
    #Write-Host $i
    $i++
	$MaLigne = $ObjExec.StdOut.ReadLine()
    Write-Host $MaLigne
	
	
}while ($ObjExec.StdOut.AtEndOfStream -ne $true)
   

if ($?){
    info "Nxxm and this dependencies has been successfully installed"
      rm -R ~/nxxm
      rm -R C:\ProgramData\install
     
   
}
