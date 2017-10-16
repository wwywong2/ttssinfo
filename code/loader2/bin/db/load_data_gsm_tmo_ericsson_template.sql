SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 1;

LOAD DATA LOCAL INFILE '[##DataDir##]/GSM_PARAM_ERIC_GSMCELL.txt' IGNORE INTO TABLE gsm_param_eric_gsmcell FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43,@COL44,@COL45,@COL46,@COL47,@COL48,@COL49,@COL50,@COL51,@COL52,@COL53,@COL54,@COL55,@COL56,@COL57,@COL58,@COL59,@COL60,@COL61,@COL62,@COL63,@COL64,@COL65,@COL66,@COL67,@COL68,@COL69,@COL70,@COL71,@COL72,@COL73,@COL74,@COL75,@COL76,@COL77)
set 
cell = nullif(@COL1,''),
cell_uid = concat(@COL67,'_',@COL10,'_',@COL9),
bsic = nullif(@COL2,''),
bcchnum = nullif(@COL3,''),
bts_smid = nullif(@COL4,''),
bts_id = nullif(@COL5,''),
routingarea = nullif(@COL6,''),
rndacctimadvthres = nullif(@COL7,''),
hotraffic = nullif(@COL8,''),
ci = nullif(@COL9,''),
lac = nullif(@COL10,''),
fnoffset = nullif(@COL11,''),
nccperm = nullif(@COL12,''),
bcc = nullif(@COL13,''),
ncc = nullif(@COL14,''),
nradios = nullif(@COL15,''),
n_sdcch = nullif(@COL16,''),
accmin = nullif(@COL17,''),
aw = nullif(@COL18,''),
bspwr = nullif(@COL19,''),
bspwrb = nullif(@COL20,''),
bspwrmin = nullif(@COL21,''),
bspwrt = nullif(@COL22,''),
bsrxmin = nullif(@COL23,''),
bsrxsuff = nullif(@COL24,''),
bstxpwr = nullif(@COL25,''),
cell_state = nullif(@COL26,''),
pssbq = nullif(@COL27,''),
psshf = nullif(@COL28,''),
pssta = nullif(@COL29,''),
psstemp = nullif(@COL30,''),
pt = nullif(@COL31,''),
ptim_bq = nullif(@COL32,''),
ptimhf = nullif(@COL33,''),
ptimta = nullif(@COL34,''),
ptimtemp = nullif(@COL35,''),
ssoffsetul = nullif(@COL36,''),
ssoffsetdl = nullif(@COL37,''),
qoffsetul = nullif(@COL38,''),
qoffsetdl = nullif(@COL39,''),
qlim_ul = nullif(@COL40,''),
qlim_dl = nullif(@COL41,''),
rlinkt = nullif(@COL42,''),
rlinkup = nullif(@COL43,''),
msrxmin = nullif(@COL44,''),
msrxsuff = nullif(@COL45,''),
iho = nullif(@COL46,''),
sslensd = nullif(@COL47,''),
ssrampsd = nullif(@COL48,''),
qlensd = nullif(@COL49,''),
talim = nullif(@COL50,''),
hystsep = nullif(@COL51,''),
dynbtspwr_state = nullif(@COL52,''),
sdcchreg = nullif(@COL53,''),
ssdesdl = nullif(@COL54,''),
sslendl = nullif(@COL55,''),
qlendl = nullif(@COL56,''),
lcompdl = nullif(@COL57,''),
qdesdl = nullif(@COL58,''),
qcompdl = nullif(@COL59,''),
dynmspwr_state = nullif(@COL60,''),
ssdes = nullif(@COL61,''),
sslen = nullif(@COL62,''),
qlen = nullif(@COL63,''),
lcompul = nullif(@COL64,''),
qdesul = nullif(@COL65,''),
qcompul = nullif(@COL66,''),
bscname = nullif(@COL67,''),
vendor = nullif(@COL68,''),
ch_group_0 = nullif(@COL69,''),
hop = nullif(@COL70,''),
hsn = nullif(@COL71,''),
maio = nullif(@COL72,''),
fhop_group = nullif(@COL73,''),
ch_group_1 = nullif(@COL74,''),
ntrus_g_1 = nullif(@COL75,''),
configuration = nullif(@COL76,''),
rec_date = nullif(@COL77,'');

LOAD DATA LOCAL INFILE '[##DataDir##]/GSM_PARAM_ERIC_2G_NB.txt' IGNORE INTO TABLE gsm_param_eric_2g_nb FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13)
set 
CELL_UID = nullif(@COL1,''),
src_cell = nullif(@COL1,''),
trg_cell = nullif(@COL2,''),
awoffset = nullif(@COL3,''),
bqoffset = nullif(@COL4,''),
hihyst = nullif(@COL5,''),
khyst = nullif(@COL6,''),
koffset = nullif(@COL7,''),
lhyst = nullif(@COL8,''),
lohyst = nullif(@COL9,''),
loffset = nullif(@COL10,''),
offset = nullif(@COL11,''),
configuration = nullif(@COL12,''),
rec_date = nullif(@COL13,'');
