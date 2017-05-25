$url = "http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/Marsu5/windows-development-environment/master/boxstarter"
function setupprofile () {
    if(Test-Path $HOME\Documents\WindowsPowerShell\){
        Copy-Item .\Microsoft.PowerShell-profile.ps1 $HOME\Documents\WindowsPowerShell\profile.ps1
    }else{
        mkdir $HOME\Documents\WindowsPowerShell\
        setupprofile
    }
}

if((Get-WmiObject Win32_OperatingSystem).OSArchitecture -eq "64-bit"){
    Write-Output "Installation started."
    # Install ninite package
    Write-Output "Downloading ninite package..."
    Invoke-WebRequest "https://ninite.com/7zip-audacity-chrome-dropbox-googledrive-jdkx8-paint.net-qbittorrent-sharex-teamviewer12-vlc-windirstat/ninite.exe" -OutFile "ninite.exe"
    Start-Process ninite.exe -Wait
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
    Copy-Item .\PostInstall.ps1 $env:temp\postinstall.ps1
    Write-Output "Installation complete. Press any key to quit ..."
    $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}else {
    # Why are you even using a 32-bit OS in 2017?
    Write-Output "This script only supports 64-bit systems!"
}