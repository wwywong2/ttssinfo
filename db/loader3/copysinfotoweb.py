#!/usr/bin/python
import os, sys
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

def copyFileToRemote(serverAddr, serverUsr, serverPwd, localFile, remoteDestination):
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

def main():

    loCarr = 'tmo'
    loMkt = 'la'
    retToken = {}
    retToken['dbHost'] = 'db-tmobile-01'
    retToken['dbUser'] = 'user_boinc'
    retToken['dbPwd'] = 'Boinc@94588'
    localsinfopath = '/home/jcheng/mesos/ttssinfo/db/loader/s_info_LTE.zip'
    
    mainschema = 'optpcs_{}'.format(loCarr)
    getwebserveripquery = "select web_ipaddress From markets where suffix = '{}'".format(loMkt)
    getwebserveripcmd = "mysql -h {} -u {} -p{} -D {} -e \"{}\"".format(retToken['dbHost'], retToken['dbUser'], retToken['dbPwd'], mainschema, getwebserveripquery)
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
    if webip == '': return 1
    websinfopath = '/var/www/html/{}/{}/resources/sinfo'.format(loCarr, loMkt)

    print websinfopath

    # hard code test
    ret = checkRemoteDirExist(webip, 'imnosrf', 'tts1234', websinfopath, True)
    if not ret['ret']:
        print 'create remote dir failed: {}'.format(ret)
    
    ret = copyFileToRemote(webip, 'imnosrf', 'tts1234', localsinfopath, websinfopath)
    if not ret['ret']:
        print 'copy sinfo to webserver failed'
    

    return 0

############# main #############
if __name__ == "__main__":
    
    ret = main()
    os._exit(ret)
