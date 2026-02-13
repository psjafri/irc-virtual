# Lab 7 script
# 1.3. Open a PowerShell Console and export ETHA-VMG1 using the following cmdlet:
Export-VM -Name ETHA-VMG1 -Path D:\VMExport
# 3.13. On STO-SVR1, use the Windows PowerShell cmdlet Checkpoint-VM to create checkpoint for ETHA-VM3, and then name it Folder3.
Checkpoint-VM -Name "ETHA-VM3"
# 3.14. Use the cmdlet Get-VMSnapshot to view existing checkpoints for ETHA-VM3
Get-VMSnapshot -VMName "ETHA-VM3"
# 4.2. Use the Windows PowerShell cmdlet Export-VMSnapshot to export the Folder2 checkpoint of ETHA-VM3 to the D:\Exported
Export-VMSnapshot -VMName "ETHA-VM3" -Name "Folder2" -Path "D:\Exported"
# Use the Windows PowerShell cmdlet Export-VM to export ETHA-VM3 to the D:\Exported
Export-VM -Name "ETHA-VM3" -Path "D:\Exported"
# 4.8. Use the Windows PowerShell cmdlet Restore-VMSnapshot to apply the Folder3 checkpoint to ETHA-VM3. Confirm Yes to All.
Restore-VMSnapshot -VMName "ETHA-VM3" -Name "Folder3"
# 8.1. On STO-SVR1, use the Windows PowerShell cmdlet Get-VM to view whether resource metering is enabled for ETHA-VMG1
Get-VM -Name "ETHA-VMG1" | Select-Object Name, ResourceMeteringEnabled
# 8.2. Use the Windows PowerShell cmdlet Enable-VMResourceMetering to enable resource metering for ETHA-VMG1.
Enable-VMResourceMetering -VMName "ETHA-VMG1"
# 8.3. Use the Windows PowerShell cmdlet Measure-VM to view resource metering data for ETHA-VMG1.
Measure-VM -VMName "ETHA-VMG1"
# 8.9. On STO-SVR1, use the Windows PowerShell cmdlet Disable-VMResourceMetering to disable resource metering for ETHA-VMG1.
Disable-VMResourceMetering -VMName "ETHA-VMG1"
