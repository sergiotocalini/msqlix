SELECT    DB_NAME(sp.dbid) AS db, COUNT(sp.spid) AS count
FROM	  sys.sysprocesses sp
GROUP BY  DB_NAME(sp.dbid);
