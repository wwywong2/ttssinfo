#!/usr/bin/python
import os, sys, uuid
import utilities, requests
import subprocess
from urlparse import urlparse
import httplib, sys

'''
Ex.
python ho_dump.py TMO NYC 2017-04-05 LTE 3 db-tmobile-01 user_boinc Boinc@94588 3306
'''

def checkUrlFileExist(url):
    retObj = {}
    r = ''
    try:
        r = requests.get(url)
    except:
        retObj['ret'] = False
        retObj['url'] = url
        retObj['code'] = -1
    finally:
        if not r == '':
            if r.status_code == requests.codes.ok:
                retObj['ret'] = True
            else:
                retObj['ret'] = False
            retObj['url'] = url
            retObj['code'] = r.status_code
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

def fileLineCount(filename):
    f = open(filename)                  
    lines = 0
    buf_size = 1024 * 1024
    read_f = f.read # loop optimization

    buf = read_f(buf_size)
    while buf:
        lines += buf.count('\n')
        buf = read_f(buf_size)

    f.close()
    return lines

def main():

    retObj = {}
    retObj['msg'] = ''
    argvs = len(sys.argv)
    try:	
        Carr = sys.argv[1]
        Mkt = sys.argv[2]
        RecDate = sys.argv[3]
        Tech = sys.argv[4]
        dateDiff = sys.argv[5]
        dbhost = sys.argv[6]
        dbuser = sys.argv[7]
        dbpwd = sys.argv[8]
        dbport = sys.argv[9]
    except:
        retObj['msg'] = 'Arguments are incorrect'
        retObj['ret'] = False
        print retObj
        return 1
    carr_low = Carr.lower()
    mkt_low = Mkt.lower()

    mainschema = 'optpcs_{}'.format(carr_low)
    getwebserverosquery = "select url From markets where suffix = '{}'".format(Mkt.upper())
    #retObj['msg'] = retObj['msg'] + "{}".format(getwebserverosquery)
    getwebserveroscmd = "mysql -h {} -u {} -p{} -D {} -e \"{}\"".format(dbhost, dbuser, dbpwd, mainschema, getwebserverosquery)
    #retObj['msg'] = retObj['msg'] + "{}".format(getwebserveroscmd)
    ret = subprocessShellExecute(getwebserveroscmd)
    if not ret['ret']:
        retObj['msg'] = "get machine ip failed."
        retObj['ret'] = False
        print retObj
        return 1
    
    out = ret['output']
    machineip = ''
    try:
        url = out.split('\n')[1].strip('\n').strip('\r')
    except:
        retObj['msg'] = "wrong machine url{}".format(out)
        retObj['ret'] = False
        print retObj
        return 1
    if url == '':
        retObj['msg'] = "no machine information found - url:{}".format(url)
        retObj['ret'] = False
        print retObj
        return 1

    # {market_url}/api/genhostats?apiKey={}&carr=carr_low&mkt=mkt_low&recdate=RecDate&datediff=dateDiff
    urlRoot = url[:url.rfind('/')]
    apiKey = 'ICNrUHga4bu8Iz1p'
    genhostatsapi = '{}/api/genhostats?apiKey={}&recdate={}&datediff={}'.format(urlRoot, apiKey, RecDate, dateDiff)    

    r = ''
    try:
        r = requests.get(genhostatsapi)
    except:
        retObj['ret'] = False
        retObj['url'] = genhostatsapi
        retObj['code'] = -1
    finally:
        if not r == '':
            if r.status_code == requests.codes.ok:
                retObj['ret'] = True
            else:
                retObj['ret'] = False
            retObj['url'] = genhostatsapi
            retObj['code'] = r.status_code
            retObj['apiret'] = r.text
    print retObj
    return 0

############# main #############
if __name__ == "__main__":
    
    ret = main()
    os._exit(ret)
