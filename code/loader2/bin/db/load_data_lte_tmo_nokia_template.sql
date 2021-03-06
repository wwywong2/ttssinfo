SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 0;

LOAD DATA LOCAL INFILE '[##DataDir##]/S_INFO_LTE.csv' IGNORE INTO TABLE s_info_LTE FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43,@COL44,@COL45,@COL46,@COL47,@COL48)
SET
SITEID	  = nullif(@COL1 ,''),
CELL	  = nullif(@COL2 ,''),
LATITUDE	  = nullif(@COL3 ,''),
LONGITUDE	  = nullif(@COL4 ,''),
ORIENTATION	  = nullif(@COL5 ,''),
BEAM_WIDTH	  = nullif(@COL6 ,''),
StructureType	  = nullif(@COL7 ,''),
STATUS	  = nullif(@COL8 ,''),
GE	  = nullif(@COL9 ,''),
RC	  = nullif(@COL10 ,''),
E_DTILTS	  = nullif(@COL11 ,''),
M_DTILTS	  = nullif(@COL12 ,''),
ERP	  = nullif(@COL13 ,''),
ANTTYPE	  = nullif(@COL14 ,''),
eNBID	  = nullif(@COL15 ,''),
relativeCI	  = nullif(@COL16 ,''),
MCC	  = nullif(@COL17 ,''),
MNC	  = nullif(@COL18 ,''),
ECI	 = nullif(concat(substring(@COL19,7,5),substring(@COL20,10,2)),''),
ECGI	 = nullif(concat(@COL17	,@COL18	,substring(@COL19,7,5),substring(@COL20,10,2)),''),
dlEARFCN	  = nullif(@COL22 ,''),
ulEARFCN	  = nullif(@COL23 ,''),
NUM_NC	  = nullif(@COL24 ,''),
UMTS_NUM_NC	  = nullif(@COL25 ,''),
GSM_NUM_NC	  = nullif(@COL26 ,''),
physicalLayerCellIdentityGrpIdx	  = nullif(@COL27 ,''),
physicalLayerCellIdentityIndex	  = nullif(@COL28 ,''),
physicalCellID	  = nullif(@COL29 ,''),
referenceSignalPower	  = nullif(@COL30 ,''),
TAC	  = nullif(@COL31 ,''),
MME	  = nullif(@COL32 ,''),
SGW	  = nullif(@COL33 ,''),
PDN	  = nullif(@COL34 ,''),
ZONEID	  = nullif(@COL35 ,''),
FLAG1	  = nullif(@COL36 ,''),
FLAG2	  = nullif(@COL37 ,''),
OptPCS1	  = nullif(@COL38 ,''),
OptPCS2	  = nullif(@COL39 ,''),
OptPCS3	  = nullif(@COL40 ,''),
OptPCS4	  = nullif(@COL41 ,''),
OptPCS5	  = nullif(@COL42 ,''),
OptPCS6	  = nullif(@COL43 ,''),
VENDOR	  = nullif(@COL44 ,''),
TECH	  = nullif(@COL45 ,''),
CELL_UID	  = nullif(concat(@COL17	,@COL18	,substring(@COL19,7,5),substring(@COL20,10,2)),''),
MAPINFO_ID	  = nullif(@COL48 ,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_NOKIA_2G_NB.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_2G_NB FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15)
set 
CELL_UID	 = nullif(@COL1 ,''),
Src_CELL	 = nullif(@COL2 ,''),
version	 = nullif(@COL3 ,''),
distName	 = nullif(@COL4 ,''),
Trg_CELL	 = nullif(@COL5 ,''),
Trg_arfcnValueGeran	 = nullif(@COL6 ,''),
Trg_basestationColourCode	 = nullif(@COL7 ,''),
Trg_networkColourCode	 = nullif(@COL8 ,''),
Trg_dtm	 = nullif(@COL9 ,''),
Trg_nrControl	 = nullif(@COL10 ,''),
Trg_ci	 = nullif(@COL11 ,''),
Trg_eNACCAllowed	 = nullif(@COL12 ,''),
Trg_lac	 = nullif(@COL13 ,''),
TRG_REDIRWITHSYSINFOALLOWED	 = NULLIF(@COL14 ,''),
TRG_SRVCCALLOWED	 = NULLIF(@COL15 ,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_NOKIA_3G_NB.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_3G_NB FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18)
set 
CELL_UID	 = nullif(@COL1 ,''),
Src_CELL	 = nullif(@COL2 ,''),
version	 = nullif(@COL3 ,''),
distName	 = nullif(@COL4 ,''),
Trg_CELL	 = nullif(@COL5 ,''),
Trg_nrControl	 = nullif(@COL6 ,''),
Trg_uTargetFreq	 = nullif(@COL7 ,''),
Trg_uTargetLac	 = nullif(@COL8 ,''),
Trg_uTargetRac	 = nullif(@COL9 ,''),
Trg_uTargetScFdd	 = nullif(@COL10 ,''),
Trg_csfbPsHoAllowed	 = nullif(@COL11 ,''),
Trg_psHoAllowed	 = nullif(@COL12 ,''),
Trg_srvccAllowed	 = nullif(@COL13 ,''),
Trg_uTargetCid	 = nullif(@COL14 ,''),
Trg_uTargetRncId	 = nullif(@COL15 ,''),
Src_uarfcnDl	 = nullif(@COL16 ,''),
Trg_uarfcnDl	 = nullif(@COL17 ,''),
HO_TYPE	 = NULLIF(@COL18 ,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_NOKIA_4G_NB.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_4G_NB FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22)
set 
CELL_UID	 = nullif(@COL1 ,''),
Src_LteCellID	 = nullif(@COL2 ,''),
version	 = nullif(@COL3 ,''),
distName	 = nullif(@COL4 ,''),
Trg_LteCellID	 = nullif(@COL5 ,''),
Trg_eNBID	 = nullif(@COL6 ,''),
Trg_relativeCI	 = nullif(@COL7 ,''),
Trg_ECI	 = nullif(@COL8 ,''),
Trg_ECGI	 = nullif(@COL9 ,''),
Trg_physicalLayerCellIdentityGroupIndex	 = nullif(@COL10 ,''),
Trg_physicalLayerCellIdentityIndex	 = nullif(@COL11 ,''),
Trg_physicalCellID	 = nullif(@COL12 ,''),
Trg_plmnMobileCountryCode	 = nullif(@COL13 ,''),
Trg_plmnMobileNetworkCode	 = nullif(@COL14 ,''),
Trg_trackingAreaCode	 = nullif(@COL15 ,''),
Trg_cellIndOffNeigh	 = nullif(@COL16 ,''),
Trg_cellIndOffNeighDelta	 = nullif(@COL17 ,''),
Trg_handoverAllowed	 = nullif(@COL18 ,''),
Trg_nrControl	 = nullif(@COL19 ,''),
Src_uarfcnDl	 = nullif(@COL20 ,''),
Trg_uarfcnDl	 = nullif(@COL21 ,''),
HO_TYPE	 = NULLIF(@COL22 ,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/PARAM_NOKIA_ENBEQUIPMENT.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_ENBEQUIPMENT FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43)
set 
enbId = nullif(@COL2,''),
version = nullif(@COL3,''),
distName = nullif(@COL4,''),
BTS_Name = nullif(@COL5,''),
enbName = nullif(@COL6,''),
mcc = nullif(@COL7,''),
mnc = nullif(@COL8,''),
actCSFBRedir = nullif(@COL9,''),
actCellTrace = nullif(@COL10,''),
actCiphering = nullif(@COL11,''),
actConvVoice = nullif(@COL12,''),
actDistributedSite = nullif(@COL13,''),
actEmerCallRedir = nullif(@COL14,''),
actFlexBbUsage = nullif(@COL15,''),
actHOtoWcdma = nullif(@COL16,''),
actIMSEmerSessR9 = nullif(@COL17,''),
actIfHo = nullif(@COL18,''),
actImmHRPD = nullif(@COL19,''),
actImmXrtt = nullif(@COL20,''),
actLTES1Ho = nullif(@COL21,''),
actLocRep = nullif(@COL22,''),
actMultBearers = nullif(@COL23,''),
actNonGbrServiceDiff = nullif(@COL24,''),
actOperatorQCI = nullif(@COL25,''),
actPdcpRohc = nullif(@COL26,''),
actPeriodicIntraUeMeas = nullif(@COL27,''),
actRedirect = nullif(@COL28,''),
actRfChaining = nullif(@COL29,''),
actS1Flex = nullif(@COL30,''),
actSelMobPrf = nullif(@COL31,''),
actSubscriberTrace = nullif(@COL32,''),
actUeBasedAnrIntraFreqLte = nullif(@COL33,''),
acteNACCtoGSM = nullif(@COL34,''),
anrOmExtEnable = nullif(@COL35,''),
enableAutoLock = nullif(@COL36,''),
enableGrflShdn = nullif(@COL37,''),
operationalState = nullif(@COL38,''),
prioTopoHO = nullif(@COL39,''),
tS1RelPrepL = nullif(@COL40,''),
tS1RelPrepU = nullif(@COL41,''),
tagMaxAM = nullif(@COL42,''),
tagMaxUM = nullif(@COL43,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/PARAM_NOKIA_HOG.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_HOG FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12)
set 
CELL_UID = nullif(@COL2,''),
version = nullif(@COL3,''),
distName = nullif(@COL4,''),
EUTRAN_CELL = nullif(@COL5,''),
arfcnValueListGERAN = nullif(@COL6,''),
b2Threshold1GERAN = nullif(@COL7,''),
b2Threshold2RssiGERAN = nullif(@COL8,''),
b2TimeToTriggerGERANMeas = nullif(@COL9,''),
bandIndicatorGERAN = nullif(@COL10,''),
hysB2ThresholdGERAN = nullif(@COL11,''),
reportIntervalGERAN = nullif(@COL12,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/PARAM_NOKIA_HOIF.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_HOIF FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25)
set 
CELL_UID = nullif(@COL2,''),
version = nullif(@COL3,''),
distName = nullif(@COL4,''),
EUTRAN_CELL = nullif(@COL5,''),
a3OffsetRsrpInterFreq = nullif(@COL6,''),
a3OffsetRsrqInterFreq = nullif(@COL7,''),
a3ReportIntervalRsrpInterFreq = nullif(@COL8,''),
a3ReportIntervalRsrqInterFreq = nullif(@COL9,''),
a3TimeToTriggerRsrpInterFreq = nullif(@COL10,''),
a3TimeToTriggerRsrqInterFreq = nullif(@COL11,''),
a5ReportIntervalInterFreq = nullif(@COL12,''),
a5TimeToTriggerInterFreq = nullif(@COL13,''),
eutraCarrierInfo = nullif(@COL14,''),
hysA3OffsetRsrpInterFreq = nullif(@COL15,''),
hysA3OffsetRsrqInterFreq = nullif(@COL16,''),
hysThreshold3InterFreq = nullif(@COL17,''),
interPresAntP = nullif(@COL18,''),
measQuantInterFreq = nullif(@COL19,''),
measurementBandwidth = nullif(@COL20,''),
offsetFreqInter = nullif(@COL21,''),
threshold3InterFreq = nullif(@COL22,''),
threshold3aInterFreq = nullif(@COL23,''),
thresholdRsrpIFLBFilter = nullif(@COL24,''),
thresholdRsrqIFLBFilter = nullif(@COL25,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/PARAM_NOKIA_HOW.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_HOW FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18)
set 
CELL_UID = nullif(@COL2,''),
version = nullif(@COL3,''),
distName = nullif(@COL4,''),
EUTRAN_CELL = nullif(@COL5,''),
b1ThresholdCSFBUtraEcn0 = nullif(@COL6,''),
b1ThresholdCSFBUtraRscp = nullif(@COL7,''),
b1TimeToTriggerCSFBUtraMeas = nullif(@COL8,''),
b2Threshold1Utra = nullif(@COL9,''),
b2Threshold2UtraEcn0 = nullif(@COL10,''),
b2Threshold2UtraRscp = nullif(@COL11,''),
b2TimeToTriggerUtraMeas = nullif(@COL12,''),
hysB1ThresholdCSFBUtra = nullif(@COL13,''),
hysB2ThresholdUtra = nullif(@COL14,''),
maxNumCsfbTargets = nullif(@COL15,''),
offsetFreqUtra = nullif(@COL16,''),
reportIntervalUtra = nullif(@COL17,''),
utraCarrierFreq = nullif(@COL18,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/PARAM_NOKIA_LTECELL.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_LTECELL FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43,@COL44,@COL45,@COL46,@COL47,@COL48,@COL49,@COL50,@COL51,@COL52,@COL53,@COL54,@COL55,@COL56,@COL57,@COL58,@COL59,@COL60,@COL61,@COL62,@COL63,@COL64,@COL65,@COL66,@COL67,@COL68,@COL69,@COL70,@COL71,@COL72,@COL73,@COL74,@COL75,@COL76,@COL77,@COL78,@COL79,@COL80,@COL81,@COL82,@COL83,@COL84,@COL85,@COL86,@COL87,@COL88,@COL89,@COL90,@COL91,@COL92,@COL93,@COL94,@COL95,@COL96,@COL97,@COL98,@COL99,@COL100,@COL101,@COL102,@COL103,@COL104,@COL105,@COL106,@COL107,@COL108,@COL109,@COL110,@COL111,@COL112,@COL113,@COL114,@COL115,@COL116,@COL117,@COL118,@COL119,@COL120,@COL121,@COL122,@COL123,@COL124,@COL125,@COL126,@COL127,@COL128,@COL129,@COL130,@COL131,@COL132,@COL133,@COL134,@COL135,@COL136,@COL137,@COL138,@COL139)
set 
CELL_UID = nullif(@COL2,''),
version = nullif(@COL3,''),
distName = nullif(@COL4,''),
BTS_Name = nullif(@COL5,''),
enbId = nullif(@COL6,''),
EUTRAN_CELL = nullif(@COL7,''),
a1TimeToTriggerDeactInterMeas = nullif(@COL8,''),
a2TimeToTriggerActGERANMeas = nullif(@COL9,''),
a2TimeToTriggerActInterFreqMeas = nullif(@COL10,''),
a2TimeToTriggerActWcdmaMeas = nullif(@COL11,''),
a2TimeToTriggerRedirect = nullif(@COL12,''),
a3Offset = nullif(@COL13,''),
a3ReportInterval = nullif(@COL14,''),
a3TimeToTrigger = nullif(@COL15,''),
a5ReportInterval = nullif(@COL16,''),
a5TimeToTrigger = nullif(@COL17,''),
actDrx = nullif(@COL18,''),
administrativeState = nullif(@COL19,''),
anrThresNbCell = nullif(@COL20,''),
cellBarred = nullif(@COL21,''),
cellIndOffServ = nullif(@COL22,''),
cellName = nullif(@COL23,''),
cellReSelPrio = nullif(@COL24,''),
cellSrPeriod = nullif(@COL25,''),
cqiAperEnable = nullif(@COL26,''),
cqiAperMode = nullif(@COL27,''),
cqiPerNp = nullif(@COL28,''),
cqiPerSbCycK = nullif(@COL29,''),
cqiPerSimulAck = nullif(@COL30,''),
dlCellPwrRed = nullif(@COL31,''),
dlChBw = nullif(@COL32,''),
dlInterferenceEnable = nullif(@COL33,''),
dlInterferenceLevel = nullif(@COL34,''),
dlInterferenceModulation = nullif(@COL35,''),
dlMimoMode = nullif(@COL36,''),
dlOlqcEnable = nullif(@COL37,''),
dlPathlossChg = nullif(@COL38,''),
dlPcfichBoost = nullif(@COL39,''),
dlPhichBoost = nullif(@COL40,''),
dlRsBoost = nullif(@COL41,''),
dlTargetBler = nullif(@COL42,''),
dlamcCqiDef = nullif(@COL43,''),
dlamcEnable = nullif(@COL44,''),
dlpcMimoComp = nullif(@COL45,''),
dlsDciCch = nullif(@COL46,''),
dlsFdAlg = nullif(@COL47,''),
dlsOldtcTarget = nullif(@COL48,''),
dlsUsePartPrb = nullif(@COL49,''),
eCallAcBarred = nullif(@COL50,''),
earfcnDL = nullif(@COL51,''),
earfcnUL = nullif(@COL52,''),
enableAmcPdcch = nullif(@COL53,''),
enableBetterCellHo = nullif(@COL54,''),
enableCovHo = nullif(@COL55,''),
enableDl16Qam = nullif(@COL56,''),
enableLowAgg = nullif(@COL57,''),
enablePcPdcch = nullif(@COL58,''),
eutraCelId = nullif(@COL59,''),
filterCoeff = nullif(@COL60,''),
filterCoefficientCpichEcn0 = nullif(@COL61,''),
filterCoefficientCpichRscp = nullif(@COL62,''),
filterCoefficientRSRP = nullif(@COL63,''),
filterCoefficientRSRQ = nullif(@COL64,''),
filterCoefficientRSSI = nullif(@COL65,''),
harqMaxMsg3 = nullif(@COL66,''),
harqMaxTrDl = nullif(@COL67,''),
harqMaxTrUl = nullif(@COL68,''),
hopModePusch = nullif(@COL69,''),
hysA3Offset = nullif(@COL70,''),
hysThreshold2GERAN = nullif(@COL71,''),
hysThreshold2InterFreq = nullif(@COL72,''),
hysThreshold2Wcdma = nullif(@COL73,''),
hysThreshold2a = nullif(@COL74,''),
hysThreshold3 = nullif(@COL75,''),
hysThreshold3a = nullif(@COL76,''),
hysThreshold4 = nullif(@COL77,''),
inactivityTimer = nullif(@COL78,''),
iniMcsDl = nullif(@COL79,''),
iniMcsUl = nullif(@COL80,''),
iniPrbsUl = nullif(@COL81,''),
intrFrqCelRes = nullif(@COL82,''),
intraPresAntP = nullif(@COL83,''),
lcrId = nullif(@COL84,''),
maxBitrateDl = nullif(@COL85,''),
maxBitrateUl = nullif(@COL86,''),
maxCrPgDl = nullif(@COL87,''),
maxCrRa4Dl = nullif(@COL88,''),
maxCrRaDl = nullif(@COL89,''),
maxCrSibDl = nullif(@COL90,''),
maxNrSymPdcch = nullif(@COL91,''),
maxNumActDrb = nullif(@COL92,''),
maxNumActUE = nullif(@COL93,''),
maxNumQci1Drb = nullif(@COL94,''),
maxNumRrc = nullif(@COL95,''),
maxNumRrcEmergency = nullif(@COL96,''),
maxNumUeDl = nullif(@COL97,''),
maxNumUeUl = nullif(@COL98,''),
mbrSelector = nullif(@COL99,''),
measQuantityUtra = nullif(@COL100,''),
minBitrateDl = nullif(@COL101,''),
minBitrateUl = nullif(@COL102,''),
nLTEIntraNeighbours = nullif(@COL103,''),
numOfTxPorts = nullif(@COL104,''),
offsetFreqIntra = nullif(@COL105,''),
operationalState = nullif(@COL106,''),
p0NomPucch = nullif(@COL107,''),
p0NomPusch = nullif(@COL108,''),
pMax = nullif(@COL109,''),
pMaxIntraF = nullif(@COL110,''),
pMaxOwnCell = nullif(@COL111,''),
reportAmount = nullif(@COL112,''),
reportInterval = nullif(@COL113,''),
phyCellId = nullif(@COL114,''),
primPlmnCellres = nullif(@COL115,''),
qHyst = nullif(@COL116,''),
qrxlevmin = nullif(@COL117,''),
qRxLevMinOffset = nullif(@COL118,''),
qrxlevminintraF = nullif(@COL119,''),
sIntrasearch = nullif(@COL120,''),
sNonIntrsearch = nullif(@COL121,''),
tReselEutr = nullif(@COL122,''),
tac = nullif(@COL123,''),
threshSrvLow = nullif(@COL124,''),
threshold1 = nullif(@COL125,''),
threshold2GERAN = nullif(@COL126,''),
threshold2InterFreq = nullif(@COL127,''),
threshold2Wcdma = nullif(@COL128,''),
threshold2a = nullif(@COL129,''),
threshold3 = nullif(@COL130,''),
threshold3a = nullif(@COL131,''),
threshold4 = nullif(@COL132,''),
timeToTriggerSfHigh = nullif(@COL133,''),
timeToTriggerSfMedium = nullif(@COL134,''),
txPowerScaling = nullif(@COL135,''),
ulChBw = nullif(@COL136,''),
prachCS = nullif(@COL137,''),
rootSeqIndex = nullif(@COL138,''),
prachHsFlag = nullif(@COL139,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/PARAM_NOKIA_MMEACCESS.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_MMEACCESS FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10)
set 
BTS_Name = nullif(@COL2,''),
version = nullif(@COL3,''),
distName = nullif(@COL4,''),
mcc = nullif(@COL5,''),
mnc = nullif(@COL6,''),
mmeCode = nullif(@COL7,''),
mmeGroupId = nullif(@COL8,''),
mmeName = nullif(@COL9,''),
relMmeCap = nullif(@COL10,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/PARAM_NOKIA_REDRT.csv' IGNORE INTO TABLE LTE_PARAM_NOKIA_REDRT FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16)
set 
CELL_UID = nullif(@COL2,''),
version = nullif(@COL3,''),
distName = nullif(@COL4,''),
EUTRAN_CELL = nullif(@COL5,''),
addGsmSIToRedirMsg = nullif(@COL6,''),
csFallBPrio = nullif(@COL7,''),
emerCallPrio = nullif(@COL8,''),
redirBandCdma = nullif(@COL9,''),
redirFreqCdma = nullif(@COL10,''),
redirFreqEutra = nullif(@COL11,''),
redirFreqUtra = nullif(@COL12,''),
redirGeranBandIndicator = nullif(@COL13,''),
redirRat = nullif(@COL14,''),
redirectPrio = nullif(@COL15,''),
redirGeranArfcnValueL = nullif(@COL16,''),
rec_date = current_date();

SET AUTOCOMMIT = 1;
