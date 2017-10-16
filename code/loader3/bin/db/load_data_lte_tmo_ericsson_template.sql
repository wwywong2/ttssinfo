SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 0;

LOAD DATA LOCAL INFILE '[##DataDir##]/S_INFO_LTE.csv' IGNORE INTO TABLE S_INFO_LTE FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22)
SET
CELL	 = nullif(@COL1	 ,''),
SITEID	 = nullif(@COL2	 ,''),
eNBId	 = nullif(@COL3	 ,''),
relativeCI	 = nullif(@COL4	 ,''),
mcc	 = nullif(@COL5	 ,''),
mnc	 = nullif(@COL6	 ,''),
ECI	 = nullif(concat(substring(@COL7,7,5),substring(@COL8,10,2)),''),
ECGI	 = nullif(concat(@COL5	,@COL6	,substring(@COL7,7,5),substring(@COL8,10,2)),''),
cell_uid	 = nullif(concat(@COL5	,@COL6	,substring(@COL7,7,5),substring(@COL8,10,2)),''),
dlearfcn	 = nullif(@COL10	 ,''),
ulearfcn	 = nullif(@COL11	 ,''),
NUM_NC	 = nullif(@COL12	 ,''),
UMTS_NUM_NC	 = nullif(@COL13	 ,''),
GSM_NUM_NC	 = nullif(@COL14	 ,''),
physicalLayerCellIdentityGrpIdx	 = nullif(@COL15	 ,''),
physicalLayerCellIdentityIndex	 = nullif(@COL16	 ,''),
physicalCellID	 = nullif(@COL17	 ,''),
referenceSignalPower	 = nullif(@COL18	 ,''),
tac	 = nullif(@COL19	 ,''),
Vendor	 = nullif(@COL20	 ,''),
tech	 = nullif(@COL21	 ,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_3G_NB.csv' IGNORE INTO TABLE LTE_PARAM_ERIC_3G_NB FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15)
set 
CELL_UID	= NULLIF(@COL1	 ,''),
Src_Cell	= NULLIF(@COL2	 ,''),
Trg_CELL	= NULLIF(@COL3	 ,''),
Trg_GCID	= NULLIF(@COL4	 ,''),
Trg_PLMN_ID	= NULLIF(@COL5	 ,''),
Trg_LAC	= NULLIF(@COL6	 ,''),
Trg_CI	= NULLIF(@COL7	 ,''),
Trg_UARFCN	= NULLIF(@COL8	 ,''),
Trg_coverageIndicator	= NULLIF(@COL9	 ,''),
Trg_isHoAllowed	= NULLIF(@COL10	 ,''),
Trg_isRemoveAllowed	= NULLIF(@COL11	 ,''),
Trg_loadBalancing	= NULLIF(@COL12	 ,''),
Trg_lbBnrAllowed	= NULLIF(@COL13	 ,''),
Trg_lbCovIndicated	= NULLIF(@COL14	 ,''),
QUERY_DATE	= NULLIF(@COL15	 ,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_4G_NB.csv' IGNORE INTO TABLE LTE_PARAM_ERIC_4G_NB FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20, @COL21, @COL22, @COL23, @COL24, @COL25, @COL26, @COL27, @COL28, @COL29, @COL30, @COL31, @COL32, @COL33, @COL34, @COL35, @COL36, @COL37, @COL38, @COL39, @COL40, @COL41, @COL42, @COL43, @COL44, @COL45, @COL46)
set 
CELL_UID = nullif(@COL1,''),
Src_LteCellID = nullif(@COL2,''),
Trg_LteCellID = nullif(@COL3,''),
Trg_eNBID = nullif(@COL4,''),
Trg_relativeCI = nullif(@COL5,''),
Trg_ECI = nullif(@COL6,''),
Trg_ECGI = nullif(@COL7,''),
Trg_cellIndividualOffset = nullif(@COL8,''),
Trg_isHOAllowed = nullif(@COL9,''),
Trg_isRemoveAllowed = nullif(@COL10,''),
Trg_physicalLayerCellIdentityGroupIndex = nullif(@COL11,''),
Trg_physicalLayerCellIdentityIndex = nullif(@COL12,''),
Trg_physicalCellID = nullif(@COL13,''),
Trg_plmnMobileCountryCode = nullif(@COL14,''),
Trg_plmnMobileNetworkCode = nullif(@COL15,''),
Trg_qOffsetCell = nullif(@COL16,''),
Trg_trackingAreaCode = nullif(@COL17,''),
Trg_EUTRAN_FREQ_RELATION_ID = nullif(@COL18,''),
Trg_adjacentCell = nullif(@COL19,''),
Trg_ANR_CREATED = nullif(@COL20,''),
Trg_CTRL_MODE = nullif(@COL21,''),
Trg_SUPP_MBLTY_REL_TYPE = nullif(@COL22,''),
Trg_TIME_OF_ANR_CLEAN = nullif(@COL23,''),
Trg_TIME_OF_ANR_MODIFICATION = nullif(@COL24,''),
Src_uarfcnDl = nullif(@COL25,''),
Trg_uarfcnDl = nullif(@COL26,''),
HO_TYPE = nullif(@COL27,''),
Trg_IncludeInSI = nullif(@COL28,''),
Trg_CoverageIndicator = nullif(@COL29,''),
Trg_loadBalancing = nullif(@COL30,''),
Trg_sCellCandidate = nullif(@COL31,''),
Trg_LbBnrAloowed = nullif(@COL32,''),
Trg_IMLOADBALANCINGACTIVE = nullif(@COL33,''),
Trg_IncomingLB = nullif(@COL34,''),
Trg_LBCovIndicated = nullif(@COL35,''),
QUERY_DATE = nullif(@COL36,''),
amoallowed = nullif(@COL37,''),
amostate = nullif(@COL38,''),
crsassistanceinfopriority = nullif(@COL39,''),
hosucclevel = nullif(@COL40,''),
mobilitystatus = nullif(@COL41,''),
scellpriority = nullif(@COL42,''),
s1retrytimer = nullif(@COL43,''),
sleepmodecapacitycell = nullif(@COL44,''),
sleepmodecovcellcandidate = nullif(@COL45,''),
sleepmodecoveragecell = nullif(@COL46,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQUIPMENT.csv' IGNORE INTO TABLE LTE_PARAM_ERIC_ENBEQUIPMENT FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17)
set 
MECONTEXT_ID	 = nullif(@COL1 ,''),
macroEnbId	 = nullif(@COL2 ,''),
dnsLookupOnTai	 = nullif(@COL3 ,''),
dnsLookupTimer	 = nullif(@COL4 ,''),
dscpLabel	 = nullif(@COL5 ,''),
mcc	 = nullif(@COL6 ,''),
mnc	 = nullif(@COL7 ,''),
mncLength	 = nullif(@COL8 ,''),
oaMLinkSuperVisionActive	 = nullif(@COL9 ,''),
s1RetryTimer	 = nullif(@COL10 ,''),
schedulingStrategy	 = nullif(@COL11 ,''),
sctpRef	 = nullif(@COL12 ,''),
x2retryTimerMaxAuto	 = nullif(@COL13 ,''),
x2retryTimerStart	 = nullif(@COL14 ,''),
MME	 = nullif(@COL15 ,''),
MMECOUNT	 = NULLIF(@COL16 ,''),
QUERY_DATE	= NULLIF(@COL17	 ,''),
rec_date = current_date();

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_EUTRANFREQREL.csv' IGNORE INTO TABLE LTE_PARAM_ERIC_EUTRANFREQREL FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20, @COL21, @COL22, @COL23, @COL24, @COL25, @COL26, @COL27, @COL28, @COL29, @COL30, @COL31, @COL32, @COL33, @COL34, @COL35, @COL36, @COL37, @COL38, @COL39, @COL40, @COL41, @COL42, @COL43, @COL44, @COL45, @COL46, @COL47, @COL48)
set 
CELL_UID = nullif(@COL1,''),
ENB_Name = nullif(@COL2,''),
EUTRAN_CELL_FDD_ID = nullif(@COL3,''),
DataContainer_id = nullif(@COL4,''),
adjacent_EutranFreq = nullif(@COL5,''),
cellReselectionPriority = nullif(@COL6,''),
connectedModeMobilityPrio = nullif(@COL7,''),
voicePrio = nullif(@COL8,''),
pMax = nullif(@COL9,''),
qRxLevMin = nullif(@COL10,''),
qQualMin = nullif(@COL11,''),
qOffsetFreq = nullif(@COL12,''),
threshXHigh = nullif(@COL13,''),
threshXLow = nullif(@COL14,''),
threshXHighQ = nullif(@COL15,''),
threshXLowQ = nullif(@COL16,''),
tReselectionEutra = nullif(@COL17,''),
tReselectionEutraSfHigh = nullif(@COL18,''),
tReselectionEutraSfMedium = nullif(@COL19,''),
userLabel = nullif(@COL20,''),
allowedMeasBandwidth = nullif(@COL21,''),
presenceAntennaPort1 = nullif(@COL22,''),
mobilityAction = nullif(@COL23,''),
neighCellConfig = nullif(@COL24,''),
interFreqMeasType = nullif(@COL25,''),
lbBnrPolicy = nullif(@COL26,''),
lbActivationThreshold = nullif(@COL27,''),
anrMeasOn = nullif(@COL28,''),
arpPrio = nullif(@COL29,''),
caTriggeredRedirectionActive = nullif(@COL30,''),
nonPlannedPciCIO = nullif(@COL31,''),
nonPlannedPciTargetIdType = nullif(@COL32,''),
nonPlannedPhysCellId = nullif(@COL33,''),
nonPlannedPhysCellIdRange = nullif(@COL34,''),
blackListEntryIdleMode = nullif(@COL35,''),
blackListEntry = nullif(@COL36,''),
QUERY_DATE = nullif(@COL37,''),
amoallowed = nullif(@COL38,''),
cellsleepcovcellmeason = nullif(@COL39,''),
csgcelltargetidtype = nullif(@COL40,''),
hybridcsgphyscellidrange = nullif(@COL41,''),
interfreqmeastypeulsinr = nullif(@COL42,''),
cafreqpriority = nullif(@COL43,''),
cafreqproportion = nullif(@COL44,''),
lba5thr1rsrpfreqoffset = nullif(@COL45,''),
qqualminrsrqce = nullif(@COL46,''),
qrxlevmince = nullif(@COL47,''),
treselectioneutrace = nullif(@COL48,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LTECELL.csv' IGNORE INTO TABLE LTE_PARAM_ERIC_LTECELL FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43,@COL44,@COL45,@COL46,@COL47,@COL48,@COL49,@COL50,@COL51,@COL52,@COL53,@COL54,@COL55,@COL56,@COL57,@COL58,@COL59,@COL60,@COL61,@COL62,@COL63,@COL64,@COL65,@COL66,@COL67,@COL68,@COL69,@COL70,@COL71,@COL72,@COL73,@COL74,@COL75,@COL76,@COL77,@COL78,@COL79,@COL80,@COL81,@COL82,@COL83,@COL84,@COL85,@COL86,@COL87,@COL88,@COL89,@COL90,@COL91,@COL92,@COL93,@COL94,@COL95,@COL96,@COL97,@COL98,@COL99,@COL100,@COL101,@COL102,@COL103,@COL104,@COL105,@COL106,@COL107,@COL108,@COL109,@COL110)
set 
CELL_UID	 = nullif(@COL1 ,''),
enbID	 = nullif(@COL2 ,''),
MECONTEXT_ID	 = nullif(@COL3 ,''),
EUTRAN_CELL_FDD_ID	 = nullif(@COL4 ,''),
acBarringFactorForMoData	 = nullif(@COL5 ,''),
acBarringFactorForMoSignalling	 = nullif(@COL6 ,''),
acBarringForEmergency	 = nullif(@COL7 ,''),
acBarringInfoPresent	 = nullif(@COL8 ,''),
acBarringMoDataPresent	 = nullif(@COL9 ,''),
acBarringMoSignallingPresent	 = nullif(@COL10 ,''),
acBarringSpecialAcForMoData	 = nullif(@COL11 ,''),
acBarringSpecialAcForMoSignalling	 = nullif(@COL12 ,''),
acBarringTimeForMoData	 = nullif(@COL13 ,''),
acBarringTimeForMoSignalling	 = nullif(@COL14 ,''),
administrativeState	 = nullif(@COL15 ,''),
bcCdma2000SysTimeType	 = nullif(@COL16 ,''),
cellBarred	 = nullif(@COL17 ,''),
cellId	 = nullif(@COL18 ,''),
dlChannelBandwidth	 = nullif(@COL19 ,''),
dlInterferenceManagementActive	 = nullif(@COL20 ,''),
drxActive	 = nullif(@COL21 ,''),
earfcndl	 = nullif(@COL22 ,''),
earfcnul	 = nullif(@COL23 ,''),
subFrameOffset	 = nullif(@COL24 ,''),
symbolOffset	 = nullif(@COL25 ,''),
timeOffset	 = nullif(@COL26 ,''),
initCdma2000SysTimeType	 = nullif(@COL27 ,''),
maximumTransmissionPower	 = nullif(@COL28 ,''),
minBestCellHoAttempts	 = nullif(@COL29 ,''),
networkSignallingValue	 = nullif(@COL30 ,''),
noOfPucchCqiUsers	 = nullif(@COL31 ,''),
noOfPucchSrUsers	 = nullif(@COL32 ,''),
noOfRxAntennas	 = nullif(@COL33 ,''),
nrOfSymbolsPdcch	 = nullif(@COL34 ,''),
partOfRadioPower	 = nullif(@COL35 ,''),
physicalLayerCellIdGroup	 = nullif(@COL36 ,''),
physicalLayerSubCellId	 = nullif(@COL37 ,''),
pMaxServingCell	 = nullif(@COL38 ,''),
pZeroNominalPucch	 = nullif(@COL39 ,''),
pZeroNominalPusch	 = nullif(@COL40 ,''),
qciTableRef	 = nullif(@COL41 ,''),
qRxLevMin	 = nullif(@COL42 ,''),
redirectionInfoRefPrio1	 = nullif(@COL43 ,''),
redirectionInfoRefPrio2	 = nullif(@COL44 ,''),
redirectionInfoRefPrio3	 = nullif(@COL45 ,''),
nCellChangeHigh	 = nullif(@COL46 ,''),
nCellChangeMedium	 = nullif(@COL47 ,''),
qHyst	 = nullif(@COL48 ,''),
qHystSfHigh	 = nullif(@COL49 ,''),
qHystSfMedium	 = nullif(@COL50 ,''),
sIntraSearch	 = nullif(@COL51 ,''),
sNonIntraSearch	 = nullif(@COL52 ,''),
tEvaluation	 = nullif(@COL53 ,''),
threshServingLow	 = nullif(@COL54 ,''),
tHystNormal	 = nullif(@COL55 ,''),
tReselectionUtra	 = nullif(@COL56 ,''),
tReselectionUtraSfHigh	 = nullif(@COL57 ,''),
tReselectionUtraSfMedium	 = nullif(@COL58 ,''),
tReselectionGeran	 = nullif(@COL59 ,''),
tReselectionGeranSfHigh	 = nullif(@COL60 ,''),
tReselectionGeranSfMedium	 = nullif(@COL61 ,''),
searchWindowSizeCdma	 = nullif(@COL62 ,''),
tReselectionCdmaHrpd	 = nullif(@COL63 ,''),
tReselectionCdmaHrpdSfHigh	 = nullif(@COL64 ,''),
tReselectionCdmaHrpdSfMedium	 = nullif(@COL65 ,''),
tac	 = nullif(@COL66 ,''),
ulChannelBandwidth	 = nullif(@COL67 ,''),
ulInterferenceManagementActive	 = nullif(@COL68 ,''),
useId	 = nullif(@COL69 ,''),
userLabel	 = nullif(@COL70 ,''),
altitude	 = nullif(@COL71 ,''),
latitude	 = nullif(@COL72 ,''),
longitude	 = nullif(@COL73 ,''),
Qrxlevminoffset	 = nullif(@COL74 ,''),
primaryPlmnReserved	 = nullif(@COL75 ,''),
additionalPlmnReservedList	 = nullif(@COL76 ,''),
noOfTxAntennas	 = nullif(@COL77 ,''),
powerPerREOfRBdBm	 = nullif(@COL78 ,''),
reservedREForReferenceSignalPerSubframe	 = nullif(@COL79 ,''),
totalREInOperatingBandwidth	 = nullif(@COL80 ,''),
totalReferenceSignalPowerdBm	 = nullif(@COL81 ,''),
filterCoefficientEUtraRsrp	 = nullif(@COL82 ,''),
filterCoefficientEUtraRsrq	 = nullif(@COL83 ,''),
a2ThresholdRsrpPrim	 = nullif(@COL84 ,''),
a2ThresholdRsrqPrim	 = nullif(@COL85 ,''),
hysteresisA2Prim	 = nullif(@COL86 ,''),
reportAmountA2Prim	 = nullif(@COL87 ,''),
reportIntervalA2Prim	 = nullif(@COL88 ,''),
reportQuantityA2Prim	 = nullif(@COL89 ,''),
timeToTriggerA2Prim	 = nullif(@COL90 ,''),
triggerQuantityA2Prim	 = nullif(@COL91 ,''),
a2ThresholdRsrpSec	 = nullif(@COL92 ,''),
a2ThresholdRsrqSec	 = nullif(@COL93 ,''),
hysteresisA2Sec	 = nullif(@COL94 ,''),
reportAmountA2Sec	 = nullif(@COL95 ,''),
reportIntervalA2Sec	 = nullif(@COL96 ,''),
reportQuantityA2Sec	 = nullif(@COL97 ,''),
timeToTriggerA2Sec	 = nullif(@COL98 ,''),
triggerQuantityA2Sec	 = nullif(@COL99 ,''),
hysteresisA3	 = nullif(@COL100 ,''),
reportAmountA3	 = nullif(@COL101 ,''),
ReportConfigEUtraBestCellId	 = nullif(@COL102 ,''),
reportIntervalA3	 = nullif(@COL103 ,''),
reportQuantityA3	 = nullif(@COL104 ,''),
timeToTriggerA3	 = nullif(@COL105 ,''),
TRIGGERQUANTITYA3	 = NULLIF(@COL106 ,''),
cellRange	 = nullif(@COL107 ,''),
rachRootSequence	 = nullif(@COL108 ,''),
highSpeedUEActive	 = NULLIF(@COL109 ,''),
QUERY_DATE	= NULLIF(@COL110	 ,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_MMEACCESS.csv' IGNORE INTO TABLE LTE_PARAM_ERIC_MMEACCESS FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23)
set 
MECONTEXT_ID = nullif(@COL1,''),
TERM_POINT_TO_MME_ID = nullif(@COL2,''),
ADMINISTRATIVE_STATE = nullif(@COL3,''),
AVAILABILITY_STATUS = nullif(@COL4,''),
DOMAIN_NAME = nullif(@COL5,''),
IP_ADDRESS1 = nullif(@COL6,''),
IP_ADDRESS2 = nullif(@COL7,''),
mmeName = nullif(@COL8,''),
OPERATIONAL_STATE = nullif(@COL9,''),
relativeMmeCapacity = nullif(@COL10,''),
USED_IP_ADDRESS = nullif(@COL11,''),
MMECODE = nullif(@COL12,''),
MMEGroupID = nullif(@COL13,''),
QUERY_DATE = nullif(@COL14,''),
dcntype = nullif(@COL15,''),
ipv6address1 = nullif(@COL16,''),
ipv6address2 = nullif(@COL17,''),
mmecodelistlterelated = nullif(@COL18,''),
mmecodelistotherrats = nullif(@COL19,''),
mmegilistlterelated = nullif(@COL20,''),
servedplmnlistlterelated = nullif(@COL21,''),
servedplmnlistotherrats = nullif(@COL22,''),
termpointtommeid = nullif(@COL23,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_TERMPOINTTOENB.csv' IGNORE INTO TABLE LTE_PARAM_ERIC_TERMPOINTTOENB FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16)
set 
MECONTEXT_ID = nullif(@COL1,''),
TermPointToENB_ID = nullif(@COL2,''),
TermPointToENB_NAME = nullif(@COL3,''),
ipAddress = nullif(@COL4,''),
administrativeState = nullif(@COL5,''),
operationalState = nullif(@COL6,''),
usedIpAddress = nullif(@COL7,''),
ipv6Address = nullif(@COL8,''),
QUERY_DATE = nullif(@COL9,''),
availabilitystatus = nullif(@COL10,''),
createdby = nullif(@COL11,''),
domainname = nullif(@COL12,''),
lastmodification = nullif(@COL13,''),
termpointtoenbid = nullif(@COL14,''),
timeofcreation = nullif(@COL15,''),
timeoflastmodification = nullif(@COL16,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_UTRANFREQREL.csv' IGNORE INTO TABLE LTE_PARAM_ERIC_UTRANFREQREL FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28)
set 
CELL_UID	= NULLIF(@COL1	 ,''),
ENB_Name	= NULLIF(@COL2	 ,''),
EUTRAN_CELL_FDD_ID	= NULLIF(@COL3	 ,''),
DataContainer_id	= NULLIF(@COL4	 ,''),
adjacent_UtranFreq	= NULLIF(@COL5	 ,''),
cellReselectionPriority	= NULLIF(@COL6	 ,''),
connectedModeMobilityPrio	= NULLIF(@COL7	 ,''),
voicePrio	= NULLIF(@COL8	 ,''),
csFallbackPrio	= NULLIF(@COL9	 ,''),
csFallbackPrioEC	= NULLIF(@COL10	 ,''),
pMaxUtra	= NULLIF(@COL11	 ,''),
qQualMin	= NULLIF(@COL12	 ,''),
qRxLevMin	= NULLIF(@COL13	 ,''),
qOffsetFreq	= NULLIF(@COL14	 ,''),
threshXHigh	= NULLIF(@COL15	 ,''),
threshXLow	= NULLIF(@COL16	 ,''),
threshXHighQ	= NULLIF(@COL17	 ,''),
threshXLowQ	= NULLIF(@COL18	 ,''),
userLabel	= NULLIF(@COL19	 ,''),
mobilityAction	= NULLIF(@COL20	 ,''),
mobilityActionCsfb	= NULLIF(@COL21	 ,''),
anrMeasOn	= NULLIF(@COL22	 ,''),
utranFreqToQciProfileRelation	= NULLIF(@COL23	 ,''),
maxNrUtranCellRelations	= NULLIF(@COL24	 ,''),
lbBnrPolicy	= NULLIF(@COL25	 ,''),
altCsfbTargetPrio	= NULLIF(@COL26	 ,''),
altCsfbTargetPrioEc	= NULLIF(@COL27	 ,''),
QUERY_DATE	= NULLIF(@COL28	 ,''),
rec_date = current_date();


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQ_ANR_FUNCTION_EUTRAN.csv' IGNORE INTO TABLE stg_lte_param_eric_enbeq_anr_function_eutran FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4)
SET
MECONTEXT_ID = nullif(@COL1,''),
anrUesThreshInterFMax = nullif(@COL2,''),
anrUesThreshInterFMin = nullif(@COL3,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQ_BALANCING_FUNC.csv' IGNORE INTO TABLE stg_lte_param_eric_enbeq_balancing_func FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4)
SET
MECONTEXT_ID = nullif(@COL1,''),
LBCEILING = nullif(@COL2,''),
LBTHRESHOLD = nullif(@COL3,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQ_ENODEBFUNCTION.csv' IGNORE INTO TABLE stg_lte_param_eric_enbeq_enodebfunction FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3)
SET
MECONTEXT_ID = nullif(@COL1,''),
zzzTemporary3 = nullif(@COL2,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQ_INTERFREQ_LOAD_BAL.csv' IGNORE INTO TABLE stg_lte_param_eric_enbeq_interfreq_load_bal FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5)
SET
MECONTEXT_ID = nullif(@COL1,''),
featureStateInterFrequencyLoadBalancing = nullif(@COL2,''),
licenseStateInterFrequencyLoadBalancing = nullif(@COL3,''),
serviceStateInterFrequencyLoadBalancing = nullif(@COL4,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQ_MOB_CTRLCOV.csv' IGNORE INTO TABLE stg_lte_param_eric_enbeq_mob_ctrlcov FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5)
SET
MECONTEXT_ID = nullif(@COL1,''),
featureStateMobCtrlAtPoorCov = nullif(@COL2,''),
licenseStateMobCtrlAtPoorCov = nullif(@COL3,''),
serviceStateMobCtrlAtPoorCov = nullif(@COL4,'');


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQ_QCIPROFILEPREDEFINED.csv' IGNORE INTO TABLE stg_lte_param_eric_enbeq_qciprofilepredefined FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43,@COL44,@COL45,@COL46,@COL47,@COL48,@COL49,@COL50,@COL51,@COL52,@COL53,@COL54,@COL55,@COL56,@COL57,@COL58,@COL59,@COL60,@COL61,@COL62,@COL63,@COL64,@COL65,@COL66,@COL67,@COL68,@COL69,@COL70,@COL71,@COL72,@COL73,@COL74,@COL75,@COL76,@COL77,@COL78,@COL79,@COL80,@COL81,@COL82)
SET
MECONTEXT_ID = nullif(@COL1,''),
default_b2Threshold2RscpUtraOffset = nullif(@COL2,''),
default_b2Threshold1RsrpUtraOffset = nullif(@COL3,''),
default_b2Threshold2Cdma2000Offset = nullif(@COL4,''),
default_b2Threshold1RsrpCdma2000Offset = nullif(@COL5,''),
default_a2ThresholdRsrpPrimOffset = nullif(@COL6,''),
default_a2ThresholdRsrpSecOffset = nullif(@COL7,''),
default_qciSubscriptionQuanta = nullif(@COL8,''),
default_rohcEnabled = nullif(@COL9,''),
qci1_b2Threshold2RscpUtraOffset = nullif(@COL10,''),
qci1_b2Threshold1RsrpUtraOffset = nullif(@COL11,''),
qci1_b2Threshold2Cdma2000Offset = nullif(@COL12,''),
qci1_b2Threshold1RsrpCdma2000Offset = nullif(@COL13,''),
qci1_a2ThresholdRsrpPrimOffset = nullif(@COL14,''),
qci1_a2ThresholdRsrpSecOffset = nullif(@COL15,''),
qci1_qciSubscriptionQuanta = nullif(@COL16,''),
qci1_rohcEnabled = nullif(@COL17,''),
qci2_b2Threshold2RscpUtraOffset = nullif(@COL18,''),
qci2_b2Threshold1RsrpUtraOffset = nullif(@COL19,''),
qci2_b2Threshold2Cdma2000Offset = nullif(@COL20,''),
qci2_b2Threshold1RsrpCdma2000Offset = nullif(@COL21,''),
qci2_a2ThresholdRsrpPrimOffset = nullif(@COL22,''),
qci2_a2ThresholdRsrpSecOffset = nullif(@COL23,''),
qci2_qciSubscriptionQuanta = nullif(@COL24,''),
qci2_rohcEnabled = nullif(@COL25,''),
qci3_b2Threshold2RscpUtraOffset = nullif(@COL26,''),
qci3_b2Threshold1RsrpUtraOffset = nullif(@COL27,''),
qci3_b2Threshold2Cdma2000Offset = nullif(@COL28,''),
qci3_b2Threshold1RsrpCdma2000Offset = nullif(@COL29,''),
qci3_a2ThresholdRsrpPrimOffset = nullif(@COL30,''),
qci3_a2ThresholdRsrpSecOffset = nullif(@COL31,''),
qci3_qciSubscriptionQuanta = nullif(@COL32,''),
qci3_rohcEnabled = nullif(@COL33,''),
qci4_b2Threshold2RscpUtraOffset = nullif(@COL34,''),
qci4_b2Threshold1RsrpUtraOffset = nullif(@COL35,''),
qci4_b2Threshold2Cdma2000Offset = nullif(@COL36,''),
qci4_b2Threshold1RsrpCdma2000Offset = nullif(@COL37,''),
qci4_a2ThresholdRsrpPrimOffset = nullif(@COL38,''),
qci4_a2ThresholdRsrpSecOffset = nullif(@COL39,''),
qci4_qciSubscriptionQuanta = nullif(@COL40,''),
qci4_rohcEnabled = nullif(@COL41,''),
qci5_b2Threshold2RscpUtraOffset = nullif(@COL42,''),
qci5_b2Threshold1RsrpUtraOffset = nullif(@COL43,''),
qci5_b2Threshold2Cdma2000Offset = nullif(@COL44,''),
qci5_b2Threshold1RsrpCdma2000Offset = nullif(@COL45,''),
qci5_a2ThresholdRsrpPrimOffset = nullif(@COL46,''),
qci5_a2ThresholdRsrpSecOffset = nullif(@COL47,''),
qci5_qciSubscriptionQuanta = nullif(@COL48,''),
qci5_rohcEnabled = nullif(@COL49,''),
qci6_b2Threshold2RscpUtraOffset = nullif(@COL50,''),
qci6_b2Threshold1RsrpUtraOffset = nullif(@COL51,''),
qci6_b2Threshold2Cdma2000Offset = nullif(@COL52,''),
qci6_b2Threshold1RsrpCdma2000Offset = nullif(@COL53,''),
qci6_a2ThresholdRsrpPrimOffset = nullif(@COL54,''),
qci6_a2ThresholdRsrpSecOffset = nullif(@COL55,''),
qci6_qciSubscriptionQuanta = nullif(@COL56,''),
qci6_rohcEnabled = nullif(@COL57,''),
qci7_b2Threshold2RscpUtraOffset = nullif(@COL58,''),
qci7_b2Threshold1RsrpUtraOffset = nullif(@COL59,''),
qci7_b2Threshold2Cdma2000Offset = nullif(@COL60,''),
qci7_b2Threshold1RsrpCdma2000Offset = nullif(@COL61,''),
qci7_a2ThresholdRsrpPrimOffset = nullif(@COL62,''),
qci7_a2ThresholdRsrpSecOffset = nullif(@COL63,''),
qci7_qciSubscriptionQuanta = nullif(@COL64,''),
qci7_rohcEnabled = nullif(@COL65,''),
qci8_b2Threshold2RscpUtraOffset = nullif(@COL66,''),
qci8_b2Threshold1RsrpUtraOffset = nullif(@COL67,''),
qci8_b2Threshold2Cdma2000Offset = nullif(@COL68,''),
qci8_b2Threshold1RsrpCdma2000Offset = nullif(@COL69,''),
qci8_a2ThresholdRsrpPrimOffset = nullif(@COL70,''),
qci8_a2ThresholdRsrpSecOffset = nullif(@COL71,''),
qci8_qciSubscriptionQuanta = nullif(@COL72,''),
qci8_rohcEnabled = nullif(@COL73,''),
qci9_b2Threshold2RscpUtraOffset = nullif(@COL74,''),
qci9_b2Threshold1RsrpUtraOffset = nullif(@COL75,''),
qci9_b2Threshold2Cdma2000Offset = nullif(@COL76,''),
qci9_b2Threshold1RsrpCdma2000Offset = nullif(@COL77,''),
qci9_a2ThresholdRsrpPrimOffset = nullif(@COL78,''),
qci9_a2ThresholdRsrpSecOffset = nullif(@COL79,''),
qci9_qciSubscriptionQuanta = nullif(@COL80,''),
qci9_rohcEnabled = nullif(@COL81,'');


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQ_ROHC.csv' IGNORE INTO TABLE stg_lte_param_eric_enbeq_rohc FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5)
SET
MECONTEXT_ID = nullif(@COL1,''),
featureStateROHC = nullif(@COL2,''),
licenseStateROHC = nullif(@COL3,''),
serviceStateROHC = nullif(@COL4,'');


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENBEQ_SRVCC_TO_UTRAN.csv' IGNORE INTO TABLE stg_lte_param_eric_enbeq_srvcc_to_utran FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5)
SET
MECONTEXT_ID = nullif(@COL1,''),
featureStateSRVCCtoUTRAN = nullif(@COL2,''),
licenseStateSRVCCtoUTRAN = nullif(@COL3,''),
serviceStateSRVCCtoUTRAN = nullif(@COL4,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CON_CSFB_CDMA2000.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_con_csfb_cdma2000 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
thresholdCdma20001xRtt = nullif(@COL2,''),
hysteresis_CSFBCdma2000 = nullif(@COL3,''),
timeToTrigger_CSFBCdma2000 = nullif(@COL4,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONF_A4.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_conf_a4 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a4ThresholdRsrp = nullif(@COL2,''),
a4ThresholdRsrq = nullif(@COL3,''),
hysteresisA4 = nullif(@COL4,''),
timeToTriggerA4 = nullif(@COL5,''),
triggerQuantityA4 = nullif(@COL6,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONF_B1_GERAN.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_conf_b1_geran FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
b1ThresholdGeran = nullif(@COL2,''),
hysteresisB1_Geran = nullif(@COL3,''),
timeToTriggerB1_Geran = nullif(@COL4,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONF_B1_UTRA.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_conf_b1_utra FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
b1ThresholdEcNoUtra = nullif(@COL2,''),
b1ThresholdRscpUtra = nullif(@COL3,''),
hysteresisB1_Utra = nullif(@COL4,''),
timeToTriggerB1_Utra = nullif(@COL5,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONF_B2_CDMA_20001XRTT.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_conf_b2_cdma_20001xrtt FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
b2Threshold2Cdma20001xRtt = nullif(@COL2,''),
b2Threshold1Rsrp_Cdma20001xRtt = nullif(@COL3,''),
b2Threshold1Rsrq_Cdma20001xRtt = nullif(@COL4,''),
hysteresisB2_Cdma20001xRtt = nullif(@COL5,''),
timeToTriggerB2_Cdma20001xRtt = nullif(@COL6,''),
triggerQuantityB2_Cdma20001xRtt = nullif(@COL7,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONF_EUTRA_BEST_ANR.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_conf_eutra_best_anr FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a3offsetAnrDelta = nullif(@COL2,''),
hysteresisA3_BestCellAnr = nullif(@COL3,''),
timeToTriggerA3_BestCellAnr = nullif(@COL4,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONFIG_A1_PRIM.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_config_a1_prim FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a1ThresholdRsrpPrim = nullif(@COL2,''),
a1ThresholdRsrqPrim = nullif(@COL3,''),
hysteresisA1Prim = nullif(@COL4,''),
timeToTriggerA1Prim = nullif(@COL5,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONFIG_A1_SEC.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_config_a1_sec FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a1ThresholdRsrpSec = nullif(@COL2,''),
a1ThresholdRsrqSec = nullif(@COL3,''),
hysteresisA1Sec = nullif(@COL4,''),
timeToTriggerA1Sec = nullif(@COL5,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONFIG_A5.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_config_a5 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a5Threshold1Rsrp = nullif(@COL2,''),
a5Threshold1Rsrq = nullif(@COL3,''),
a5Threshold2Rsrp = nullif(@COL4,''),
a5Threshold2Rsrq = nullif(@COL5,''),
hysteresisA5 = nullif(@COL6,''),
timeToTriggerA5 = nullif(@COL7,''),
triggerQuantityA5 = nullif(@COL8,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONFIG_A5_ANR.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_config_a5_anr FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a5Threshold1RsrpAnrDelta = nullif(@COL2,''),
a5Threshold1RsrqAnrDelta = nullif(@COL3,''),
a5Threshold2RsrpAnrDelta = nullif(@COL4,''),
a5Threshold2RsrqAnrDelta = nullif(@COL5,''),
hysteresisA5_Anr = nullif(@COL6,''),
timeToTriggerA5_Anr = nullif(@COL7,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONFIG_B2_CDMA_2000.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_config_b2_cdma_2000 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
b2Threshold2Cdma2000 = nullif(@COL2,''),
b2Threshold1Rsrp_Cdma2000 = nullif(@COL3,''),
b2Threshold1Rsrq_Cdma2000 = nullif(@COL4,''),
hysteresisB2_Cdma2000 = nullif(@COL5,''),
timeToTriggerB2_Cdma2000 = nullif(@COL6,''),
triggerQuantityB2_Cdma2000 = nullif(@COL7,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONFIG_B2_GERAN.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_config_b2_geran FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
b2Threshold2Geran = nullif(@COL2,''),
b2Threshold1Rsrp_Geran = nullif(@COL3,''),
b2Threshold1Rsrq_Geran = nullif(@COL4,''),
hysteresisB2_Geran = nullif(@COL5,''),
timeToTriggerB2_Geran = nullif(@COL6,''),
triggerQuantityB2_Geran = nullif(@COL7,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_CONFIG_B2_UTRA.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_config_b2_utra FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
b2Threshold2EcNoUtra = nullif(@COL2,''),
b2Threshold2RscpUtra = nullif(@COL3,''),
b2Threshold1Rsrp_Utra = nullif(@COL4,''),
b2Threshold1Rsrq_Utra = nullif(@COL5,''),
hysteresisB2_Utra = nullif(@COL6,''),
timeToTriggerB2_Utra = nullif(@COL7,''),
triggerQuantityB2_Utra = nullif(@COL8,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_ECF_UMC.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_ecf_umc FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a3offset = nullif(@COL2,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_EUTRAN_CELL_FDD.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_eutran_cell_fdd FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
mobCtrlAtPoorCovActive = nullif(@COL2,''),
cellSubscriptionCapacity = nullif(@COL3,''),
sIntraSearchP = nullif(@COL4,''),
sIntraSearchQ = nullif(@COL5,''),
sIntraSearchv920Active = nullif(@COL6,''),
sNonIntraSearchP = nullif(@COL7,''),
sNonIntraSearchQ = nullif(@COL8,''),
sNonIntraSearchv920Active = nullif(@COL9,''),
threshServingLowQ = nullif(@COL10,''),
qQualMin = nullif(@COL11,''),
qQualMinOffset = nullif(@COL12,''),
isDlOnly = nullif(@COL13,''),
crsGain = nullif(@COL14,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_REP_CF_EUTRAINTFRQ.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_rep_cf_eutraintfrq FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a4ThresholdRsrp_InterFreqLb = nullif(@COL2,''),
hysteresisA4_InterFreqLb = nullif(@COL3,''),
a5Threshold1Rsrp_InterFreqLb = nullif(@COL4,''),
a5Threshold2Rsrp_InterFreqLb = nullif(@COL5,''),
a5Threshold2Rsrq_InterFreqLb = nullif(@COL6,''),
hysteresisA5_InterFreqLb = nullif(@COL7,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_REP_CONF_INTER_RAT_LB.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_rep_conf_inter_rat_lb FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
utranB1ThresholdRscp = nullif(@COL2,''),
utranHysteresisB1 = nullif(@COL3,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_REPCONF_SCELL_A1A2.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_repconf_scell_a1a2 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a1a2ThresholdRsrp = nullif(@COL2,''),
a1a2ThresholdRsrq = nullif(@COL3,''),
hysteresisA1A2Rsrp = nullif(@COL4,''),
hysteresisA1A2Rsrq = nullif(@COL5,''),
timeToTriggerA1 = nullif(@COL6,''),
timeToTriggerA2 = nullif(@COL7,''),
triggerQuantityA1A2 = nullif(@COL8,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_REPCONF_SCELL_A4.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_repconf_scell_a4 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a4ThresholdRsrp_SCellA4 = nullif(@COL2,''),
a4ThresholdRsrq_SCellA4 = nullif(@COL3,''),
hysteresisA4_SCellA4 = nullif(@COL4,''),
timeToTriggerA4_SCellA4 = nullif(@COL5,''),
triggerQuantityA4_SCellA4 = nullif(@COL6,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_REPCONF_SCELL_A6.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_repconf_scell_a6 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a6offset = nullif(@COL2,''),
hysteresisA6 = nullif(@COL3,''),
timeToTriggerA6 = nullif(@COL4,''),
triggerQuantityA6 = nullif(@COL5,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_REPCONF_SEARCH.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_repconf_search FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a1a2SearchThresholdRsrp = nullif(@COL2,''),
a1a2SearchThresholdRsrq = nullif(@COL3,''),
a2CriticalThresholdRsrp = nullif(@COL4,''),
a2CriticalThresholdRsrq = nullif(@COL5,''),
hysteresisA1A2SearchRsrp = nullif(@COL6,''),
hysteresisA1A2SearchRsrq = nullif(@COL7,''),
hysteresisA2CriticalRsrp = nullif(@COL8,''),
hysteresisA2CriticalRsrq = nullif(@COL9,''),
timeToTriggerA1Search = nullif(@COL10,''),
timeToTriggerA2Critical = nullif(@COL11,''),
timeToTriggerA2Search = nullif(@COL12,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_REPCONFEUTRA_BCL.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_repconfeutra_bcl FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a3offset_IFBestCell = nullif(@COL2,''),
hysteresisA3_IFBestCell = nullif(@COL3,''),
timeToTriggerA3_IFBestCell = nullif(@COL4,''),
triggerQuantityA3_IFBestCell = nullif(@COL5,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_SUB4_CONFCSFBGERAN.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_sub4_confcsfbgeran FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
thresholdGeran = nullif(@COL2,''),
hysteresis_CSFBGeran = nullif(@COL3,''),
timeToTrigger_CSFBGeran = nullif(@COL4,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_SUB4_RCONFCSFBUTRA.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_sub4_rconfcsfbutra FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
thresholdEcNo = nullif(@COL2,''),
thresholdRscp = nullif(@COL3,''),
hysteresis_CSFBUtra = nullif(@COL4,''),
timeToTrigger_CSFBUtra = nullif(@COL5,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LCELL_UE_MEAS_CONTROL.csv' IGNORE INTO TABLE stg_lte_param_eric_lcell_ue_meas_control FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET
EUTRAN_CELL_FDD_ID = nullif(@COL1,''),
a5B2MobilityTimer = nullif(@COL2,''),
ueMeasurementsActive = nullif(@COL3,''),
ueMeasurementsActiveIF = nullif(@COL4,''),
ueMeasurementsActiveUTRAN = nullif(@COL5,''),
ueMeasurementsActiveGERAN = nullif(@COL6,''),
ueMeasurementsActiveCDMA2000 = nullif(@COL7,''),
ueMeasurementsActiveCDMA20001xRtt = nullif(@COL8,'');

SET AUTOCOMMIT = 1;
