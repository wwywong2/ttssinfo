SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 0;

/*
LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_GENERAL_INFO.txt' IGNORE INTO TABLE UMTS_GENERAL_INFO FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7)
SET
SourceType = nullif(@COL1 ,''),
Source = nullif(@COL2 ,''),
Priority = nullif(@COL3 ,''),
SourceCreatedDate = nullif(@COL4 ,''),
SourceModifiedDate = nullif(@COL5 ,''),
Comment = nullif(@COL6 ,''),
rec_date = nullif(@col7 ,'');
*/
LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_PARAM_2G_NB.txt' IGNORE INTO TABLE UMTS_PARAM_2G_NB FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7)
SET
CELL_UID = nullif(@COL1 ,''),
Src_CELL = nullif(@COL2 ,''),
Trg_CELL = nullif(@COL3 ,''),
Param = nullif(@COL4 ,''),
Trg_LAC = nullif(@COL5 ,''),
Trg_CI = nullif(@COL6 ,''),
rec_date = nullif(@COL7 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_PARAM_3G_NB.txt' IGNORE INTO TABLE UMTS_PARAM_3G_NB FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10)
SET
CELL_UID = nullif(@COL1 ,''),
Src_CELL = nullif(@COL2 ,''),
Trg_CELL = nullif(@COL3 ,''),
Param = nullif(@COL4 ,''),
Trg_LAC = nullif(@COL5 ,''),
Trg_CI = nullif(@COL6 ,''),
Src_uarfcnDl = nullif(@COL7 ,''),
Trg_uarfcnDl = nullif(@COL8 ,''),
HO_TYPE = nullif(@COL9 ,''),
rec_date = nullif(@col10 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_PARAM_ALU.txt' IGNORE INTO TABLE UMTS_PARAM_ALU FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2)
SET
CELL_UID = nullif(@COL1 ,''),
rec_date = nullif(@col2 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_PARAM_COMMON.txt' IGNORE INTO TABLE UMTS_PARAM_COMMON FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3)
SET
CELL_UID = nullif(@COL1 ,''),
OSS_Version = nullif(@COL2 ,''),
rec_date = nullif(@COL3 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_PARAM_ERICSSON.txt' IGNORE INTO TABLE UMTS_PARAM_ERICSSON FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3)
SET
CELL_UID = nullif(@COL1 ,''),
Sector_Carrier = nullif(@COL2 ,''),
rec_date = nullif(@COL3 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_PARAM_LUCENT.txt' IGNORE INTO TABLE UMTS_PARAM_LUCENT FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2)
SET
CELL_UID = nullif(@COL1 ,''),
rec_date = nullif(@col2 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_PARAM_NOKIA.txt' IGNORE INTO TABLE UMTS_PARAM_NOKIA FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2)
SET
CELL_UID = NULLIF(@COL1 ,''),
rec_date = nullif(@col2 ,'');


LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_STATS.txt' IGNORE INTO TABLE UMTS_STATS FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4)
SET 
TYPE = nullif(@COL1 ,''),
KEY_val = nullif(@COL2 ,''),
VALUESTRING = nullif(@COL3 ,''),
rec_date = nullif(@col4 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_TABLE_LIST.txt' IGNORE INTO TABLE UMTS_TABLE_LIST FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3)
SET 
VENDOR_ID = nullif(@COL1 ,''),
TableList = nullif(@COL2 ,''),
rec_date = nullif(@COL3 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_VERSION.txt' IGNORE INTO TABLE UMTS_VERSION FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4)
SET VENDOR_ID = nullif(@COL1 ,''),
VENDOR = nullif(@COL2 ,''),
VERSION = nullif(@COL3 ,''),
rec_date = nullif(@COL4 ,'');


load data local infile '/home/imnosrf/ttssinfo/db/loader1/result/S_INFO_UMTS.txt' ignore into table s_info_umts fields terminated by '\t' escaped by '' lines terminated by '\n'  ignore 1 lines
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43,@COL44,@COL45,@COL46,@COL47,@COL48,@COL49,@COL50,@COL51,@COL52,@COL53,@COL54,@COL55,@COL56,@COL57,@COL58,@COL59,@COL60,@COL61,@COL62,@COL63,@COL64,@COL65,@COL66,@COL67,@COL68,@COL69,@COL70,@COL71,@COL72,@COL73,@COL74,@COL75,@COL76,@COL77,@COL78,@COL79,@COL80,@COL81,@COL82,@COL83,@COL84,@COL85,@COL86,@COL87,@COL88,@COL89,@COL90,@COL91,@COL92,@COL93,@COL94,@COL95,@COL96,@COL97,@COL98,@COL99,@COL100,@COL101,@COL102,@COL103,@COL104,@COL105,@COL106,@COL107,@COL108,@COL109,@COL110,@COL111,@COL112,@COL113,@COL114,@COL115,@COL116,@COL117,@COL118,@COL119,@COL120,@COL121,@COL122,@COL123,@COL124,@COL125,@COL126,@COL127,@COL128,@COL129,@COL130,@COL131,@COL132,@COL133,@COL134,@COL135,@COL136,@COL137,@COL138,@COL139,@COL140,@COL141,@COL142,@COL143,@COL144,@COL145,@COL146,@COL147,@COL148,@COL149,@COL150,@COL151,@COL152,@COL153,@COL154,@COL155,@COL156,@COL157,@COL158,@COL159,@COL160,@COL161,@COL162,@COL163,@COL164,@COL165)
SET 
SITEID = nullif(@COL1 ,''),
LATITUDE = nullif(@COL2 ,''),
LONGITUDE = nullif(@COL3 ,''),
CELL = nullif(@COL4 ,''),
ORIENTATION = nullif(@COL5 ,''),
NUM_NC = nullif(@COL6 ,''),
NCLIST = nullif(@COL7 ,''),
NCLIST2 = nullif(@COL8 ,''),
NCLIST3 = nullif(@COL9 ,''),
NCPARA = nullif(@COL10 ,''),
NCPARA2 = nullif(@COL11 ,''),
NCPARA3 = nullif(@COL12 ,''),
NCPARA4 = nullif(@COL13 ,''),
GSM_NUM_NC = nullif(@COL14 ,''),
GSM_NCLIST = nullif(@COL15 ,''),
GSM_NCPARAM = nullif(@COL16 ,''),
UtranCellId = nullif(@COL17 ,''),
accessClassNBarred = nullif(@COL18 ,''),
administrativeState = nullif(@COL19 ,''),
aseDlAdm = nullif(@COL20 ,''),
aseUlAdm = nullif(@COL21 ,''),
aseUlAdmOffset = nullif(@COL22 ,''),
availabilityStatus = nullif(@COL23 ,''),
bchPower = nullif(@COL24 ,''),
beMarginAseDl = nullif(@COL25 ,''),
beMarginAseUl = nullif(@COL26 ,''),
beMarginDlCode = nullif(@COL27 ,''),
beMarginDlPwr = nullif(@COL28 ,''),
cId = nullif(@COL29 ,''),
cellReserved = nullif(@COL30 ,''),
compModeAdm = nullif(@COL31 ,''),
congDlInterval = nullif(@COL32 ,''),
congTimeOut = nullif(@COL33 ,''),
congUlInterval = nullif(@COL34 ,''),
directedRetryTarget = nullif(@COL35 ,''),
dlCodeAdm = nullif(@COL36 ,''),
fPwrDown = nullif(@COL37 ,''),
fPwrUp = nullif(@COL38 ,''),
fachMeasOccaCycLenCoeff = nullif(@COL39 ,''),
hoType = nullif(@COL40 ,''),
iFCong = nullif(@COL41 ,''),
iFHyst = nullif(@COL42 ,''),
iFOffset = nullif(@COL43 ,''),
individualOffset = nullif(@COL44 ,''),
intCongFilter = nullif(@COL45 ,''),
interFreqFddMeasIndicator = nullif(@COL46 ,''),
interPwrMax = nullif(@COL47 ,''),
interRate = nullif(@COL48 ,''),
loadSharingGsmFraction = nullif(@COL49 ,''),
loadSharingGsmThreshold = nullif(@COL50 ,''),
localCellId = nullif(@COL51 ,''),
maxPwrMax = nullif(@COL52 ,''),
maxRate = nullif(@COL53 ,''),
maxTxPowerUl = nullif(@COL54 ,''),
maximumTransmissionPower = nullif(@COL55 ,''),
minPwrMax = nullif(@COL56 ,''),
minPwrRl = nullif(@COL57 ,''),
minimumRate = nullif(@COL58 ,''),
nInSyncInd = nullif(@COL59 ,''),
nOutSyncInd = nullif(@COL60 ,''),
operationalState = nullif(@COL61 ,''),
primaryCpichPower = nullif(@COL62 ,''),
primarySchPower = nullif(@COL63 ,''),
primaryScramblingCode = nullif(@COL64 ,''),
pwrAdm = nullif(@COL65 ,''),
pwrAdmOffset = nullif(@COL66 ,''),
pwrCongFilter = nullif(@COL67 ,''),
pwrEstFact = nullif(@COL68 ,''),
pwrHyst = nullif(@COL69 ,''),
pwrOffset = nullif(@COL70 ,''),
qHyst1 = nullif(@COL71 ,''),
qHyst2 = nullif(@COL72 ,''),
qQualMin = nullif(@COL73 ,''),
qRxLevMin = nullif(@COL74 ,''),
qualMeasQuantity = nullif(@COL75 ,''),
releaseAseDl = nullif(@COL76 ,''),
releaseAseDlNg = nullif(@COL77 ,''),
rlFailureT = nullif(@COL78 ,''),
sInterSearch = nullif(@COL79 ,''),
sIntraSearch = nullif(@COL80 ,''),
sRatSearch = nullif(@COL81 ,''),
secondarySchPower = nullif(@COL82 ,''),
sf16Adm = nullif(@COL83 ,''),
sf32Adm = nullif(@COL84 ,''),
sf8Adm = nullif(@COL85 ,''),
sib1PlmnScopeValueTag = nullif(@COL86 ,''),
tCell = nullif(@COL87 ,''),
tfsFlexConstant = nullif(@COL88 ,''),
tmCongAction = nullif(@COL89 ,''),
tmCongActionNg = nullif(@COL90 ,''),
tmInitialG = nullif(@COL91 ,''),
treSelection = nullif(@COL92 ,''),
txFilter = nullif(@COL93 ,''),
txInterval = nullif(@COL94 ,''),
uarfcnDl = nullif(@COL95 ,''),
uarfcnUl = nullif(@COL96 ,''),
usedFreqThresh2dEcno = nullif(@COL97 ,''),
usedFreqThresh2dRscp = nullif(@COL98 ,''),
umts2GsmQDeActCM2F_Thres = nullif(@COL99 ,''),
umts2GsmQDeActCM2F_Time = nullif(@COL100 ,''),
ReportCriteria1A = nullif(@COL101 ,''),
ReportCriteria1B = nullif(@COL102 ,''),
ReportCriteria1C = nullif(@COL103 ,''),
ActiveSetSizePS = nullif(@COL104 ,''),
ActiveSetSizeCS = nullif(@COL105 ,''),
HysteresisList = nullif(@COL106 ,''),
TimeToTriggerList = nullif(@COL107 ,''),
GSMThresh3a = nullif(@COL108 ,''),
UtranRelThresh3aEcno = nullif(@COL109 ,''),
UtranRelThresh3aRscp = nullif(@COL110 ,''),
FachId = nullif(@COL111 ,''),
fachAdministrativeState = nullif(@COL112 ,''),
fachAvailabilityStatus = nullif(@COL113 ,''),
fach1RateMatchingAttrDl = nullif(@COL114 ,''),
fach2RateMatchingAttrDl = nullif(@COL115 ,''),
maxFach1Power = nullif(@COL116 ,''),
maxFach2Power = nullif(@COL117 ,''),
fachOperationalState = nullif(@COL118 ,''),
pOffset1Fach = nullif(@COL119 ,''),
pOffset3Fach = nullif(@COL120 ,''),
fachSccpchOffset = nullif(@COL121 ,''),
PchId = nullif(@COL122 ,''),
pchAdministrativeState = nullif(@COL123 ,''),
pchAvailabilityStatus = nullif(@COL124 ,''),
pchOperationalState = nullif(@COL125 ,''),
pchPower = nullif(@COL126 ,''),
pichMode = nullif(@COL127 ,''),
pichPower = nullif(@COL128 ,''),
pchSccpchOffset = nullif(@COL129 ,''),
RachId = nullif(@COL130 ,''),
rachAdministrativeState = nullif(@COL131 ,''),
aichPower = nullif(@COL132 ,''),
aichTransmissionTiming = nullif(@COL133 ,''),
rachAvailabilityStatus = nullif(@COL134 ,''),
rachConstantValueCprach = nullif(@COL135 ,''),
rachMaxPreambleCycle = nullif(@COL136 ,''),
rachOperationalState = nullif(@COL137 ,''),
powerOffsetP0 = nullif(@COL138 ,''),
powerOffsetPpm = nullif(@COL139 ,''),
rachPreambleRetransMax = nullif(@COL140 ,''),
rachPreambleSignatures = nullif(@COL141 ,''),
rachPreambleThreshold = nullif(@COL142 ,''),
rachScramblingCodeWordNo = nullif(@COL143 ,''),
rachSpreadingFactor = nullif(@COL144 ,''),
rachSubChannelNo = nullif(@COL145 ,''),
nodebid = nullif(@COL146 ,''),
sac = nullif(@COL147 ,''),
rac = nullif(@COL148 ,''),
lac = nullif(@COL149 ,''),
GE = nullif(@COL150 ,''),
RC = nullif(@COL151 ,''),
BEAM_WIDTH = nullif(@COL152 ,''),
EV_DTILTS = nullif(@COL153 ,''),
DTILTS_M = nullif(@COL154 ,''),
ERP = nullif(@COL155 ,''),
ANTTYPE = nullif(@COL156 ,''),
RNC = nullif(@COL157 ,''),
VENDOR = nullif(@COL158 ,''),
TECH = nullif(@COL159 ,''),
ZONEID = nullif(@COL160 ,''),
FLAG1 = nullif(@COL161 ,''),
FLAG2 = nullif(@COL162 ,''),
CELL_UID = nullif(@COL163 ,''),
MAPINFO_ID = nullif(@COL164 ,''),
rec_date = nullif(@COL165 ,'');

LOAD DATA LOCAL INFILE '/home/imnosrf/ttssinfo/db/loader1/result/UMTS_PARAM_DAS.txt' IGNORE INTO TABLE UMTS_PARAM_DAS FIELDS TERMINATED BY '\t' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33)
SET 
CELL_UID	=	nullif(@COL1,''),
SITEID	=	nullif(@COL2,''),
CELL	=	nullif(@COL3,''),
ASSET_ID	=	nullif(@COL4,''),
INSTANCE_ID	=	nullif(@COL5,''),
REMOTE_ID	=	nullif(@COL6,''),
ANT_ID	=	nullif(@COL7,''),
ANT_TYPE	=	nullif(@COL8,''),
ANT_IDX	=	nullif(@COL9,''),
PHY_ANT_IDX	=	nullif(@COL10,''),
ORIENTATION	=	nullif(@COL11,''),
LATITUDE	=	nullif(@COL12,''),
LONGITUDE	=	nullif(@COL13,''),
LATITUDE_ANT	=	nullif(@COL14,''),
LONGITUDE_ANT	=	nullif(@COL15,''),
GE	=	nullif(@COL16,''),
RC	=	nullif(@COL17,''),
H_BEAM_WIDTH	=	nullif(@COL18,''),
E_DTILTS	=	nullif(@COL19,''),
M_DTILTS	=	nullif(@COL20,''),
FEEDER_LEN	=	nullif(@COL21,''),
FEEDER_TYPE	=	nullif(@COL22,''),
ANT_GAIN	=	nullif(@COL23,''),
SYS_OUT_PWR_TOT	=	nullif(@COL24,''),
TOT_DAS_GAIN_LOSS	=	nullif(@COL25,''),
ANT_EIRP_PER_CHL	=	nullif(@COL26,''),
ANT_EIRP_TOT	=	nullif(@COL27,''),
SECTOR_ANT_LOC	=	nullif(@COL28,''),
STRUCTURE_TYPE	=	nullif(@COL29,''),
VENDOR	=	nullif(@COL30,''),
TECH	=	nullif(@COL31,''),
QUERY_DATE = STR_TO_DATE(@COL32,'%Y-%m-%d %H:%i:%s'),
rec_date	=	nullif(@COL33,'');

SET AUTOCOMMIT = 1;