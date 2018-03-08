
$SOURCE_DIR=split-path -parent $MyInvocation.MyCommand.Definition
$ZABBIX_DIR="C:\Program Files (x86)\Zabbix Agent"

New-Item -Path $ZABBIX_DIR\scripts\agentd -Name msbbix -ItemType directory
Copy-Item -Path $SOURCE_DIR\msbbix\scripts -Recurse -Destination $ZABBIX_DIR\scripts\agentd\msbbix\ -Container
Copy-Item -Path $SOURCE_DIR\msbbix\zabbix_agentd.conf -Recurse -Destination $ZABBIX_DIR\zabbix_agentd.d\msbbix.conf -Container
