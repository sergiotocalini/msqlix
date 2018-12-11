#

[CmdletBinding()]
param (
    [Parameter(Mandatory=$False,ValueFromPipeline=$True,Position=0)][string]$property
);

if (!$property) {
   $property = 'ProductVersion'
}

$output = Invoke-Sqlcmd -InputFile "C:\Program Files (x86)\Zabbix Agent\scripts\agentd\msqlix\sql\serverproperty.sql" -Variable @("P1='$property'")
$output.$property
