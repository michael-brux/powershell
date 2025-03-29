# Get free physical memory
$physicalMemory = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty FreePhysicalMemory
$physicalMemoryMB = [math]::Round($physicalMemory / 1024, 2)

# Get free virtual memory
$virtualMemory = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty FreeVirtualMemory
$virtualMemoryMB = [math]::Round($virtualMemory / 1024, 2)

# Display results
Write-Output "Free Physical Memory: $physicalMemoryMB MB"
Write-Output "Free Virtual Memory: $virtualMemoryMB MB"
