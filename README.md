# msqlix
Zabbix Agent - MSSQL

# Dependencies

* [Powershell (latest version)](https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell)
* [Git](https://git-scm.com/download/win)
* [Zabbix Agent](http://www.suiviperf.com/zabbix/index.php)

# Deploy
We need to change some options on the zabbix_agentd configuration.
```
Windows PowerShell
Copyright (C) 2014 Microsoft Corporation. All rights reserved.
 
PS C:\Users\Administrator> edit "C:\Program Files (x86)\Zabbix Agent\zabbix_agentd.conf"
...
Include=C:\Program Files (x86)\Zabbix Agent\zabbix_agentd.d\
...
PS C:\Users\Administrator> 
```

## Zabbix
Then you can run the deploy_zabbix.ps1 script as administrator.
```
Windows PowerShell
Copyright (C) 2014 Microsoft Corporation. All rights reserved.
 
PS C:\Users\Administrator> cd .\Desktop
PS C:\Users\Administrator\Desktop> git clone https://github.com/sergiotocalini/msqlix.git
Cloning into 'msqlix'...
remote: Counting objects: 55, done.
remote: Compressing objects: 100% (8/8), done.
remote: Total 55 (delta 1), reused 7 (delta 1), pack-reused 46
Unpacking objects: 100% (55/55), done.
PS C:\Users\Administrator\Desktop> .\msqlix\deploy_zabbix.ps1
PS C:\Users\Administrator\Desktop>
``` 
*Note: the installation has to be executed on the zabbix agent host and you have to import the template on the zabbix web. The default installation directory is "C:\Program Files (x86)\Zabbix Agent\scripts\agentd\msqlix\*". Please restart the zabbix-agent after the installation of the script.
