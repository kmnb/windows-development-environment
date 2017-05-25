# Removes GOW SSH
Remove-Item "C:\Program Files (x86)\Gow\bin\ssh.bat"

# Install ninite package
Write-Output "Installing ninite package..."
Invoke-WebRequest "https://ninite.com/7zip-audacity-chrome-dropbox-googledrive-jdkx8-paint.net-qbittorrent-sharex-teamviewer12-vlc-windirstat/ninite.exe" -OutFile "ninite.exe"
Start-Process ninite.exe