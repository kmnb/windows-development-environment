$url = "http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/Marsu5/windows-development-environment/master/boxstarter"
function setupprofile () {
    if(Test-Path $HOME\Documents\WindowsPowerShell\){
        Copy-Item ./Microsoft.PowerShell-profile.ps1 $HOME\Documents\WindowsPowerShell\profile.ps1
    }else{
        mkdir $HOME\Documents\WindowsPowerShell\
        setupprofile
    }
}

if((Get-WmiObject Win32_OperatingSystem).OSArchitecture -eq "64-bit"){
    Write-Output "Installation started."
    Write-Output "Dowloading boxstarter package"
    $ie = New-Object -com internetexplorer.application; 
    $ie.visible = $true; 
    $ie.navigate($url);
    while ($ie.Busy -eq $true) 
    { 
        Start-Sleep -Milliseconds 1000; 
    } 
    Write-Output "Installing software package."
    Write-Output "Seting up powershell profile."
    setupprofile
    Write-Output "Installation complete. Press any key to quit ..."
    $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}else {
    Write-Output "This script only supports 64-bit systems!"
}


