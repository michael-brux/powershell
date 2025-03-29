# List all processes with detailed information

# Get all processes and include additional properties
$processes = Get-Process | Select-Object `
    Name,
    Id,
    @{Name = "CPU (s)"; Expression = { [math]::Round($_.CPU, 2) } },
    @{Name = "Virtual Memory (MB)"; Expression = { [int][math]::Round($_.VirtualMemorySize64 / 1MB, 0) } }

# Display the results in a table
$processes | Sort-Object -Property "Virtual Memory (MB)" -Descending | Format-Table -AutoSize

