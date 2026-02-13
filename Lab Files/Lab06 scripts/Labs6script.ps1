# Lab06 ETHA - Virtuella System
# Practice 1: Creating and Using Windows Server Hyper-V Virtual Switches
# 2.1. On STO-SVR1, in Windows PowerShell, use the cmdlet Get-NetAdapter with the All parameter to confirm the information from step 1.2.
Get-NetAdapter -Physical | Select-Object Name, InterfaceDescription, Status, LinkSpeed
# 2.2. On STO-SVR1, in Windows PowerShell, use the cmdlet Get-VMNetworkAdapter with the All parameter, and complete the following table
Get-VMNetworkAdapter -All | Select-Object VMName, SwitchName, MacAddress, Status, IPAddresses
# 2.5. In Windows PowerShell, use the cmdlet Get-NetAdapter to confirm that the network adapters that you added by using Windows PowerShell are present on the system.
Get-NetAdapter | Where-Object InterfaceDescription -like "*Loopback*" | Select-Object Name, InterfaceDescription, Status, LinkSpeed
# 3.4. Use the Windows PowerShell cmdlet Get-VMNetworkAdapter with the All parameter to confirm that there is a network adapter named Internal Switch present on the system.
Get-VMNetworkAdapter -All | Where-Object Name -eq "Internal Switch" | Select-Object VMName, Name, SwitchName, Status
# 3.6. Use the Windows PowerShell cmdlet Get-NetAdapter to get the name of the default network adapter in the Host.
Get-NetAdapter | Where-Object { (Get-NetRoute -DestinationPrefix "0.0.0.0/0" -InterfaceIndex $_.InterfaceIndex -ErrorAction SilentlyContinue) } | Select-Object Name, InterfaceDescription, Status, LinkSpeed
# 3.7. Use the Windows PowerShell cmdlet New-VMSwitch to create an private virtual switch, and name it Private Switch.
New-VMSwitch -Name "Private Switch" -SwitchType Private
# 3.9. In Windows PowerShell, use the Get-VMNetworkAdapter cmdlet with the All parameter to confirm that no network connection was added when you created the private virtual switch.
Get-VMNetworkAdapter -All
# 4.11. On ETHA-VMG2, use the Windows PowerShell cmdlet Set-NetIPInterface to enable dynamic TCP/IP configuration for the Ethernet Interfacealias network connection. To do this, you will need to run Windows PowerShell in Administrator mode.
# 7.1. On ETHA-VMG1, use the Windows PowerShell cmdlet Set-NetIPInterface to enable dynamic TCP/IP configuration. Use ipconfig to release and renew TCP/IP settings.
Set-NetIPInterface -InterfaceAlias "Ethernet" -Dhcp Enabled
ipconfig /release
ipconfig /renew
# 7.4. On STO-SVR1, use the Windows PowerShell Get-VMNetworkAdapter to get the name of the ETHA-VMG2 adapter, and the Set-VMNetworkAdapter cmdlet to disable DHCP guard on the ETHA-VMG2 virtual computer. 
Get-VMNetworkAdapter -VMName "ETHA-VMG2" | Set-VMNetworkAdapter -DhcpGuard Off
