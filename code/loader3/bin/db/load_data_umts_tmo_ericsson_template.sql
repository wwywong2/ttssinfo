SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 0;

LOAD DATA LOCAL INFILE '[##DataDir##]/S_INFO_UMTS_2G_NB_PARAM.csv' IGNORE INTO TABLE UMTS_PARAM_2G_NB FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7)
SET
CELL_UID = nullif(@COL2,''),
Src_CELL = nullif(@COL3,''),
Trg_CELL = nullif(@COL4,''),
Param = nullif(@COL5,''),
Trg_LAC = nullif(@COL6,''),
Trg_CI = nullif(@COL7,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/S_INFO_UMTS_3G_NB_PARAM.csv' IGNORE INTO TABLE UMTS_PARAM_3G_NB FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10)
SET
CELL_UID = nullif(@COL2,''),
Src_CELL = nullif(@COL3,''),
Trg_CELL = nullif(@COL4,''),
Param = nullif(@COL5,''),
Trg_LAC = nullif(@COL6,''),
Trg_CI = nullif(@COL7,''),
Src_uarfcnDl = nullif(@COL8,''),
Trg_uarfcnDl = nullif(@COL9,''),
HO_TYPE = nullif(@COL10,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/S_INFO_UMTS.csv' IGNORE INTO TABLE S_INFO_UMTS FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43,@COL44,@COL45,@COL46,@COL47,@COL48,@COL49,@COL50,@COL51,@COL52,@COL53,@COL54,@COL55,@COL56,@COL57,@COL58,@COL59,@COL60,@COL61,@COL62,@COL63,@COL64,@COL65,@COL66,@COL67,@COL68,@COL69,@COL70,@COL71,@COL72,@COL73,@COL74,@COL75,@COL76,@COL77,@COL78,@COL79,@COL80,@COL81,@COL82,@COL83,@COL84,@COL85,@COL86,@COL87,@COL88,@COL89,@COL90,@COL91,@COL92,@COL93,@COL94,@COL95,@COL96,@COL97,@COL98,@COL99,@COL100,@COL101,@COL102,@COL103,@COL104,@COL105,@COL106,@COL107,@COL108,@COL109,@COL110,@COL111,@COL112,@COL113,@COL114,@COL115,@COL116,@COL117,@COL118,@COL119,@COL120,@COL121,@COL122,@COL123,@COL124,@COL125,@COL126,@COL127,@COL128,@COL129,@COL130,@COL131,@COL132,@COL133,@COL134,@COL135,@COL136,@COL137,@COL138,@COL139,@COL140,@COL141,@COL142,@COL143,@COL144,@COL145,@COL146,@COL147,@COL148,@COL149,@COL150,@COL151,@COL152,@COL153,@COL154,@COL155,@COL156,@COL157,@COL158,@COL159,@COL160,@COL161,@COL162,@COL163,@COL164)
SET 
SITEID = nullif(@COL2 ,''),
LATITUDE = nullif(@COL3 ,''),
LONGITUDE = nullif(@COL4 ,''),
CELL = nullif(@COL1 ,''),
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
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/QUERY_4.csv' IGNORE INTO TABLE STG_UMTS_PARAM_ERIC_REPORT FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET 
RNC = nullif(@COL1,''),
RNCName = nullif(@COL2,''),
reportingRange1a = nullif(@COL3,''),
reportingRange1b = nullif(@COL4,''),
HysteresisList = nullif(@COL5,''),
TimeToTriggerList = nullif(@COL6,''),
GSMThresh3a = nullif(@COL7,''),
UtranRelThresh3aEcno = nullif(@COL8,''),
UtranRelThresh3aRscp = nullif(@COL9,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/QUERY_5.csv' IGNORE INTO TABLE STG_UMTS_PARAM_ERIC_ACTIVE FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET 
RNC = nullif(@COL1,''),
RNCName = nullif(@COL2,''),
ActiveSetSizePS = nullif(@COL3,''),
ActiveSetSizeCS = nullif(@COL4,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/QUERY_6.csv' IGNORE INTO TABLE STG_UMTS_PARAM_ERIC_FACH FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET 
CELL = nullif(@COL1,''),
Fach_ID = nullif(@COL2,''),
administrativeState = nullif(@COL3,''),
maxFach1Power = nullif(@COL4,''),
maxFach2Power = nullif(@COL5,''),
pOffset1Fach = nullif(@COL6,''),
pOffset3Fach = nullif(@COL7,''),
sccpchOffset = nullif(@COL8,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/QUERY_7.csv' IGNORE INTO TABLE STG_UMTS_PARAM_ERIC_PCH FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET 
CELL = nullif(@COL1,''),
Pch_ID = nullif(@COL2,''),
administrativeState = nullif(@COL3,''),
pchAvailabilityStatus = nullif(@COL4,''),
pchOperationalState = nullif(@COL5,''),
pchPower = nullif(@COL6,''),
pichPower = nullif(@COL7,''),
sccpchOffset = nullif(@COL8,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/QUERY_8.csv' IGNORE INTO TABLE STG_UMTS_PARAM_ERIC_RACH FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14)
SET 
CELL = nullif(@COL1,''),
Rach_ID = nullif(@COL2,''),
administrativeState = nullif(@COL3,''),
aichPower = nullif(@COL4,''),
aichTransmissionTiming = nullif(@COL5,''),
constantValueCprach = nullif(@COL6,''),
maxPreambleCycle = nullif(@COL7,''),
powerOffsetP0 = nullif(@COL8,''),
powerOffsetPpm = nullif(@COL9,''),
preambleRetransMax = nullif(@COL10,''),
preambleSignatures = nullif(@COL11,''),
scramblingCodeWordNo = nullif(@COL12,''),
spreadingFactor = nullif(@COL13,''),
subChannelNo = nullif(@COL14,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/S_INFO_UMTS_CGI.csv' IGNORE INTO TABLE STG_UMTS_PARAM_ERIC_CGI FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2)
SET 
cgi = nullif(@COL1,''),
CELL_UID = nullif(@COL2,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/PARAM_ERICSSON.csv' IGNORE INTO TABLE UMTS_PARAM_ERICSSON FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2)
SET 
CELL_UID = nullif(@COL1,''),
Sector_Carrier = nullif(@COL2,''),
rec_date = current_date();

SET AUTOCOMMIT = 1;