SET sql_warnings = 1;
SET sql_log_bin=0; 
SET sql_safe_updates = 0; -- allows update without PK
SET innodb_lock_wait_timeout = 600;
SET tx_isolation = 'READ-COMMITTED';

-- CALL load_rss_data_gsm('2014-05-02');
SELECT @p_date;
CALL load_mapping_list_gsm(@p_date);
CALL load_missing_data_gsm(@p_date);
CALL load_rss_data_gsm(@p_date);
CALL load_param_change_gsm(@p_date);
CALL load_lookup_freq_band(@p_date, 'GSM') ;

SELECT MIN(rec_date) 
INTO @p_next_date
FROM gsm_table_list
WHERE tablelist ='PARAM_COMMON'
AND rec_date > @p_date;

SELECT @p_next_date;
CALL load_rss_data_gsm(@p_next_date);
CALL load_param_change_gsm(@p_next_date);
