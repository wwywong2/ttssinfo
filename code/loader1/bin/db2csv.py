#!/usr/bin/python

import os
import sys
import platform
import logging

import mysql.connector
#import pyodbc

import ConfigParser

import time # This is required to include time module.
from datetime import datetime # datetime module

from optparse import OptionParser # parse input arg
from optparse import OptionGroup



# functions #######################################################################
def ReadMarketIni(ini_market):
	conf=ConfigParser.ConfigParser()
	conf.read(ini_market)
	ret=dict()
	markets=conf.sections()
	for market in markets:
		rncColl=list()
		a=market.split('-')
		if len(a) < 3:
			continue
		for item,val in conf.items(market):
			if ( item.find('conditiona') != -1 ):
				rncColl.append(val);
		if len(rncColl) > 0 :
			ret.update({a[1] : rncColl})		
	return ret

def WriteSqlRow(row,f):
	arr = list()
	for item in row:
		arr.append(str(item));
	f.write(dlm.join(arr) + '\n' )

# replaceStrInFile - replace string in a text file
def replaceStrInFile(infile, outfile, oldstr, newstr):
	
	if infile == outfile:
		bReplace = True
		newoutfile = outfile + ".tmp"
	else:
		bReplace = False
		newoutfile = outfile
		
	

	try:
		with open(infile, 'rb') as f1:
			with open(newoutfile, 'wb') as f2:
				for line in f1:
				    f2.write(line.replace(oldstr, newstr))		
	finally:		
		f1.close()
		f2.close()
	
	if bReplace:
		# remove orig file
		os.remove(infile)
		# rename file
		os.rename(newoutfile, outfile)
	
	return
# end of replaceStrInFile




# main start #######################################################################



usage_str = """usage: %prog [options] \"ini_path\" \"out_dir\"

Mandatory arguments:
  ini_path:	ini location
  out_dir:	output directory"""

parser = OptionParser(usage=usage_str, version="%prog 1.0")
parser.add_option("-d", "--dbname", action="store", dest="dbname",
	default='testdb', help="database name (default: %default)")
parser.add_option("-H", "--hostname", action="store", dest="hostname",
	default='localhost', help="host name (default: %default)")
parser.add_option("-P", action="store", type="int", dest="port",
	default=3306, help="port (default: %default)")
parser.add_option("-u", "--username", action="store", dest="username",
	default='tts', help="user ID (default: %default)")
parser.add_option("-p", "--password", action="store", dest="pwd",
	default='tts1234', help="password (default: %default)")
parser.add_option("-l", "--logfilename", action="store", dest="logfilename",
	default='db2csv.log', help="log filename (default: %default)")
(options, args) = parser.parse_args()

# check params
#print "# of arg:", len(sys.argv)
if len(args) < 2: # check mandatory param
	parser.error("Too few mandatory arguments")		

# set mandatory param
ini_path = args[0] if (len(args) >= 1) else ""
out_path = args[1] if (len(args) >= 2) else ""

if (ini_path == '' or out_path == ''):
	parser.error("Mandatory arguments cannot be empty")	


# set optional param
dbname = options.dbname
hostname = options.hostname
port = options.port
username = options.username
pwd = options.pwd
logfilename = options.logfilename

# setup output dir
if not os.path.isdir(out_path):
	print '[%s] Creating dir: \"%s\"\n' % (
		time.strftime("%Y-%m-%d %H:%M:%S"), out_path)
	os.makedirs(out_path)
	
# setup log file
logname = out_path + "/" + logfilename
logging.basicConfig(filename=logname, filemode='w', level=logging.INFO,
	format='%(asctime)s: %(levelname)s: %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p') # filemode='w' will start fresh every time


logging.info("""%s start...
hostname: %s
port: %s
dbname: %s
username: %s
pwd: %s
ini_path: %s
out_path: %s""" % (sys.argv[0], hostname, port, dbname, username, pwd, ini_path, out_path))

	
# read ini
config = ConfigParser.ConfigParser()
config.read(ini_path)

# write ini sample
'''
config.add_section('newsection') # need to add section before add keys otherwise exception
config.set('newsection','newkey', 'newvalue')
with open(ini_path, 'wb') as configfile: # write to file (can be the same file for overwrite)
	config.write(configfile)
'''

#sects = config.sections()
#connstr=config.get('s_info_gsm','connectionString') # only first section have connectionString: currently not used
connstr=''
#logging.debug('connstr: \"%s\"' % connstr)

#GET connection
user = username
password = pwd
mysystem = platform.system()
if mysystem == 'Linux':
	sqldriver='{FreeTDS};TDS_Version=8.0'	
else:
	sqldriver='{SQL Server}'
#conn_string = 'DSN=%s;UID=%s;PWD=%s;' % (dsn, user, password)
#conn_string = 'DRIVER=%s;%sUID=%s;PWD=%s' % (sqldriver,connstr,user,password)
conn_string = 'DRIVER=%s;%s' % (sqldriver,connstr)
#logging.debug('conn_string: \"%s\"' % conn_string )

#cnxn = pyodbc.connect(conn_string)
cnxn = mysql.connector.connect(
	host=hostname,
	port=port,
    user=username,
    passwd=pwd,    
    db=dbname)

'''
# sample MySQL connection code
mydb = mysql.connector.connect(
	host='localhost',
    user='root',
    passwd='tts1234',
    db='sinfo_tmo_nyc_temp'
	)
cursor = mydb.cursor()
cursor.execute('SELECT cell, siteid FROM gsm_atoll limit 10;')
for (cell, siteID) in cursor:
	print cell, siteID
'''

all_query=dict();
for sect in config.sections():
	fname = config.get(sect,'filename')
	#out = config.get(sect,'outputPath') # not get it from ini anymore
	out = out_path
	hdr = config.get(sect,'bPrintHeader').lower()
	sql = config.get(sect,'sqlQuery')
	dlm = config.get(sect,'delimiter')
	if dlm == '\\t': dlm = '\t'

	if not os.path.isdir(out): # safeguard: create dir if not exist
		logging.info('Creating dir: \"%s\"' % (out))		
		os.makedirs(out)
	
	outfile=out+'/'+fname
	
	logging.info("dumping section %s (%s)..." % (sect, outfile))
	logging.debug("ini data: fname:%s\tout:%s\thdr:%s\tdlm:%s" % (fname, out, hdr, dlm))
	logging.debug("ini data: sql:%s" % (sql))
	
	f = None
	try:
		f=open(outfile,'w')
		cursor = cnxn.cursor()
		cursor.execute(sql)

		if (hdr == 'true'): # print header or not
			header = [ header[0] for header in cursor.description ]
			WriteSqlRow(header,f)

		for row in cursor: # print body
			WriteSqlRow(row,f)

		logging.info("dumping section %s completed.\n" % (sect))
		
	except (mysql.connector.Error, mysql.connector.OperationalError), err:				
		logging.error("(%d, \"%s\")\n" % (err[0], err[1]))
		
	finally:		
		if f is not None: f.close()
		cursor.close()
	
	# replace 'None' with empty
	replaceStrInFile(outfile, outfile, "None", "")


	
# end of for sect in config.sections():




''' old code....
for sect in config.sections():
	fname = config.get(sect,'filename')
	ini = config.get(sect,'autoSiteIniPath')
	out = config.get(sect,'outputPath')
	hdr = config.get(sect,'bPrintHeader')
	sql = config.get(sect,'sqlQuery')
	dlm = config.get(sect,'delimiter')
	#marketColl = ReadMarketIni('AutoSite_TMOBILEERIC.ini')
	marketColl = ReadMarketIni(ini)
	#print sql
	for market,rncColl in marketColl.items():
		logging.info(sect + ":" + market)
		for rnc in rncColl:
			mysql=sql.replace('<RNC>',rnc)
			#cursor.execute(mysql)
			outpath=out.replace('<MARKET_TAG>',market)
			outpathp=outpath.replace('/<RNC_TAG>',"")
			if not os.path.isdir(outpathp):
				print 'creating dir: ',outpathp
				os.makedirs(outpathp)
			outpath=outpath.replace('<RNC_TAG>',rnc)
			if not os.path.isdir(outpath):
				print 'creating dir: ',outpath
				os.makedirs(outpath)
			outfile=outpath+'/'+fname
			try:
				cursor = cnxn.cursor()
				cursor.execute(mysql)
				row = cursor.fetchone()
				if row:	 
					f=open(outfile,'w')
					header = [ header[0] for header in cursor.description ]
					WriteSqlRow(header,f)
					WriteSqlRow(row,f)
					for row in cursor:
						WriteSqlRow(row,f)
					f.close()
			except (pyodbc.Error, pyodbc.OperationalError), err:
				logging.debug(err)
				cursor.close()
				continue
'''
logging.info("process completed.")
cnxn.close()

