SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 0;

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LTECELL_3.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_LTECELL_3 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20, @COL21, @COL22, @COL23, @COL24, @COL25, @COL26, @COL27, @COL28, @COL29, @COL30, @COL31, @COL32, @COL33, @COL34, @COL35, @COL36, @COL37, @COL38, @COL39, @COL40, @COL41, @COL42, @COL43, @COL44, @COL45, @COL46, @COL47, @COL48, @COL49, @COL50, @COL51, @COL52, @COL53, @COL54, @COL55, @COL56, @COL57, @COL58, @COL59, @COL60, @COL61, @COL62, @COL63, @COL64, @COL65, @COL66, @COL67, @COL68, @COL69, @COL70, @COL71, @COL72, @COL73, @COL74, @COL75, @COL76, @COL77, @COL78, @COL79, @COL80, @COL81, @COL82, @COL83, @COL84, @COL85, @COL86, @COL87, @COL88)
SET 
cell_uid = nullif(@COL1,''),
mecontext = nullif(@COL2,''),
eutrancellfdd = nullif(@COL3,''),
ailgautorestartenabled = nullif(@COL4,''),
allocthrpucchformat1 = nullif(@COL5,''),
alloctimerpucchformat1 = nullif(@COL6,''),
clusteredpuschmprfactor = nullif(@COL7,''),
deallocthrpucchformat1 = nullif(@COL8,''),
dealloctimerpucchformat1 = nullif(@COL9,''),
dl256qamenabled = nullif(@COL10,''),
dlinternalchannelbandwidth = nullif(@COL11,''),
enableueassistedadaptivedrx = nullif(@COL12,''),
enableueassistedsigreduction = nullif(@COL13,''),
maxnoclusteredpuschalloc = nullif(@COL14,''),
maxsentcrsassistcells = nullif(@COL15,''),
maxsoftlockbackofftime = nullif(@COL16,''),
primarypsdoffset = nullif(@COL17,''),
rtptimeout = nullif(@COL18,''),
spifhosetupbeareratinitialctxtsetup = nullif(@COL19,''),
transmissionmode = nullif(@COL20,''),
ulblertargetenabled = nullif(@COL21,''),
ulinternalchannelbandwidth = nullif(@COL22,''),
ulschedctrlforoocuesenabled = nullif(@COL23,''),
zzztemporary41 = nullif(@COL24,''),
zzztemporary42 = nullif(@COL25,''),
zzztemporary43 = nullif(@COL26,''),
zzztemporary44 = nullif(@COL27,''),
zzztemporary45 = nullif(@COL28,''),
zzztemporary46 = nullif(@COL29,''),
zzztemporary47 = nullif(@COL30,''),
lastschedlinkadaptenabled = nullif(@COL31,''),
pdcchcovimprovedtx = nullif(@COL32,''),
pdcchcovimproveqci1 = nullif(@COL33,''),
pdcchcovimprovesrb = nullif(@COL34,''),
pdschmaxnrofprbsperue = nullif(@COL35,''),
prioadditionalfreqbandlist = nullif(@COL36,''),
srdetecthighthres = nullif(@COL37,''),
ttibundlingafterho = nullif(@COL38,''),
ttibundlingafterreest = nullif(@COL39,''),
ttibundlingswitchthres = nullif(@COL40,''),
ttibundlingswitchthreshyst = nullif(@COL41,''),
ulscellpriority = nullif(@COL42,''),
ultrigactive = nullif(@COL43,''),
zzztemporary48 = nullif(@COL44,''),
zzztemporary49 = nullif(@COL45,''),
zzztemporary50 = nullif(@COL46,''),
capriothreshold = nullif(@COL47,''),
catm1supportenabled = nullif(@COL48,''),
dynulresourceallocenabled = nullif(@COL49,''),
edrxallowed = nullif(@COL50,''),
elclongdrxcycle = nullif(@COL51,''),
enablesinruplinkclpc = nullif(@COL52,''),
highestsupportedcelevelbr = nullif(@COL53,''),
interferencethresholdsinrclpc = nullif(@COL54,''),
mappinginfobr = nullif(@COL55,''),
maxvalidsubframedlbr = nullif(@COL56,''),
measbasedelccontrol = nullif(@COL57,''),
noofpucchformat3prbpairs = nullif(@COL58,''),
qqualminrsrqce = nullif(@COL59,''),
qrxlevmince = nullif(@COL60,''),
rxsinrtargetclpc = nullif(@COL61,''),
siperiodicitysi1 = nullif(@COL62,''),
siperiodicitysi2 = nullif(@COL63,''),
siperiodicitysi3 = nullif(@COL64,''),
siperiodicitysi4 = nullif(@COL65,''),
siperiodicitysi5 = nullif(@COL66,''),
siperiodicitysi6 = nullif(@COL67,''),
siperiodicitysi7 = nullif(@COL68,''),
siperiodicitysi8 = nullif(@COL69,''),
siperiodicitysi9 = nullif(@COL70,''),
siperiodicitysi10 = nullif(@COL71,''),
sivaliditytimebr = nullif(@COL72,''),
ulpsdloadthresholdsinrclpc = nullif(@COL73,''),
zzztemporary51 = nullif(@COL74,''),
zzztemporary52 = nullif(@COL75,''),
zzztemporary53 = nullif(@COL76,''),
zzztemporary54 = nullif(@COL77,''),
zzztemporary55 = nullif(@COL78,''),
zzztemporary56 = nullif(@COL79,''),
zzztemporary57 = nullif(@COL80,''),
zzztemporary58 = nullif(@COL81,''),
zzztemporary59 = nullif(@COL82,''),
zzztemporary60 = nullif(@COL83,''),
zzztemporary61 = nullif(@COL84,''),
zzztemporary62 = nullif(@COL85,''),
filedate = nullif(@COL86,''),
query_date = nullif(@COL87,''),
rec_date = nullif(@COL88,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_AIRIFLOADPROFILE.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_AIRIFLOADPROFILE FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
enodebfunction = nullif(@COL3,''),
zzztemporary8 = nullif(@COL4,''),
zzztemporary9 = nullif(@COL5,''),
filedate = nullif(@COL6,''),
query_date = nullif(@COL7,''),
rec_date = nullif(@COL8,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ANRFUNCTION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_ANRFUNCTION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
enodebfunction = nullif(@COL3,''),
anrfunction = nullif(@COL4,''),
probcelldetectlowhosuccthres = nullif(@COL5,''),
probcelldetectlowhosucctime = nullif(@COL6,''),
probcelldetectmedhosuccthres = nullif(@COL7,''),
probcelldetectmedhosucctime = nullif(@COL8,''),
problematiccellpolicy = nullif(@COL9,''),
perecgimeasplmnwhitelist = nullif(@COL10,''),
plmnwhitelistenabled = nullif(@COL11,''),
pciconflictdetectionecgimeas = nullif(@COL12,''),
pciconflictmobilityecgimeas = nullif(@COL13,''),
filedate = nullif(@COL14,''),
query_date = nullif(@COL15,''),
rec_date = nullif(@COL16,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ANRFUNCTIONEUTRAN.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_ANRFUNCTIONEUTRAN FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
enodebfunction = nullif(@COL3,''),
anrfunction = nullif(@COL4,''),
anrfunctioneutran = nullif(@COL5,''),
anreutraninterfmeasreportdecr = nullif(@COL6,''),
anreutraninterfmeasreportincr = nullif(@COL7,''),
anreutraninterfmeasreportmax = nullif(@COL8,''),
anreutraninterfmeasreportmin = nullif(@COL9,''),
eutrananragqci1 = nullif(@COL10,''),
filedate = nullif(@COL11,''),
query_date = nullif(@COL12,''),
rec_date = nullif(@COL13,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ANRFUNCTIONUTRAN.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_ANRFUNCTIONUTRAN FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
enodebfunction = nullif(@COL3,''),
anrfunction = nullif(@COL4,''),
anrfunctionutran = nullif(@COL5,''),
utrananragqci1 = nullif(@COL6,''),
filedate = nullif(@COL7,''),
query_date = nullif(@COL8,''),
rec_date = nullif(@COL9,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ANRPCICONFLICTDRXPROFILE.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_ANRPCICONFLICTDRXPROFILE FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
enodebfunction = nullif(@COL3,''),
anrpciconflictdrxprofile = nullif(@COL4,''),
anrpciconflictdrxinactivitytimer = nullif(@COL5,''),
anrpciconflictdrxprofileid = nullif(@COL6,''),
anrpciconflictlongdrxcycle = nullif(@COL7,''),
anrpciconflictondurationtimer = nullif(@COL8,''),
filedate = nullif(@COL9,''),
query_date = nullif(@COL10,''),
rec_date = nullif(@COL11,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_BBPROCESSINGRESOURCE.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_BBPROCESSINGRESOURCE FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
equipment = nullif(@COL3,''),
subrack = nullif(@COL4,''),
slot = nullif(@COL5,''),
pluginunit = nullif(@COL6,''),
devicegroup = nullif(@COL7,''),
bbprocessingresource = nullif(@COL8,''),
bbprocessingresourceid = nullif(@COL9,''),
liccapdistr = nullif(@COL10,''),
filedate = nullif(@COL11,''),
query_date = nullif(@COL12,''),
rec_date = nullif(@COL13,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_CARRIERAGGREGATIONFUNCTION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_CARRIERAGGREGATIONFUNCTION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
enodebfunction = nullif(@COL3,''),
carrieraggregationfunction = nullif(@COL4,''),
zzztemporary1 = nullif(@COL5,''),
zzztemporary2 = nullif(@COL6,''),
zzztemporary3 = nullif(@COL7,''),
pdcchenhancedlaforvolte = nullif(@COL8,''),
scellselectionmode = nullif(@COL9,''),
capreference = nullif(@COL10,''),
dynamicscellselectionmethod = nullif(@COL11,''),
enhancedselectionofmimoandca = nullif(@COL12,''),
fourlayermimopreferred = nullif(@COL13,''),
laascellactdeactdatathres = nullif(@COL14,''),
laascellactdeactdatathreshyst = nullif(@COL15,''),
laascellactdeactprohibittimer = nullif(@COL16,''),
laascellschedulesinrthres = nullif(@COL17,''),
filedate = nullif(@COL18,''),
query_date = nullif(@COL19,''),
rec_date = nullif(@COL20,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_CELLSLEEPNODEFUNCTION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_CELLSLEEPNODEFUNCTION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
enodebfunction = nullif(@COL3,''),
cellsleepnodefunction = nullif(@COL4,''),
cellsleepnodefunctionid = nullif(@COL5,''),
csmeutraninterfmeasreportdecr = nullif(@COL6,''),
csmeutraninterfmeasreportincr = nullif(@COL7,''),
csmeutraninterfmeasreportmax = nullif(@COL8,''),
csmeutraninterfmeasreportmin = nullif(@COL9,''),
filedate = nullif(@COL10,''),
query_date = nullif(@COL11,''),
rec_date = nullif(@COL12,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_ENODEBFUNCTION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_ENODEBFUNCTION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20, @COL21, @COL22, @COL23, @COL24, @COL25, @COL26, @COL27, @COL28, @COL29, @COL30, @COL31, @COL32, @COL33, @COL34, @COL35, @COL36, @COL37, @COL38, @COL39, @COL40, @COL41, @COL42, @COL43, @COL44, @COL45, @COL46, @COL47, @COL48, @COL49, @COL50, @COL51, @COL52, @COL53, @COL54, @COL55, @COL56, @COL57, @COL58, @COL59, @COL60)
SET 
nodename = nullif(@COL1,''),
managedelement = nullif(@COL2,''),
enodebfunction = nullif(@COL3,''),
eranvlanportref = nullif(@COL4,''),
upx2ipaddressref = nullif(@COL5,''),
adaptiverlcretxdl = nullif(@COL6,''),
alignttibundwultrigsinr = nullif(@COL7,''),
altnasbackto = nullif(@COL8,''),
caawaremfbiintracellho = nullif(@COL9,''),
checkemergencysoftlock = nullif(@COL10,''),
dlmaxwaitingtimeglobal = nullif(@COL11,''),
enabledultrigmeas = nullif(@COL12,''),
gtpuerrorindicationdscp = nullif(@COL13,''),
interenbcatunneldscp = nullif(@COL14,''),
ipsecepaddressref = nullif(@COL15,''),
measuringecgiwithagactive = nullif(@COL16,''),
mfbisupportpolicy = nullif(@COL17,''),
prioritizeadditionalbands = nullif(@COL18,''),
`release` = nullif(@COL19,''),
s1gtpuechodscp = nullif(@COL20,''),
s1gtpuechoenable = nullif(@COL21,''),
s1gtpuechofailureaction = nullif(@COL22,''),
sctpx2ref = nullif(@COL23,''),
softlockrwrwaittimerinternal = nullif(@COL24,''),
softlockrwrwaittimeroperator = nullif(@COL25,''),
tddvoipdrxprofileid = nullif(@COL26,''),
timephasemaxdeviationedrx = nullif(@COL27,''),
timephasemaxdeviationienbca = nullif(@COL28,''),
ulmaxwaitingtimeglobal = nullif(@COL29,''),
usebandprioritiesinscelleval = nullif(@COL30,''),
usebandprioritiesinsib1 = nullif(@COL31,''),
x2gtpuechodscp = nullif(@COL32,''),
x2gtpuechoenable = nullif(@COL33,''),
zzztemporary28 = nullif(@COL34,''),
zzztemporary30 = nullif(@COL35,''),
zzztemporary32 = nullif(@COL36,''),
zzztemporary33 = nullif(@COL37,''),
zzztemporary34 = nullif(@COL38,''),
zzztemporary35 = nullif(@COL39,''),
zzztemporary36 = nullif(@COL40,''),
zzztemporary37 = nullif(@COL41,''),
zzztemporary39 = nullif(@COL42,''),
zzztemporary40 = nullif(@COL43,''),
zzztemporary41 = nullif(@COL44,''),
zzztemporary42 = nullif(@COL45,''),
zzztemporary43 = nullif(@COL46,''),
zzztemporary44 = nullif(@COL47,''),
zzztemporary45 = nullif(@COL48,''),
zzztemporary46 = nullif(@COL49,''),
zzztemporary47 = nullif(@COL50,''),
zzztemporary48 = nullif(@COL51,''),
zzztemporary49 = nullif(@COL52,''),
zzztemporary50 = nullif(@COL53,''),
zzztemporary51 = nullif(@COL54,''),
zzztemporary52 = nullif(@COL55,''),
zzztemporary53 = nullif(@COL56,''),
zzztemporary54 = nullif(@COL57,''),
query_date = nullif(@COL58,''),
filedate = nullif(@COL59,''),
rec_date = nullif(@COL60,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_EXTERNALENODEBFUNCTION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_EXTERNALENODEBFUNCTION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET 
nodename = nullif(@COL1,''),
externalenodebfunction = nullif(@COL2,''),
enbid = nullif(@COL3,''),
ultrighosupport = nullif(@COL4,''),
escellcapacityscaling = nullif(@COL5,''),
interenodebcainteractionmode = nullif(@COL6,''),
filedate = nullif(@COL7,''),
query_date = nullif(@COL8,''),
rec_date = nullif(@COL9,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_EXTERNALEUTRANCELLFDD.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_EXTERNALEUTRANCELLFDD FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13)
SET 
nodename = nullif(@COL1,''),
externalenodebfunction = nullif(@COL2,''),
externaleutrancellfdd = nullif(@COL3,''),
zzztemporaryext1 = nullif(@COL4,''),
zzztemporaryext2 = nullif(@COL5,''),
zzztemporaryext3 = nullif(@COL6,''),
zzztemporaryext4 = nullif(@COL7,''),
zzztemporaryext5 = nullif(@COL8,''),
mbsfnsubframealloc = nullif(@COL9,''),
nooftxantennas = nullif(@COL10,''),
filedate = nullif(@COL11,''),
query_date = nullif(@COL12,''),
rec_date = nullif(@COL13,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_EXTERNALUTRANCELLFDD.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_EXTERNALUTRANCELLFDD FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11)
SET 
nodename = nullif(@COL1,''),
utranfrequency = nullif(@COL2,''),
externalutrancellfdd = nullif(@COL3,''),
zzztemporaryext1 = nullif(@COL4,''),
zzztemporaryext2 = nullif(@COL5,''),
zzztemporaryext3 = nullif(@COL6,''),
zzztemporaryext4 = nullif(@COL7,''),
zzztemporaryext5 = nullif(@COL8,''),
filedate = nullif(@COL9,''),
query_date = nullif(@COL10,''),
rec_date = nullif(@COL11,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_FLEXIBLEQOSFUNCTION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_FLEXIBLEQOSFUNCTION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6)
SET 
nodename = nullif(@COL1,''),
flexibleqosfunction = nullif(@COL2,''),
flexibleqosfunctionid = nullif(@COL3,''),
filedate = nullif(@COL4,''),
query_date = nullif(@COL5,''),
rec_date = nullif(@COL6,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_LOADBALANCINGFUNCTION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_LOADBALANCINGFUNCTION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7)
SET 
nodename = nullif(@COL1,''),
loadbalancingfunction = nullif(@COL2,''),
ocdminhighhitthresh = nullif(@COL3,''),
ocdmaxnohighhitratecells = nullif(@COL4,''),
filedate = nullif(@COL5,''),
query_date = nullif(@COL6,''),
rec_date = nullif(@COL7,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_MDTCONFIGURATION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_MDTCONFIGURATION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12)
SET 
nodename = nullif(@COL1,''),
mdtconfiguration = nullif(@COL2,''),
reportintervalmdt = nullif(@COL3,''),
reportingtrigger = nullif(@COL4,''),
reportamountmdt = nullif(@COL5,''),
positioningmethod = nullif(@COL6,''),
mdtconfigurationid = nullif(@COL7,''),
a2thresholdrsrqmdt = nullif(@COL8,''),
a2thresholdrsrpmdt = nullif(@COL9,''),
filedate = nullif(@COL10,''),
query_date = nullif(@COL11,''),
rec_date = nullif(@COL12,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_MIMOSLEEPFUNCTION.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_MIMOSLEEPFUNCTION FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11)
SET 
nodename = nullif(@COL1,''),
eutrancellfdd = nullif(@COL2,''),
mimosleepfunction = nullif(@COL3,''),
sleependtime = nullif(@COL4,''),
sleepmode = nullif(@COL5,''),
sleepstarttime = nullif(@COL6,''),
sleepstate = nullif(@COL7,''),
sleeppowercontrol = nullif(@COL8,''),
filedate = nullif(@COL9,''),
query_date = nullif(@COL10,''),
rec_date = nullif(@COL11,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_PAGING.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_PAGING FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET 
nodename = nullif(@COL1,''),
paging = nullif(@COL2,''),
defaultpagingcyclenbiot = nullif(@COL3,''),
nbbr = nullif(@COL4,''),
nbnbiot = nullif(@COL5,''),
numrepetitionspagingnbiot = nullif(@COL6,''),
filedate = nullif(@COL7,''),
query_date = nullif(@COL8,''),
rec_date = nullif(@COL9,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_PLMNINFO.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_PLMNINFO FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET 
nodename = nullif(@COL1,''),
plmninfo = nullif(@COL2,''),
plmnwhitelist_mcc = nullif(@COL3,''),
plmnwhitelist_mnc = nullif(@COL4,''),
plmnwhitelist_mnclength = nullif(@COL5,''),
plmnwhitelist = nullif(@COL6,''),
filedate = nullif(@COL7,''),
query_date = nullif(@COL8,''),
rec_date = nullif(@COL9,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_QCIPROFILEPREDEFINED.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_QCIPROFILEPREDEFINED FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET 
nodename = nullif(@COL1,''),
qcitable = nullif(@COL2,''),
qciprofilepredefined = nullif(@COL3,''),
pdboffset = nullif(@COL4,''),
timerprofileref = nullif(@COL5,''),
treorderingul = nullif(@COL6,''),
filedate = nullif(@COL7,''),
query_date = nullif(@COL8,''),
rec_date = nullif(@COL9,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_RCS.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_RCS FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8)
SET
nodename = nullif(@COL1,''),
rcs = nullif(@COL2,''),
tinactivitytimerbr = nullif(@COL3,''),
tinactivitytimer = nullif(@COL4,''),
rlcdldeliveryfailureaction = nullif(@COL5,''),
filedate = nullif(@COL6,''),
query_date = nullif(@COL7,''),
rec_date = nullif(@COL8,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_REPORTCONFIGA5SOFTLOCK.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_REPORTCONFIGA5SOFTLOCK FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9)
SET 
nodename = nullif(@COL1,''),
eutrancellfdd = nullif(@COL2,''),
uemeascontrol = nullif(@COL3,''),
reportconfiga5softlock = nullif(@COL4,''),
a5threshold2rsrp = nullif(@COL5,''),
reportconfiga5softlockid = nullif(@COL6,''),
filedate = nullif(@COL7,''),
query_date = nullif(@COL8,''),
rec_date = nullif(@COL9,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_REPORTCONFIGELCA1A2.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_REPORTCONFIGELCA1A2 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12)
SET 
nodename = nullif(@COL1,''),
eutrancellfdd = nullif(@COL2,''),
uemeascontrol = nullif(@COL3,''),
reportconfigelca1a2 = nullif(@COL4,''),
a1a2thresholdrsrp = nullif(@COL5,''),
hysteresisa1a2rsrp = nullif(@COL6,''),
reportconfigelca1a2id = nullif(@COL7,''),
timetotriggera1 = nullif(@COL8,''),
timetotriggera2 = nullif(@COL9,''),
filedate = nullif(@COL10,''),
query_date = nullif(@COL11,''),
rec_date = nullif(@COL12,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_REPORTCONFIGSEARCH.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_REPORTCONFIGSEARCH FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16)
SET 
nodename = nullif(@COL1,''),
eutrancellfdd = nullif(@COL2,''),
uemeascontrol = nullif(@COL3,''),
reportconfigsearch = nullif(@COL4,''),
reportconfigsearchid = nullif(@COL5,''),
a1a2ulsearchthreshold = nullif(@COL6,''),
a2ulcriticalthreshold = nullif(@COL7,''),
hysteresisa1a2ulsearch = nullif(@COL8,''),
hysteresisa2ulcritical = nullif(@COL9,''),
qcia1a2ulthroffsets = nullif(@COL10,''),
timetotriggera1ulsearch = nullif(@COL11,''),
timetotriggera2ulcritical = nullif(@COL12,''),
timetotriggera2ulsearch = nullif(@COL13,''),
filedate = nullif(@COL14,''),
query_date = nullif(@COL15,''),
rec_date = nullif(@COL16,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_RRC.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_RRC FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10)
SET 
nodename = nullif(@COL1,''),
rrc = nullif(@COL2,''),
t300br = nullif(@COL3,''),
t300nbiot = nullif(@COL4,''),
t301br = nullif(@COL5,''),
t301nbiot = nullif(@COL6,''),
t311nbiot = nullif(@COL7,''),
filedate = nullif(@COL8,''),
query_date = nullif(@COL9,''),
rec_date = nullif(@COL10,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_SCIPROFILE.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_SCIPROFILE FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20, @COL21, @COL22, @COL23)
SET 
nodename = nullif(@COL1,''),
qcitable = nullif(@COL2,''),
sciprofile = nullif(@COL3,''),
abspriooverride = nullif(@COL4,''),
dlmaxwaitingtime = nullif(@COL5,''),
dlminbitrate = nullif(@COL6,''),
dlrelativepriority = nullif(@COL7,''),
dlresourceallocationstrategy = nullif(@COL8,''),
logicalchannelgroupref = nullif(@COL9,''),
pdb = nullif(@COL10,''),
priority = nullif(@COL11,''),
reservedby = nullif(@COL12,''),
schedulingalgorithm = nullif(@COL13,''),
sci = nullif(@COL14,''),
sciprofileid = nullif(@COL15,''),
srsallocationstrategy = nullif(@COL16,''),
ulmaxwaitingtime = nullif(@COL17,''),
ulminbitrate = nullif(@COL18,''),
ulrelativepriority = nullif(@COL19,''),
ulresourceallocationstrategy = nullif(@COL20,''),
filedate = nullif(@COL21,''),
query_date = nullif(@COL22,''),
rec_date = nullif(@COL23,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_SECTORCARRIER.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_SECTORCARRIER FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20)
SET 
nodename = nullif(@COL1,''),
sectorcarrier = nullif(@COL2,''),
eutrancellfdd = nullif(@COL3,''),
dlpimcandidate = nullif(@COL4,''),
pimcfunctionreference = nullif(@COL5,''),
radiotransmitperformancemode = nullif(@COL6,''),
ulpimcancellationmode = nullif(@COL7,''),
zzztemporary1 = nullif(@COL8,''),
zzztemporary2 = nullif(@COL9,''),
zzztemporary3 = nullif(@COL10,''),
zzztemporary4 = nullif(@COL11,''),
zzztemporary5 = nullif(@COL12,''),
zzztemporary6 = nullif(@COL13,''),
maximumtransmissionpower = nullif(@COL14,''),
noofrxantennas = nullif(@COL15,''),
nooftxantennas = nullif(@COL16,''),
partofsectorpower = nullif(@COL17,''),
filedate = nullif(@COL18,''),
query_date = nullif(@COL19,''),
rec_date = nullif(@COL20,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_SIGNALINGRADIOBEARER.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_SIGNALINGRADIOBEARER FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11)
SET 
nodename = nullif(@COL1,''),
radiobearertable = nullif(@COL2,''),
signalingradiobearer = nullif(@COL3,''),
dlmaxretxthreshold = nullif(@COL4,''),
ulmaxretxthreshold = nullif(@COL5,''),
treorderingul = nullif(@COL6,''),
tpollretransmitdl = nullif(@COL7,''),
tpollretransmitul = nullif(@COL8,''),
filedate = nullif(@COL9,''),
query_date = nullif(@COL10,''),
rec_date = nullif(@COL11,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_TIMERPROFILE.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_TIMERPROFILE FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10)
SET 
nodename = nullif(@COL1,''),
timerprofile = nullif(@COL2,''),
timerprofileid = nullif(@COL3,''),
trelocoverall = nullif(@COL4,''),
trrcconnectionreconfiguration = nullif(@COL5,''),
trrcconnreest = nullif(@COL6,''),
twaitforrrcconnreest = nullif(@COL7,''),
filedate = nullif(@COL8,''),
query_date = nullif(@COL9,''),
rec_date = nullif(@COL10,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_ERIC_UEMEASCONTROL.txt' IGNORE INTO TABLE LTE_PARAM_ERIC_UEMEASCONTROL FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15)
SET 
nodename = nullif(@COL1,''),
eutrancellfdd = nullif(@COL2,''),
uemeascontrol = nullif(@COL3,''),
checka2searchlevel = nullif(@COL4,''),
filtercoefficienteutraulsinrmax = nullif(@COL5,''),
maxnomeasreportsinact = nullif(@COL6,''),
zzztemporary21 = nullif(@COL7,''),
zzztemporary22 = nullif(@COL8,''),
zzztemporary23 = nullif(@COL9,''),
zzztemporary24 = nullif(@COL10,''),
zzztemporary25 = nullif(@COL11,''),
zzztemporary26 = nullif(@COL12,''),
filedate = nullif(@COL13,''),
query_date = nullif(@COL14,''),
rec_date = nullif(@COL15,'');

SET AUTOCOMMIT = 1;