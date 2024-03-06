import os
import os.path
import re

def backtickIt(command):
    file = os.popen(command)
    output = file.readlines()
    file.close()
    return output



for filename in os.listdir("."):
#    reResult = re.match("cortui_(.*?)bmp\\.mdl", filename)
    reResult = re.match("(.*?)guage(.*?)\\.png", filename)
    if(reResult):
        #name = reResult.group(1)
        part1 = reResult.group(1)
        part2 = reResult.group(2)
        #if(not name.startswith("parci") and not name.startswith("fp")):
        #targetname = "cortui_%s.png" % name
        targetname = "%sgauge%s.png" % (part1, part2)
        #print filename, targetname
        print "".join(backtickIt("svn move %s %s" % (filename, targetname)))
        print "================================================"
