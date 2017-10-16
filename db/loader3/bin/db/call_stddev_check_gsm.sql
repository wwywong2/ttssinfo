SET sql_warnings = 1;
SET sql_log_bin=0; 
SET sql_safe_updates = 0; -- allows update without PK
SET innodb_lock_wait_timeout = 600;
SET tx_isolation = 'READ-COMMITTED';

SET @stdddev_val = 
(
SELECT ( case when ifnull(c.cnt,0) = 0 then 999999
              when ifnull(round(STDDEV(a.cnt),0),0) = 0 then 0 
              when round(STDDEV(a.cnt),0) < @p_stddev_threshold_val then round(STDDEV(a.cnt),0)
              when round(STDDEV(a.cnt),0) > @p_stddev_threshold_val and c.cnt >= round(AVG(b.cnt),0) then 1
              else round(STDDEV(a.cnt),0)
         end  ) 
  FROM 
  (SELECT  valuestring AS cnt,rec_date
     FROM gsm_stats
     WHERE rec_date < @p_date
     AND key_val ='gsm_rssqry_cell_cnt'
     UNION ALL
     SELECT  count(*) AS cnt,rec_date
     FROM s_info_gsm_stg 
     GROUP BY rec_date
     HAVING COUNT(*) <> 0
     ORDER BY rec_date DESC
     LIMIT 5	) AS A,
  (SELECT ifnull(AVG(x.cnt),0) cnt from
	  (SELECT  valuestring AS cnt,rec_date
     FROM gsm_stats
     WHERE rec_date < @p_date
     AND key_val ='gsm_rssqry_cell_cnt'
		 ORDER BY rec_date DESC
		 LIMIT 4	) AS X ) AS B,
   (SELECT ifnull(max(y.cnt),0) cnt from
	  (SELECT  count(*) AS cnt,rec_date
		 FROM s_info_gsm_stg 
		 GROUP BY rec_date
	   ) AS Y ) AS C
  );
  
SELECT @stdddev_val ;

SET @latest_cnt = (SELECT count(*) AS latest_cnt FROM s_info_gsm_stg);
SET @cnt_list  = (SELECT group_concat(concat('[ ',date(rec_date) ,' - ', cnt,' ]')) from (SELECT  count(*) AS cnt,rec_date  FROM s_info_gsm WHERE rec_date < @p_date GROUP BY rec_date ORDER BY rec_date DESC LIMIT 5) AS A);

SELECT concat('The latest set has ',ifnull(@latest_cnt,0),' number of cells for date - ',@p_date,' as compared to previous five set - ',ifnull(@cnt_list,'EMPTY')) as stddev_msg;

