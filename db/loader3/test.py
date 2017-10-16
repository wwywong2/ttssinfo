#!/usr/bin/python
import os, subprocess

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

def main():
    cmd = "python /home/jcheng/mesos/ttssinfo/db/loader/clusterrecovery.py {} {}".format('TMO', 'LV')
    ret = subprocessShellExecute(cmd)

    print ret
    return 0
############# main #############
if __name__ == "__main__":
    ret = main()
    os._exit(0)
