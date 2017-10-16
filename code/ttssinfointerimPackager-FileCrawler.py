#!' + os.path.sep + 'usr' + os.path.sep + 'bin' + os.path.sep + 'python

import os
import sys
import string
import utilities


def main(path, outPath, module):
    # create lock
    curr_py_path = os.path.realpath(__file__) # current running file - abs path
    curr_py_dir, curr_py_filename = os.path.split(curr_py_path)  # current folder and file - abs path
    curr_py_dir_arr = curr_py_dir.split(os.path.sep)
    try:
        os.makedirs( os.path.sep + os.path.join( 'tmp', curr_py_dir_arr[len(curr_py_dir_arr) - 1] + '-' + curr_py_filename + '.lock') )
    except OSError:
        return 1

    recDate = utilities.getNowDateTimeString()
    recDate = recDate[:4] + '-' + recDate[4:6] + '-' + recDate[6:8]
    for dirName, subdirList, fileList in os.walk( curr_py_dir ):
        myArr = dirName.split(os.path.sep)
        depth = dirName.count(os.path.sep) - curr_py_dir.count(os.path.sep)
        
        if depth == 0:
            for f in fileList:
                if string.find( f, '.edw') > -1:
                    tokenFile = os.path.join(dirName, f)
                    #retToken = utilities.getTokenInfo( tokenFile, False )
                    #if retToken['mktToken'] == 'PEN' and retToken['dbStatusTable'] == 'umts_process_status':
                    
                    '''
                    if len( retToken['mktToken'] ) == 2 or len( retToken['mktToken'] ) == 3:
                        val = utilities.dbStatusUpdater( 'new', retToken, 'NODATA_' + recDate + '.zip', recDate, '' )
                        val = utilities.dbStatusUpdater( 'insert', retToken, 'NODATA_' + recDate + '.zip', recDate, 'NODATA' )
                    '''
                    print ( '[{}] LINE FILE -- [{}] [{}] '\
                        .format(curr_py_filename, str(depth), f ) )
                    #print (
                    cmd = (
                    'python {} {} {} {}'.format( 
                        os.path.join(curr_py_dir, 'ttssinfointerimPackager-SpecificGroup.py'), path
                        , outPath, f[:f.find('.')] )
                        )
                    ret = utilities.subprocessShellExecute( cmd )
                    os.remove( os.path.join(dirName, f) )
            break
	
    # remove lock
    utilities.removeDir( os.path.sep + os.path.join( 'tmp', curr_py_dir_arr[len(curr_py_dir_arr) - 1] + '-' + curr_py_filename + '.lock') )
    
    return 0
    

############# main #############
if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else '.'
    outPath = sys.argv[2] if len(sys.argv) > 2 else '.'
    module = sys.argv[3] if len(sys.argv) > 3 else '.edw'
    ret = main(path, outPath, module)
    print ret