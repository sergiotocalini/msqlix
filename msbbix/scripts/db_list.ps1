
$dbs = Get-WmiObject Win32_PerfFormattedData_MSSQLServer_SQLServerDatabases | Select Name
$idx = 1
write-host "{"
write-host "   `"data`":["
foreach ($perfdbs in $dbs) {
    $output="      { `"{#DBNAME}`" : `"" + $perfdbs.Name + "`" }"
    if ($idx -lt $dbs.Count) {
        $output=$output + ","
    }
    write-host $output
    $idx++;
}
write-host "   ]"
write-host "}"
