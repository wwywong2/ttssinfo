SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 0;


LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_NOKIA_LTECELL_2.txt' IGNORE INTO TABLE LTE_PARAM_NOKIA_LTECELL_2 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20, @COL21, @COL22, @COL23, @COL24, @COL25, @COL26, @COL27, @COL28, @COL29, @COL30, @COL31, @COL32, @COL33, @COL34, @COL35, @COL36, @COL37, @COL38, @COL39, @COL40, @COL41, @COL42, @COL43, @COL44, @COL45, @COL46, @COL47, @COL48, @COL49, @COL50, @COL51, @COL52, @COL53, @COL54, @COL55, @COL56, @COL57, @COL58, @COL59, @COL60, @COL61, @COL62, @COL63, @COL64, @COL65, @COL66, @COL67, @COL68, @COL69, @COL70, @COL71, @COL72, @COL73, @COL74, @COL75, @COL76, @COL77, @COL78, @COL79, @COL80, @COL81, @COL82, @COL83, @COL84, @COL85, @COL86, @COL87, @COL88, @COL89, @COL90, @COL91, @COL92, @COL93, @COL94, @COL95, @COL96, @COL97, @COL98, @COL99, @COL100, @COL101, @COL102, @COL103, @COL104, @COL105, @COL106, @COL107, @COL108, @COL109, @COL110, @COL111, @COL112, @COL113, @COL114, @COL115, @COL116, @COL117, @COL118, @COL119, @COL120, @COL121, @COL122, @COL123, @COL124, @COL125, @COL126, @COL127, @COL128, @COL129, @COL130, @COL131, @COL132, @COL133, @COL134, @COL135, @COL136, @COL137, @COL138, @COL139, @COL140, @COL141, @COL142, @COL143, @COL144, @COL145, @COL146, @COL147, @COL148, @COL149, @COL150, @COL151, @COL152, @COL153, @COL154, @COL155, @COL156, @COL157, @COL158, @COL159, @COL160, @COL161, @COL162, @COL163, @COL164, @COL165, @COL166, @COL167, @COL168, @COL169, @COL170, @COL171, @COL172, @COL173, @COL174)
SET 
version = nullif(@COL2,''),
distname = nullif(@COL3,''),
bts_name = nullif(@COL4,''),
enbid = nullif(@COL5,''),
eutran_cell = nullif(@COL6,''),
actdlsoldtc = nullif(@COL7,''),
actdlsvoicepacketagg = nullif(@COL8,''),
actfastmimoswitch = nullif(@COL9,''),
actldpdcch = nullif(@COL10,''),
actmodulationschemeul = nullif(@COL11,''),
actollapdcch = nullif(@COL12,''),
actotdoa = nullif(@COL13,''),
actprstxdiv = nullif(@COL14,''),
actrepeatermode = nullif(@COL15,''),
actsmartdrx = nullif(@COL16,''),
actsupercell = nullif(@COL17,''),
actttibundling = nullif(@COL18,''),
actullnkadp = nullif(@COL19,''),
addgbrtrafficrrho = nullif(@COL20,''),
addgbrtraffictcho = nullif(@COL21,''),
addnumdrbradioreasho = nullif(@COL22,''),
addnumdrbtimecriticalho = nullif(@COL23,''),
addnumqci1drbradioreasho = nullif(@COL24,''),
addnumqci1drbtimecriticalho = nullif(@COL25,''),
addspectremi = nullif(@COL26,''),
blankedpucch = nullif(@COL27,''),
cellresetrequest = nullif(@COL28,''),
celltype = nullif(@COL29,''),
defpagcyc = nullif(@COL30,''),
deltapremsg3 = nullif(@COL31,''),
deltatfenabled = nullif(@COL32,''),
dfpucchf1 = nullif(@COL33,''),
dfpucchf1b = nullif(@COL34,''),
dfpucchf2 = nullif(@COL35,''),
dfpucchf2a = nullif(@COL36,''),
dfpucchf2b = nullif(@COL37,''),
drxprofile101drxinactivityt = nullif(@COL38,''),
drxprofile101drxlongcycle = nullif(@COL39,''),
drxprofile101drxonduratt = nullif(@COL40,''),
drxprofile101drxprofileindex = nullif(@COL41,''),
dsrtransmax = nullif(@COL42,''),
eullaatbperiod = nullif(@COL43,''),
eullableravewin = nullif(@COL44,''),
eulladeltamcs = nullif(@COL45,''),
eullalowmcsthr = nullif(@COL46,''),
eullalowprbthr = nullif(@COL47,''),
eullaprbincdecfactor = nullif(@COL48,''),
filtercentertx = nullif(@COL49,''),
filtercoefficientcsfbcpichecn0 = nullif(@COL50,''),
filtercoefficientcsfbcpichrscp = nullif(@COL51,''),
gbrconghandling = nullif(@COL52,''),
grpassigpusch = nullif(@COL53,''),
harqmaxtrulttibundling = nullif(@COL54,''),
hsscenario = nullif(@COL55,''),
idlelbcellreselprio = nullif(@COL56,''),
iflbbearchecktimer = nullif(@COL57,''),
iflbhighloadgbrdl = nullif(@COL58,''),
iflbhighloadnongbrdl = nullif(@COL59,''),
iflbhighloadpdcch = nullif(@COL60,''),
ilreactimerul = nullif(@COL61,''),
loadbalancingprofile = nullif(@COL62,''),
cellcapclass = nullif(@COL63,''),
lowermargincio = nullif(@COL64,''),
maxgbrtrafficlimit = nullif(@COL65,''),
maxnumcaconfuedc = nullif(@COL66,''),
measquantitycsfbutra = nullif(@COL67,''),
mimoclcqithd = nullif(@COL68,''),
mimoclcqithu = nullif(@COL69,''),
mimoclrithd = nullif(@COL70,''),
mimoclrithu = nullif(@COL71,''),
mimoolcqithd = nullif(@COL72,''),
mimoolcqithu = nullif(@COL73,''),
mimoolrithd = nullif(@COL74,''),
mimoolrithu = nullif(@COL75,''),
mobstateparamncelchghgh = nullif(@COL76,''),
mobstateparamncelchgmed = nullif(@COL77,''),
mobstateparamteval = nullif(@COL78,''),
mobstateparamthystnorm = nullif(@COL79,''),
pagingnb = nullif(@COL80,''),
pdcchaggdefue = nullif(@COL81,''),
pdcchaggmsg4 = nullif(@COL82,''),
pdcchaggpaging = nullif(@COL83,''),
pdcchaggpreamb = nullif(@COL84,''),
pdcchaggraresp = nullif(@COL85,''),
pdcchaggsib = nullif(@COL86,''),
pdcchalpha = nullif(@COL87,''),
pdcchcqishift = nullif(@COL88,''),
pdcchharqtargetbler = nullif(@COL89,''),
pdcchuldlbal = nullif(@COL90,''),
periodiccqifeedbacktype = nullif(@COL91,''),
prachconfindex = nullif(@COL92,''),
prachfreqoff = nullif(@COL93,''),
prsbandwidth = nullif(@COL94,''),
prsconfigurationindex = nullif(@COL95,''),
prsnumdlframes = nullif(@COL96,''),
prspowerboost = nullif(@COL97,''),
pucchnancs = nullif(@COL98,''),
puschackoffi = nullif(@COL99,''),
puschcqioffi = nullif(@COL100,''),
puschrioffi = nullif(@COL101,''),
racontresot = nullif(@COL102,''),
ralargemcsul = nullif(@COL103,''),
ramsgpoffgrb = nullif(@COL104,''),
ranondedpreamb = nullif(@COL105,''),
rapregrasize = nullif(@COL106,''),
rarespwinsize = nullif(@COL107,''),
rasmallmcsul = nullif(@COL108,''),
rasmallvolul = nullif(@COL109,''),
rcambrmgndl = nullif(@COL110,''),
rcambrmgnul = nullif(@COL111,''),
rcenabledl = nullif(@COL112,''),
rcenableul = nullif(@COL113,''),
redbwendl = nullif(@COL114,''),
redbwmaxrbdl = nullif(@COL115,''),
redbwmaxrbul = nullif(@COL116,''),
redbwminrbul = nullif(@COL117,''),
redbwrpaenul = nullif(@COL118,''),
srspwroffset = nullif(@COL119,''),
syncsigtxmode = nullif(@COL120,''),
t302 = nullif(@COL121,''),
t304enaccgsm = nullif(@COL122,''),
t304interrat = nullif(@COL123,''),
t304interratgsm = nullif(@COL124,''),
t304intralte = nullif(@COL125,''),
t320 = nullif(@COL126,''),
tamaxoffset = nullif(@COL127,''),
tatimer = nullif(@COL128,''),
tatimermargin = nullif(@COL129,''),
textendedwait = nullif(@COL130,''),
tperiodicbsr = nullif(@COL131,''),
tperiodicphr = nullif(@COL132,''),
tprohibitphr = nullif(@COL133,''),
tretxbsrtime = nullif(@COL134,''),
tstoreuecntxt = nullif(@COL135,''),
ttibundlingblertarget = nullif(@COL136,''),
ttibundlingblerthreshold = nullif(@COL137,''),
ttibundlingsinrthreshold = nullif(@COL138,''),
ulamcalltben = nullif(@COL139,''),
ulamcswitchper = nullif(@COL140,''),
ulatbeventper = nullif(@COL141,''),
ulcombinationmode = nullif(@COL142,''),
ulpcalpha = nullif(@COL143,''),
ulpclowlevcch = nullif(@COL144,''),
ulpclowqualcch = nullif(@COL145,''),
ulpcuplevcch = nullif(@COL146,''),
ulpcupqualcch = nullif(@COL147,''),
ulpclowlevsch = nullif(@COL148,''),
ulpclowqualsch = nullif(@COL149,''),
ulpcuplevsch = nullif(@COL150,''),
ulpcupqualsch = nullif(@COL151,''),
ulpcraresptpc = nullif(@COL152,''),
ulpcreadperiod = nullif(@COL153,''),
ulrscs = nullif(@COL154,''),
ulsfdprbassignalg = nullif(@COL155,''),
ulsmaxpacketagg = nullif(@COL156,''),
ulsminrbperue = nullif(@COL157,''),
ulsmintbs = nullif(@COL158,''),
ulsschedmethod = nullif(@COL159,''),
ultargetbler = nullif(@COL160,''),
uppermargincio = nullif(@COL161,''),
useid = nullif(@COL162,''),
drxprofile101drxprofilepriority = nullif(@COL163,''),
drxprofile101drxretranst = nullif(@COL164,''),
drxprofile102drxinactivityt = nullif(@COL165,''),
drxprofile102drxlongcycle = nullif(@COL166,''),
drxprofile102drxonduratt = nullif(@COL167,''),
drxprofile102drxprofileindex = nullif(@COL168,''),
drxprofile102drxprofilepriority = nullif(@COL169,''),
drxprofile102drxretranst = nullif(@COL170,''),
dl64qamenable = nullif(@COL171,''),
lastupdate = nullif(@COL172,''),
query_date = nullif(@COL173,''),
rec_date = nullif(@COL174,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/LTE_PARAM_NOKIA_ENBEQUIPMENT_2.txt' IGNORE INTO TABLE LTE_PARAM_NOKIA_ENBEQUIPMENT_2 FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\n'  IGNORE 1 LINES 
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11, @COL12, @COL13, @COL14, @COL15, @COL16, @COL17, @COL18, @COL19, @COL20, @COL21, @COL22, @COL23, @COL24, @COL25, @COL26, @COL27, @COL28, @COL29, @COL30, @COL31, @COL32, @COL33, @COL34, @COL35, @COL36, @COL37, @COL38, @COL39, @COL40, @COL41, @COL42, @COL43, @COL44, @COL45, @COL46, @COL47, @COL48, @COL49, @COL50, @COL51, @COL52, @COL53, @COL54, @COL55, @COL56, @COL57, @COL58, @COL59, @COL60, @COL61, @COL62, @COL63, @COL64, @COL65, @COL66, @COL67, @COL68, @COL69, @COL70, @COL71, @COL72, @COL73, @COL74, @COL75, @COL76, @COL77, @COL78, @COL79, @COL80, @COL81, @COL82, @COL83, @COL84, @COL85, @COL86, @COL87, @COL88, @COL89, @COL90, @COL91, @COL92, @COL93, @COL94, @COL95, @COL96, @COL97, @COL98, @COL99, @COL100, @COL101, @COL102, @COL103, @COL104, @COL105, @COL106, @COL107, @COL108, @COL109, @COL110, @COL111, @COL112, @COL113, @COL114, @COL115, @COL116, @COL117, @COL118, @COL119, @COL120, @COL121, @COL122, @COL123, @COL124, @COL125, @COL126, @COL127, @COL128, @COL129, @COL130, @COL131, @COL132, @COL133, @COL134, @COL135, @COL136, @COL137, @COL138, @COL139, @COL140, @COL141, @COL142, @COL143, @COL144, @COL145, @COL146, @COL147, @COL148, @COL149, @COL150, @COL151, @COL152, @COL153, @COL154, @COL155, @COL156, @COL157, @COL158, @COL159, @COL160, @COL161, @COL162, @COL163, @COL164, @COL165, @COL166, @COL167, @COL168, @COL169, @COL170, @COL171, @COL172, @COL173, @COL174, @COL175, @COL176, @COL177, @COL178, @COL179, @COL180, @COL181, @COL182, @COL183, @COL184, @COL185, @COL186, @COL187, @COL188, @COL189, @COL190, @COL191, @COL192, @COL193, @COL194, @COL195, @COL196, @COL197, @COL198, @COL199, @COL200, @COL201, @COL202, @COL203, @COL204, @COL205, @COL206, @COL207, @COL208, @COL209, @COL210, @COL211, @COL212, @COL213, @COL214, @COL215, @COL216, @COL217, @COL218, @COL219, @COL220, @COL221, @COL222, @COL223, @COL224, @COL225, @COL226, @COL227, @COL228, @COL229, @COL230, @COL231, @COL232, @COL233, @COL234, @COL235, @COL236, @COL237, @COL238, @COL239, @COL240, @COL241, @COL242, @COL243, @COL244, @COL245, @COL246, @COL247, @COL248, @COL249, @COL250, @COL251, @COL252, @COL253, @COL254, @COL255, @COL256, @COL257, @COL258, @COL259, @COL260, @COL261, @COL262, @COL263, @COL264, @COL265, @COL266, @COL267, @COL268, @COL269, @COL270, @COL271, @COL272, @COL273, @COL274, @COL275, @COL276, @COL277, @COL278, @COL279, @COL280, @COL281, @COL282, @COL283, @COL284, @COL285, @COL286, @COL287, @COL288, @COL289)
SET 
enbid = nullif(@COL2,''),
version = nullif(@COL3,''),
distname = nullif(@COL4,''),
bts_name = nullif(@COL5,''),
enbname = nullif(@COL6,''),
mcc = nullif(@COL7,''),
mnc = nullif(@COL8,''),
actcmas = nullif(@COL9,''),
actcompchecks = nullif(@COL10,''),
actcplaneovlhandling = nullif(@COL11,''),
actcsfbpshotoutra = nullif(@COL12,''),
actdlcaggr = nullif(@COL13,''),
actdualband = nullif(@COL14,''),
actenhacandgbrservices = nullif(@COL15,''),
acterabmodify = nullif(@COL16,''),
actetws = nullif(@COL17,''),
actgsmredirwithsi = nullif(@COL18,''),
acthenbmobility = nullif(@COL19,''),
acthighrrc = nullif(@COL20,''),
actidlelb = nullif(@COL21,''),
actinterfreqlb = nullif(@COL22,''),
actintrafreqloadbal = nullif(@COL23,''),
actmdtcelltrace = nullif(@COL24,''),
actmultgbrbearers = nullif(@COL25,''),
actoptmmeselection = nullif(@COL26,''),
actrimforgsm = nullif(@COL27,''),
acts1olhandling = nullif(@COL28,''),
actsrvcctogsm = nullif(@COL29,''),
actsrvcctowcdma = nullif(@COL30,''),
actuebasedanrutran = nullif(@COL31,''),
actzuc = nullif(@COL32,''),
amrlcpbtab1dlpollbyte = nullif(@COL33,''),
amrlcpbtab1uecategory = nullif(@COL34,''),
amrlcpbtab1ulpollbyte = nullif(@COL35,''),
amrlcpbtab2dlpollbyte = nullif(@COL36,''),
amrlcpbtab2uecategory = nullif(@COL37,''),
amrlcpbtab2ulpollbyte = nullif(@COL38,''),
amrlcpbtab3dlpollbyte = nullif(@COL39,''),
amrlcpbtab3uecategory = nullif(@COL40,''),
amrlcpbtab3ulpollbyte = nullif(@COL41,''),
amrlcpbtab4dlpollbyte = nullif(@COL42,''),
amrlcpbtab4uecategory = nullif(@COL43,''),
amrlcpbtab4ulpollbyte = nullif(@COL44,''),
amrlcpbtab5dlpollbyte = nullif(@COL45,''),
amrlcpbtab5uecategory = nullif(@COL46,''),
amrlcpbtab5ulpollbyte = nullif(@COL47,''),
btsresetrequest = nullif(@COL48,''),
camindlambr = nullif(@COL49,''),
eea0 = nullif(@COL50,''),
eea1 = nullif(@COL51,''),
eea2 = nullif(@COL52,''),
eea3 = nullif(@COL53,''),
congweightalg = nullif(@COL54,''),
defprofidxam = nullif(@COL55,''),
defprofidxum = nullif(@COL56,''),
etwsprimnotifbcdur = nullif(@COL57,''),
keyrefrmarg = nullif(@COL58,''),
maxnumpreemptions = nullif(@COL59,''),
moprofileselect = nullif(@COL60,''),
nullfallback = nullif(@COL61,''),
pbrnongbr = nullif(@COL62,''),
pdcpprof101pdcpprofileid = nullif(@COL63,''),
pdcpprof101rohcmaxcid = nullif(@COL64,''),
pdcpprof101snsize = nullif(@COL65,''),
pdcpprof101tdiscard = nullif(@COL66,''),
pdcpprof102pdcpprofileid = nullif(@COL67,''),
pdcpprof102snsize = nullif(@COL68,''),
pdcpprof102tdiscard = nullif(@COL69,''),
pdcpprof103pdcpprofileid = nullif(@COL70,''),
pdcpprof103snsize = nullif(@COL71,''),
pdcpprof103tdiscard = nullif(@COL72,''),
pdcpprof104pdcpprofileid = nullif(@COL73,''),
pdcpprof104snsize = nullif(@COL74,''),
pdcpprof104tdiscard = nullif(@COL75,''),
pdcpprof1pdcpprofileid = nullif(@COL76,''),
pdcpprof1statusrepreq = nullif(@COL77,''),
pdcpprof1tdiscard = nullif(@COL78,''),
pdcpprof2pdcpprofileid = nullif(@COL79,''),
pdcpprof2statusrepreq = nullif(@COL80,''),
pdcpprof2tdiscard = nullif(@COL81,''),
pdcpprof3pdcpprofileid = nullif(@COL82,''),
pdcpprof3statusrepreq = nullif(@COL83,''),
pdcpprof3tdiscard = nullif(@COL84,''),
pdcpprof4pdcpprofileid = nullif(@COL85,''),
pdcpprof4statusrepreq = nullif(@COL86,''),
pdcpprof4tdiscard = nullif(@COL87,''),
pdcpprof5pdcpprofileid = nullif(@COL88,''),
pdcpprof5statusrepreq = nullif(@COL89,''),
pdcpprof5tdiscard = nullif(@COL90,''),
prohibitlbhotimer = nullif(@COL91,''),
pwswithemareaid = nullif(@COL92,''),
qcitab1delaytarget = nullif(@COL93,''),
qcitab1drxprofileindex = nullif(@COL94,''),
qcitab1dscp = nullif(@COL95,''),
qcitab1enforcettibundling = nullif(@COL96,''),
qcitab1lcgid = nullif(@COL97,''),
qcitab1maxgbrdl = nullif(@COL98,''),
qcitab1maxgbrul = nullif(@COL99,''),
qcitab1pdcpprofidx = nullif(@COL100,''),
qcitab1prio = nullif(@COL101,''),
qcitab1qci = nullif(@COL102,''),
qcitab1qcisupp = nullif(@COL103,''),
qcitab1restype = nullif(@COL104,''),
qcitab1rlcmode = nullif(@COL105,''),
qcitab1rlcprofidx = nullif(@COL106,''),
qcitab1schedulbsd = nullif(@COL107,''),
qcitab1schedulprio = nullif(@COL108,''),
qcitab2delaytarget = nullif(@COL109,''),
qcitab2drxprofileindex = nullif(@COL110,''),
qcitab2dscp = nullif(@COL111,''),
qcitab2enforcettibundling = nullif(@COL112,''),
qcitab2l2ohfactordl = nullif(@COL113,''),
qcitab2l2ohfactorul = nullif(@COL114,''),
qcitab2lcgid = nullif(@COL115,''),
qcitab2maxgbrdl = nullif(@COL116,''),
qcitab2maxgbrul = nullif(@COL117,''),
qcitab2pdcpprofidx = nullif(@COL118,''),
qcitab2prio = nullif(@COL119,''),
qcitab2qci = nullif(@COL120,''),
qcitab2qcisupp = nullif(@COL121,''),
qcitab2restype = nullif(@COL122,''),
qcitab2rlcmode = nullif(@COL123,''),
qcitab2rlcprofidx = nullif(@COL124,''),
qcitab2schedulbsd = nullif(@COL125,''),
qcitab2schedulprio = nullif(@COL126,''),
qcitab3delaytarget = nullif(@COL127,''),
qcitab3drxprofileindex = nullif(@COL128,''),
qcitab3dscp = nullif(@COL129,''),
qcitab3enforcettibundling = nullif(@COL130,''),
qcitab3l2ohfactordl = nullif(@COL131,''),
qcitab3l2ohfactorul = nullif(@COL132,''),
qcitab3lcgid = nullif(@COL133,''),
qcitab3maxgbrdl = nullif(@COL134,''),
qcitab3maxgbrul = nullif(@COL135,''),
qcitab3pdcpprofidx = nullif(@COL136,''),
qcitab3prio = nullif(@COL137,''),
qcitab3qci = nullif(@COL138,''),
qcitab3qcisupp = nullif(@COL139,''),
qcitab3restype = nullif(@COL140,''),
qcitab3rlcmode = nullif(@COL141,''),
qcitab3rlcprofidx = nullif(@COL142,''),
qcitab3schedulbsd = nullif(@COL143,''),
qcitab3schedulprio = nullif(@COL144,''),
qcitab4delaytarget = nullif(@COL145,''),
qcitab4drxprofileindex = nullif(@COL146,''),
qcitab4dscp = nullif(@COL147,''),
qcitab4enforcettibundling = nullif(@COL148,''),
qcitab4l2ohfactordl = nullif(@COL149,''),
qcitab4l2ohfactorul = nullif(@COL150,''),
qcitab4lcgid = nullif(@COL151,''),
qcitab4maxgbrdl = nullif(@COL152,''),
qcitab4maxgbrul = nullif(@COL153,''),
qcitab4pdcpprofidx = nullif(@COL154,''),
qcitab4prio = nullif(@COL155,''),
qcitab4qci = nullif(@COL156,''),
qcitab4qcisupp = nullif(@COL157,''),
qcitab4restype = nullif(@COL158,''),
qcitab4rlcmode = nullif(@COL159,''),
qcitab4rlcprofidx = nullif(@COL160,''),
qcitab4schedulbsd = nullif(@COL161,''),
qcitab4schedulprio = nullif(@COL162,''),
qcitab5drxprofileindex = nullif(@COL163,''),
qcitab5dscp = nullif(@COL164,''),
qcitab5enforcettibundling = nullif(@COL165,''),
qcitab5lcgid = nullif(@COL166,''),
qcitab5pdcpprofidx = nullif(@COL167,''),
qcitab5prio = nullif(@COL168,''),
qcitab5qci = nullif(@COL169,''),
qcitab5qcisupp = nullif(@COL170,''),
qcitab5restype = nullif(@COL171,''),
qcitab5rlcmode = nullif(@COL172,''),
qcitab5rlcprofidx = nullif(@COL173,''),
qcitab5schedulbsd = nullif(@COL174,''),
qcitab5schedulprio = nullif(@COL175,''),
qcitab5schedultype = nullif(@COL176,''),
qcitab5schedulweight = nullif(@COL177,''),
qcitab6drxprofileindex = nullif(@COL178,''),
qcitab6dscp = nullif(@COL179,''),
qcitab6enforcettibundling = nullif(@COL180,''),
qcitab6lcgid = nullif(@COL181,''),
qcitab6pdcpprofidx = nullif(@COL182,''),
qcitab6prio = nullif(@COL183,''),
qcitab6qci = nullif(@COL184,''),
qcitab6qcisupp = nullif(@COL185,''),
qcitab6restype = nullif(@COL186,''),
qcitab6rlcmode = nullif(@COL187,''),
qcitab6rlcprofidx = nullif(@COL188,''),
qcitab6schedulbsd = nullif(@COL189,''),
qcitab6schedulprio = nullif(@COL190,''),
qcitab6schedulweight = nullif(@COL191,''),
qcitab7drxprofileindex = nullif(@COL192,''),
qcitab7dscp = nullif(@COL193,''),
qcitab7enforcettibundling = nullif(@COL194,''),
qcitab7lcgid = nullif(@COL195,''),
qcitab7pdcpprofidx = nullif(@COL196,''),
qcitab7prio = nullif(@COL197,''),
qcitab7qci = nullif(@COL198,''),
qcitab7qcisupp = nullif(@COL199,''),
qcitab7restype = nullif(@COL200,''),
qcitab7rlcmode = nullif(@COL201,''),
qcitab7rlcprofidx = nullif(@COL202,''),
qcitab7schedulbsd = nullif(@COL203,''),
qcitab7schedulprio = nullif(@COL204,''),
qcitab7schedulweight = nullif(@COL205,''),
qcitab8drxprofileindex = nullif(@COL206,''),
qcitab8dscp = nullif(@COL207,''),
qcitab8enforcettibundling = nullif(@COL208,''),
qcitab8lcgid = nullif(@COL209,''),
qcitab8pdcpprofidx = nullif(@COL210,''),
qcitab8prio = nullif(@COL211,''),
qcitab8qci = nullif(@COL212,''),
qcitab8qcisupp = nullif(@COL213,''),
qcitab8restype = nullif(@COL214,''),
qcitab8rlcmode = nullif(@COL215,''),
qcitab8rlcprofidx = nullif(@COL216,''),
qcitab8schedulbsd = nullif(@COL217,''),
qcitab8schedulprio = nullif(@COL218,''),
qcitab8schedulweight = nullif(@COL219,''),
qcitab9drxprofileindex = nullif(@COL220,''),
qcitab9dscp = nullif(@COL221,''),
qcitab9enforcettibundling = nullif(@COL222,''),
qcitab9lcgid = nullif(@COL223,''),
qcitab9pdcpprofidx = nullif(@COL224,''),
qcitab9prio = nullif(@COL225,''),
qcitab9qci = nullif(@COL226,''),
qcitab9qcisupp = nullif(@COL227,''),
qcitab9restype = nullif(@COL228,''),
qcitab9rlcmode = nullif(@COL229,''),
qcitab9rlcprofidx = nullif(@COL230,''),
qcitab9schedulbsd = nullif(@COL231,''),
qcitab9schedulprio = nullif(@COL232,''),
qcitab9schedulweight = nullif(@COL233,''),
recoveryresetdelay = nullif(@COL234,''),
rlcprof101rlcprofileid = nullif(@COL235,''),
rlcprof101snfieldlengthdl = nullif(@COL236,''),
rlcprof101snfieldlengthul = nullif(@COL237,''),
rlcprof101treord = nullif(@COL238,''),
rlcprof102rlcprofileid = nullif(@COL239,''),
rlcprof102snfieldlengthdl = nullif(@COL240,''),
rlcprof102snfieldlengthul = nullif(@COL241,''),
rlcprof102treord = nullif(@COL242,''),
rlcprof103rlcprofileid = nullif(@COL243,''),
rlcprof103snfieldlengthdl = nullif(@COL244,''),
rlcprof103snfieldlengthul = nullif(@COL245,''),
rlcprof103treord = nullif(@COL246,''),
rlcprof104rlcprofileid = nullif(@COL247,''),
rlcprof104snfieldlengthdl = nullif(@COL248,''),
rlcprof104snfieldlengthul = nullif(@COL249,''),
rlcprof104treord = nullif(@COL250,''),
rlcprof1pollpdu = nullif(@COL251,''),
rlcprof1rlcprofileid = nullif(@COL252,''),
rlcprof1tpollretr = nullif(@COL253,''),
rlcprof1tprohib = nullif(@COL254,''),
rlcprof1treord = nullif(@COL255,''),
rlcprof2pollpdu = nullif(@COL256,''),
rlcprof2rlcprofileid = nullif(@COL257,''),
rlcprof2tpollretr = nullif(@COL258,''),
rlcprof2tprohib = nullif(@COL259,''),
rlcprof2treord = nullif(@COL260,''),
rlcprof3pollpdu = nullif(@COL261,''),
rlcprof3rlcprofileid = nullif(@COL262,''),
rlcprof3tpollretr = nullif(@COL263,''),
rlcprof3tprohib = nullif(@COL264,''),
rlcprof3treord = nullif(@COL265,''),
rlcprof4pollpdu = nullif(@COL266,''),
rlcprof4rlcprofileid = nullif(@COL267,''),
rlcprof4tpollretr = nullif(@COL268,''),
rlcprof4tprohib = nullif(@COL269,''),
rlcprof4treord = nullif(@COL270,''),
rlcprof5pollpdu = nullif(@COL271,''),
rlcprof5rlcprofileid = nullif(@COL272,''),
rlcprof5tpollretr = nullif(@COL273,''),
rlcprof5tprohib = nullif(@COL274,''),
rlcprof5treord = nullif(@COL275,''),
s1inducedcelldeactdelaytime = nullif(@COL276,''),
scellactivationcycleperiod = nullif(@COL277,''),
scellactivationmethod = nullif(@COL278,''),
scelldeactivationtimerenb = nullif(@COL279,''),
scellpcellharqfdbkusage = nullif(@COL280,''),
shutdownstepamount = nullif(@COL281,''),
shutdownwindow = nullif(@COL282,''),
timdelaccontpreempt = nullif(@COL283,''),
ts1relprepg = nullif(@COL284,''),
txpathfailuremode = nullif(@COL285,''),
actdualcarrier = nullif(@COL286,''),
lastupdate = nullif(@COL287,''),
query_date = nullif(@COL288,''),
rec_date = nullif(@COL289,'');

SET AUTOCOMMIT = 1;