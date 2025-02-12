SELECT c.ckey            ckey_,
       c.db_name,
       c.cdb,
       c.dbversion,
       c.log_mode,
       c.force_logging,
       c.redo_gb_per_day,
       c.rac_dbinstaces,
       c.characterset,
       c.platform_name,
       c.startup_time,
       c.user_schemas,
       c.buffer_cache_mb,
       c.shared_pool_mb,
       c.total_pga_allocated_mb,
       c.db_total_memory_gb,
       c.db_size_allocated_gb,
       c.db_size_in_use_gb,
       c.db_long_size_gb,
       c.dg_database_role,
       c.dg_protection_mode,
       c.dg_protection_level,
       b.*,
       a.num_cpus        host_num_cpus,
       a.num_cpu_cores   host_num_cpu_cores,
       a.num_cpu_sockets host_num_cpu_sockets,
       a.host_mem_gb,
       a.host_free_mem_perc,
       a.host_cpu_utilization_perc,
       a.host_sys_cpu_utilization_perc,
       a.host_load_avg,
       a.host_swap_bytes_perc
FROM   ${dataset}.vosstat_metrics a
       INNER JOIN ${dataset}.vsysmetric_hist b
               ON a.ckey = b.ckey
                  AND a.dbid = b.dbid
                  AND a.instance_number = b.instance_number
                  AND a.hour = b.hour
       INNER JOIN ${dataset}.vdbsummary c
               ON a.ckey = c.ckey; 
