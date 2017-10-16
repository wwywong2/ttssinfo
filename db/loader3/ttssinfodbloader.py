#!/usr/bin/python

import os
import sys
import datetime
import re
import string
import ConfigParser
import zipfile
import utilities
import subprocess
import time
import json
from pprint import pprint


################################################
#   subprocessShellExecute
#       1 . MySQL
#       2.  Execuable
################################################
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
        retObj['output'] = out
    #p.kill()
    return retObj

def main(path, lZone, module):
    # create lock
    curr_py_path = os.path.realpath(__file__) # current running file - abs path
    curr_py_dir, curr_py_filename = os.path.split(curr_py_path)  # current folder and file - abs path
    curr_py_dir_arr = curr_py_dir.split(os.path.sep)
    try:
        os.makedirs( os.path.sep + os.path.join( 'tmp', curr_py_dir_arr[len(curr_py_dir_arr) - 1] + '-' + curr_py_filename + '.lock') )
    except OSError:
        return 1

    for dirName, subdirList, fileList in os.walk( path ):
        #myArr = dirName.split(os.path.sep)
        depth = dirName.count(os.path.sep) - path.count(os.path.sep)
        
        if depth == 0:
            for fname in fileList:
                if string.find( fname, module ) > -1 and string.find( fname, '.zip' ) > -1:
                    try:
                        myFile = dirName + os.path.sep + fname
                        os.rename( myFile, myFile )
                        zip_ref = zipfile.ZipFile( myFile, 'r' )
                        
                        ret = subprocessShellExecute( 'rm -f ' + lZone + os.path.sep + '*' )
                        for f in zip_ref.namelist():
                            if string.find( f, 'db_load_status' ) > -1:
                                zip_ref.extract( f, lZone )
                                
                            if string.find( f, 'Token' ) > -1:
                                zip_ref.extract( f, lZone )
                                # Read Token file
                                retToken = utilities.getTokenInfo( lZone + os.path.sep + f, False)
                                break
                                
                        zip_ref.close()

                        try:
                            retToken
                        except NameError:
                            continue
                        else:
                            recDate = utilities.getNowDateTimeString()
                            val = utilities.dbStatusUpdater( 'update', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'LOADING')#, '[DateOfData-' +  )
                            print( 'Moving file: ' + myFile + ' ---> ' + lZone + os.path.sep + fname )
                            os.rename( myFile, lZone + os.path.sep + fname )
                            cmd = curr_py_dir + os.path.sep + 'bin' + os.path.sep + 'ttssinfo_db.sh \"{}\" \"{}\" \"{}\" \"{}\" \"{}\" \"{}\" \"{}\"'.format( lZone, curr_py_dir + os.path.sep + '..' + os.path.sep + 'archive', string.lower(retToken['dbSchema']), retToken['dbHost'], '3306', retToken['dbUser'], retToken['dbPwd'] )
                            print( cmd )
                            ret = subprocessShellExecute(cmd)
                            
                            exec_str = 'python ' + curr_py_dir + os.path.sep + 'db2csv.py -H {} -P {} -d {} -u {} -p {} -l \"{}\" \"{}db2csv_{}_{}_sinfolookup.ini\" \"{}\" 2>&1'.format(
                                retToken['dbHost'], '3306', retToken['dbSchema'], retToken['dbUser'], retToken['dbPwd'], "db2csv.log",
                                curr_py_dir + os.path.sep, string.lower(retToken['techToken']), string.lower(retToken['carr']),
                                lZone)
                            print( exec_str )
                            print "[%s] Dumping lookup files...\n%s\n" % (
                                time.strftime("%Y-%m-%d %H:%M:%S"), exec_str)  	
                            sys.stdout.flush() # flush buffer before executing next line
                            #retcode = os.system(exec_str)		
                            ret = subprocessShellExecute(exec_str)
                            #if (retcode == 0):
                            if ret['ret']:
                                val = utilities.dbStatusUpdater( 'update', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'DONE' )
                                print "[%s] Dumping lookup files completed.\n" % (
                                    time.strftime("%Y-%m-%d %H:%M:%S"))
                                if retToken['techToken'] == 'LTE':
                                    lteplanfile = os.path.join( lZone, 's_info_' + retToken['techToken'] + '_' + retToken['mktToken'] + '_' + retToken['carr'] + '.zip' )
                                    ziph = zipfile.ZipFile( lteplanfile, 'w', zipfile.ZIP_DEFLATED )
                                    zip_ref = zipfile.ZipFile( lZone + os.path.sep + '..' + os.path.sep + '..' + os.path.sep  + 'archive' + os.path.sep  + fname, 'r' )
                                    zip_ref.extract( 'Token.txt', lZone )
                                    zip_ref.close()
                                for dir, subdirlist, filelist in os.walk( lZone ):
                                    for f in filelist:
                                        if string.find( f, 'Lookup' ) > -1:
                                            os.rename(lZone + os.path.sep + f, lZone + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + 'LandingZone' + os.path.sep + retToken['carr'] + os.path.sep + retToken['mktToken'] + '_' + f)
                                        else:
                                            if retToken['techToken'] == 'LTE' and string.find( f, '.txt' ) > -1:
                                                ziph.write( lZone + os.path.sep + f, f )
                                                
                                try:
                                    lteplanfile
                                except NameError:
                                    continue
                                else:
                                    ziph.close()
                                    
                                    # Copy zip file to web server, for AdHOC LTEPLAN
                                    adhoclteplanfile = os.path.join(lZone, 's_info_' + retToken['techToken'] + '.zip')
                                    cmd = 'cp -p {} {}'.format( lteplanfile, adhoclteplanfile )
                                    print( 'LINE Creating adhoclteplanfile: ' + cmd )
                                    ret = subprocessShellExecute(cmd)
                                    
                                    mainschema = 'optpcs_{}'.format( retToken['carr'] )
                                    getwebserveripquery = "select web_ipaddress From markets where suffix = '{}'".format( retToken['mktToken'] )
                                    getwebserveripcmd = "mysql -h {} -u {} -p{} -D {} -e \"{}\""\
                                            .format(retToken['dbHost'], retToken['dbUser'], retToken['dbPwd'], mainschema
                                            , getwebserveripquery)
                                    ret = subprocessShellExecute(getwebserveripcmd)
                                    
                                    webip = ''
                                    if ret['ret']:
                                        out = ret['output']
                                        try:
                                            webip = out.split('\n')[1].strip('\n').strip('\r')
                                        except:
                                            print "wrong machineip information: {}".format(out)
                                            pass

                                    print webip
                                    if webip == '': val = utilities.dbStatusUpdater( 'warning', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'WARNING: no web ip present' )
                                    websinfopath = '/var/www/html/{}/{}/resources/sinfo'.format(string.lower(retToken['carr']), string.lower(retToken['mktToken']))

                                    print websinfopath

                                    # hard code test
                                    ret = utilities.checkRemoteDirExist(webip, 'imnosrf', 'tts1234', websinfopath, True)
                                    if not ret['ret']:
                                        print 'create remote dir failed: {}'.format(ret)
                                        val = utilities.dbStatusUpdater( 'warning', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'WARNING: create remote dir failed' )
                                    
                                    ret = utilities.copyFileToRemote(webip, 'imnosrf', 'tts1234', adhoclteplanfile, websinfopath)
                                    if not ret['ret']:
                                        print 'copy sinfo to webserver failed'
                                        val = utilities.dbStatusUpdater( 'warning', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'WARNING: copy sinfo to web failed' )
                                    
                                    cmd = "python {}ho_dump.py {} {} {} {} {} {} {} {} {}"\
                                            .format( curr_py_dir+os.path.sep, retToken['carr'], retToken['mktToken']
                                            ,recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], retToken['techToken'], 3
                                            ,retToken['dbHost'], retToken['dbUser'], retToken['dbPwd'], '3306' )
                                    print( cmd )
                                    ret = subprocessShellExecute(cmd)
                                    if not ret['ret']:
                                        val = utilities.dbStatusUpdater( 'warning', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'WARNING: ho_dump.py failed - API submission error - ' + ret['msg'] )
                                    pprint( ret )
                                    
                                    if 'apiret' in ret:
                                        apiretObj = json.loads( ret['apiret'] )
                                        if not apiretObj['success']:
                                            val = utilities.dbStatusUpdater( 'warning', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'WARNING: ho_dump.py failed - ' + ret['apiret']['msg'] )
                                    
                                    cmd = "python {}clusterrecovery.py {} {} {} {} {} {}"\
                                            .format( curr_py_dir+os.path.sep, retToken['carr'], retToken['mktToken']
                                            ,retToken['dbHost'], retToken['dbUser'], retToken['dbPwd'], '3306' )
                                    print( cmd )
                                    ret = subprocessShellExecute(cmd)
                                    if not ret['ret']:
                                        val = utilities.dbStatusUpdater( 'warning', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'WARNING: clusterrecovery.py failed' )
                                    
                                    lteplanfileFINAL = os.path.join( os.path.sep + curr_py_dir_arr[1], curr_py_dir_arr[2], 'lteplan', 'mover1', string.replace( os.path.split(lteplanfile)[1], '.zip', '' ) )
                                    print( 'Moving file: ' + lteplanfile + ' ---> ' + lteplanfileFINAL + '.zip' )
                                    try:
                                        os.rename(lteplanfile, lteplanfileFINAL + '.tmp')
                                        os.rename(lteplanfileFINAL + '.tmp', lteplanfileFINAL + '.zip')
                                    except OSError:
                                        print 'Renaming {} to {} failed.'.format(lteplanfile, lteplanfileFINAL + '.tmp')
                                        val = utilities.dbStatusUpdater( 'warning', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'WARNING: plan-audit submission failed' )
                                        continue

                            else:
                                val = utilities.dbStatusUpdater( 'update', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'FAILED', 'Dumping lookup files failed with return code ' )
                                print "[%s] Dumping lookup files failed with return code %d\n" % (
                                    time.strftime("%Y-%m-%d %H:%M:%S"), retcode)				
                            ret = subprocessShellExecute( 'rm -f ' + lZone + os.path.sep + '*' )
                        #break
                                
                    except OSError:
                        print '{} cannot be accessed.'.format(myFile)
                        continue
            
    
    # remove lock
    utilities.removeDir( os.path.sep + os.path.join( 'tmp', curr_py_dir_arr[len(curr_py_dir_arr) - 1] + '-' + curr_py_filename + '.lock') )
    
    return 0
    

############# main #############
if __name__ == "__main__":
    inPath = sys.argv[1] if len(sys.argv) > 1 else '.'
    outPath = sys.argv[2] if len(sys.argv) > 2 else '.'
    module = sys.argv[3] if len(sys.argv) > 3 else 'SINFO'
    #print( '[' + inPath + ']' + '[' + outPath + ']' + '[' + module + ']' )
    ret = main( inPath, outPath, module)
    print ret