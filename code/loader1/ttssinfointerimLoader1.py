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
                            val = utilities.dbStatusUpdater( 'new', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], '' )
                            val = utilities.dbStatusUpdater( 'insert', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'NEW' )
                            print( 'Moving file: ' + myFile + ' ---> ' + lZone + os.path.sep + fname )
                            os.rename( myFile, lZone + os.path.sep + fname )
                            #cmd = 'python ' + curr_py_dir + os.path.sep + 'bin/sinfo_loader.py -H {} -u {} -p{} -P {} --dbname {} \"\" \"\" \"\" \"\" >> output.log 2>&1'.format('InterimDB', retToken['dbUser'], retToken['dbPwd'], '3306', string.lower(retToken['dbSchema']) + '_temp')
                            cmd = 'python ' + curr_py_dir + os.path.sep + 'bin/sinfo_loader.py -H {} -u {} -p{} -P {} --dbname {} \"\" \"\" {} \"\" >> {}output.log 2>&1'\
                                    .format('interim-db-01', 'root', 'tts1234', '3306', string.lower(retToken['dbSchema']) + '_temp', curr_py_dir + os.path.sep + '..' + os.path.sep + 'archive/', curr_py_dir + os.path.sep)
                            #        .format('interim-db-01', 'root', 'tts1234', '3306', string.lower(retToken['dbSchema']) + '_temp', os.path.join(curr_py_dir, '..', 'archive'), curr_py_dir + os.path.sep)
                            ret = subprocessShellExecute(cmd)
                            print( cmd )
                            val = utilities.dbStatusUpdater( 'update', retToken, fname, recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8], 'QUEUED' )
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
                ret = subprocessShellExecute( 'rm -f ' + lZone + os.path.sep + '*' )
            
    
    # remove lock
    utilities.removeDir(os.path.sep + 'tmp' + os.path.sep + curr_py_filename + '.lock')
    
    return 0
    

############# main #############
if __name__ == "__main__":
    inPath = sys.argv[1] if len(sys.argv) > 1 else '.'
    outPath = sys.argv[2] if len(sys.argv) > 2 else '.'
    module = sys.argv[3] if len(sys.argv) > 3 else 'GSMSINFO'
    ret = main( inPath, outPath, module)
    print ret