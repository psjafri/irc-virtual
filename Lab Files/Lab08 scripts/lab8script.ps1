# Lab 08 scripts
#1.1. On the Host, STO-SVR1, in the Windows PowerShell ISE Console, create a PS Script with the following commands, save it and, then run it.to enable nested virtualization on SEA-NODE1 and SEA- NODE2.
Set-VMProcessor -VMName SEA-NODE1 -ExposeVirtualizationExtensions $true -Count 2
Set-VMMemory SEA-NODE1 -DynamicMemoryEnabled $false
Get-VMNetworkAdapter -VMName SEA-NODE1| Set-VMNetworkAdapter -MacAddressSpoofing On
#Node 2
Set-VMProcessor -VMName SEA-NODE2 -ExposeVirtualizationExtensions $true -Count 2
Set-VMMemory SEA-NODE2 -DynamicMemoryEnabled $false
Get-VMNetworkAdapter -VMName SEA-NODE2| Set-VMNetworkAdapter -MacAddressSpoofing On
