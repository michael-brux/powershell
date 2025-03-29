# Get free and total physical memory
$physicalMemoryFree = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty FreePhysicalMemory
$physicalMemoryTotal = Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -ExpandProperty TotalPhysicalMemory
$physicalMemoryFreeGB = [math]::Round($physicalMemoryFree / 1024 / 1024, 1)
$physicalMemoryTotalGB = [math]::Round($physicalMemoryTotal / 1024 / 1024 / 1024, 1)
$physicalMemoryFreePercent = [math]::Round(($physicalMemoryFree * 1024) / $physicalMemoryTotal * 100, 0)

# Get free and total virtual memory
$virtualMemoryFree = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty FreeVirtualMemory
$virtualMemoryTotal = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty TotalVirtualMemorySize
$virtualMemoryFreeGB = [math]::Round($virtualMemoryFree / 1024 / 1024, 1)
$virtualMemoryTotalGB = [math]::Round($virtualMemoryTotal / 1024 / 1024, 1)
$virtualMemoryFreePercent = [math]::Round(($virtualMemoryFree / $virtualMemoryTotal) * 100, 0)

# Display results
Write-Output "Physical Memory: $physicalMemoryFreeGB GB free of $physicalMemoryTotalGB GB ($physicalMemoryFreePercent% free)"
Write-Output "Virtual Memory: $virtualMemoryFreeGB GB free of $virtualMemoryTotalGB GB ($virtualMemoryFreePercent% free)"
