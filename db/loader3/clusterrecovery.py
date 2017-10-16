#!/usr/bin/python

import os, sys, subprocess
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
    retObj = {}
    retObj['msg'] = ''
    argvs = len(sys.argv)
    try:	
        carr = sys.argv[1]
        mkt = sys.argv[2]
        dbhost = sys.argv[3]
        dbuser = sys.argv[4]
        dbpwd = sys.argv[5]
        dbport = sys.argv[6]
    except:
        retObj['ret'] = False
        retObj['msg'] = 'Arguments are incorrect.'
        print retObj
        return 1
    
    carr_low = carr.lower()
    mkt_low = mkt.lower()

    mainschema = 'optpcs_{}'.format(carr_low)
    getwebserverosquery = "select url From markets where suffix = '{}'".format(mkt.upper())
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

    # {market_url}/api/clusterrecovery?apiKey={}&carr=carr_low&mkt=mkt_low
    urlRoot = url[:url.rfind('/')]

    clusterMap = "clustermap.json"
    clusterMapUrl='{}/mymaps/{}'.format(urlRoot, clusterMap)
    ret = checkUrlFileExist(clusterMapUrl)
    if not ret['ret']:
        retObj['ret'] = False
        retObj['msg'] = 'No cluster recovery map found on website {}'.format(clusterMapUrl)
        print retObj
        return retObj
    
    apiKey = 'ICNrUHga4bu8Iz1p'

    # debug switch
    # clusterrecoveryapi = '{}/api/clusterrecovery?apiKey={}&clsUrl={}&debug=y'.format(urlRoot, apiKey, clusterMapUrl)
    clusterrecoveryapi = '{}/api/clusterrecovery?apiKey={}&clsUrl={}'.format(urlRoot, apiKey, clusterMapUrl)    
    r = ''
    try:
        r = requests.get(clusterrecoveryapi)
    except:
        retObj['ret'] = False
        retObj['url'] = clusterrecoveryapi
        retObj['code'] = -1
    finally:
        if not r == '':
            if r.status_code == requests.codes.ok:
                retObj['ret'] = True
            else:
                retObj['ret'] = False
            retObj['url'] = clusterrecoveryapi
            retObj['code'] = r.status_code
            retObj['apiret'] = r.text
    print retObj
    
    return 0

############# main #############
if __name__ == "__main__":
    ret = main()
    os._exit(ret)
