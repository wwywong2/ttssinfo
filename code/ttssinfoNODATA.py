#!' + os.path.sep + 'usr' + os.path.sep + 'bin' + os.path.sep + 'python

import os
import sys
import string
import utilities


def main(path, module):
    # create lock
    curr_py_path = os.path.realpath(__file__) # current running file - abs path
    curr_py_dir, curr_py_filename = os.path.split(curr_py_path)  # current folder and file - abs path
    try:
        os.makedirs( os.path.sep + os.path.join('tmp', curr_py_filename + '.lock') )
    except OSError:
        return 1

    recDate = utilities.getNowDateTimeString()
    recDate = recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8]
    for dirName, subdirList, fileList in os.walk( path ):
        myArr = dirName.split(os.path.sep)
        depth = dirName.count(os.path.sep) - path.count(os.path.sep)
        
        if depth == 0:
            for f in fileList:
                if string.find( f, module ) > -1:
                    tokenFile = os.path.join(dirName, f)
                    retToken = utilities.getTokenInfo( tokenFile, False )
                    #if retToken['mktToken'] == 'PEN' and retToken['dbStatusTable'] == 'umts_process_status':
                    if len( retToken['mktToken'] ) == 2 or len( retToken['mktToken'] ) == 3:
                        val = utilities.dbStatusUpdater( 'new', retToken, 'NODATA_' + recDate + '.zip', recDate, '' )
                        val = utilities.dbStatusUpdater( 'insert', retToken, 'NODATA_' + recDate + '.zip', recDate, 'NODATA' )
                        print ( '[{}] LINE TOKEN -- [{}] [{}] [{}] [{}]'\
                            .format(curr_py_filename, str(depth), retToken['dbSchema'], retToken['mktToken']
                            , retToken['dbStatusTable']) )
            break
	
    # remove lock
    utilities.removeDir( os.path.sep + os.path.join('tmp', curr_py_filename + '.lock') )
    
    return 0
    

############# main #############
if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else '.'
    module = sys.argv[2] if len(sys.argv) > 2 else 'SINFO'
    ret = main(path, module)
    print ret