#!/bin/python
from os import listdir
import os.path
import zipfile
import sys
import subprocess
import datetime
import shutil
import fnmatch
import uuid
import json
import pycurl
import cStringIO
import logging
from shutil import copyfile

class DBLoader():
	def __init__(self,cmd,inputdir,archivedir,dbdir):
		#self.appname = appname
		self.dgen = dict()
		self.ddb = dict()
		self.cmd = cmd
		self.inputdir = os.path.realpath(inputdir)
		self.dbdir = os.path.realpath(dbdir)
		self.curdir = os.path.dirname(os.path.realpath(__file__))
		self.tmp = os.path.join(self.dbdir,'tmp')
		self.archivedir = os.path.realpath(archivedir)
		self.bin = os.path.join(self.dbdir,'bin')
		#self.log = open(os.path.join(self.dbdir,'dbloader.log'),'w')
	
	def GetResultFiles(self):
		zipColl=[]
		for f in listdir(self.inputdir):
			fpath = os.path.join(self.inputdir,f)
			if zipfile.is_zipfile(fpath):
				zipColl.append(f)
			else:
				logging.debug("{} is not a zip file".format(f))
		return zipColl

	def tolog(self,message, toConsle = True):
    		try:
        		self.log.write("[{}] {}\n".format(DBLoader.GetTimeStamp(), message))
    		except:
        		return False
    
    		if toConsle:
        		print (message)

    		return True
	
	@staticmethod
	def unzip(src_zip,dest_dir):
  		with zipfile.ZipFile(src_zip,'r') as zf:
     			#print(zf.namelist())
    			zf.extractall(dest_dir)

	@staticmethod
	def GetTimeStamp():
		return datetime.datetime.now().strftime("%Y%m%d%H%M%S")
	
	@staticmethod
	def CheckFile(zipfile_handle,myfile):
		try:
			info = zipfile_handle.getinfo(myfile)
		except KeyError:
			return 0
		else:
			return 1
	@staticmethod
	def CheckInUse(fn):
		# if file is access by other process
		# lsof can only be executed by root
		# Need full path in command when call it from crontab and python
		cmd = ['/usr/sbin/lsof', fn]
		ret = subprocess.call(cmd)
		# lsof return 0: find file is accessed by a process
		return ret
	
	@staticmethod
	def GetTokenInfo(content):
		#update parse status to db and load result to db
		#Token format
		#GENERALINFO:<APP>|<VND>|<RECDATE>|<CARR>|<REG>|<MKT>|<MKTFULL>|<TECH>
		#            LTEKPI|ERIC|2016-07-08|ATT|NORTHEAST REGION|CT|Connecticut|LTE
		#DBCONN:<HOST>|<USER>|<PASSWD>|<SCHEMA>|<TABLE>
		#       TTSSVR71|user_boinc|Boinc@94588|kpi_att_ny|kpi_process_status
		dgen=dict()
		ddb=dict()
      		lines = content.split('\n')
      		sgen=lines[0].split(':')[1]
      		a1=sgen.split('|')
      		dgen={'app':a1[0],'vnd':a1[1],'recdate':a1[2],'carr':a1[3],'reg':a1[4],'mkt':a1[5],'mktfull':a1[6],'tech':a1[7]}	
      		sdbconn=lines[1].split(':')[1]
      		a2=sdbconn.split('|')
      		ddb={'host':a2[0],'user':a2[1],'passwd':a2[2],'schema':a2[3],'table':a2[4]}
		return dgen,ddb
		
	@staticmethod
	def subprocessShellExecute(cmd):
		retObj = {}
		p = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
		out, err = p.communicate()
		if p.returncode != 0:
			# an error happened!
			err_msg = "%s. Code: %s" % (err.strip(), p.returncode)
			retObj['ret'] = False
			retObj['msg'] = err_msg  
		else:
			retObj['ret'] = True
			if len(err): # warnning
				retObj['msg'] = err
			else:
				retObj['msg'] = "ok"
			retObj['output'] = out
		#p.kill()
		return retObj
	
	@staticmethod	
	def UpdateStatusToDB(kind,ddb,dgen,msg,status,fileid,runid=-1,hldate=""):
		ts = DBLoader.GetTimeStamp()   
		mymsg=msg.replace("'","-") 
		commentstr = "{}-{}-{}-{} - {}".format(dgen['vnd'],dgen['tech'],dgen['mkt'],dgen['app'],mymsg)
		if kind == 'update':
			strSQL = "update {} set comments = '{}', process_status = '{}', last_updated_date = '{}'  where module_name = '{}' and file_name like '{}'".format(ddb['table'],commentstr, status,ts,dgen['app'],fileid)
		elif kind == 'insert':
			#Insert
			strSQL="insert into {} (ID, HL_DATE, FILE_NAME, MODULE_NAME, PROCESS_STATUS, COMMENTS, CREATION_DATE, LAST_UPDATED_DATE, MGR_RUN_ID) values ( '{}', '{}', '{}', '{}', '{}', '{}-{}-{}-{} - {}', '{}', '{}', '{}' )".format(ddb['table'],fileid,hldate,fileid,dgen['app'],status,dgen['vnd'],dgen['tech'],dgen['mkt'],dgen['app'],mymsg,ts,ts,runid)
			insertcmd="mysql -h {} -u {} -p{} -D {} -e \"call {}.new_partition('{}', '{}', '{}')\"".format(ddb['host'],ddb['user'],ddb['passwd'],ddb['schema'],ddb['schema'],ddb['schema'],dgen['recdate'],dgen['tech'])
			logging.debug("SQL Insert cmd:{}".format(insertcmd))
			ret=DBLoader.subprocessShellExecute(insertcmd)
		        logging.debug("retcode:{},retmsg:{}".format(ret['ret'],ret['msg']))
			
		elif kind == 'delete':
			#Delete
			strSQL="delete from {} where module_name = '{}' and file_name like '{}' and mgr_run_id = '-1'".format(ddb['table'],dgen['app'],fileid)
		else:
			return

		cmd = "mysql -h {} -u {} -p{} -D {} -e \"{}\"".format(ddb['host'],ddb['user'],ddb['passwd'],ddb['schema'],strSQL)
		logging.debug("SQL Upadte cmd:{}".format(cmd))
		ret = DBLoader.subprocessShellExecute(cmd)
		logging.debug("retcode:{},retmsg:{}".format(ret['ret'],ret['msg']))
		return ret
	
	def LoadDataToDB(self,myzipfile):
		exename = self.cmd
		myexe = os.path.join(self.bin,exename)
		filename = os.path.basename(myzipfile)
		fileid=filename.replace("_result","")
		datadir = os.path.dirname(myzipfile)
		#run dbloader in bash
		# ltekpi_db.sh  "input_location" "archive_location" "schema_name" "server_name" "port"  "user_name" "password"  
		bashcmd = "{} \"{}\" \"{}\" \"{}\" \"{}\" \"3306\" \"{}\" \"{}\"".format(myexe,datadir,self.archivedir,self.ddb['schema'],self.ddb['host'],self.ddb['user'],self.ddb['passwd'])
		logging.debug("run bash command : [{}]".format(bashcmd))

		ret=DBLoader.subprocessShellExecute(bashcmd)
		
		if not ret['ret']: 
			#Load result failed
			#send result to db
			status = 'Failed'
			msg = "DB Loading Failed"
			DBLoader.UpdateStatusToDB('update',self.ddb,self.dgen,msg,status,fileid)
			logging.error("DB Loading Failed")
		else:
			#DB return but need to check if it is no error
			#locate archive name
			myresultzip = os.path.join(self.archivedir,filename)
			if not os.path.isfile(myresultzip):
				logging.error("Cannot find the result file: {}".format(myresultzip))
				return
			with zipfile.ZipFile(myresultzip) as zf:
				dirname=os.path.basename(os.path.splitext(myresultzip)[0])
				logging.debug("Checking result file: {}".format(myresultzip))
				dberrfile=os.path.join(dirname,'db_error.log')
				logging.debug("Check if it has db error: {}".format(dberrfile))
				if DBLoader.CheckFile(zf,dberrfile) == 1:
					msg=zf.read(dberrfile)
					if msg: #not empty=> loading error
						msg2=msg.replace('|','-')
						status = "Loading Error: {}".format(msg2)
						logging.error("DB Loading error:{}".format(msg))
						ret=DBLoader.UpdateStatusToDB('update',self.ddb,self.dgen,"",status,fileid,-1)
						logging.debug("UpdateDB retcode:{},retmsg:{}".format(ret['ret'],ret['msg']))
						return	
				statusfile=os.path.join(dirname,'db_load_status.log')
				logging.debug("Checking status file: {} ...".format(statusfile))
				if DBLoader.CheckFile(zf,statusfile) == 1:
					lines=zf.read(statusfile).split('\n')
					for line in lines:
						if not line:
							continue
						info = line.split('|')
						if len(info) > 3:
							logging.debug("Loading status:{} - {}".format(info[2],info[3]))
							ret=DBLoader.UpdateStatusToDB('insert',self.ddb,self.dgen,info[3],info[2],fileid,info[0],info[1])
							logging.debug("UpdateDB retcode:{},retmsg:{}".format(ret['ret'],ret['msg']))
					#delete a record with runind=-1, which inserted before parsing	
					ret=DBLoader.UpdateStatusToDB('delete',self.ddb,self.dgen,"","",fileid)
					logging.debug("UpdateDB retcode:{},retmsg:{}".format(ret['ret'],ret['msg']))
					
				else:
					logging.error("Cannot find status file: {}. Update DB status: Loading Error.".format(statusfile))
					msg = 'No Data'
					status = 'Loading Error'
					logging.debug("DB Loading error:{}".format(msg))
					ret=DBLoader.UpdateStatusToDB('update',self.ddb,self.dgen,msg,status,fileid)
					logging.debug("UpdateDB retcode:{},retmsg:{}".format(ret['ret'],ret['msg']))

	def CreateUUIDDir(self):
		uuidstr = str(uuid.uuid4())
		mydir = os.path.join(self.tmp,'tts-'+uuidstr)
		os.makedirs(mydir)
		return mydir
		
	def mainloop(self):
		logging.debug("Target directory : {}".format(self.inputdir))
		for fname in self.GetResultFiles():
			logging.info("Processing file: {}".format(fname))
			fsrc=os.path.join(self.inputdir,fname)
			#tmpdir = self.CreateUUIDDir()
			tmpdir = self.tmp
			fdest=os.path.join(tmpdir,fname)
			shutil.move(fsrc,fdest)
			logging.debug("Checking data file content:{} ...".format(fdest))	
			zipdir=os.path.basename(os.path.splitext(fdest)[0])
			mytoken=os.path.join(zipdir,'Token.txt')
			myerr=os.path.join(zipdir,'log','error.txt')
			with zipfile.ZipFile(fdest) as zf:
				if DBLoader.CheckFile(zf,mytoken) == 0:
					#no token file , update status to db and go on next
					logging.error("fatal error: no token file {}. go to next data file".format(mytoken))
					shutil.rmtree(tmpdir)
					continue
				else:
					content=zf.read(mytoken)
					self.dgen,self.ddb=DBLoader.GetTokenInfo(content)
					
				if DBLoader.CheckFile(zf,myerr) == 1:
					#update error status to db and go on next zip file
					filename = os.path.basename(fdest)
					fileid=filename.replace("_result","")
					msg = zf.read(myerr).replace('|','-')
					status = 'Processing Error'
					ret=DBLoader.UpdateStatusToDB('insert',self.ddb,self.dgen,msg,status,fileid,'-1')
					logging.debug("UpdateDB retcode:{},retmsg:{}".format(ret['ret'],ret['msg']))
					logging.error("Error during parsing file {}. go to next data file".format(fdest))
					shutil.rmtree(tmpdir)  
					continue
				logging.debug("Start to load data file to DB ....")
				self.LoadDataToDB(fdest)
				logging.info("Loading data into DB: {}".format(fdest))
				#shutil.rmtree(tmpdir)
			 	break			


class DataPackager():
	def __init__(self,rootdir,destdir,archivedir,apps):
		#self.appname = appname
		self.apps = apps
		self.dgen = dict()
		self.ddb = dict()
		self.rootdir = os.path.realpath(rootdir)
		self.destdir = os.path.realpath(destdir)
		self.archivedir = os.path.realpath(archivedir)
		self.curdate = datetime.datetime.now().strftime("%Y-%m-%d")
		#self.log = open(os.path.join(self.rootdir,'datapackager.log'),'w')
	
	def WriteTokenFile(self,mkt,dest,appname):
		tokenTemplate=os.path.join(self.rootdir,mkt+'_'+appname+'_Token.txt')
		if not os.path.isfile(tokenTemplate):
			logging.error('no token file exists: {}'.format(tokenTemplate))
			return ""
		token4mkt=os.path.join(dest,'Token.txt')
		logging.debug("Creating token file : {}".format(token4mkt))
		with open(token4mkt,'w') as fout:
			with open(tokenTemplate) as fin:
				lines = fin.readlines()
				for line in lines:
					line=line.rstrip()
					if line.find('GENERALINFO:') != -1:
						newline=line.replace('<RECDATE>',self.curdate)
						info=newline.split(':')[1]
						a1=info.split('|')
						self.dgen[mkt]={'app':a1[0],'vnd':a1[1],'recdate':a1[2],'carr':a1[3],'reg':a1[4],'mkt':a1[5],'mktfull':a1[6],'tech':a1[7]}
						fout.write(newline+"\n")
						logging.debug(self.dgen[mkt])
					elif line.find('DBCONN:') != -1:
						info=line.split(':')[1]		
						a2=info.split('|')
      						self.ddb[mkt]={'host':a2[0],'user':a2[1],'passwd':a2[2],'schema':a2[3],'table':a2[4]}
						logging.debug(self.ddb[mkt])	
						fout.write(line+"\n")
		return token4mkt

	def MakeTmpDir(self,curdir):
		workdir = os.path.join(curdir,'tmp')
		if os.path.exists(workdir):
			shutil.rmtree(workdir)
		try:
			os.makedirs(workdir)
		except OSError:
			workdir=""
		return workdir
	
	def PackData(self,mkt,mktdir):
		#mktdir = os.path.join(self.rootdir,mkt)
		#if os.path.isdir(mktdir) and mkt != 'template' and mkt != 'LTEPLAN':
		for appname in self.apps:
			appdir = os.path.join(mktdir,appname)
			#print appdir
			if not os.path.isdir(appdir):
				logging.debug("wrong appdir:{}".format(appdir))
				continue
			for csv in fnmatch.filter(listdir(appdir),'*.csv'):
				workdir=self.MakeTmpDir(appdir)
				if not workdir:
					logging.error("Cannot create work dir: {}".format(os.path.join(arrdir,'tmp')))
					break
				
				#check whether the file is in transition mode, i.e., in the middle of downloading
                                try:
                                        mycsvpath=os.path.join(appdir,csv)
                                        os.rename(mycsvpath,mycsvpath)
                                except OSError:
                                        logging.info("{} is being locked, try the next available file".format(csv))
                                        continue
	
				tokenpath=self.WriteTokenFile(mkt,workdir,appname)
				if tokenpath != "":	
					listpath=os.path.join(workdir,'FileList.txt')
					logging.debug("Creating fililist: {}".format(listpath))
					with open(listpath,'w') as flist:
						flist.write(csv)
					csvpath = os.path.join(workdir,csv)
					logging.info("Pack data file: {}".format(csv))
					shutil.move(os.path.join(appdir,csv),csvpath)
					#shutil.copy(os.path.join(appdir,'Token.txt'),os.path.join(workdir,'Token.txt'))
					#filename=os.path.splitext(csv)[0]
					#ZIPFILE=!APPNAME!_20!yy!!mm!!dd!_!VENDOR!_!yy!!mm!!dd!!sTime: =0!-!CARR!-!MKT!.zip
					ts=datetime.datetime.now().strftime('%y%m%d%H%M%S%f')[:-3]
					filename="{}_{}_{}_{}-{}-{}.zip".format(appname,self.curdate.replace('-',''),self.dgen[mkt]['vnd'],ts,self.dgen[mkt]['carr'],self.dgen[mkt]['mkt'])
					zippath=os.path.join(appdir,filename)
					logging.debug("creating zipfile: {}".format(zippath))
					#shutil.make_archive(zipname, 'zip', workdir)
					with zipfile.ZipFile(zippath,'w') as myzip:
						for f in listdir(workdir):
							fpath=os.path.join(workdir,f)
							myzip.write(fpath,f)
							os.remove(fpath)
					return zippath
		
	def mainloop(self):
		for mkt in listdir(self.rootdir):
			mktdir = os.path.join(self.rootdir,mkt)
			if os.path.isdir(mktdir) and mkt != 'template' and mkt != 'LTEPLAN':
				logging.debug("Entering market : {}".format(mkt))
				zippath=self.PackData(mkt,mktdir)
				if zippath:
					zipname=os.path.basename(zippath)
					logging.info("packing data completed, moving file {} to destination {}".format(zippath,self.destdir))
					newname=os.path.join(self.destdir,zipname)
					copyname=os.path.join(self.archivedir,zipname)
					copyfile(zippath,copyname)
					os.rename(zippath,newname)
					#update DB for new file coming
					ret=DBLoader.UpdateStatusToDB('insert',self.ddb[mkt],self.dgen[mkt],"","RUNNING",zipname,'-1',self.dgen[mkt]['recdate'])
					logging.debug("UpdateDB retcode:{},retmsg:{}".format(ret['ret'],ret['msg']))
					
					return newname

class MarathonJob():
	def __init__(self,appid,agenthome,ipaddr,port,jsonpath,inputdir,resultdir,password):
		self.url = "http://{}:{}/v2/apps".format(ipaddr,port)
		self.ipaddr = ipaddr
		self.port = port
		self.jsonpath = jsonpath
		self.inputdir = inputdir
		self.resultdir = resultdir
		self.appid = appid
		self.agenthome=agenthome
		self.password=password
	
	def GetJsonData(self):
		with open(self.jsonpath) as jfile:
						
    			jsondata=jfile.read()
			jsondata=jsondata.replace("{remotein}",self.inputdir)
			#jsondata=jsondata.replace("{outputdir}",self.outputdir)
			jsondata=jsondata.replace("{remoteout}",self.resultdir)
			jsondata=jsondata.replace("{ipaddr}",self.ipaddr)
			jsondata=jsondata.replace("{port}",self.port)
			jsondata=jsondata.replace("{appid}",self.appid)
			jsondata=jsondata.replace("{agenthome}",self.agenthome)
			jsondata=jsondata.replace("{password}",self.password)
			
		
			jdata=json.loads(jsondata)
			return json.dumps(jdata)
			###
			jdata = json.load(jfile)
			return json.dumps(jdata)
			###	
	def SubmitJob(self):
    		retObj = {}
    		c = pycurl.Curl()
    		buff = cStringIO.StringIO()
		#myurl = 'http://10.26.126.202:8080/v2/apps'
    		#c.setopt(c.URL, myurl)
		c.setopt(c.URL,self.url)
    		c.setopt(c.HTTPHEADER, ['Content-Type: application/json'])
    		c.setopt(c.WRITEFUNCTION, buff.write)
    		c.setopt(c.POST, 1)
		####
		with open(self.jsonpath) as jfile:
			jdata=json.load(jfile)
		jsondata=json.dumps(jdata)
		####
		jsonstr=self.GetJsonData()
		#jsondata = json.dumps(jsonstr)
		c.setopt(c.POSTFIELDS, jsonstr)
		c.setopt(c.VERBOSE,1)
		logging.debug(jsonstr)
    	    	c.perform()
    		retObj['statusCode'] = c.getinfo(c.HTTP_CODE)
    		retObj['reponseCode'] = c.getinfo(c.RESPONSE_CODE)
    		c.close()
    		return retObj

