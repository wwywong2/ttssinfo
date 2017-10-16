SET SQL_WARNINGS = 1;
SET SQL_LOG_BIN=0; 
SET AUTOCOMMIT = 1;

LOAD DATA LOCAL INFILE '[##DataDir##]/GSM_PARAM_NORTEL_GSMCELL.txt' IGNORE INTO TABLE gsm_param_nortel_gsmcell FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10,@COL11,@COL12,@COL13,@COL14,@COL15,@COL16,@COL17,@COL18,@COL19,@COL20,@COL21,@COL22,@COL23,@COL24,@COL25,@COL26,@COL27,@COL28,@COL29,@COL30,@COL31,@COL32,@COL33,@COL34,@COL35,@COL36,@COL37,@COL38,@COL39,@COL40,@COL41,@COL42,@COL43,@COL44,@COL45,@COL46,@COL47,@COL48,@COL49)
set 
cell = nullif(@COL1,''),
cell_uid = concat(@COL40,'_',@COL10,'_',@COL9),
bsic = nullif(@COL2,''),
bcchfreq = nullif(@COL3,''),
btssmid = nullif(@COL4,''),
btsid = nullif(@COL5,''),
routingarea = nullif(@COL6,''),
rndacctimadvthreshold = nullif(@COL7,''),
hotraffic = nullif(@COL8,''),
cellidentity = nullif(@COL9,''),
locationac = nullif(@COL10,''),
btscc = nullif(@COL11,''),
networkcc = nullif(@COL12,''),
nradios = nullif(@COL13,''),
n_sdcch = nullif(@COL14,''),
rxlevamin = nullif(@COL15,''),
intradirectedretryconf = nullif(@COL16,''),
interdirectedretryconf = nullif(@COL17,''),
bstxpwrmax = nullif(@COL18,''),
cell_state = nullif(@COL19,''),
lrxlevdlh = nullif(@COL20,''),
lrxlevulh = nullif(@COL21,''),
rxlevdlih = nullif(@COL22,''),
rxlevulih = nullif(@COL23,''),
rxqualdlih = nullif(@COL24,''),
rxqualulih = nullif(@COL25,''),
lrxqualulh = nullif(@COL26,''),
lrxqualdlh = nullif(@COL27,''),
intracellenabled = nullif(@COL28,''),
msrangemax = nullif(@COL29,''),
pwrctrlenbl = nullif(@COL30,''),
lrxlevdlp = nullif(@COL31,''),
urxlevdlp = nullif(@COL32,''),
lrxqualdlp = nullif(@COL33,''),
urxqualdlp = nullif(@COL34,''),
uplinkpowercontrol = nullif(@COL35,''),
lrxlevulp = nullif(@COL36,''),
urxlevulp = nullif(@COL37,''),
lrxqualulp = nullif(@COL38,''),
urxqualulp = nullif(@COL39,''),
bscid = nullif(@COL40,''),
vendor = nullif(@COL41,''),
ch_group_0 = nullif(@COL42,''),
btsishopping = nullif(@COL43,''),
hoppseqnbr = nullif(@COL44,''),
maio = nullif(@COL45,''),
fhop_group = nullif(@COL46,''),
ch_group_1 = nullif(@COL47,''),
ntrus_g_1 = nullif(@COL48,''),
rec_date = nullif(@COL49,'') ;

LOAD DATA LOCAL INFILE '[##DataDir##]/GSM_PARAM_NORTEL_2G_NB.txt' IGNORE INTO TABLE gsm_param_nortel_2g_nb FIELDS TERMINATED BY '|' ESCAPED BY '' LINES TERMINATED BY '\r\n'  IGNORE 1 LINES
(@COL1,@COL2,@COL3,@COL4,@COL5,@COL6,@COL7,@COL8,@COL9,@COL10)
set 
CELL_UID = nullif(@COL1,''),
src_cell = nullif(@COL1,''),
trg_cell = nullif(@COL2,''),
homargin = nullif(@COL3,''),
homarginrxlev = nullif(@COL4,''),
homarginrxqual = nullif(@COL5,''),
rxlevmin = nullif(@COL6,''),
homargindist = nullif(@COL7,''),
rxlevdlpbgt = nullif(@COL8,''),
homargintrafficoffset = nullif(@COL9,''),
rec_date = nullif(@COL10,'') ;

