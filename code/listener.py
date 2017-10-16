import sys
import time
import logging
import os
import datetime
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler 

# RESOURCES: http://brunorocha.org/python/watching-a-directory-for-file-changes-with-python.html

def getPath(fullpath):
	return os.path.dirname(fullpath)

def getFilename(fullpath):
	return os.path.basename(fullpath)

class MyHandler(PatternMatchingEventHandler):
    patterns = ["*.*", "*.xml", "*.html"]

    def process(self, event):
        ptInTime = datetime.datetime.now().strftime('%Y%m%d%H%M%S%f')
        """
        event.event_type 
            'modified' | 'created' | 'moved' | 'deleted'
        event.is_directory
            True | False
        event.src_path
            path/to/observed/file
        """
        # the file will be processed there
        print "=== FILE SYSTEM ACTIVITY ====================="
        print "Directory: " + getPath(event.src_path)
        print "Filename : " + getFilename(event.src_path)
        print "Fullpath : " + event.src_path
        print "Event    : {} ({}-{}-{} {}:{}:{}-{})"\
            .format( event.event_type
            , ptInTime[:4], ptInTime[4:6], ptInTime[6:8], ptInTime[8:10], ptInTime[10:12], ptInTime[12:14]
            , ptInTime[14:len(ptInTime)])

    #def on_any_event(self, event):
    #    self.process(event)

    def on_created(self, event):
        self.process(event)

    def on_deleted(self, event):
        self.process(event)

    '''
    def on_modified(self, event):
        self.process(event)
    '''

    def on_moved(self, event):
        self.process(event)

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO,
                        format='%(asctime)s - %(message)s',
                        datefmt='%Y-%m-%d %H:%M:%S')
    path = sys.argv[1] if len(sys.argv) > 1 else '.'
    observer = Observer()
    observer.schedule(MyHandler(), path, recursive=True)
    observer.start()
    print ("listening ... ")
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()