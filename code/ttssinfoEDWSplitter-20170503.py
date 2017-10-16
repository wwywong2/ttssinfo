#!/usr/bin/python
import os,shutil
import sys
import struct
import time
import gzip
from pip._vendor.pkg_resources import null_ns_handler

def recursive_walk(sroot):
    sDirTree=''
    justFileName= sroot;
    if (justFileName.rfind('/') >= 0):
        sDirTree = justFileName[0:justFileName.rfind('/')]
        justFileName = justFileName[justFileName.rfind('/')+1:]
        
    if (justFileName.rfind('\\') >= 0):
        sDirTree = justFileName[0:justFileName.rfind('\\')]
        justFileName = justFileName[justFileName.rfind('\\')+1:]        
            
    for folderName, subfolders, filenames in os.walk(sDirTree):        
        if subfolders:
            for subfolder in subfolders:                
                recursive_walk(sDirTree+'/'+subfolder)     
        for f in filenames:
            sFileName = f
            if sFileName.find(justFileName) >= 0:
                yield os.path.abspath(os.path.join(folderName, f))                 
    
                   
def getuncompressedsize(filename):
    with open(filename, 'rb') as f:
        f.seek(-4, 2)
        return struct.unpack('I', f.read(4))[0]


def ReadInput(inputFullDir):
    fcoll = list()
    if os.path.isdir(inputFullDir):
        for fn in os.listdir(inputFullDir):
            if fn.endswith('.gz'):
                fcoll.append(inputFullDir+'/'+fn)
    elif os.path.exists(inputFullDir):
        if inputFullDir.endswith('.gz'):
            fcoll.append(inputFullDir)
    return fcoll     


if __name__ == '__main__':      
    
    #scodePathFile= os.path.realpath(__file__)
    
    start = time.time()
    nNumParam= len(sys.argv)
    if nNumParam < 4:
        exit()
    bCreateTreeStruct = sys.argv[1].lower()
    inputDir = sys.argv[2]
    screateSetDir = sys.argv[3]
    sOutLocation=screateSetDir
    sRegion=''
    sVendor=''
    
    if nNumParam >4:
        sRegion= sys.argv[4]
    if nNumParam >5:            
        sVendor= sys.argv[5]
    
    fcoll = recursive_walk(inputDir)    
    if fcoll  == 0:
        exit()
                
    longSize= fcoll        
   
    if not os.path.exists(screateSetDir):
        os.makedirs(screateSetDir)    
        
    nfile=0    
    lstLogError = list()
    dataArray= list()

    for fn in fcoll:
        justFileName= fn;
        if (justFileName.rfind('/') >= 0):
            justFileName = justFileName[justFileName.rfind('/')+1:]
        if (justFileName.rfind('\\') >= 0):
            justFileName = justFileName[justFileName.rfind('\\')+1:]        
        if fn.endswith('.gz'):
            f=gzip.open(fn,'rb')
        else:
            f=open(fn)
        
        nfile=nfile+1
        print str(nfile) +' ='+ fn
        if len(fn) > 0:
            count = 0
            curr_py_path='curr_py_path'
            
            sOutLocation=screateSetDir            
            aItemsHeader=list()
            prevaItems=list()
            prevaItems.append('')
            prevaItems.append('')
            prevaItems.append('')
            prevaItems.append('')
            global fw
            nNodata=0
            for sline in f:            
                count = count + 1
                try:
                    #sline=f.readline()                    
                    aItems=sline.split('|')
                    if (aItems[0].rfind('---') >= 0 or len(aItems[0]) <= 0):
                        continue                    
                    if (aItems[0].lower()=='filename' and aItems[1].lower()=='market'):
                        aItemsHeader=sline.split('|')                        
                        continue                   
                     
                    if not (aItems[0] == prevaItems[0] and aItems[1] == prevaItems[1] and aItems[2] == prevaItems[2]): 
                        if count > 3:
                            fw.close()
                        
                        try:
                            sCreateTreePath=sOutLocation
                            if (bCreateTreeStruct == 'y'):
                                sCreateTreePath=os.path.join(sOutLocation,sRegion,aItems[1],sVendor,aItems[2])
                            else:
                                sCreateTreePath=sOutLocation
                                
                            if not os.path.exists(sCreateTreePath):
                                os.makedirs(sCreateTreePath)
                        except Exception as e:                            
                            print "Exception1: %s in file: %s" % (e, fn)
                        
                        try:                            
                            if not os.path.exists(sCreateTreePath+'/'+aItems[0].upper()+'.csv'):
                                
                                fw = open(sCreateTreePath+'/'+aItems[0].upper()+'.csv','a')
                                
                                nItem=0
                                sAppendLine=''
                                for sitem in aItemsHeader:  
                                    nItem =nItem+1                        
                                    if (nItem>3):
                                        if sAppendLine == '':
                                            sAppendLine=sitem
                                        else:
                                            sAppendLine=sAppendLine+'|'+sitem                                       
                                
                                fw.write(sAppendLine)
                            else:
                                fw = open(sCreateTreePath+'/'+aItems[0].upper()+'.csv','a')
                        except Exception as e:
                            print "Exception2: %s in file: %s" % (e, fn)
                            
                    sAppendLine=''
                    nItem=0
                    for sitem in aItems:  
                        nItem =nItem+1                        
                        if (nItem>3):                                                       
                            if sAppendLine == '':
                                sAppendLine=sitem
                            else:
                                sAppendLine=sAppendLine+'|'+sitem
                         
                       
                    fw.write(sAppendLine.replace('NULL', ''))
                    
                    
                    prevaItems=aItems
                    
                    #{'host':a2[0],'user':a2[1],'passwd':a2[2],'schema':a2[3],'table':a2[4]}
                    
                except Exception as e:                    
                    print "Exception3 in file: %s" % ( fn)
                    break
            fw.close()
        f.close()           
        