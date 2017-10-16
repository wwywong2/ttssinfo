SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 1;

LOAD DATA LOCAL INFILE '[##DataDir##]/ATOLL_LTE_EXPORT.csv' IGNORE INTO TABLE LTE_ATOLL_STG FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26)
SET
FILE_RANK_NUM = 1,
REGION	 = NULLIF(@COL1	 ,''),
ATT_MARKET	 = NULLIF(@COL2	 ,''),
ATOLL_PROJECT	 = NULLIF(@COL3	 ,''),
SITE_NAME	 = NULLIF(@COL4	 ,''),
TX_ID	 = NULLIF(@COL5	 ,''),
LONGITUDE	 = NULLIF(@COL6	 ,''),
LATITUDE	 = NULLIF(@COL7	 ,''),
DX	 = NULLIF(@COL8	 ,''),
DY	 = NULLIF(@COL9	 ,''),
ELEVATION_FT	 = NULLIF(REPLACE(@COL10,' ft','')	 ,''),
LAC	 = NULLIF(@COL11	 ,''),
CID	 = NULLIF(@COL12	 ,''),
ATOLL_STATUS	 = NULLIF(@COL13	 ,''),
AZIMUTH	 = NULLIF(@COL14	 ,''),
TILT	 = NULLIF(@COL15	 ,''),
ANTENNA_NAME	 = NULLIF(@COL16	 ,''),
GAIN	 = NULLIF(@COL17	 ,''),
PATTERN_ELECTRICAL_TILT	 = NULLIF(@COL18	 ,''),
BEAMWIDTH	 = NULLIF(@COL19	 ,''),
EIRP	 = NULLIF(@COL20	 ,''),
`POWER`	 = NULLIF(@COL21	 ,''),
LOSSES	 = NULLIF(@COL22	 ,''),
HEIGHT_FT	 = NULLIF(REPLACE(@COL23,' ft','')	 ,''),
VENDOR	 = NULLIF(@COL24	 ,''),
RNC	 = NULLIF(@COL25	 ,''),
STRUCTURE_TYPE	 = NULLIF(@COL26	 ,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_DAS.csv' IGNORE INTO TABLE LTE_PARAM_DAS FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32)
SET 
CELL_UID	=	NULLIF(@COL1,''),
SITEID	=	NULLIF(@COL2,''),
CELL	=	NULLIF(@COL3,''),
ASSET_ID	=	NULLIF(@COL4,''),
INSTANCE_ID	=	NULLIF(@COL5,''),
REMOTE_ID	=	NULLIF(@COL6,''),
ANT_ID	=	NULLIF(@COL7,''),
ANT_TYPE	=	NULLIF(@COL8,''),
ANT_IDX	=	NULLIF(@COL9,''),
PHY_ANT_IDX	=	NULLIF(@COL10,''),
ORIENTATION	=	NULLIF(@COL11,''),
LATITUDE	=	NULLIF(@COL12,''),
LONGITUDE	=	NULLIF(@COL13,''),
LATITUDE_ANT	=	NULLIF(@COL14,''),
LONGITUDE_ANT	=	NULLIF(@COL15,''),
GE	=	NULLIF(@COL16,''),
RC	=	NULLIF(@COL17,''),
H_BEAM_WIDTH	=	NULLIF(@COL18,''),
E_DTILTS	=	NULLIF(@COL19,''),
M_DTILTS	=	NULLIF(@COL20,''),
FEEDER_LEN	=	NULLIF(@COL21,''),
FEEDER_TYPE	=	NULLIF(@COL22,''),
ANT_GAIN	=	NULLIF(@COL23,''),
SYS_OUT_PWR_TOT	=	NULLIF(@COL24,''),
TOT_DAS_GAIN_LOSS	=	NULLIF(@COL25,''),
ANT_EIRP_PER_CHL	=	NULLIF(@COL26,''),
ANT_EIRP_TOT	=	NULLIF(@COL27,''),
SECTOR_ANT_LOC	=	NULLIF(@COL28,''),
STRUCTURE_TYPE	=	NULLIF(@COL29,''),
VENDOR	=	NULLIF(@COL30,''),
TECH	=	NULLIF(@COL31,''),
QUERY_DATE = STR_TO_DATE(@COL32,'%Y-%m-%d %H:%i:%s'),
REC_DATE = CURRENT_DATE();
