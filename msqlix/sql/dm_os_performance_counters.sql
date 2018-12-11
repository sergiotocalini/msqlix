SELECT	  cntr_value AS QUERY_RESULT
FROM	  sys.dm_os_performance_counters WITH (NOLOCK)
WHERE	  counter_name = $(P1)
AND	  instance_name = $(P2);
