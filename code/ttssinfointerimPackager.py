#!' + os.path.sep + 'usr' + os.path.sep + 'bin' + os.path.sep + 'python

import os
import sys
import datetime
import re
import string
import ConfigParser
import zipfile
import utilities


def setStaticInfo(cfgParser, tech, vendor):
    if tech == 'GSM' and vendor == 'ERICSSON':
        cfgParser.set( 'checklist_' + vendor, 'Num', 1 )
        cfgParser.set( 'checklist_' + vendor, 'File1', 'GSM_PARAM_ERIC_GSMCELL.txt' )
        cfgParser.set( 'filelist_' + vendor, 'Num', 2 )
        cfgParser.set( 'filelist_' + vendor, 'File1', 'GSM_PARAM_ERIC_GSMCELL.txt' )
        cfgParser.set( 'filelist_' + vendor, 'File2', 'GSM_PARAM_ERIC_2G_NB.txt' )
    
    if tech == 'GSM' and vendor == 'NORTEL':
        cfgParser.set( 'checklist_' + vendor, 'Num', 1 )
        cfgParser.set( 'checklist_' + vendor, 'File1', 'GSM_PARAM_NORTEL_GSMCELL.txt' )
        cfgParser.set( 'filelist_' + vendor, 'Num', 2 )
        cfgParser.set( 'filelist_' + vendor, 'File1', 'GSM_PARAM_NORTEL_GSMCELL.txt' )
        cfgParser.set( 'filelist_' + vendor, 'File2', 'GSM_PARAM_NORTEL_2G_NB.txt' )
    
    if tech == 'GSM' and vendor == 'NOKIA':
        cfgParser.set( 'checklist_' + vendor, 'Num', 1 )
        cfgParser.set( 'checklist_' + vendor, 'File1', 'GSM_PARAM_NOKIA_GSMCELL.txt' )
        cfgParser.set( 'filelist_' + vendor, 'Num', 5 )
        cfgParser.set( 'filelist_' + vendor, 'File1', 'GSM_PARAM_NOKIA_2G_NB.txt' )
        cfgParser.set( 'filelist_' + vendor, 'File2', 'GSM_PARAM_NOKIA_3G_NB.txt' )
        cfgParser.set( 'filelist_' + vendor, 'File3', 'GSM_PARAM_NOKIA_GSMCELL.txt' )
        cfgParser.set( 'filelist_' + vendor, 'File4', 'STG_GSM_PARAM_NOKIA_GSMCELL_TCH.txt' )
        cfgParser.set( 'filelist_' + vendor, 'File5', 'STG_GSM_PARAM_NOKIA_GSMCELL_TRX.txt' )
    
    if tech == 'UMTS' and vendor == 'ERICSSON':
        cfgParser.set( 'checklist_' + vendor, 'Num', 2 )
        cfgParser.set( 'checklist_' + vendor, 'File1', 'S_INFO_UMTS.csv' )
        cfgParser.set( 'checklist_' + vendor, 'File2', 'S_INFO_UMTS_3G_NB_PARAM.csv' )
        cfgParser.set( 'filelist_' + vendor, 'Num', 15 )
        cfgParser.set( 'filelist_' + vendor, 'File1', 'PARAM_ERICSSON.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File2', 'QUERY_2.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File3', 'QUERY_3.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File4', 'QUERY_4.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File5', 'QUERY_5.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File6', 'QUERY_6.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File7', 'QUERY_7.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File8', 'QUERY_8.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File9', 'S_INFO_UMTS.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File10', 'S_INFO_UMTS2.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File11', 'S_INFO_UMTS_2G_NB_PARAM.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File12', 'S_INFO_UMTS_3G_NB_PARAM.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File13', 'S_INFO_UMTS_CGI.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File14', 'UMTS_PARAM_ERIC_UTRANCELL.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File15', 'UMTS_PARAM_ERIC_NODEBFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'Num', 2 )
        cfgParser.set( 'bypasslist_' + vendor, 'File1', 'UMTS_PARAM_ERIC_UTRANCELL.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File2', 'UMTS_PARAM_ERIC_NODEBFUNCTION.csv' )
    
    if tech == 'UMTS' and vendor == 'NOKIA':
        cfgParser.set( 'checklist_' + vendor, 'Num', 2 )
        cfgParser.set( 'checklist_' + vendor, 'File1', 'S_INFO_UMTS.csv' )
        cfgParser.set( 'checklist_' + vendor, 'File2', 'PARAM_3G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'Num', 7 )
        cfgParser.set( 'filelist_' + vendor, 'File1', 'PARAM_2G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File2', 'PARAM_3G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File3', 'QUERY_2.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File4', 'QUERY_3.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File5', 'S_INFO_UMTS.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File6', 'UMTS_PARAM_NOKIA_WBTS.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File7', 'UMTS_PARAM_NOKIA_WCEL.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'Num', 2 )
        cfgParser.set( 'bypasslist_' + vendor, 'File1', 'UMTS_PARAM_NOKIA_WBTS.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File2', 'UMTS_PARAM_NOKIA_WCEL.csv' )
    
    if tech == 'LTE' and vendor == 'ERICSSON':
        cfgParser.set( 'checklist_' + vendor, 'Num', 2 )
        cfgParser.set( 'checklist_' + vendor, 'File1', 'S_INFO_LTE.csv' )
        cfgParser.set( 'checklist_' + vendor, 'File2', 'LTE_PARAM_ERIC_4G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'Num', 73 )
        cfgParser.set( 'filelist_' + vendor, 'File1', 'LTE_PARAM_ERIC_3G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File2', 'LTE_PARAM_ERIC_4G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File3', 'LTE_PARAM_ERIC_ENBEQUIPMENT.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File4', 'LTE_PARAM_ERIC_ENBEQ_ANR_FUNCTION_EUTRAN.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File5', 'LTE_PARAM_ERIC_ENBEQ_BALANCING_FUNC.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File6', 'LTE_PARAM_ERIC_ENBEQ_ENODEBFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File7', 'LTE_PARAM_ERIC_ENBEQ_INTERFREQ_LOAD_BAL.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File8', 'LTE_PARAM_ERIC_ENBEQ_MOB_CTRLCOV.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File9', 'LTE_PARAM_ERIC_ENBEQ_QCIPROFILEPREDEFINED.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File10', 'LTE_PARAM_ERIC_ENBEQ_ROHC.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File11', 'LTE_PARAM_ERIC_ENBEQ_SRVCC_TO_UTRAN.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File12', 'LTE_PARAM_ERIC_EUTRANFREQREL.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File13', 'LTE_PARAM_ERIC_LCELL_CONFIG_A1_PRIM.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File14', 'LTE_PARAM_ERIC_LCELL_CONFIG_A1_SEC.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File15', 'LTE_PARAM_ERIC_LCELL_CONFIG_A5.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File16', 'LTE_PARAM_ERIC_LCELL_CONFIG_A5_ANR.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File17', 'LTE_PARAM_ERIC_LCELL_CONFIG_B2_CDMA_2000.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File18', 'LTE_PARAM_ERIC_LCELL_CONFIG_B2_GERAN.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File19', 'LTE_PARAM_ERIC_LCELL_CONFIG_B2_UTRA.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File20', 'LTE_PARAM_ERIC_LCELL_CONF_A4.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File21', 'LTE_PARAM_ERIC_LCELL_CONF_B1_GERAN.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File22', 'LTE_PARAM_ERIC_LCELL_CONF_B1_UTRA.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File23', 'LTE_PARAM_ERIC_LCELL_CONF_B2_CDMA_20001XRTT.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File24', 'LTE_PARAM_ERIC_LCELL_CONF_EUTRA_BEST_ANR.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File25', 'LTE_PARAM_ERIC_LCELL_CON_CSFB_CDMA2000.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File26', 'LTE_PARAM_ERIC_LCELL_ECF_UMC.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File27', 'LTE_PARAM_ERIC_LCELL_EUTRAN_CELL_FDD.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File28', 'LTE_PARAM_ERIC_LCELL_REPCONFEUTRA_BCL.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File29', 'LTE_PARAM_ERIC_LCELL_REPCONF_SCELL_A1A2.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File30', 'LTE_PARAM_ERIC_LCELL_REPCONF_SCELL_A4.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File31', 'LTE_PARAM_ERIC_LCELL_REPCONF_SCELL_A6.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File32', 'LTE_PARAM_ERIC_LCELL_REPCONF_SEARCH.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File33', 'LTE_PARAM_ERIC_LCELL_REP_CF_EUTRAINTFRQ.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File34', 'LTE_PARAM_ERIC_LCELL_REP_CONF_INTER_RAT_LB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File35', 'LTE_PARAM_ERIC_LCELL_SUB4_CONFCSFBGERAN.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File36', 'LTE_PARAM_ERIC_LCELL_SUB4_RCONFCSFBUTRA.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File37', 'LTE_PARAM_ERIC_LCELL_UE_MEAS_CONTROL.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File38', 'LTE_PARAM_ERIC_LTECELL.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File39', 'LTE_PARAM_ERIC_MMEACCESS.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File40', 'LTE_PARAM_ERIC_TERMPOINTTOENB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File41', 'LTE_PARAM_ERIC_UTRANFREQREL.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File42', 'S_INFO_LTE.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File43', 'S_INFO_LTE2.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File44', 'LTE_PARAM_ERIC_LTECELL_3.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File45', 'LTE_PARAM_ERIC_AIRIFLOADPROFILE.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File46', 'LTE_PARAM_ERIC_ANRFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File47', 'LTE_PARAM_ERIC_ANRFUNCTIONEUTRAN.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File48', 'LTE_PARAM_ERIC_ANRFUNCTIONUTRAN.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File49', 'LTE_PARAM_ERIC_ANRPCICONFLICTDRXPROFILE.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File50', 'LTE_PARAM_ERIC_BBPROCESSINGRESOURCE.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File51', 'LTE_PARAM_ERIC_CARRIERAGGREGATIONFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File52', 'LTE_PARAM_ERIC_CELLSLEEPNODEFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File53', 'LTE_PARAM_ERIC_ENODEBFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File54', 'LTE_PARAM_ERIC_EXTERNALENODEBFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File55', 'LTE_PARAM_ERIC_EXTERNALEUTRANCELLFDD.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File56', 'LTE_PARAM_ERIC_EXTERNALUTRANCELLFDD.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File57', 'LTE_PARAM_ERIC_FLEXIBLEQOSFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File58', 'LTE_PARAM_ERIC_LOADBALANCINGFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File59', 'LTE_PARAM_ERIC_MDTCONFIGURATION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File60', 'LTE_PARAM_ERIC_MIMOSLEEPFUNCTION.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File61', 'LTE_PARAM_ERIC_PAGING.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File62', 'LTE_PARAM_ERIC_PLMNINFO.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File63', 'LTE_PARAM_ERIC_QCIPROFILEPREDEFINED.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File64', 'LTE_PARAM_ERIC_RCS.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File65', 'LTE_PARAM_ERIC_REPORTCONFIGA5SOFTLOCK.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File66', 'LTE_PARAM_ERIC_REPORTCONFIGELCA1A2.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File67', 'LTE_PARAM_ERIC_REPORTCONFIGSEARCH.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File68', 'LTE_PARAM_ERIC_RRC.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File69', 'LTE_PARAM_ERIC_SCIPROFILE.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File70', 'LTE_PARAM_ERIC_SECTORCARRIER.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File71', 'LTE_PARAM_ERIC_SIGNALINGRADIOBEARER.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File72', 'LTE_PARAM_ERIC_TIMERPROFILE.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File73', 'LTE_PARAM_ERIC_UEMEASCONTROL.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'Num', 30 )
        cfgParser.set( 'bypasslist_' + vendor, 'File1', 'LTE_PARAM_ERIC_LTECELL_3.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File2', 'LTE_PARAM_ERIC_AIRIFLOADPROFILE.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File3', 'LTE_PARAM_ERIC_ANRFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File4', 'LTE_PARAM_ERIC_ANRFUNCTIONEUTRAN.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File5', 'LTE_PARAM_ERIC_ANRFUNCTIONUTRAN.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File6', 'LTE_PARAM_ERIC_ANRPCICONFLICTDRXPROFILE.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File7', 'LTE_PARAM_ERIC_BBPROCESSINGRESOURCE.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File8', 'LTE_PARAM_ERIC_CARRIERAGGREGATIONFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File9', 'LTE_PARAM_ERIC_CELLSLEEPNODEFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File10', 'LTE_PARAM_ERIC_ENODEBFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File11', 'LTE_PARAM_ERIC_EXTERNALENODEBFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File12', 'LTE_PARAM_ERIC_EXTERNALEUTRANCELLFDD.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File13', 'LTE_PARAM_ERIC_EXTERNALUTRANCELLFDD.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File14', 'LTE_PARAM_ERIC_FLEXIBLEQOSFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File15', 'LTE_PARAM_ERIC_LOADBALANCINGFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File16', 'LTE_PARAM_ERIC_MDTCONFIGURATION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File17', 'LTE_PARAM_ERIC_MIMOSLEEPFUNCTION.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File18', 'LTE_PARAM_ERIC_PAGING.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File19', 'LTE_PARAM_ERIC_PLMNINFO.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File20', 'LTE_PARAM_ERIC_QCIPROFILEPREDEFINED.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File21', 'LTE_PARAM_ERIC_RCS.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File22', 'LTE_PARAM_ERIC_REPORTCONFIGA5SOFTLOCK.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File23', 'LTE_PARAM_ERIC_REPORTCONFIGELCA1A2.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File24', 'LTE_PARAM_ERIC_REPORTCONFIGSEARCH.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File25', 'LTE_PARAM_ERIC_RRC.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File26', 'LTE_PARAM_ERIC_SCIPROFILE.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File27', 'LTE_PARAM_ERIC_SECTORCARRIER.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File28', 'LTE_PARAM_ERIC_SIGNALINGRADIOBEARER.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File29', 'LTE_PARAM_ERIC_TIMERPROFILE.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File30', 'LTE_PARAM_ERIC_UEMEASCONTROL.csv' )
        
    if tech == 'LTE' and vendor == 'NOKIA':
        cfgParser.set( 'checklist_' + vendor, 'Num', 2 )
        cfgParser.set( 'checklist_' + vendor, 'File1', 'S_INFO_LTE.csv' )
        cfgParser.set( 'checklist_' + vendor, 'File2', 'LTE_PARAM_NOKIA_4G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'Num', 13 )
        cfgParser.set( 'filelist_' + vendor, 'File1', 'LTE_PARAM_NOKIA_2G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File2', 'LTE_PARAM_NOKIA_3G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File3', 'LTE_PARAM_NOKIA_4G_NB.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File4', 'PARAM_NOKIA_ENBEQUIPMENT.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File5', 'PARAM_NOKIA_HOG.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File6', 'PARAM_NOKIA_HOIF.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File7', 'PARAM_NOKIA_HOW.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File8', 'PARAM_NOKIA_LTECELL.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File9', 'PARAM_NOKIA_MMEACCESS.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File10', 'PARAM_NOKIA_REDRT.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File11', 'S_INFO_LTE.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File12', 'LTE_PARAM_NOKIA_LTECELL_2.csv' )
        cfgParser.set( 'filelist_' + vendor, 'File13', 'LTE_PARAM_NOKIA_ENBEQUIPMENT_2.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'Num', 2 )
        cfgParser.set( 'bypasslist_' + vendor, 'File1', 'LTE_PARAM_NOKIA_LTECELL_2.csv' )
        cfgParser.set( 'bypasslist_' + vendor, 'File2', 'LTE_PARAM_NOKIA_ENBEQUIPMENT_2.csv' )


def main(path, lZone, module):
    # create lock
    curr_py_path = os.path.realpath(__file__) # current running file - abs path
    curr_py_dir, curr_py_filename = os.path.split(curr_py_path)  # current folder and file - abs path
    curr_py_dir_arr = curr_py_dir.split(os.path.sep)
    try:
        os.makedirs( os.path.sep + os.path.join( 'tmp', curr_py_dir_arr[len(curr_py_dir_arr) - 1] + '-' + curr_py_filename + '.lock') )
    except OSError:
        return 1

    utilities.copyFile( os.path.join(curr_py_dir, 'MarketAbbr.cfg'), path )
    '''
    cfgParser = ConfigParser.ConfigParser()
    # The following will tell cfgParserParser to keep case-sensitive names
    cfgParser.optionxform = str
    '''

    tech = ''
    region = ''
    market = ''
    vendor = ''
    oFile = ''
    mktCnt = 1  # NEED TO BE DELETED & MOVED' + os.path.sep + 'UNCOMMENT BELOW
    mAbbrFile = ConfigParser.ConfigParser()
    mAbbrFile.read( os.path.join(path, 'MarketAbbr.cfg') )


	# Crawl through MarketAbbr.cfg to find markets need to be combined based on mAbbrFile & include TEMPLATE folder
	
    for dirName, subdirList, fileList in os.walk( path ):
        myArr = dirName.split(os.path.sep)
        depth = dirName.count(os.path.sep) - path.count(os.path.sep)
        #print ( 'LINE 166 -- ' + '[' + str(depth) + ']' + '[' + dirName + ']' )
        
        if depth == 1:
            if (len(myArr[ len(myArr) - 1 ].split('-')) > 1):
                tech = myArr[ len(myArr) - 1 ].split('-')[1]
            else:
                tech = myArr[ len(myArr) - 1 ]
            #mktCnt = 1
                
        '''
        '''
        if depth == 2:
            # RAWFILES & SITEFILES & TEMPLATE folders
            if myArr[ len(myArr) - 1 ] == 'SITEFILES':
                for market, marketAbbr in mAbbrFile.items( 'DEFAULT' ):
                    if string.find( marketAbbr, '|' ) > -1:
                        marketAbbr = marketAbbr[:string.find(marketAbbr, '|')]
                        for f in fileList:
                            mktName = string.upper(string.replace(market, '.', ''))
                            if string.find( f, mktName + '.csv' ) > -1:
                                # Getting the right Site/Atoll file for the market
                                #print ( 'LINE MarketMapping - [{}] [{}] [{}]'.format( mktName, marketAbbr, f ) )
                                tFile = os.path.join( dirName, string.replace(f, mktName, marketAbbr) )
                                #print( 'LINE tFile -- [{}] - [{}]'.format( mktName, tFile ) )
                                if utilities.fileExist( tFile ):
                                    #print( 
                                    cmd = ( 
                                    'awk \'FNR > 1\' {} >> {}'.format( os.path.join(dirName, f), tFile ) )
                                else:
                                    #print( 
                                    cmd = ( 
                                    'cat {} > {}'.format( os.path.join(dirName, f), tFile ) )
                                ret = utilities.subprocessShellExecute( cmd )
            
        if depth == 3:
            region = myArr[ len(myArr) - 1 ]
            regionPath = dirName
            
        if depth == 4:
            market = myArr[ len(myArr) - 1 ]
            
            try:
                marketAbbr = mAbbrFile.get( 'DEFAULT', market )
                if string.find( marketAbbr, '|' ) > -1:
                    isPartOfBiggerMkt = True
                    marketAbbr = marketAbbr[:string.find( marketAbbr, '|' )]
                    combinedMktPath = os.path.join(regionPath, marketAbbr)
                else:
                    isPartOfBiggerMkt = False
                    combinedMktPath = dirName
            except (ConfigParser.NoOptionError):
                marketAbbr = market
                
        if depth == 5: # Vendor Level
            vendor = myArr[ len(myArr) - 1 ]
            
            if isPartOfBiggerMkt:
                
                for subdir in subdirList:
                    try:
                        os.makedirs(
                        #print( 'LINE 204 -- ' +
                        os.path.join(combinedMktPath, vendor, market+'-'+subdir) )
                    except OSError:
                        dummy = 1
                        
                    #print ( 'LINE Copy subdir -- ' + 
                    cmd = (
                    'cp -p -r {} {}'\
                        .format( os.path.join(dirName, subdir, '*'), os.path.join(combinedMktPath, vendor, market+'-'+subdir) ) )
                    ret = utilities.subprocessShellExecute( cmd )
                
                #print ( 'LINE Remove folder -- ' + 
                cmd = (
                'rm -rf {}'\
                    .format( os.path.join(regionPath, market) ) )
                ret = utilities.subprocessShellExecute( cmd )
                #break
            
            #print ( 'LINE Copy templates -- ' + 
            cmd = (
            'cp -p -r {} {}'\
                .format( os.path.join(curr_py_dir, 'TEMPLATE_' + tech + '_' + vendor), os.path.join(combinedMktPath, vendor) ) )
            ret = utilities.subprocessShellExecute( cmd )
            '''
            '''

    
    # Vendor & Tech specifics here
    
    for dirName, subdirList, fileList in os.walk( path ):
        myArr = dirName.split(os.path.sep)
        depth = dirName.count(os.path.sep) - path.count(os.path.sep)
        #print ( 'LINE 165 -- ' + '[' + str(depth) + ']' + '[' + dirName + ']' )
        #break
        
        if depth == 1:
            if (len(myArr[ len(myArr) - 1 ].split('-')) > 1):
                tech = myArr[ len(myArr) - 1 ].split('-')[1]
            else:
                tech = myArr[ len(myArr) - 1 ]
            #mktCnt = 1
                
        '''
        if depth == 2:
            # RAWFILES & SITEFILES & TEMPLATE folders
        '''
            
        if depth == 3:
            region = myArr[ len(myArr) - 1 ]
            
        if depth == 4:
            market = myArr[ len(myArr) - 1 ]
            
            try:
                marketAbbr = mAbbrFile.get( 'DEFAULT', market )
                if string.find( marketAbbr, ':' ) > -1:
                    marketAbbr = marketAbbr[:string.find(marketAbbr, ':')]
            except (ConfigParser.NoOptionError):
                marketAbbr = market
            
            if mktCnt != 1:
                cfgParser.write( cfgFile )
                cfgFile.close()
                ziph.write( os.path.join(path, 'Market.ini'), 'Market.ini' )
                ziph.close()
                
            #cfgFile = open(path + os.path.sep + 'Market' + str(mktCnt) + '.ini', 'w')
            cfgFile = open(os.path.join(path, 'Market.ini'), 'w')
            mktCnt += 1
            
            cfgParser = ConfigParser.ConfigParser()
            # The following will tell cfgParserParser to keep case-sensitive names
            cfgParser.optionxform = str

            print( 'Found directory: %s %s' % (tech + '-' + region + '-' + market + '-' + myArr[ len(myArr) - 1 ], str(depth)) )
            #print( str( datetime.datetime.today() ) + ' ' + str( datetime.datetime.now().time() ) )
            try:
                # add the settings to the structure of the file, and lets write it out...
                # Note to self: for DEFAULT section name, no need to add the section, it is by default there
                cfgParser.set( 'DEFAULT', 'Num', 0 )
                cfgParser.set( 'DEFAULT', "Count", 0 )
                cfgParser.set( 'DEFAULT', 'Tech', '' )
                cfgParser.set( 'DEFAULT', 'Region', '' )
                cfgParser.set( 'DEFAULT', 'Market', '' )
                cfgParser.set( 'DEFAULT', 'VendorCount', 0 )
                cfgParser.set( 'DEFAULT', 'VendorN', '' )
                
                cfgParser.add_section( 'main' )
                cfgParser.set( 'main', 'Company', 'TMO' )
                cfgParser.set( 'main', 'Tech', tech )
                cfgParser.set( 'main', 'Region', region )
                cfgParser.set( 'main', 'Market', market )
                cfgParser.set( 'main', 'VendorCount', '' )
            except (ConfigParser.DuplicateSectionError):
                dummy = 1
            
            i = 0
            for myDir in subdirList:
                i+=1
                vendor = myDir
                try:
                    cfgParser.add_section( 'checklist_' + vendor )
                    cfgParser.add_section( 'bypasslist_' + vendor )
                    cfgParser.add_section( 'filelist_' + vendor )
                    cfgParser.add_section( 'bsc_' + vendor )
                except (ConfigParser.DuplicateSectionError):
                    dummy = 1
                
                cfgParser.set( 'bsc_' + vendor, 'Num', '' )
                cfgParser.set( 'main', 'Vendor' + str(i), myDir )
                setStaticInfo( cfgParser, tech, vendor )    # Call a method to set static info for the config file
            cfgParser.set( 'main', 'VendorCount', str(i) )
            ziph = zipfile.ZipFile( os.path.join((lZone if lZone != '' else path), tech + 'SINFO_' + ('MULTIVENDOR' if i>1 else vendor) + '_' + re.sub( '[-]', '', str( datetime.datetime.today() )[:10] ) + '_' + re.sub( '[:.]', '', str( datetime.datetime.now().time() )[:12] ) + '_TMO-' + marketAbbr + '_Result.zip'), 'w', zipfile.ZIP_DEFLATED )
            
            for dirs, subdirs, files in os.walk( string.replace( dirName[:string.find( dirName, region )], 'RAWFILES', 'SITEFILES' ) ):
                for f in files:
                    # Getting the right Site/Atoll file for the market
                    if string.find( f, '-' + string.replace(market, '.', '') + '.csv' ) > -1:
                        fileNm = string.upper( string.replace( f, '-' + string.replace(market, '.', ''), '' ) )
                        fileNm = fileNm[:string.find(fileNm, '.')] + string.lower( fileNm[string.find(fileNm, '.'):] )
                        print( 'LINE Site file: ' + os.path.join(dirs, f + ' - [' + fileNm + ']') )
                        ziph.write( os.path.join(dirs, f), fileNm )
            '''            
            for dirs, subdirs, files in os.walk( path + os.path.sep + 'TOKENs' ):
                for f in files:
                    # Getting the right Token file for the market
                    if string.find( f, market + '_' + tech + 'SINFO_Token.txt' ) > -1:
                        ziph.write( dirs + os.path.sep + f, 'Token.txt' )  #NEED TO BE CHANGED
                        print( 'LINE 257: ' + dirs + os.path.sep + f )
            '''
            tokenFile = os.path.join(path, '..', '..', marketAbbr + '_' + tech + 'SINFO_Token.txt')
            if os.path.exists( tokenFile ):
                ziph.write( tokenFile, 'Token.txt' )
            else:
                tokenFile = os.path.join(path, 'TOKENs', market + '_' + tech + 'SINFO_Token.txt')
                if os.path.exists( tokenFile ):
                    ziph.write( tokenFile, 'Token.txt' )
            
        if depth == 5:
            i = 0
            for myDir in subdirList:
                i+=1
                cfgParser.set( 'bsc_' + myArr[ len(myArr) - 1 ], 'bsc' + str(i), myDir )
            cfgParser.set( 'bsc_' + myArr[ len(myArr) - 1 ], 'Num', str(i) )
            
        if depth == 6:
            for fname in fileList:
                ziph.write( os.path.join( dirName, fname ), os.path.join( myArr[ len(myArr) - 4 ], myArr[ len(myArr) - 3 ], myArr[ len(myArr) - 2 ], myArr[ len(myArr) - 1 ], fname ) )
    
    try:
        cfgFile
    except NameError:
        dummy = 1
    else:
        cfgParser.write( cfgFile )
        cfgFile.close()
        ziph.write( os.path.join(path, 'Market.ini'), 'Market.ini' )
        ziph.close()
    
    # remove lock
    utilities.removeDir( os.path.sep + os.path.join( 'tmp', curr_py_dir_arr[len(curr_py_dir_arr) - 1] + '-' + curr_py_filename + '.lock') )
    
    return 0
    

############# main #############
if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else '.'
    outPath = sys.argv[2] if len(sys.argv) > 2 else path
    module = sys.argv[3] if len(sys.argv) > 3 else 'SINFO'
    ret = main(path, outPath, module)
    print ret