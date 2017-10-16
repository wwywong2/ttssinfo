SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 

LOAD DATA LOCAL INFILE '[##DataDir##]/S_INFO_GSM.txt' IGNORE INTO TABLE s_info_gsm_stg FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES 
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28)
SET 
siteid = nullif(@COL1,''),
cell = nullif(@COL2,''),
latitude = nullif(@COL3,''),
longitude = nullif(@COL4,''),
orientation = nullif(@COL5,''),
beam_width = nullif(@COL6,''),
structuretype = nullif(@COL7,''),
status = nullif(@COL8,''),
ge = nullif(@COL9,''),
rc = nullif(@COL10,''),
e_dtilts = nullif(@COL11,''),
m_dtilts = nullif(@COL12,''),
erp = nullif(@COL13,''),
anttype = nullif(@COL14,''),
bsc = nullif(@COL15,''),
lac = nullif(@COL16,''),
ci = nullif(@COL17,''),
bcch = nullif(@COL18,''),
bsic = nullif(@COL19,''),
mcc = nullif(@COL20,''),
mnc = nullif(@COL21,''),
rac = nullif(@COL22,''),
num_nc = nullif(@COL23,''),
umts_num_nc = nullif(@COL24,''),
vendor = nullif(@COL25,''),
tech = nullif(@COL26,''),
cell_uid = nullif(@COL27,''),
rec_date = nullif(@COL28,'') ;
