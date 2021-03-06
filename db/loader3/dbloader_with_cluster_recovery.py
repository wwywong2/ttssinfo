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
import requests

def checkUrlFileExist(url):
    retObj = {}
    r = requests.head(url)
    a = requests.codes.ok
    b = r.status_code
    if r.status_code == requests.codes.ok:
        retObj['ret'] = True
    else:
        retObj['ret'] = False
    return retObj


def clusterrecovery(carr, mkt):
    retObj = {}

    carr_lower = carr.lower()
    mkt_low = mkt.lower()
    recovPage = "php/clusterrecovery.php"
    clusterMapUrl = "clustermap.json"
    webHost = ''
    if carr_lower == 'iwr' or carr_lower == 'vz':
        webHost = 'https://www.imnosrf.com'
        recovPage = '{}/{}/{}/{}'.format(webHost, carr_lower, mkt_low, recovPage)
        clusterMapUrl='{}/{}/{}/mymaps/{}'.format(webHost, carr_lower, mkt_low, clusterMapUrl)
    elif carr_lower == 'tmo' or carr_lower == 'att':
        print clusterMapUrl
        webHost = 'https://{}.imnosrf.com'.format(carr_lower)
        #webHost='http://10.81.52.105/'.format(carr_lower)
        recovPage = '{}/{}/{}'.format(webHost, mkt_low, recovPage)
        clusterMapUrl='{}/{}/mymaps/{}'.format(webHost, mkt_low, clusterMapUrl)

    ret = checkUrlFileExist(clusterMapUrl)
    if not ret['ret']:
        retObj['ret'] = False
        retObj['msg'] = 'No cluster recovery map found on website {}'.format(clusterMapUrl)
        return retObj
    
    clusterrecoveryCmd = '{}?clsUrl={}&debug=y'.format(recovPage, clusterMapUrl)
    r = requests.get('{}'.format(clusterrecoveryCmd))
    # no need to check return status
    retObj['ret'] = True
    retObj['msg'] = ''

    return retObj

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
    try:
        os.makedirs(os.path.sep + 'tmp' + os.path.sep + curr_py_filename + '.lock')
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
                        
                        for f in zip_ref.namelist():
                            # The if-statement below handles incoming zip file that were zipped from Windows OS
                            # else-statement is for default extraction
                            '''
                            if f.count(os.path.sep) == 0:
                                myDir = lZone + os.path.sep + os.path.split(string.replace( f, '\\', os.path.sep ))[0]
                                xFile = os.path.split(string.replace( f, '\\', os.path.sep ))[1]
                                
                                try:
                                    os.makedirs( myDir )
                                    os.chmod( myDir, 0o777 )
                                except OSError:
                                    pass
                                
                                zip_ref.extract( f, myDir )
                                #print( myDir + os.path.sep + f + ' ---> ' + myDir + os.path.sep + xFile )
                                os.rename( myDir + os.path.sep + f, myDir + os.path.sep + xFile )
                            '''
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
                            retcode = os.system(exec_str)		
                            if (retcode == 0):
                                print "[%s] Dumping lookup files completed.\n" % (
                                    time.strftime("%Y-%m-%d %H:%M:%S"))
                                if retToken['techToken'] == 'LTE':
                                    lteplanfile = 's_info_' + retToken['techToken'] + '_' + retToken['mktToken'] + '_' + retToken['carr'] + '.zip'
                                    ziph = zipfile.ZipFile( lZone + os.path.sep + lteplanfile, 'w', zipfile.ZIP_DEFLATED )
                                    zip_ref = zipfile.ZipFile( lZone + os.path.sep + '..' + os.path.sep + '..' + os.path.sep  + 'archive' + os.path.sep  + fname, 'r' )
                                    zip_ref.extract( 'Token.txt', lZone )
                                    zip_ref.close()
                                for dir, subdirlist, filelist in os.walk( lZone ):
                                    for f in filelist:
                                        if string.find( f, 'Lookup' ) > -1:
                                            #cmd = 'mv -f ' + lZone + os.path.sep + f + ' ' + lZone + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + 'LandingZone' + os.path.sep + retToken['carr'] + os.path.sep + retToken['mktToken'] + '_' + f
                                            #print( cmd )
                                            #ret = subprocessShellExecute( cmd )
                                            os.rename(lZone + os.path.sep + f, lZone + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + 'LandingZone' + os.path.sep + retToken['carr'] + os.path.sep + retToken['mktToken'] + '_' + f)
                                        else:
                                            if retToken['techToken'] == 'LTE' and string.find( f, '.txt' ) > -1:
                                                ziph.write( lZone + os.path.sep + f, f )
                                try:
                                    lteplanfile
                                except NameError:
                                    continue
                                else:
                                    os.rename(lZone + os.path.sep + lteplanfile, lZone + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + '..' + os.path.sep + 'lteplan' + os.path.sep + 'mover1' + os.path.sep + lteplanfile)
                            else:
                                print "[%s] Dumping lookup files failed with return code %d\n" % (
                                    time.strftime("%Y-%m-%d %H:%M:%S"), retcode)				
                                #cleanupAndExit(4, work_location)
                        '''
                        if ret['ret']:  
                            runidList = ret['output'].split('\n')
                            for rid in runidList:
                                break
                                # skip header
                                if not rid == 'runid' and not rid == '':
                                    deleteDataSQL = 'call delete_planau_lte({});'.format(rid)
                                    deleteCmd = "mysql -h {} -u {} -p{} -D {} -e \"{}\"".format(retToken['dbHost'], retToken['dbUser'], retToken['dbPwd'], retToken['dbSchema'], deleteDataSQL)
                                    ret = subprocessShellExecute(deleteCmd)
                                    if ret['ret']:
                                        deleteDataSQL = 'delete from {} where runid={};'.format(retToken['dbAuditTable'], rid)
                                        deleteCmd = "mysql -h {} -u {} -p{} -D {} -e \"{}\"".format(retToken['dbHost'], retToken['dbUser'], retToken['dbPwd'], retToken['dbSchema'], deleteDataSQL)
                                        ret = subprocessShellExecute(deleteCmd)
                                        if not ret['ret']:
                                            bDeleteError = True
                                            break
                                    else:
                                        bDeleteError = True
                                        break
                        else:
                            bDeleteError = True
                        '''
                        #break
                                
                    except:
                        print '{} cannot be accessed.'.format(myFile)
                        continue
            
    
    # remove lock
    utilities.removeDir(os.path.sep + 'tmp' + os.path.sep + curr_py_filename + '.lock')
    
    return 0
    

############# main #############
if __name__ == "__main__":
    inPath = sys.argv[1] if len(sys.argv) > 1 else '.'
    outPath = sys.argv[2] if len(sys.argv) > 2 else '.'
    module = sys.argv[3] if len(sys.argv) > 3 else 'SINFO'
    #print( '[' + inPath + ']' + '[' + outPath + ']' + '[' + module + ']' )
    ret = main( inPath, outPath, module)
    print ret
