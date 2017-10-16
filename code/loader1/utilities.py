#!/usr/bin/python

######## json_reader ########
def json_reader(jsonFile):
    import json
    
    with open(jsonFile) as data_file:    
        data = json.load(data_file)

    return data

######## fileExist ########
def fileExist(fileFullPath):
    import os
    return os.path.isfile(fileFullPath)

######## removeDir (recursively) ########
def removeDir(path):
    import shutil
    return shutil.rmtree(path)

######## copyFile ########
def copyFile(srcFile, destPath, createIfNotExist = False, move = False):
    import os
    import shutil
    
    if not os.path.isfile(srcFile):
        return False
    
    if createIfNotExist:
        if not os.path.isdir(destPath):
            os.mkdir(destPath)
    try:
        if move: # provide full path of destPath will overwrite (force)
            shutil.move(srcFile, destPath)
        else:
            shutil.copy(srcFile, destPath)
        return True
    except:
        return False
    
######## get_ini_value ######## 
def get_ini_value(settingFilePath, section, option, default = ''):
    import ConfigParser
    value = ''
    if not os.path.isfile(settingFilePath):
        value = default
    else:
        config = ConfigParser.ConfigParser()
        config.read(settingFilePath)

    if config is None:
        value = default
    else:
        try:
            value = config.get(section, option)
        except ConfigParser.NoSectionError:
            value = default
        except ConfigParser.NoOptionError:
            value = default
        except:
            value = default
            
    return value

######## getOS ########
#   return:
#       linux
#       darwin - Mac
#       win32  - windows (x86/x64)
#######################
def getOS():
    from sys import platform as osName
    
    if osName == "linux" or osName == "linux2":
        osName = "linux"
    
    return osName
    
######## getNowDateTimeString ########  
def getNowDateTimeString(getMillisec = False):
    import datetime
    if getMillisec:
        return datetime.datetime.now().strftime('%Y%m%d%H%M%S%f')
    else:
        return datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    
######## zip - zipIsZipFile ########    
def zipIsZipFile(fn):
    import zipfile
    return zipfile.is_zipfile(fn)

######## zip - zipReadFile ########
######## read file in zip without extract
def zipReadFile(zipFile, fn):
    import os
    import zipfile

    content = ''
    if not zipIsZipFile(zipFile):
        return content
    
    zipObj = zipfile.ZipFile(zipFile, "r")
    content = zipObj.read(fn)
       
    return content

######## zip - zipExtract ########  
def zipExtract(zipFile, extractFn = '', outpath = ''):
    import os
    import zipfile
    
    if not zipIsZipFile(zipFile):
        return False
    zipObj = zipfile.ZipFile(zipFile, "r")

    if not outpath:
        outpath = os.path.dirname(zipFile)
    
    if not extractFn:
        try:
            zipObj.extractall(outpath)
        except:
            return False
    else:
        try:
            zipObj.extract(extractFn, outpath)
        except:
            return False
       
    return True

######## zipFolder ########
def zipFolder(zipFileFullPath, folderPath, hasBaseFolder = False):
    import sys
    import os
    import zipfile
    
    retObj = {}
    
    parentFolder = os.path.dirname(folderPath)
    baseFolder = os.path.basename(folderPath)
    rootlen = len(folderPath) + 1
    
    # Retrieve the paths of the folder contents.
    contents = os.walk(folderPath)
    try:
        zipFile = zipfile.ZipFile(zipFileFullPath, 'w', zipfile.ZIP_DEFLATED)
        for root, folders, files in contents:
            for fileName in files:
                absolutePath = os.path.join(root, fileName)
                fn = absolutePath[rootlen:]
                if hasBaseFolder:
                    fn = os.path.join(baseFolder, fn) 
                zipFile.write(absolutePath, fn)
    except IOError, message:
        retObj['ret'] = False
        retObj['msg'] = message
        pass
    except OSError, message:
        retObj['ret'] = False
        retObj['msg'] = message
        pass
    except zipfile.BadZipfile, message:
        retObj['ret'] = False
        retObj['msg'] = message
        pass
    finally:
        retObj['ret'] = True
        
    return retObj
   
def getTokenInfo(filePath, bInZipFile = False):
    retObj = {}
    tokenContent = ''

    if bInZipFile:
        tokenContent = zipReadFile(filePath, 'Token.txt')
    else:
        with open(filePath, 'r') as fcontent:
            tokenContent = fcontent.read()
            
    if tokenContent == '':
        retObj['msg'] = "No information in Token.txt"
        retObj['ret'] = False
        return retObj

    # safeguard for token file coming from windows
    tokenContent = tokenContent.replace('\r\n', '\n')

    # parse token.txt
    retObj['AUDITTYPE'] = 0
    retObj['dateDiff'] = 3
    for line in tokenContent.split('\n'):
        if line.find('GENERALINFO')>=0:
            try:
                lineList = line.strip('\n').strip('\r').strip(' ').split(':')[1].split('|')
                retObj['appName'] = lineList[0]
                retObj['vendor'] = lineList[1]
                retObj['recDate'] = lineList[2]
                retObj['carr'] = lineList[3]
                retObj['region'] = lineList[4]
                retObj['mktToken'] = lineList[5]
                retObj['mktDesc'] = lineList[6]
                retObj['techToken'] = lineList[7]
            except:
                retObj['msg'] = 'Incorrect Token.txt => GENERALINFO'
                retObj['ret'] = False
                return retObj
                
        if line.find('DBCONN')>=0:
            try:
                lineList = line.strip('\n').strip('\r').strip(' ').split(':')[1].split('|')
                retObj['dbHost'] = lineList[0]
                retObj['dbUser'] = lineList[1]
                retObj['dbPwd'] = lineList[2]
                retObj['dbSchema'] = lineList[3]
                retObj['dbStatusTable'] = lineList[4]
            except:
                retObj['msg'] = 'Incorrect Token.txt => DBCONN'
                retObj['ret'] = False
                return retObj

        if line.find('LTEPLANAUDIT:')>=0:
            try:
                lineList = line.strip('\n').strip('\r').strip(' ').split(':')[1].split('|')
                if len(lineList)<1:
                    retObj['msg'] = 'LTEPLANAUDIT information in Token.txt is incorrect'
                    retObj['ret'] = False
                    return retObj
                else:
                    retObj['dbAuditTable'] = lineList[0]
                    if len(lineList)>=2:
                        optStr = lineList[1].split('=')
                        if optStr[0] == 'opt':
                            if int(optStr[1]) == 1:
                                 retObj['AUDITTYPE'] = 1
            except:
                retObj['msg'] = 'Incorrect Token.txt => LTEPLANAUDIT'
                retObj['ret'] = False
                return retObj

        if line.find('LTEPLAN:')>=0:
            try:
                lineList = line.strip('\n').strip('\r').strip(' ').split(':')[1].split('|')
                retObj['dbPlanTable'] = lineList[0]
            except:
                retObj['msg'] = 'Incorrect Token.txt => LTEPLAN'
                retObj['ret'] = False
                return retObj
            
        if line.find('LTECRSFDR')>=0:
            try:
                lineList = line.strip('\n').strip('\r').strip(' ').split(':')[1].split('|')
                retObj['crsfdrTable'] = lineList[0]
                retObj['dateDiff'] = lineList[1].split('=')[1]
            except:
                retObj['msg'] = 'Incorrect Token.txt => LTECRSFDR'
                retObj['ret'] = False
                return retObj
    retObj['ret'] = True       
    return retObj
    
######## dbStatusUpdate ########
def dbStatusUpdater(sqlType, tokenObj, filename, recdate, status = 'FAILED', addComment = ''):
    import os
    import string
    
    try:
        tokenObj
    except NameError:
        pass
    else:
        if string.lower(sqlType) == 'new':
            sqlStmt = "call {}.new_partition('{}', '{}', '{}') "\
                    .format( tokenObj['dbSchema'], tokenObj['dbSchema'], recdate, tokenObj['techToken'] )
        elif string.lower(sqlType) == 'insert':
            sqlStmt = "insert into {} (ID, REC_DATE, FILE_NAME, MODULE_NAME, PROCESS_STATUS, COMMENTS, CREATION_DATE, LAST_UPDATED_DATE) values ('{}', '{}', '{}', '{}', '{}', '{}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP) "\
                    .format( tokenObj['dbStatusTable'], filename, recdate, filename, tokenObj['appName'], status,
                    tokenObj['vendor'] + '-' + tokenObj['techToken'] + '-' + tokenObj['mktToken'] + '-' + tokenObj['appName'])
        elif string.lower(sqlType) == 'update':
            sqlStmt = "update {} set comments = case when process_status <> 'DONE' then concat( comments, '|', process_status, ' -- COMPLETED', '{}' ) else comments end, process_status = '{}', last_updated_date = CURRENT_TIMESTAMP where module_name = '{}' and file_name like '{}' "\
                    .format( tokenObj['dbStatusTable'], addComment, status, tokenObj['appName'], filename )
        elif string.lower(sqlType) == 'warning':
            sqlStmt = "update {} set comments = concat( comments, '|', '{}' ), last_updated_date = CURRENT_TIMESTAMP where module_name = '{}' and file_name like '{}' "\
                    .format( tokenObj['dbStatusTable'], addComment, tokenObj['appName'], filename )
        elif string.lower(sqlType) == 'delete':
            sqlStmt = "delete from {} where module_name = '{}' and file_name like '{}' and mgr_run_id = '-1' "\
                    .format( tokenObj['dbStatusTable'], tokenObj['appName'], filename )

        cmd = "mysql -h {} -u {} -p{} -D {} -e \"{}\""\
                .format( tokenObj['dbHost'], tokenObj['dbUser'], tokenObj['dbPwd'], tokenObj['dbSchema'], sqlStmt )
        ret = subprocessShellExecute(cmd)
        if not ret['ret']:
            print( cmd )
    return ret['ret']

################################################
#   subprocessShellExecute
#       1 . MySQL
#       2.  Execuable
################################################
def subprocessShellExecute(cmd):
    import subprocess
    
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
        retObj['output'] = out
    #p.kill()
    return retObj

def copyFileToRemote(serverAddr, serverUsr, serverPwd, localFile, remoteDestination):
    import subprocess
    
    # sshpass -p "$webServerPwd" scp $webServerUser@$webServer:"$website_hostats_file_path" "${dir_db}${packageFolder}/"
    retObj = {}

    cmd = ['sshpass', '-p', '{}'.format(serverPwd), 'scp', '{}'.format(localFile), '{}@{}:{}'.format(serverUsr, serverAddr, remoteDestination)]
    p = subprocess.call(cmd)
    if p == 0:
        retObj['ret'] = True
    else:
        retObj['ret'] = False
    retObj['cmd'] = cmd
    return retObj

def checkRemoteDirExist(serverAddr, serverUsr, serverPwd, remoteDir, createIfNotExit = False):
    import subprocess
    
    retObj = {}
    
    cmd = ['sshpass', '-p', '{}'.format(serverPwd), 'ssh', '{}@{}'.format(serverUsr, serverAddr), 'test -d {}'.format(remoteDir)]
    p = subprocess.call(cmd)
    if p == 0:
        retObj['ret'] = True
    else:
        retObj['ret'] = False

    if createIfNotExit:
        cmd2 = "echo 'mkdir {}' | sshpass -p {} sftp -oBatchMode=no -b- {}@{}".format(remoteDir, serverPwd, serverUsr, serverAddr)
        retObj = subprocessShellExecute(cmd2)
        retObj['cmd_create_remote_dir'] = cmd2
        
    retObj['cmd_test_remote_dir'] = cmd
    return retObj


