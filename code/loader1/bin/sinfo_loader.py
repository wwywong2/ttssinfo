#!/usr/bin/python

import sys, getopt # used for cmd arg, sys.exit

import os # os related
import glob # pathname

import shutil # move file

import ConfigParser # read ini

from optparse import OptionParser # parse input arg
from optparse import OptionGroup

import time # This is required to include time module.
from datetime import datetime # datetime module

#import MySQLdb # db related








# main function
# sample call: ./bin/sinfo_loader.py -H localhost -P 3306 --dbname sinfo_tmo_nyc_temp -u root -ptts1234 "" "" ""
#
# main return code:
# 0 - no error
# 1 - essential file missing, ini file data problem
# 2 - argument errors, directory errors
# 3 - db related errors
# 4 - db export errors
# 5 - all folder empty (no data) error
def main():

	# set some key var
	curr_py_path = os.path.realpath(__file__) # current running file - abs path
	curr_py_dir, curr_py_filename = os.path.split(curr_py_path)  # current file and folder - abs path
	#curr_py_dir = os.path.dirname(curr_py_path)

	#print "param:", sys.argv[1:]
	
	usage_str = """usage: %prog [options] \"input_location\" \"staging_location\" \"archive_location\" \"export_location\"

Mandatory arguments:
  input_location:	input directory for result zip
                 	(pass \"\" for default: ./bin/../result/)
  staging_location:	working directory for unzipping and loading files into interim db
                   	(pass \"\" for default: ./bin/../staging/)
  archive_location:	archive directory for moving zip(with logs) after interim db loader finishes
                   	(pass \"\" for default: ./bin/../archive/)
  export_location:	export directory for moving zip(with logs) after interim db data exported
                   	(pass \"\" for default: ./bin/../export/)"""

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
	'''
	# if need add group options
	group = OptionGroup(parser, "Dangerous Options",
                    "Caution: use these options at your own risk.  "
                    "It is believed that some of them bite.")
	group.add_option("-g", action="store_true", help="Group option.")
	parser.add_option_group(group)
	'''
	(options, args) = parser.parse_args()
	
	
	#print "# of arg:", len(sys.argv)
	if len(args) < 4: # check mandatory param
		parser.error("Too few mandatory arguments")		
	

	# set basic param
	bin_dir = curr_py_dir
	db_dir = bin_dir + "/db"
	path_7z = "7za"
	path_db2csv = bin_dir + "/db2csv.py"
	market_ini = "Market.ini"
	token_file = "Token.txt"

	# set mandatory param
	result_dir = args[0] if (len(args) >= 1 and args[0] != "") else bin_dir+"/../result"
	staging_dir = args[1] if (len(args) >= 2 and args[1] != "") else bin_dir+"/../staging"
	archive_dir = args[2] if (len(args) >= 3 and args[2] != "") else bin_dir+"/../archive"
	export_dir = args[3] if (len(args) >= 4 and args[3] != "") else bin_dir+"/../export"
	# set optional param
	dbname = options.dbname
	hostname = options.hostname
	port = options.port
	username = options.username
	pwd = options.pwd



	# startup info
	print """
-------------------------------------------
Startup info
-------------------------------------------"""
	print "input location:", result_dir
	print "staging location:", staging_dir
	print "archive location:", archive_dir
	print "export location:", export_dir
	print "db name:", dbname
	print "hostname:", hostname
	print "port:", port
	print "username:", username
	print "password:", pwd
	print

	# check if option argument/value is missing - assuming the argument does not start with '-'
	#avail_option = ("-d", "--dbname", "-H", "--hostname", "-p", "-u", "-w")
	for key, value in vars(options).items():
		if len(str(value)) > 0 and str(value)[0] == '-': # if arguments are one of the option
			parser.error("ambiguous option argument detected. Possibly missing argument before \"%s\"." % value)
		
	

	# check mandatory param
	# result folder
	result_dir = result_dir.rstrip('/')
	if result_dir == '':
		parser.print_help()
		sys.exit(2)
	elif not os.path.isdir(result_dir):  # error out if not exist
		print '[%s] \"%s\" does not exist!' % (
			time.strftime("%Y-%m-%d %H:%M:%S"), result_dir)
		print "[%s] Process terminated." % (
			time.strftime("%Y-%m-%d %H:%M:%S"))   
		sys.exit(2)

	# staging folder
	staging_dir = staging_dir.rstrip('/')
	if staging_dir == '':
		parser.print_help()
		sys.exit(2)
	elif not os.path.isdir(staging_dir): # create if not exist
		try:	
			os.mkdir(staging_dir)
		except:
			print '[%s] Failed to create folder \"%s\"!' % (
				time.strftime("%Y-%m-%d %H:%M:%S"), staging_dir)
			print "[%s] Process terminated." % (
				time.strftime("%Y-%m-%d %H:%M:%S"))   
			sys.exit(2)
	else:
		# no cleanup
		#sys.stdout.flush() # flush buffer before executing next line
		#os.system("rm -rf "+staging_dir)
		#os.mkdir(staging_dir)
		pass

	# archive folder
	archive_dir = archive_dir.rstrip('/')
	if archive_dir == '':
		parser.print_help()
		sys.exit(2)
	elif not os.path.isdir(archive_dir): # create if not exist
		try:
			os.mkdir(archive_dir)		
		except:
			print '[%s] Failed to create folder \"%s\"!' % (
				time.strftime("%Y-%m-%d %H:%M:%S"), archive_dir)
			print "[%s] Process terminated." % (
				time.strftime("%Y-%m-%d %H:%M:%S"))   
			sys.exit(2)
	else:
		# no cleanup
		#sys.stdout.flush() # flush buffer before executing next line
		#os.system("rm -rf "+archive_dir)
		#os.mkdir(archive_dir)
		pass
		
	# export folder
	export_dir = export_dir.rstrip('/')
	if export_dir == '':
		parser.print_help()
		sys.exit(2)
	elif not os.path.isdir(export_dir): # create if not exist
		try:
			os.mkdir(export_dir)		
		except:
			print '[%s] Failed to create folder \"%s\"!' % (
				time.strftime("%Y-%m-%d %H:%M:%S"), export_dir)
			print "[%s] Process terminated." % (
				time.strftime("%Y-%m-%d %H:%M:%S"))   
			sys.exit(2)
	else:
		# no cleanup
		#sys.stdout.flush() # flush buffer before executing next line
		#os.system("rm -rf "+export_dir)
		#os.mkdir(export_dir)
		pass



	# check empty input folder
	if os.listdir(result_dir + '/') == []:		
		print "[%s] \"%s\" is empty or does not exist." % (
			time.strftime("%Y-%m-%d %H:%M:%S"), result_dir)
		print "[%s] Process terminated." % (
			time.strftime("%Y-%m-%d %H:%M:%S"))   		
		sys.exit(2)



	# check file exist
	if len(glob.glob(result_dir + "/*SINFO_*.zip")) <= 0:  # no file
		print "[%s] \"%s\" does not contain any recognizable zip." % (
			time.strftime("%Y-%m-%d %H:%M:%S"), result_dir)
		print "[%s] Process terminated." % (
			time.strftime("%Y-%m-%d %H:%M:%S"))   		
		sys.exit(2)




	# extract file to be process
	for file_inputzip in glob.glob(result_dir + "/*.zip"):		
		# get essential parts from filename
		#print file_inputzip
		file_inputzip_dir, file_inputzip_file = os.path.split(file_inputzip)
		# GSMSINFO_MULTIVENDOR_20170224_131232.805_TMO-NEW_YORK_Result.zip
		# UMTSSINFO_ERICSSON_20170210_131233.807_TMO-LAS_VEGAS_Result.zip
		# LTESINFO_ERICSSON_20170209_131232.965_TMO-LAS_VEGAS_Result.zip
		file_inputzip_file_parts = file_inputzip_file.split("_")
		# not getting company and tech from filename, get it from Market.ini
		#print file_inputzip_file_parts
		#curr_company = file_inputzip_file_parts[2]
		#curr_company_lower = curr_company.lower()
		#curr_tech = file_inputzip_file_parts[0]
		#curr_tech_lower = curr_tech.lower()
		curr_module = file_inputzip_file_parts[1]
		curr_date = file_inputzip_file_parts[2]
		curr_id = file_inputzip_file_parts[3]
		curr_rest = file_inputzip_file_parts[4]
		#print curr_company, '-', curr_tech, '-', curr_module, '-', curr_date, '-', curr_id, '-', curr_rest

		# new staging location
		file_inputzip_staging = staging_dir + "/" + file_inputzip_file
		file_inputzip_staging_dir = staging_dir + "/" + file_inputzip_file.split(".zip")[0]

		# setup input config
		work_location = {
			'path_7z': path_7z,
			'archive_dir': archive_dir,
			'export_dir': export_dir,
			'inputfile_dir': file_inputzip_staging_dir,
			'inputfile_path': file_inputzip_staging,
			'inputfile_name': file_inputzip_file
		}

		# remove original before moving
		if os.path.exists(file_inputzip_staging):
			os.remove(file_inputzip_staging)

		# move file to staging
		print "[%s] Moving result zip file \"%s\" ==>> \"%s/\"\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip, staging_dir)   
		shutil.move(file_inputzip, staging_dir)
	
		# cleanup folder before extract
		sys.stdout.flush() # flush buffer before executing next line
		os.system("rm -rf "+file_inputzip_staging_dir) 		
		
		exec_str = "%s x -y -bb -o\"%s\" \"%s\"" % (
			path_7z, file_inputzip_staging_dir, file_inputzip_staging)
		print "[%s] Unzipping file \"%s\" ==>> \"%s/\"\n%s" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging, file_inputzip_staging_dir, exec_str)   
		sys.stdout.flush() # flush buffer before executing next line
		os.system(exec_str)

		print "[%s] Unzipping file \"%s\" completed.\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging)   


		# do checking
		# 1. make sure key files are there (Market.ini, Token.txt, sitefile)		
		token_file_path = file_inputzip_staging_dir+"/"+token_file
		if not os.path.exists(token_file_path): # this check file exist
			print "[%s] Essential file \"%s\" missing!" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), token_file_path)
			print "[%s] Process terminated.\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))   	
			cleanupAndExit(1, work_location)

		market_ini_path = file_inputzip_staging_dir+"/"+market_ini
		if not os.path.exists(market_ini_path): # this check file exist
			print "[%s] Essential file \"%s\" missing!" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), market_ini_path)   
			print "[%s] Process terminated.\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))   	
			cleanupAndExit(1, work_location)


		# 1b. read ini and check site file
		iniparser = ConfigParser.SafeConfigParser()
		iniparser.read(file_inputzip_staging_dir + "/" + market_ini)
		try:
			curr_company = iniparser.get('main', 'Company')
			curr_company_lower = curr_company.lower()
			curr_tech = iniparser.get('main', 'Tech')
			curr_tech_lower = curr_tech.lower()
		except (ConfigParser.NoSectionError, ConfigParser.NoOptionError):
			print "[%s] Error getting main data from ini\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))
			#need cleanup
			cleanupAndExit(1, work_location)

			
		sitefile_ini_path = "%s/ATOLL_%s_EXPORT.csv" % (file_inputzip_staging_dir,
			curr_tech)
		if not os.path.exists(sitefile_ini_path): # this check file exist
			print "[%s] Essential file \"%s\" missing!" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), sitefile_ini_path)   
			print "[%s] Process terminated.\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))   	
			cleanupAndExit(1, work_location)
		if (os.path.getsize(sitefile_ini_path)/1024.0) < 1.0:
			print "[%s] Essential file \"%s\" empty / too small (< 1 KB)!" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), sitefile_ini_path)   
			print "[%s] Process terminated.\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))   	
			cleanupAndExit(1, work_location)



		# 2. read ini and crawl folder to check for files existence and > 1 KB		
		try:
			region = iniparser.get('main', 'Region')
			market = iniparser.get('main', 'Market')
			vendorCount = int(iniparser.get('main', 'VendorCount'))
			vendorList = []
			# get vendor
			for i in xrange(1,vendorCount+1):
				currVendor = iniparser.get('main', 'Vendor'+str(i))
				vendorList.append(currVendor)
		except (ConfigParser.NoSectionError, ConfigParser.NoOptionError):
			print "[%s] Error getting main data from ini\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))
			#need cleanup
			cleanupAndExit(1, work_location)
		
		# check folder
		bSomeFolderValid = False
		try:
			for currVendor in vendorList: # for each vendor start checking for all empty error
				bscCount = int(iniparser.get('bsc_'+currVendor, 'Num'))
				for j in xrange(1,bscCount+1): 			
					currBsc = iniparser.get('bsc_'+currVendor, 'bsc'+str(j))
					currCheckFolder = "%s/%s/%s/%s/%s" % (file_inputzip_staging_dir,
						region, market, currVendor, currBsc)
					print "[%s] Checking folder \"%s\"..." % (
						time.strftime("%Y-%m-%d %H:%M:%S"), currCheckFolder)
					error, err_msg = validateDataFolder(currCheckFolder, iniparser, currVendor)
					print "Return code: %s - %s\n" % (error, err_msg)
					if error == 0: # no error
						bSomeFolderValid = True
		except (ConfigParser.NoSectionError, ConfigParser.NoOptionError):
			print "[%s] Error getting bsc data from ini\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))
			#need cleanup
			cleanupAndExit(1, work_location)

		# if all folders are empty, report error and quit
		if not bSomeFolderValid:
			# WES_TEST: call api to report problem - all folder empty
			print "[%s] All folders are empty!" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))
			print "[%s] Process terminated.\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))
			cleanupAndExit(5, work_location)





		# 3. wipe db before running
		mysqlexec_stmt = "SET sql_warnings = 1; SET sql_log_bin = 0; SET sql_safe_updates = 0; \
CALL \`%s\`.\`delete_data_%s\`('%s');" % (dbname, curr_tech_lower, dbname)
		#print mysqlexec_stmt
		mysqlexec = "mysql -h \"%s\" -P %d -u %s -p%s %s -t -vvv -e \"%s\" > \"%s/log01_delete_data_%s.log\" 2>&1" % (
			hostname, port, username, pwd, dbname, mysqlexec_stmt, file_inputzip_staging_dir, curr_tech_lower)
		#print mysqlexec
		print "[%s] Wipe db before insert...\n%s\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), mysqlexec)
		sys.stdout.flush() # flush buffer before executing next line		
		retcode = os.system(mysqlexec)
		retcode >>= 8 # 00000011 00000000 (high byte status; low byte signal)
		#print "\nsystem return code:", retcode
		if (retcode != 0):
			print "[%s] Wipe db failed! mysql return code %d\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), retcode)
			os.system("echo \"Error in wiping db in calling delete_data_%s\n\" > \"%s\"" % (
				curr_tech_lower, file_inputzip_staging_dir+"/db_error.log"))
			cleanupAndExit(3, work_location)

		# 4. insert site file
		# prep template files
		atollsql = db_dir + "/load_data_%s_atoll_template.sql" % (curr_tech_lower)
		atollsqlOut = file_inputzip_staging_dir + "/load_data_%s_atoll.sql" % (curr_tech_lower)
		atollsqlLog = file_inputzip_staging_dir + "/log02a_load_data_%s_atoll.log" % (curr_tech_lower)
		atollprocLog = file_inputzip_staging_dir + "/log02b_load_data_%s_%s_atoll_proc.log" % (curr_tech_lower, curr_company_lower)
		replaceStrInFile(atollsql, atollsqlOut, "[##DataDir##]", file_inputzip_staging_dir)
		
		mysqlexec_stmt = "source %s;" % (atollsqlOut)
		mysqlexec = "mysql -h \"%s\" -P %d -u %s -p%s %s -t -vvv -e \"%s\" > \"%s\" 2>&1" % (
			hostname, port, username, pwd, dbname, mysqlexec_stmt, atollsqlLog)
		print "[%s] Inserting site data...\n%s\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), mysqlexec)
		sys.stdout.flush() # flush buffer before executing next line	
		retcode = os.system(mysqlexec)
		retcode >>= 8 # 00000011 00000000 (high byte status; low byte signal)
		#print "\nsystem return code:", retcode
		if (retcode != 0):
			print "[%s] Inserting site data failed! mysql return code %d\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), retcode)
			os.system("echo \"Error inserting site data in calling %s\n\" > \"%s\"" % (
				atollsqlOut, file_inputzip_staging_dir+"/db_error.log"))
			cleanupAndExit(3, work_location)
		else:
			print "[%s] Inserting site data completed.\n" % (time.strftime("%Y-%m-%d %H:%M:%S"))

		# 4b. call proc for site data
		mysqlexec_stmt = "SET sql_warnings = 1; SET sql_log_bin = 0; SET sql_safe_updates = 0; \
SET tx_isolation = 'READ-COMMITTED'; CALL load_data_%s_%s_atoll();" % (curr_tech_lower, curr_company_lower)
		mysqlexec = "mysql -h \"%s\" -P %d -u %s -p%s %s -t -vvv -e \"%s\" > \"%s\" 2>&1" % (
			hostname, port, username, pwd, dbname, mysqlexec_stmt, atollprocLog)
		print "[%s] Calling procedure for site data...\n%s\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), mysqlexec)
		sys.stdout.flush() # flush buffer before executing next line
		retcode = os.system(mysqlexec)
		retcode >>= 8 # 00000011 00000000 (high byte status; low byte signal)			
		#print "\nsystem return code:", retcode
		if (retcode != 0):
			print "[%s] Calling procedure failed! mysql return code %d\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), retcode)
			os.system("echo \"Error calling procedure load_data_%s_%s_atoll()\n\" > \"%s\"" % (
				curr_tech_lower, curr_company_lower, file_inputzip_staging_dir+"/db_error.log"))
			cleanupAndExit(3, work_location)
		else:
			print "[%s] Calling procedure completed.\n" % (time.strftime("%Y-%m-%d %H:%M:%S"))


		# 5. start appending data...
		for currVendor in vendorList: # for each vendor start appending data

			currVendor_lower = currVendor.lower()
			bscCount = int(iniparser.get('bsc_'+currVendor, 'Num'))
			for j in xrange(1,bscCount+1): 			
				currBsc = iniparser.get('bsc_'+currVendor, 'bsc'+str(j))
				currCheckFolder = "%s/%s/%s/%s/%s" % (file_inputzip_staging_dir,
					region, market, currVendor, currBsc)
				print "[%s] Combining files in folder \"%s\"..." % (
					time.strftime("%Y-%m-%d %H:%M:%S"), currCheckFolder)
				error, err_msg = mergeDataFolder(currCheckFolder, iniparser, currVendor, file_inputzip_staging_dir)
				print "Return code: %s - %s\n" % (error, err_msg)
				if error != 0: # have error
					pass
			
			# 6. after combine, file is at folder already, just call script to load into db
			print "[%s] File combined. Calling insert to db for %s..." % (
				time.strftime("%Y-%m-%d %H:%M:%S"), currVendor)
				
			# prep template files
			loadersql = db_dir + "/load_data_%s_%s_%s_template.sql" % (curr_tech_lower, curr_company_lower, currVendor_lower)
			loadersqlOut = file_inputzip_staging_dir + "/load_data_%s_%s_%s.sql" % (curr_tech_lower, curr_company_lower, currVendor_lower)
			loadersqlLog = file_inputzip_staging_dir + "/log03_load_data_%s_%s_%s_sqlldr.log" % (curr_tech_lower, curr_company_lower, currVendor_lower)
			procsqlLog = file_inputzip_staging_dir + "/log04_load_data_%s_%s_%s_proc.log" % (curr_tech_lower, curr_company_lower, currVendor_lower)
			replaceStrInFile(loadersql, loadersqlOut, "[##DataDir##]", file_inputzip_staging_dir)
			
			mysqlexec_stmt = "source %s;" % (loadersqlOut)
			mysqlexec = "mysql -h \"%s\" -P %d -u %s -p%s %s -t -vvv -e \"%s\" > \"%s\" 2>&1" % (
				hostname, port, username, pwd, dbname, mysqlexec_stmt, loadersqlLog)
			print "[%s] Inserting switch data...\n%s\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), mysqlexec)
			sys.stdout.flush() # flush buffer before executing next line
			retcode = os.system(mysqlexec)
			retcode >>= 8 # 00000011 00000000 (high byte status; low byte signal)
			#print "\nsystem return code:", retcode
			if (retcode != 0):
				print "[%s] Inserting switch data failed! mysql return code %d\n" % (
					time.strftime("%Y-%m-%d %H:%M:%S"), retcode)
				os.system("echo \"Error inserting switch data in calling %s\n\" > \"%s\"" % (
					loadersqlOut, file_inputzip_staging_dir+"/db_error.log"))
				cleanupAndExit(3, work_location)
			else:
				print "[%s] Inserting switch data completed.\n" % (time.strftime("%Y-%m-%d %H:%M:%S"))
			
			# call proc for recovery			
			mysqlexec_stmt = "SET sql_warnings = 1; SET sql_log_bin = 0; SET sql_safe_updates = 0; \
SET tx_isolation = 'READ-COMMITTED'; CALL load_data_%s_%s_%s();" % (curr_tech_lower, curr_company_lower, currVendor_lower)
			mysqlexec = "mysql -h \"%s\" -P %d -u %s -p%s %s -t -vvv -e \"%s\" > \"%s\" 2>&1" % (
				hostname, port, username, pwd, dbname, mysqlexec_stmt, procsqlLog)
			print "[%s] Calling procedure for data recovery...\n%s\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), mysqlexec)
			sys.stdout.flush() # flush buffer before executing next line
			retcode = os.system(mysqlexec)
			retcode >>= 8 # 00000011 00000000 (high byte status; low byte signal)			
			#print "\nsystem return code:", retcode
			if (retcode != 0):
				print "[%s] Calling procedure failed! mysql return code %d\n" % (
					time.strftime("%Y-%m-%d %H:%M:%S"), retcode)
				os.system("echo \"Error calling procedure load_data_%s_%s_%s()\n\" > \"%s\"" % (
					curr_tech_lower, curr_company_lower, currVendor_lower, file_inputzip_staging_dir+"/db_error.log"))
				cleanupAndExit(3, work_location)
			else:
				print "[%s] Calling procedure completed.\n" % (time.strftime("%Y-%m-%d %H:%M:%S"))
			
		
		# end of for currVendor in vendorList
			



		# 7. call query_to_csv to dump out final file
		# call another py to dump to csv
		exec_str = "%s -H %s -P %d -d %s -u %s -p %s -l \"%s\" \"%s/db2csv_%s_%s_sinfo.ini\" \"%s\" 2>&1" % (
			path_db2csv, hostname, port, dbname, username, pwd, "log05_db2csv.log",
			db_dir, curr_tech_lower, curr_company_lower,
			file_inputzip_staging_dir+"/EXPORT")
		print "[%s] Dumping csv files...\n%s\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), exec_str)  	
		sys.stdout.flush() # flush buffer before executing next line
		retcode = os.system(exec_str)		
		retcode >>= 8 # 00000011 00000000 (high byte status; low byte signal)
		#print "\nsystem return code:", retcode
		if (retcode != 0):
			print "[%s] Dumping csv files failed with return code %d\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"), retcode)				
			cleanupAndExit(4, work_location)
		else:
			print "[%s] Dumping csv files completed.\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))

		# call proc dump db status
		mysqlexec_stmt = "SELECT concat('SINFO','|',group_concat(distinct(DATE_FORMAT(ifnull(rec_date,processed_date),'%%Y-%%m-%%d'))),'|',group_concat(distinct UPPER(status)),'|',group_concat(distinct UPPER(message))) load_status FROM s_info_%s_status WHERE table_name = 'SINFO' AND DATE_FORMAT(processed_date, '%%Y-%%m-%%d') = ( select max(DATE_FORMAT(processed_date, '%%Y-%%m-%%d')) from s_info_%s_status);" % (
			curr_tech_lower, curr_tech_lower)
		mysqlexec = "mysql -h \"%s\" -P %d -u %s -p%s %s -s -N -e \"%s\" > \"%s\"" % (
			hostname, port, username, pwd, dbname, mysqlexec_stmt, file_inputzip_staging_dir+"/EXPORT/db_load_status.log")
		print "[%s] Calling procedure for dumping db status...\n%s\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), mysqlexec)
		sys.stdout.flush() # flush buffer before executing next line
		retcode = os.system(mysqlexec)
		retcode >>= 8 # 00000011 00000000 (high byte status; low byte signal)			
		#print "\nsystem return code:", retcode
		#if (retcode != 0):
		#	print "[%s] Calling procedure failed! mysql return code %d\n" % (
		#		time.strftime("%Y-%m-%d %H:%M:%S"), retcode)
		#	os.system("echo \"Error calling procedure load_data_%s_%s_%s()\n\" > \"%s\"" % (
		#		curr_tech_lower, curr_company_lower, currVendor_lower, file_inputzip_staging_dir+"/db_error.log"))
		#	cleanupAndExit(3, work_location)
		#else:
		print "[%s] Calling procedure completed.\n" % (time.strftime("%Y-%m-%d %H:%M:%S"))

		# copy bypass file to export folder
		try:
			filecount = int(iniparser.get('bypasslist_'+currVendor, 'Num'))
			if filecount > 0:
				for i in xrange(1,filecount+1):
					filecheck = iniparser.get('bypasslist_'+currVendor, 'File'+str(i))
					filecheck_path = file_inputzip_staging_dir + "/" + filecheck
					bypassfile_path = file_inputzip_staging_dir + "/EXPORT/" + filecheck.split('.csv')[0] + ".txt"

					# copy file
					if os.path.exists(filecheck_path):
						print "[%s] Copying files \"%s\" to \"%s\"..." % (
							time.strftime("%Y-%m-%d %H:%M:%S"), filecheck_path, bypassfile_path)
						appendStr(filecheck_path, bypassfile_path, time.strftime("%Y-%m-%d 00:00:00"), True, "rec_date", "|")

		except (ConfigParser.NoSectionError, ConfigParser.NoOptionError):
			print "[%s] Bypass data not available from ini, ignore.\n" % (
				time.strftime("%Y-%m-%d %H:%M:%S"))

		
		# 7a. zip another new zip just including log files (log,sql) and the output csv
		file_inputzip_staging_csvexport = file_inputzip_staging_dir + "/" + file_inputzip_file
		exec_str = "%s u -bd -bb \"%s\" \"%s/EXPORT/*.txt\" \"%s/EXPORT/*.log\" \"%s/load_data_*.sql\" \"%s/*.log\"  \"%s/*.ini\" \"%s/Token.txt\"" % (
			path_7z, file_inputzip_staging_csvexport, file_inputzip_staging_dir, file_inputzip_staging_dir, 
			file_inputzip_staging_dir, file_inputzip_staging_dir, file_inputzip_staging_dir, file_inputzip_staging_dir)
		print "[%s] Zipping data (.txt, .sql, .log) in \"%s/EXPORT\" ==>> \"%s\"\n%s" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging_dir, file_inputzip_staging_csvexport, exec_str)
		sys.stdout.flush() # flush buffer before executing next line		
		os.system(exec_str)
		print "[%s] Zip file \"%s\" completed.\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging_csvexport)		
		# move zip to a dropbox regarding to corresponding market
		print "[%s] Moving export zip file \"%s\" ==>> \"%s/\"\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging_csvexport, export_dir)   
		shutil.move(file_inputzip_staging_csvexport, export_dir + "/" + file_inputzip_file)
	
	
	
			
		
		# 8. do cleanup
		# zip log and txt file back to result zip
		#exec_str = "%s u -r -bd -bb \"%s\" \"%s/*_PARAM_*.txt\" \"%s/load_data_*.sql\" \"%s/*.log\"" % (
		#	path_7z, file_inputzip_staging, file_inputzip_staging_dir, file_inputzip_staging_dir, file_inputzip_staging_dir)
		exec_str = "%s u -r -bd -bb \"%s\" \"%s/*.csv\" \"%s/*.txt\" \"%s/load_data_*.sql\" \"%s/*.log\"" % (
			path_7z, file_inputzip_staging, file_inputzip_staging_dir, file_inputzip_staging_dir, file_inputzip_staging_dir, file_inputzip_staging_dir)
		print "[%s] Zipping data (.csv, .txt, .sql, .log) in \"%s\" ==>> \"%s\"\n%s" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging_dir, file_inputzip_staging, exec_str)
		sys.stdout.flush() # flush buffer before executing next line		
		os.system(exec_str)

		print "[%s] Zip file \"%s\" completed.\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging)   
		
		# move result zip file from staging to archive
		print "[%s] Moving result zip file \"%s\" ==>> \"%s/\"\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging, archive_dir)   
		shutil.move(file_inputzip_staging, archive_dir + "/" + file_inputzip_file)
	
		# cleaning up staging folder
		print "[%s] Cleaning up output files...\n" % (
			time.strftime("%Y-%m-%d %H:%M:%S"))  		
		sys.stdout.flush() # flush buffer before executing next line
		os.system("rm -rf "+file_inputzip_staging_dir)

	# end of for file_inputzip in glob.glob(result_dir + "/*.zip"):



	print "[%s] Process completed.\n" % (
		time.strftime("%Y-%m-%d %H:%M:%S"))  	

	sys.exit(0)
# end of main







# cleanupAndExit
'''
work_location = {
	'path_7z': path_7z,
	'archive_dir': archive_dir,
	'export_dir': export_dir,
	'inputfile_dir': file_inputzip_staging_dir,
	'inputfile_path': file_inputzip_staging,
	'inputfile_name': file_inputzip_file
}
'''
def cleanupAndExit(errcode, work_location):


	# 7a. zip another new zip just including log files (log,sql) and the output csv
	file_inputzip_staging_csvexport = work_location['inputfile_dir'] + "/" + work_location['inputfile_name']
	exec_str = "%s u -bd -bb \"%s\" \"%s/EXPORT/*.txt\" \"%s/EXPORT/*.log\" \"%s/load_data_*.sql\" \"%s/*.log\"  \"%s/*.ini\" \"%s/Token.txt\"" % (
		work_location['path_7z'], file_inputzip_staging_csvexport, 
		work_location['inputfile_dir'], work_location['inputfile_dir'], 
		work_location['inputfile_dir'], work_location['inputfile_dir'],
		work_location['inputfile_dir'], work_location['inputfile_dir'])
	print "[%s] Zipping data (.txt, .sql, .log) in \"%s/EXPORT\" ==>> \"%s\"\n%s" % (
		time.strftime("%Y-%m-%d %H:%M:%S"), work_location['inputfile_dir'], file_inputzip_staging_csvexport, exec_str)
	sys.stdout.flush() # flush buffer before executing next line		
	os.system(exec_str)
	print "[%s] Zip file \"%s\" completed.\n" % (
		time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging_csvexport)		
	# move zip to a dropbox regarding to corresponding market
	print "[%s] Moving export zip file \"%s\" ==>> \"%s/\"\n" % (
		time.strftime("%Y-%m-%d %H:%M:%S"), file_inputzip_staging_csvexport, work_location['export_dir'])   
	shutil.move(file_inputzip_staging_csvexport, work_location['export_dir'] + "/" + work_location['inputfile_name'])





	# 8. do cleanup
	# zip log and txt file back to result zip
	exec_str = "%s u -r -bd -bb \"%s\" \"%s/*.csv\" \"%s/*.txt\" \"%s/load_data_*.sql\" \"%s/*.log\"" % (
		work_location['path_7z'], work_location['inputfile_path'], work_location['inputfile_dir'], work_location['inputfile_dir'], work_location['inputfile_dir'], work_location['inputfile_dir'])
	print "[%s] Zipping data (.csv, .txt, .sql, .log) in \"%s\" ==>> \"%s\"\n%s" % (
		time.strftime("%Y-%m-%d %H:%M:%S"), work_location['inputfile_dir'], work_location['inputfile_path'], exec_str)
	sys.stdout.flush() # flush buffer before executing next line		
	os.system(exec_str)

	print "[%s] Zip file \"%s\" completed.\n" % (
		time.strftime("%Y-%m-%d %H:%M:%S"), work_location['inputfile_path'])   
	
	# move result zip file from staging to archive
	print "[%s] Moving result zip file \"%s\" ==>> \"%s/\"\n" % (
		time.strftime("%Y-%m-%d %H:%M:%S"), work_location['inputfile_path'], work_location['archive_dir'])   
	shutil.move(work_location['inputfile_path'], work_location['archive_dir'] + "/" + work_location['inputfile_name'])

	# cleaning up staging folder
	print "[%s] Cleaning up output files...\n" % (
		time.strftime("%Y-%m-%d %H:%M:%S"))  		
	sys.stdout.flush() # flush buffer before executing next line
	os.system("rm -rf "+work_location['inputfile_dir'])
	
	print "[%s] Process completed with error code %d.\n" % (
		time.strftime("%Y-%m-%d %H:%M:%S"), errcode)

	sys.exit(errcode)
# end of cleanupAndExit



# validateDataFolder - test folder for valid data
# code: 
#   11 - folder not exist
#	12 - cannot get file count
#	13 - cannot get file list
#	14 - file missing or empty/too small
def validateDataFolder(folder, iniparser, vendor):
	error = 0
	err_msg = "no error"

	mainFileMissing = False
	otherFileMissing = False
	mainFileEmpty = False # < 1 KB
	otherFileEmpty = False # < 1 KB
		
	if not os.path.isdir(folder):  # error out if not exist
		error = 11; err_msg = "error: folder \"%s\" not exist" % folder
	else: # folder ok
		try:			
			filecount = int(iniparser.get('checklist_'+vendor, 'Num'))
			if filecount <= 0:
				error = 12; err_msg = "error getting file count"

			# check each file for existence	
			for i in xrange(1,filecount+1): # assuming file1 is always the mandatory file, file2 on is optional
				filecheck = iniparser.get('checklist_'+vendor, 'File'+str(i))
				filecheck_path = folder + "/" + filecheck						
				if i == 1:
					if not os.path.exists(filecheck_path): # this check file exist
						mainFileMissing = True
						break
					elif (os.path.getsize(filecheck_path)/1024.0) < 1.0: # size < 1 KB
						mainFileEmpty = True
						break
				else:				
					if not os.path.exists(filecheck_path): # this check file exist
						otherFileMissing = True
						break
					elif (os.path.getsize(filecheck_path)/1024.0) < 1.0: # size < 1 KB
						otherFileEmpty = True
						break
			
			if mainFileMissing or otherFileMissing:
				error = 14; err_msg = "error: file \"%s\" not exist" % filecheck_path
			elif mainFileEmpty or otherFileMissing:
				error = 14; err_msg = "error: file \"%s\" empty / too small (< 1 KB)" % filecheck_path
			'''
			elif otherFileMissing:
				error = 15; err_msg = "error: file \"%s\" not exist" % filecheck_path
			elif otherFileEmpty:
				error = 15; err_msg = "error: file \"%s\" empty / too small (< 1 KB)" % filecheck_path
			'''

		except (ConfigParser.NoSectionError, ConfigParser.NoOptionError):
			error = 13; err_msg = "error getting file list"
		

	return error, err_msg
# end of validateDataFolder




# mergeDataFolder - merge data from each folder to output folder
# code: 
#   21 - folder not exist
#	22 - cannot get file count
#	23 - cannot get file list
def mergeDataFolder(folder, iniparser, vendor, outputFolder):
	error = 0
	err_msg = "no error"

	mainFileMissing = False
	otherFileMissing = False
	
		
	if not os.path.isdir(folder):  # error out if not exist
		error = 21; err_msg = "error: folder \"%s\" not exist" % folder
	else: # folder ok
		try:			
			filecount = int(iniparser.get('filelist_'+vendor, 'Num'))
			if filecount <= 0:
				error = 22; err_msg = "error getting file count"

			# check each file for existence	
			for i in xrange(1,filecount+1): # assuming file1 is always the mandatory file, file2 on is optional
				filecheck = iniparser.get('filelist_'+vendor, 'File'+str(i))
				filecheck_path = folder + "/" + filecheck
				
				originalfile_path = outputFolder + "/" + filecheck
				if not os.path.exists(originalfile_path): # new creation
					if os.path.exists(filecheck_path):
						# copy file
						shutil.copy(filecheck_path, originalfile_path)
					
				else: # append
					if os.path.exists(filecheck_path):
						linenum = 0
						# combine file (append w/ skip first line)
						outfile = open(originalfile_path, 'ab')
						with open(filecheck_path, 'rb') as infile:
							for line in infile:
								linenum += 1
								if linenum > 1: # skip first line
									outfile.write(line)
							outfile.close()
						
				
			
			
		except (ConfigParser.NoSectionError, ConfigParser.NoOptionError):
			error = 23; err_msg = "error getting file list"
		

	return error, err_msg
# end of mergeDataFolder





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



# appendStr - replace string in a text file
def appendStr(infile, outfile, appStr, haveHeader, headerStr, delim):

	rowNum = 0
	if infile == outfile:
		bReplace = True
		newoutfile = outfile + ".tmp"
	else:
		bReplace = False
		newoutfile = outfile

	try:
		with open(infile, 'r') as f1:
			with open(newoutfile, 'w') as f2:
				for line in f1:
					if haveHeader == True and rowNum == 0: # first line is header
						f2.write(line.rstrip("\r\n") + delim + headerStr + '\n')
					else:
						f2.write(line.rstrip("\r\n") + delim + appStr + '\n')
					rowNum += 1
	finally:		
		f1.close()
		f2.close()


	if bReplace:
		# remove orig file
		os.remove(infile)
		# rename file
		os.rename(newoutfile, outfile)
	
	return
# end of appendStr





# crawlFolderTestFileOrFolder - test function
def crawlFolderTestFileOrFolder():
	
	# crawl folder 1 - and test if it's a folder or file
	for filename in os.listdir(archive_dir + '/'):
		filename = archive_dir+'/'+filename
		if os.path.isfile(filename):
			print filename, "is file"
		else:
			print filename, "is folder"

	# crawl folder 2 - and test if it's a folder or file
	for filename in glob.glob(archive_dir + '/*'):
		if os.path.isfile(filename):
			print filename, "is file"
		else:
			print filename, "is folder"

	return
# end of crawlFolderTestFileOrFolder





# call main()
if __name__ == "__main__":
	# execute only if run as a script
	main()


