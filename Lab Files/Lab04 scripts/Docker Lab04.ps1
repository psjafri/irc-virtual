# for lab 4 docker 
Install-Module DockerProvider -Force 
Install-Package Docker -ProviderName DockerProvider -Force 
Restart-Computer -Force 
# commands 
docker images 
Get-service docker
Start-service docker
docker network ls
docker network inspect nat 
# Search command 
docker search Microsoft
docker search github 
docker pull mcr.microsoft.com/windows/servercore/iis:latest 
docker pull nanoserver/iis:latest
# Task 6: Deploy a new container
docker images
docker run -d -p 80:80 mcr.microsoft.com/windows/servercore/iis
Ipconfig
Test-Connection 172.23.224.1
Ping 172.23.224.1
docker ps
docker stop e6444f5740d4
# Task 7: Create new images tags
docker tag mcr.microsoft.com/windows/servercore/iis pintoiis:latest
docker images
# Task 8: Create a Web Server Container based on IIS
if(!(Get-NetFirewallRule | where {$PSItem.Name -eq "TCP80"})) {New-NetFirewallRule -Name "TCP80" -DisplayName "HTTP on TCP/80" -Protocol tcp -LocalPort 80 -Action Allow -Enabled True}
docker run -it --name myweb1 -p 80:80 pintoiis cmd
# cek extra before continue
# Task 9: Stop an remove the IIS container
docker stop myweb1
docker rm myweb1
