SET sql_warnings = 1;
SET sql_log_bin=0; 
SET sql_safe_updates = 0; -- allows update without PK
SET innodb_lock_wait_timeout = 600;
SET tx_isolation = 'READ-COMMITTED';

-- CALL load_rss_data_umts('2014-05-02');
SELECT @p_date;
CALL load_mapping_list_umts(@p_date);
CALL load_missing_data_umts(@p_date);
CALL load_rss_data_umts(@p_date);
CALL load_param_change_umts(@p_date);
CALL load_lookup_freq_band(@p_date, 'UMTS') ;

SELECT MIN(rec_date) 
INTO @p_next_date
FROM umts_table_list
WHERE tablelist ='PARAM_COMMON'
AND rec_date > @p_date;

SELECT @p_next_date;
CALL load_rss_data_umts(@p_next_date);
CALL load_param_change_umts(@p_next_date);

