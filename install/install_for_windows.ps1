$INSTALL_FOLDER="C:\ProgramData\nxxm"
$NXXM_URL="https://github.com/nxxm/nxxm/releases/download/v0.0.12/nxxm-v0.0.12-windows-win64.zip"
$NXXM_EXE="$INSTALL_FOLDER\nxxm.exe"

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
}

function Info {
    param (
        $Message
    )
  Write-Output "---> $Message "
}

function New-TemporaryDirectory {
  $parent = [System.IO.Path]::GetTempPath()
  [string] $name = [System.Guid]::NewGuid()
  $path = (Join-Path -Path $parent -ChildPath $name)
  New-Item -ItemType Directory -Path $path
  return $path
}

info "Downloading nxxm..."

$download_dir = New-TemporaryDirectory
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$downloaded_nxxm_zip = (Join-Path -Path $download_dir -ChildPath "nxxm.zip")[0]
Write-Output "Dowloading nxxm archive in $downloaded_nxxm_zip"
Invoke-WebRequest -Uri $NXXM_URL -OutFile $downloaded_nxxm_zip

if(!$?) {
    Abort("Could not download nxxm")
    return
}

info "Installing nxxm in $INSTALL_FOLDER"
$nxxm_source_exe = $download_dir[0]
$nxxm_source_exe = "$nxxm_source_exe\bin\nxxm.exe"

New-Item -Force -ItemType Directory -Path $INSTALL_FOLDER
Expand-Archive -Force -path $downloaded_nxxm_zip -destinationpath $download_dir[0]
Copy-Item -Force $nxxm_source_exe -Destination $NXXM_EXE

if (!$?){
   Abort("Could not install nxxm")
   return
}

[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine) + ";$INSTALL_FOLDER",
    [EnvironmentVariableTarget]::Machine)

if (!$?){
   Abort("Could not put nxxm on the Path environment variable")
   return
}

info "nxxm is installed, downloading included tools."
$installdeps_folder = New-TemporaryDirectory
$installdeps_file = (Join-Path -Path $installdeps_folder -ChildPath "installdeps.cpp")[0]
$text = $texte | Out-File -Encoding "ASCII" -FilePath "$installdeps_file"

$command = "cmd.exe /C ""$NXXM_EXE $installdeps_folder """
$shell = New-Object -Com WScript.Shell
$objExec = $shell.Exec($command)

Do { 
	$line = $objExec.StdOut.ReadLine()
    Write-Host $line
} while ($objExec.StdOut.AtEndOfStream -ne $true)
   
if ($?){
    info "nxxm has been installed in $INSTALL_FOLDER. In either a new cmd of after a reboot nxxm will be available on your Path."
}else{
    Abort "Installation failed, please contact us via nxxm.io. We would be happy to help you."
}
