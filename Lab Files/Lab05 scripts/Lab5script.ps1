# Lab 5 Virtualization
# Practice 1
# Check Hyper-V
Get-WindowsFeature -Name Hyper-V* | Select-Object Name, DisplayName, InstallState
Get-Module -ListAvailable -Name Hyper-V
bcdedit.exe /enum
Get-WinEvent -ListLog "Hyper-V*" -ErrorAction SilentlyContinue
# Task 2: Install the Hyper-V Role using Power Shell
Install-WindowsFeature -Name Hyper-V -IncludeManagementTools
Install-WindowsFeature -Name Multipath-IO
Restart-Computer
# Verify
Get-WindowsFeature -Name Hyper-V*
Get-Command -Module Hyper-V
bcdedit.exe /enum
# P 2
# Task 5: Configure a virtual hard disk location
Set-VMHost -VirtualHardDiskPath D:\VHDs\
# Task 6: Configure Hyper-V settings by using Windows PowerShell and Hyper-V Manager
Set-VMHost -VirtualMachinePath "D:\VMs" -NumaSpanningEnabled $false -MaximumStorageMigrations 4 -EnableEnhancedSessionMode $true
# P3
# Task 8: Create virtual hard disks
New-VHD -Path "D:\VHDs\Fixed.vhdx" -SizeBytes 10GB -Fixed
# Task 10: Create virtual machines
# 10.3
Add-VMHardDiskDrive -VMName "ETHA-VMG1" -ControllerType IDE -ControllerNumber 0 -ControllerLocation 1 -Path "D:\VHDs\Differencing.vhd"
# Task 13: Manage Generation 1 virtual machines
# 13.3. Use the Windows PowerShell cmdlet Set-VM to enable dynamic memory for ETHA-VMG1.
Set-VMMemory -VMName "ETHA-VMG1" -DynamicMemoryEnabled $true
# 13.4. Use the Windows PowerShell cmdlet Get-VMxxx to
Get-VMMemory -VMName "ETHA-VMG1" | Select-Object Enabled, Minimum, Maximum, Startup
Get-VMNetworkAdapter -VMName "ETHA-VMG1" | Select-Object Name, SwitchName, MacAddress
# Task 15: Work with storage Quality of Service management simulating a very hard disk intensive MS SQL workload.
# 15.6. On Your HOST, in Windows PowerShell, use the cmdlet Set-VMHardDiskDrive to disable Quality of Service management for IDE Hard Disk on the ETHA- VMG1.
Set-VMHardDiskDrive -VMName "ETHA-VMG1" -ControllerType IDE -MaximumIOPS 0 -MinimumIOPS 0
# 16.8. On your HOST, use the Windows PowerShell cmdlet Enable-VMIntegrationService to enable “time synchronization” for ETHA-VMG1.
Enable-VMIntegrationService -VMName "ETHA-VMG1" -Name "Time Synchronization"
#17.3. Use the Windows PowerShell Add-VMHardDiskDrive cmdlet to add both Dynamic.vhdx and Dynamic2.vhdx as a SCSI disks to ETHA-VMG1
# Adding the first disk to SCSI Controller 0, Location 1
Add-VMHardDiskDrive -VMName "ETHA-VMG1" -ControllerType SCSI -ControllerNumber 0 -ControllerLocation 1 -Path "D:\VHDs\Dynamic.vhdx"
# Adding the second disk to SCSI Controller 0, Location 2
Add-VMHardDiskDrive -VMName "ETHA-VMG1" -ControllerType SCSI -ControllerNumber 0 -ControllerLocation 2 -Path "D:\VHDs\Dynamic2.vhdx"
# 18.4. On your HOST, use the Windows PowerShell cmdlet Remove-VMHardDiskDrive twice to remove SCSI disks on Locations 0 and 1 for the first SCSI controller (number 0) from ETHA-VMG1.
# # Remove the disk at SCSI Controller 0, Location 0
Remove-VMHardDiskDrive -VMName "ETHA-VMG1" -ControllerType SCSI -ControllerNumber 0 -ControllerLocation 0
# Remove the disk at SCSI Controller 0, Location 1
Remove-VMHardDiskDrive -VMName "ETHA-VMG1" -ControllerType SCSI -ControllerNumber 0 -ControllerLocation 1
