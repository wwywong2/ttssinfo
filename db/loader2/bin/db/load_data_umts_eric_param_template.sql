SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 0;

LOAD DATA LOCAL INFILE '[##DataDir##]/UMTS_PARAM_ERIC_EXTRA_SIB19_RESELECTION.txt' IGNORE INTO TABLE UMTS_PARAM_ERIC_SIB19_RESEL FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15)
SET 
  region	 = nullif(@COL1	,''),
  start_date	 = nullif(@COL2	,''),
  subnetwork_id	 = nullif(@COL3	,''),
  mecontext_id	 = nullif(@COL4	,''),
  utrancell_id	 = nullif(@COL5	,''),
  eutranfreqrelation_id	 = nullif(@COL6	,''),
  externaleutranfreq	 = nullif(@COL7	,''),
  eutranfreqrelation	 = nullif(@COL8	,''),
  cellreselectionpriority	 = nullif(@COL9	,''),
  qrxlevmin	 = nullif(@COL10	,''),
  threshhigh	 = nullif(@COL11	,''),
  threshlow	 = nullif(@COL12	,''),
  userlabel	 = nullif(@COL13	,''),
  redirection	 = nullif(@COL14	,''),
  rec_date	 = nullif(@COL15	,'');
  
SET AUTOCOMMIT = 1;