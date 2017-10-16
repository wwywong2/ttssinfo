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
                if string.find( fname, module ) > -1:
                    fnameWithPath = os.path.join( dirName, fname )
                    print ( 'LINE File Found: {}'.format(fnameWithPath) )
                    try:
                        os.rename( fnameWithPath, fnameWithPath )
                    except OSError:
                        print '{} cannot be accessed.'.format(fname)
                        continue
                    
                    tech = fname.split('_')[1]
                    print ( 'LINE TECH: {}'.format(tech) )
                    
                    if string.find( fname, 'ATOLL' ) > -1:
                        #print (
                        cmd = (
                        ' python {} N {} {} \'\' \'\' '.format( os.path.join(curr_py_dir, 'ttssinfoEDWSplitter.py')
                                , fnameWithPath, os.path.join(lZone, 'TMO_'+tech+'_ERIC-'+tech, 'SITEFILES') )
                            )
                        ret = utilities.subprocessShellExecute( cmd )
                        #print (
                        cmd = (
                        ' python {} N {} {} \'\' \'\' '.format( os.path.join(curr_py_dir, 'ttssinfoEDWSplitter.py')
                                , fnameWithPath, os.path.join(lZone, 'TMO_'+tech+'_NOKIA-'+tech, 'SITEFILES') )
                            )
                        ret = utilities.subprocessShellExecute( cmd )
                    else:
                        vendor = fname.split('_')[2]
                        #print (
                        cmd = (
                        ' python {} Y {} {} NATIONAL {} '.format( os.path.join(curr_py_dir, 'ttssinfoEDWSplitter.py')
                                , fnameWithPath, os.path.join(lZone, 'TMO_'+tech+'_'+vendor+'-'+tech, 'RAWFILES')
                                , ('ERICSSON' if vendor == 'ERIC' else vendor) )
                            )
                        ret = utilities.subprocessShellExecute( cmd )
                        utilities.touch( os.path.join(curr_py_dir, 'TMO_'+tech+'_'+vendor+'-'+tech+'.edw') )
                    
                    print ( 'LINE Archiving File: {} to {}'.format(fnameWithPath, fnameWithPath.replace( 'data', 'archive' )) )
                    try:
                        os.rename( fnameWithPath, fnameWithPath.replace( 'data', 'archive' ) )
                    except OSError:
                        print '{} cannot be accessed.'.format(fname)
                        continue
                    '''
                    '''
            break;
    
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