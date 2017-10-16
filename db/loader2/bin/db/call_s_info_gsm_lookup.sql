SET sql_warnings = 1;
SET sql_log_bin=0; 
SET sql_safe_updates = 0; -- allows update without PK
SET innodb_lock_wait_timeout = 600;
SET tx_isolation = 'READ-COMMITTED';

SELECT  bsc, siteid, cell, lac, ci, cell_uid, bsic, mcc, mnc, longitude, latitude, orientation, bcch, erp 
FROM s_info_gsm_latest_v;
