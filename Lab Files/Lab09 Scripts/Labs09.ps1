# Lab9
Set-VMProcessor -VMName SEA-VMM -ExposeVirtualizationExtensions $true -Count 2
Set-VMMemory SEA-VMM -DynamicMemoryEnabled $false
Get-VMNetworkAdapter -VMName SEA-VMM| Set-VMNetworkAdapter -MacAddressSpoofing On