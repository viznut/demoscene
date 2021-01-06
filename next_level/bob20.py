#!/usr/bin/env python

import sys
import os

currentFileDate=0
currentFileName=''
currentFileLine=0

def buildError(message):
  global currentFileName
  global currentFileLine
  print "ERROR: ",message,"\n"
  if currentFileName!='':
    print "file",currentFileName,"line",currentFileLine,"\n"
  exit(1)

codebase={}
streamchunks=[]

# buildpath='/cygdrive/B'
buildpath='BUILD'

finalCompilation=False

def numxlat(num):
  if type(num)==int:
    return num
  if(len(num)==0):
    return 0
  else:
    if(num[0]=='$'):
      return int(num[1:],16)
    else:
      return int(num)

def bytesinranges(ranges):
  bytes=0
  for i in range(0,len(ranges),2):
    bytes += ranges[i+1]-ranges[i]+1
  return bytes

def rangexlat(ranges):
  r=[]
  for range in ranges.split(','):
    p=range.split('-')
    r += [numxlat(p[0])]
    r += [numxlat(p[1])]
  return r

#####################################################################

class RangeSet:
  def __init__(me,points):
    me.points=points
  def add(me,p0,p1): # todo +
    max=len(me.points)
    i=0
    while i<max and p0>me.points[i]: i+=1
    j=i
    while j<max and p1>=me.points[j]: j+=1
    if i>0:
       start=me.points[0:i-1]
    else:
       start=[]
    if (i&1)==0:
       if (j&1)==0:
          me.points=me.points[0:i] + [p0] + [p1] + me.points[j:]
       else:
          me.points=me.points[0:i] + [p0] + me.points[j:]
    else:
       if (j&1)==0:
          me.points=me.points[0:i] + [p1] + me.points[j:]
       else:
          me.points=me.points[0:i] + me.points[j:]

  # BUG: [6969,7283] - [6969,7282] = [], should be [7283,7283]

  def sub(me,p0,p1):
    max=len(me.points)
    i=0
    while i<max and p0-1>=me.points[i]: i+=1
    j=i
    while j<max and p1+1>me.points[j]: j+=1  # was >=
    if i>0:
       start=me.points[0:i-1]
    else:
       start=[]
    if (i&1)==0:
       if (j&1)==0:
          me.points=me.points[0:i] + me.points[j:]
       else:
          me.points=me.points[0:i] + [p1+1] + me.points[j:]
    else:
       if (j&1)==0:
          me.points=me.points[0:i] + [p0-1] + me.points[j:]
       else:
          me.points=me.points[0:i] + [p0-1] + [p1+1] + me.points[j:]
  def splice(me,p0,p1):
     max=len(me.points)
     i=0
     while i<max and p0>me.points[i]: i+=1
     j=i
     while j<max and p1>=me.points[j]: j+=1
     if (i&1)==0:
        if (j&1)==0:
           return RangeSet(me.points[i:j])
        else:
           return RangeSet(me.points[i:j] + [p1])
     else:
        if (j&1)==0:
           return RangeSet([p0] + me.points[i:j])
        else:
           return RangeSet([p0] + me.points[i:j] + [p1])
  def holes(me,p0,p1): # todo ^
     max=len(me.points)
     i=0
     while i<max and p0>me.points[i]: i+=1
     j=i
     while j<max and p1>=me.points[j]: j+=1
     if (i&1)==0:
        if (j&1)==0:
           h=[p0-1] + me.points[i:j] + [p1+1]
        else:
           h=[p0-1] + me.points[i:j]
     else:
        if (j&1)==0:
           h=me.points[i:j] + [p1+1]
        else:
           h=me.points[i:j]
     for i in range(0,len(h),2):
       h[i]+=1
       h[i+1]-=1
       i+=2
     r = RangeSet(h)
     r.trim()
     return r
  def largest(me):
     maxsz=0
     for i in range(0,me.points,2):
       sz=1+me.points[i+1]-me.points[i]
       i+=2
       if sz>maxsz: maxsz=sz
     return maxsz
  def trim(me):
    trimmed=False
    while not trimmed:
      trimmed=True
      i=1
      while i<len(me.points)-2:
        if me.points[i]+1 == me.points[i+1] or me.points[i] == me.points[i+1]:
           me.points=me.points[0:i]+me.points[i+2:]
           trimmed=False
        else:
           i+=2

#####################################################################

class Chunk:

  def __init__(me,name):
    global currentFileDate
    global streamchunks
    if len(name)>0 and name[0]=='*':
      global chunkBaseName
      if chunkBaseName.find(name[1])>=0:
        name=chunkBaseName[0:chunkBaseName.find(name[1])]+name[1:]
      else:
        name=chunkBaseName+name[1:]
    me.name=name
    me.dependencies=[]
    me.companions=[]
    me.contents=[]
    me.containedIn=[]
    me.params={}  
    me.code=[]
    me.when=[]
    me.lastmod=currentFileDate
    me.position=-1
    me.positionSkew=0
    me.splits=[]
    me.loadedRange=[]
    me.isStreamChunk=False

    if len(name)>=3 and name[0:2]=='SC':
      global streamchunks
      me.params['streamchunk']=1
      if not streamchunks.__contains__(name):
        streamchunks+=[name]
        me.isStreamChunk=True
        me.splittable=False
        me.linkPresent=False

    if len(name)>=6 and name[0:4]=='DATA':
      sz=(len(name)-4)/2
      me.params['sz']=sz
      code='!byte '
      for i in range(0,sz):
        if i>0: code += ","
        code += '$'+name[4+i*2:6+i*2]
      me.code+=[code]
 
    if (len(name)==18 or len(name)==34) and name[0:2]=='ch':
      sz=(len(name)-2)/2
      me.params['sz']=sz
      me.params['align']=sz
      if sz==8:
        me.params['ranges']='$1400-$1bff'
      else:
        me.params['ranges']='$1400-$1fff'
      me.code=['DATA'+name[2:]+':', name+'=(DATA'+name[2:]+'-$1400)/'+str(sz)]
      code='!byte '
      for i in range(0,sz):
        if i>0: code += ","
        code += '$'+name[2+i*2:4+i*2]
      me.code+=[code]

  def register(me):
    global codebase
    if me.name!='':
      # todo if name begins with * then fix name (previous non-inline regged)
      if codebase.__contains__(me.name):
        for parmname in me.params.keys():
          if codebase[me.name].params.__contains__(parmname):
            if codebase[me.name].params[parmname]!=me.params[parmname]:
              buildError("Conflicting parameters for chunk "+me.name+"! Parameter "+parmname)
          else:
            codebase[me.name].params[parmname]=me.params[parmname]
        codebase[me.name].dependencies += me.dependencies
        codebase[me.name].contents += me.contents
        codebase[me.name].containedIn += me.containedIn
        codebase[me.name].companions += me.companions
        codebase[me.name].positionSkew += me.positionSkew
        if len(me.code)==0 or len(codebase[me.name].code)==0:
           codebase[me.name].code += me.code
      else:
        codebase[me.name]=me

  def setparam(me,param):
    parts = param.split('=',2)
    if len(parts)==1:
      parts+=[1]    
    me.params[parts[0]]=parts[1]

  def getRanges(me):
    r=me.ranges
    if me.params.__contains__('withinpagefrom'):
      fromwhere=me.params['withinpagefrom']
      p=codebase[fromwhere].position
      if p<0:
        buildError('Chunk '+fromwhere+' not positioned yet! Position of chunk '+me.name+' wants to relate to it.')
      else:
        r=[p,p+255]
    return r

  # areas:
  # - split: [startaddress, effective bytes, alloced bytes]
  # - for the first split of chunk we alloc +3 because of jump.
  #   actually, these 3 bytes are put in the end

  def getPositionAfter(me):
    if me.position<0:
      buildError("INTERNAL: Position after requested for chunk "+me.name+" whose position is unknown!")
    elif me.splits!=[]:
      lastsplit=me.splits[len(me.splits)-3:]
      return lastsplit[0]+lastsplit[2]
    else:
      return me.position+me.size

  def choosePosition(me,usages,extra,chooseBiggestHole=False):
    global codebase
    holes=RangeSet(usages).holes(-1,65536)
    holes.trim()
    holes=holes.points
    #print " - holes",holes
    bestcand=-1
    if chooseBiggestHole:
      bestcandvalue=-1
    else:
      bestcandvalue=65536
    candidates=[]
    for j in range(0,len(holes),2):
      holeSize=holes[j+1]-holes[j]+1
      if holeSize>=me.size and holes[j]>=0 and holes[j]<65536:
        pos=holes[j]
        pos=(pos+me.align-1)&~(me.align-1)

        if me.params.__contains__('nocross'):
          if me.size>256:
            buildError('Chunk '+chkn+' is too big (>256) for .nocross!')
          if (pos&255) + me.size > 256:
            pos=(pos+255)&~255

        if holes[j+1]-pos>=me.size+extra:
          value=(holes[j+1]-pos) - (me.size+extra)
          if chooseBiggestHole:
            if value>bestcandvalue:
              bestcand=pos
              bestcandvalue=value
          else:
            if bestcand<0:
              bestcand=pos
            if value<bestcandvalue and (pos>=0x100 or me.loadsize==0):
              bestcand=pos
              bestcandvalue=value
          candidates+=[pos]

          #if holes[j+1]-pos+1>=me.size+extra:
          #if not me.params.__contains__('nocross') and extra==0:
          #  pos=(holes[j+1]-me.size-pos+1)&~(me.align-1)
          #  if pos>=holes[j] and pos>=0:
          #    candidates+=[pos]

    #print 'bestcand:',bestcand,'cands:',candidates

    if me.name[0:2]=='ch' and len(candidates)>0:
      return candidates[0]
    else:
      return bestcand

#    if len(candidates)>0:
#      # non-zeropage first, then zeropage
#      for i in candidates:
#        if i>=0x100:
#           return i
#      return candidates[0]
#    else:
#      return -1

  def allocate(me):
    global usedAreasByTime
    if me.size>0:
      p0=me.position
      p1=p0+me.size-1
      print "  - allocating:",hex(int(p0)),"-",hex(int(p1))
      for t in me.when:
        usedAreasByTime[t].add(p0,p1)
        usedAreasByTime[t].trim()

  def extendSize(me,gain):
    me.size+=gain
    me.loadsize+=gain
    me.allocate()

  def getAllDependencies(me,orig):
    deps={}
    for chk in me.dependencies:
      deps[chk]=1
    for chk in me.companions:
      deps[chk]=1
    ready=False
    while not ready:
      ready=True
      for chk in deps.keys():
        if chk!=orig and deps[chk]==1:
          global codebase
          ready=False
          if codebase.__contains__(chk):
            subdeps=codebase[chk].getAllDependencies(orig)
          else:
            buildError("Can't find chunk "+chk+" required by "+me.name+"!")
          for subchk in subdeps:
            if not deps.__contains__(subchk):
              deps[subchk]=1
          deps[chk]=2
    return deps.keys()

  def writeAsmFile(me):
    global buildpath
    global codebase
    f=open(buildpath+'/'+me.name+'.asm','w')

    # todo add one-pass-is-enough optimization

    if finalCompilation:
      if me.position>=0:
        f.write('!to "'+buildpath+'/'+me.name+'.bin",cbm'+"\n")
      else:
        buildError("Chunk "+me.name+" has not been assigned a position!")
    else:
      f.write('!to "'+buildpath+'/'+me.name+'.binT",cbm'+"\n")

    for dep in me.dependencies:
      if finalCompilation:
        f.write('!src "'+buildpath+'/'+dep+'.exp"'+"\n")
      else:
        f.write('!src "'+buildpath+'/'+dep+'.expT"'+"\n")
        doTemp=True

    if finalCompilation:
      f.write('!sl "'+buildpath+'/'+me.name+'.exp"'+"\n")
    else:
      f.write('!sl "'+buildpath+'/'+me.name+'.expT"'+"\n")

    f.write("!cpu 6510\n")

    if(me.position>=0):
      f.write('*='+str(me.position)+"\n")
    else:
      if(me.params.__contains__('zp')):
        f.write("*=$01\n")
      else:
        f.write("*=$1666\n")

    if (len(me.name)==18 or len(me.name)==34) and me.name[0:2]=='ch':
      pass
    else:
      f.write(me.name+":\n")
      
    # todo we will have more of these "self-known params"
    if me.params.__contains__('dur'):
      f.write('.dur='+me.params['dur']+"\n")

    for line in me.code:
      f.write(line+"\n")

    if me.isStreamChunk and me.linkPresent:
      if me.next!='':
        nxp='$'+hex(int(codebase[me.next].position))[2:]
        f.write('!byte $e0,<'+nxp+',>'+nxp+' ; link to '+me.next+"\n")
      else:
        f.write(".eox !byte $e0,<.eox,>.eox\n")

    f.close()
    
  def compile(me,root):
    global buildpath
    global finalCompilation
    global codebase
    mustBeCompiled=False
    for dep in me.dependencies:
      if dep!=root:
        depRequiredCompilation = codebase[dep].compile(root)
        if depRequiredCompilation:
          mustBeCompiled = True

    if not mustBeCompiled:
      if finalCompilation:
        ext = '.bin'
      else:
        ext = '.binT'
      if not os.access(buildpath+'/'+me.name+ext,os.F_OK):
        mustBeCompiled = True
      else:
        if os.stat(buildpath+'/'+me.name+ext)[8] < me.lastmod:
          mustBeCompiled = True
        else:
          if finalCompilation:
            f=open(buildpath+'/'+me.name+ext)
            a=f.read(2)
            address=ord(a[0])+ord(a[1])*256
            # print me.name,"address",me.position,"<=>",address,"\n"
            f.close()
            if address != me.position:
              mustBeCompiled=True

    if mustBeCompiled:
      me.writeAsmFile()
      if finalCompilation:
        print "Compiling",me.name,"(final binary)"
      else:
        print "Compiling",me.name,"(temporary binary)"
      rc=os.system('acme '+buildpath+'/'+me.name+'.asm')
      if rc!=0:
        buildError("Error while assembling chunk "+me.name+"!")
      else:
        return True
    else:
      return False
      
  def getBytes(me):
    global finalCompilation
    me.compile(me.name)
    if finalCompilation:
      f=open(buildpath+'/'+me.name+'.bin','r')
    else:
      f=open(buildpath+'/'+me.name+'.binT','r')
    bytes=f.read()
    f.close()
    return bytes[2:]

  def checkAndGetSize(me):
    global buildpath
    global finalCompilation
    szKnown=True
    loadszKnown=True
    if me.params.__contains__('sz'):
      me.size=numxlat(me.params['sz'])
    else:
      szKnown=False
    if me.params.__contains__('ldsz'):
      me.loadsize=numxlat(me.params['ldsz'])
    else:
      loadszKnown=False
    if not (szKnown and loadszKnown):
      me.compile(me.name)
      if finalCompilation:
        if os.access(buildpath+'/'+me.name+'.bin',os.F_OK):
          if os.stat(buildpath+'/'+me.name+'.bin')[8] > me.lastmod:
            sz=os.stat(buildpath+'/'+me.name+'.bin')[6]-2
            if not szKnown:
              me.size=me.params['sz']=sz
            if not loadszKnown:
              me.loadsize=me.params['ldsz']=sz
            return me.size
      elif os.access(buildpath+'/'+me.name+'.binT',os.F_OK):
        if os.stat(buildpath+'/'+me.name+'.binT')[8] > me.lastmod:
          sz=os.stat(buildpath+'/'+me.name+'.binT')[6]-2
          if not szKnown:
            me.size=me.params['sz']=os.stat(buildpath+'/'+me.name+'.binT')[6]-2
          if not loadszKnown:
            me.loadsize=me.params['ldsz']=os.stat(buildpath+'/'+me.name+'.binT')[6]-2
          return me.size


chunk=Chunk('')

def processSourceLine(sourceLine):
  global chunk
  sourceLine=sourceLine.rstrip()
  if sourceLine[0:3]!=';,;':
    chunk.code += [sourceLine]
  else:
    sourceLine=sourceLine.split(' ; ')[0]
    parts = sourceLine.split(' ')
    if parts[1] == '->' or parts[1] == '<-' or parts[1] == '&-':
      if parts[2][0] == '.':
         buildError('Dot is illegal chunkname initial')
      relchunk=Chunk('')
      for rel in parts[2:]:
        if rel[0]!='.':
          relchunk.register()
          relchunk=Chunk(rel)
          if relchunk.name!='':
             if parts[1] == '->':
               if not chunk.contents.__contains__(relchunk.name):
                 chunk.contents += [relchunk.name]
                 print relchunk.name," is contained in ",chunk.name,"..."
                 relchunk.containedIn += [chunk.name]
             elif parts[1] == '<-':
               if not chunk.dependencies.__contains__(relchunk.name):
                 chunk.dependencies += [relchunk.name]
             else:
               if not chunk.companions.__contains__(relchunk.name):
                 chunk.companions += [relchunk.name]
        else:
          relchunk.setparam(rel[1:])
        relchunk.register()
    else:
      for chk in parts[1:]:  
        if chk[0]!='.':
          global chunkBaseName
          chunk.register()
          chunkBaseName=chunk.name
          chunk=Chunk(chk)
        else:
          chunk.setparam(chk[1:])

if(len(sys.argv)>=2):
  sourceFiles=sys.argv[1:]
else:
  buildError("Usage: "+sys.argv[0]+" asmfiles")

############################################################################
print "Gathering source code..."

for filename in sourceFiles:
  currentFileDate=os.stat(filename)[8]
  file=open(filename,'r')
  currentFileName=filename
  currentFileLine=0
  for line in file:
    currentFileLine+=1
    processSourceLine(line)
  file.close()
  chunk.register()
  chunk=Chunk('')

currentFileName=''
print "- Total",len(codebase),"chunks defined in",len(sourceFiles),"source files"

############################################################################
### precheck chunks ###

#  for subchkn in codebase[chkn].contents:
#    if not codebase.__contains__[subchkn]:
#      contchk=Chunk(subchkn)
#      contchk.dependencies=[chkn]
#      contchk.register()

############################################################################
print "Gathering dependencies..."

if len(streamchunks)==0:
  streamchunks=['main']

streamchunks.sort()

depsByTime=[]
usedAreasByTime=[]
chunkctrForTime=[]
timeIndex=0

prevsc=''
chunkctr=0
for sc in streamchunks:
  depsByTime+=[['essentials',sc]]
  usedAreasByTime+=[RangeSet([])]
  codebase[sc].when+=[timeIndex]
  codebase[sc].previous=prevsc
  codebase[sc].next=''
  for chkn in codebase['essentials'].getAllDependencies('essentials'):
    # print ' - ',chkn
    codebase[chkn].when+=[timeIndex]
    depsByTime[timeIndex]+=[chkn]
  # substantiate nede for prevsc
  if prevsc!='':
    codebase[prevsc].next=sc
  for chkn in codebase[sc].getAllDependencies(sc):
    # print ' - ',chkn
    codebase[chkn].when+=[timeIndex]
    depsByTime[timeIndex]+=[chkn]
  chunkctrForTime+=[chunkctr]
  print "* Time index",timeIndex,":",sc,'( chunkctr',chunkctr,')'
  if codebase[sc].params.__contains__('waits'):
    chunkctr+=int(codebase[sc].params['waits'])
  else:
    chunkctr+=1
  timeIndex+=1
  prevsc=sc

numberOfStreamChunks=timeIndex

print "- Total",numberOfStreamChunks,"streamchunks"

############################################################################
### remove duplicates (chunks already contained in another chunk) ###
# if containerchunk present everywhere were contained needed -> remove contained

print "Optimizing dependencies..."

for i in range(0,timeIndex):
  toBeRemoved=[]
  deps=depsByTime[i]
  for chk in deps:
    for cont in codebase[chk].containedIn:
      if deps .__contains__(cont):
        toBeRemoved+=[chk]

  for chk in toBeRemoved:
    while deps.__contains__(chk):
      deps.remove(chk)
    for c in codebase.keys():
      while codebase[c].dependencies.__contains__(chk):
        codebase[c].dependencies.remove(chk)
        #print " - Removed dependency",chk,"from",c,"..."

  depsByTime[i]=deps

############################################################################

print "Fixing per-chunk info..."

for chkn in codebase.keys():
  if len(codebase[chkn].when)>0:
    if codebase[chkn].params.__contains__('pos'):
       codebase[chkn].position = numxlat(codebase[chkn].params['pos'])
    if not codebase[chkn].params.__contains__('ranges'):
       if codebase[chkn].params.__contains__('zp'):
         ranges='$00-$ff'
       else:
         # ranges='$1000-$1fff,$0100-$03ff,$00-$ff'
         ranges='$0000-$03ff,$1000-$1fff'
         if codebase[chkn].params.__contains__('cm'):
           ranges='$9400-$97ff,'+ranges
    else:
      ranges=codebase[chkn].params['ranges']
    codebase[chkn].ranges=rangexlat(ranges)
    if not codebase[chkn].params.__contains__('align'):
       codebase[chkn].align=1
    else:
       codebase[chkn].align=numxlat(codebase[chkn].params['align'])
    codebase[chkn].when.sort()
    uniq=[]
    prev=-1
    for i in codebase[chkn].when:
      if i!=prev:
        uniq+=[i]
        prev=i
    codebase[chkn].when=uniq
  else:
    del codebase[chkn]

############################################################################
print "Obtaining object sizes..."

finalCompilation=False

for chkn in codebase.keys():
  codebase[chkn].checkAndGetSize()
  if codebase[chkn].size==0 and codebase[chkn].position<0:
    codebase[chkn].position=1337

############################################################################
print "Sorting chunks for positioning..."

posord=codebase.keys()

for chkn in posord:
  if codebase[chkn].position>=0:
    enpl=1
  else:
    bir=bytesinranges(codebase[chkn].ranges)  
    if bir<codebase[chkn].size:
      buildError('Chunk '+chkn+' is way too big! '+str(codebase[chkn].size)+' vs '+str(bir))
    if bir==codebase[chkn].size:
      enpl=1
    else:
      if codebase[chkn].params.__contains__('withinpagefrom'):
        bir=256
      enpl=(bir-codebase[chkn].size)/codebase[chkn].align + 1
    if codebase[chkn].name[0:2]=='SC':
      enpl=65536 + codebase[chkn].when[0]
  if codebase[chkn].params.__contains__('posprio'):
     posprio=codebase[chkn].params['posprio']
  else:
     posprio=100
  enpl*=posprio
  codebase[chkn].enpl=enpl

  # position of a chunk depends on another -> need 'maxenpl'
  if codebase[chkn].params.__contains__('withinpagefrom'):
    wpf=codebase[chkn].params['withinpagefrom']
    print '-',wpf,'must be positioned prior to',chkn,'- adjusting priority'
    maxenpl=enpl-1
    if codebase[wpf].params.__contains__('maxenpl'):
        if codebase[wpf].params['maxenpl']>maxenpl:
          codebase[wpf].params['maxenpl']=maxenpl
    else:
      codebase[wpf].params['maxenpl']=maxenpl

for chkn in posord:
  if codebase[chkn].params.__contains__('maxenpl'):
    maxenpl=codebase[chkn].params['maxenpl']
    if maxenpl<codebase[chkn].enpl:
      codebase[chkn].enpl=maxenpl

def posordsorter(a,b):
  c=cmp(codebase[a].enpl, codebase[b].enpl)
  if c!=0:
    return c
  c=cmp(codebase[a].when[0], codebase[b].when[0])
  if c!=0:
    return c
  c=cmp(codebase[a].when[len(codebase[a].when)-1],
        codebase[b].when[len(codebase[b].when)-1])
  return c

posord.sort(posordsorter)

############################################################################
print "Deciding positions..."

def splitStreamData(bytes,lgt):
  i=0
  oplgt=0
  while i<lgt:
    op=bytes[i]
    if op<0x40:
       oplgt=op+2  # 00 = 1 byte of data. yes, this is always bytecount
    elif op<0x80:
       oplgt=2     # opcode & 1-byte operand
    elif op<0xc0:
       oplgt=1     # always 1-byte
    elif op<0xe0:
       oplgt=2     # always 2-byte
    elif op==0xe0:
       buildError('Stream chunk contains jumps! Cannot split it!')
    elif op==0xe1:
       oplgt=2
    elif op==0xe2:
       oplgt=2
    elif op==0xe3:
       oplgt=1
    else:
       buildError('Unknown opcode in stream! Cannot split it!')
    i+=oplgt
  if i>=lgt:
    i-=oplgt
  return i

def extendUsageMap(base,when):
  global usedAreasByTime
  usedAtSomePoint=base
  for t in when:
    if t>=0:
      for i in range(0,len(usedAreasByTime[t].points),2):
        usedAtSomePoint.add(usedAreasByTime[t].points[i],usedAreasByTime[t].points[i+1])
  usedAtSomePoint.trim()
  return usedAtSomePoint

def generateUsageMap(when):
  global usedAreasByTime
  base=RangeSet([])
  return extendUsageMap(base,when)

def getPriorFreedom(t1,p0,p1):
  global usedAreasByTime
  d=0
  for t in range(t1-1,-1,-1):
    res=usedAreasByTime[t].splice(p0,p1)
    if res!=[]: break
    d+=1  # .dur instead?
  return d

def getPosteriorFreedom(t0,p0,p1):
  global usedAreasByTime
  global numberOfStreamChunks
  d=0
  for t in range(t0,numberOfStreamChunks):
    res=usedAreasByTime[t].splice(p0,p1)
    if res!=[]: break
    d+=1  # .dur instead?
  return d

def chooseFragmentation(me,holes,extra,bytes):
  for j in range(0,len(holes),2):
    holeSize=holes[j+1]-holes[j]+1
    if holeSize>=len(bytes)+extra:
      return [holes[j],me.size+extra]
  largest=1+extra
  where=-1
  for j in range(0,len(holes),2):
    holeSize=holes[j+1]-holes[j]+1
    if holeSize>=largest:
      fit=splitStreamData(bytes,holeSize+extra)
      if fit>largest:
        largest=fit
        where=j
  if where<0:
    return False
  else:
    return [holes[where],largest]

def decidePositionForChunk(chkn):
  global codebase
  global usedAreasByTime
  global decidedPosition
  global decidedFirstSplitPosition
  global decidedFirstSplitSize
  global streamchunks
  
  decidedPosition=-1
  decidedFirstSplitSize=0

  if codebase[chkn].position>=0:
    p0=codebase[chkn].position
    p1=p0+codebase[chkn].size-1
    if codebase[chkn].size>0 and not codebase[chkn].params.__contains__('mayoverlap'):
      for t in codebase[chkn].when:
        if t>=0:
          overlap = usedAreasByTime[t].splice(p0,p1).points
          if overlap!=[]:
            buildError('Fixed-position chunk '+chkn+' overlaps with something else at time index '+str(t)+'!!! Areas='+str(usedAreasByTime[t].points)+' overlap='+str(overlap))
    decidedPosition=p0
  else:
    r=codebase[chkn].getRanges()
    #print 'DBG ranges:',r
    used=RangeSet(r).holes(-1,65536)
    used.trim()
    #print 'DBG Used:',used.points
    usedAtSomePoint=extendUsageMap(used,codebase[chkn].when)
    # usedAtSomePoint=generateUsageMap(codebase[chkn].when)

    sz=codebase[chkn].size

    if codebase[chkn].isStreamChunk and codebase[chkn].previous!='':
      prev=codebase[chkn].previous
      sp=codebase[prev].getPositionAfter()
      print " - fitting ",hex(sp),"..",hex(sp+sz-1) # ," // usedatsomepoint:",usedAtSomePoint.points
      overlap=usedAtSomePoint.splice(sp,sp+sz-1).points
      # usable=ranges.splice... or something
      print " - overlap:",overlap
      if overlap==[]:
        decidedPosition=sp
        codebase[chkn].positionSkew=-3
        print " - fits after previous sc, skew -3"
        return decidedPosition
      elif codebase[chkn].splittable:
        roomsize=overlap[0]-sp
        print " - not fitting after previous sc... room",roomsize,"vs",sz
        if roomsize>0:
          bytes=codebase[chkn].getBytes()
          fitroomsize=splitStreamData(bytes,roomsize)
          if fitroomsize>0:
            print "(fitting ",fitroomsize,"bytes instead of whole sc)"
            decidedFirstSplitPosition=sp
            decidedFirstSplitSize=fitroomsize
            return -1

    if codebase[chkn].isStreamChunk:
      print " - not fitting after previous sc, linking to elsewhere"
      prevsc=codebase[chkn].previous
      if prevsc!='':
        codebase[prevsc].linkPresent=True
        codebase[prevsc].extendSize(3)
        print " - setting link flag for",prevsc
      extra=3
    else:
      extra=0

    if codebase[chkn].params.__contains__('sugpos'):
      for sugpos in codebase[chkn].params['sugpos'].split(','):
        sp=numxlat(sugpos)
        if(usedAtSomePoint.splice(sp,sp+sz-1).points==[]):
          decidedPosition=sp
          return decidedPosition

    used=usedAtSomePoint

    if codebase[chkn].params.__contains__('extra'):
      extra += int(codebase[chkn].params['extra'])

    if extra>0:
      print ' - choosing position as if the chunk required',extra,'extra bytes'

    choosebiggestchunk=codebase[chkn].isStreamChunk

    cp=codebase[chkn].choosePosition(used.points,extra,choosebiggestchunk)
    if cp<0:
      buildError("Can't find suitable hole for chunk "+chkn+"! (none available when needed)")
    bestcand=cp
    #print '- used:',used.points
    #print '- best candidate on current time:',bestcand

    depth=codebase[chkn].when[0]
    if codebase[chkn].loadsize>0:
      t1=codebase[chkn].when[0]
      for t in range(t1-1,-1,-1):
        usednew=extendUsageMap(used,[t])
        cp=codebase[chkn].choosePosition(usednew.points,extra,choosebiggestchunk)
        if cp<0:
          break
        bestcand=cp
        depth=t
        #print '- better candidate',bestcand,'... time:',t,' used:',usednew.points
        used=usednew
        if depth<t1-8: # if we get this deep, concentrate on future instead
           break

      if t1!=0 and depth==t1:
        buildError("Can't find suitable hole for chunk "+chkn+"! (none available before needed)")

    # todo maybe also scan midrange stuff

    t1=codebase[chkn].when[len(codebase[chkn].when)-1]
    height=t1
    for t in range(t1,len(streamchunks),1):
      usednew=extendUsageMap(used,[t])
      cp=codebase[chkn].choosePosition(usednew.points,extra,choosebiggestchunk)
      if cp<0:
        break
      bestcand=cp
      height=t
      #print '- better candidate, depth',bestcand,'... time:',t,' used:',usednew.points
      used=usednew

    print " - best candidate:",bestcand,'( valid',depth,'...',height,')'
    decidedPosition=bestcand

  return decidedPosition

### ###

for chkn in posord:
  print "-",chkn,'(',codebase[chkn].when,')'
  decidePositionForChunk(chkn)

  # decidedPosition means decided NON-SPLIT position
  if decidedPosition>=0:
    codebase[chkn].position=decidedPosition
    codebase[chkn].allocate()
  elif codebase[chkn].isStreamChunk and codebase[chkn].splittable:
    bytesToLocate=codebase[chkn].getBytes()
    splits=[]
    ranges=codebase[chkn].getRanges()

    if decidedFirstSplitSize>0:
      splits+=[decidedFirstSplitPosition,decidedFirstSplitSize,decidedFirstSplitSize]
      p0=decidedFirstSplitPosition
      p1=p0+decidedFirstSplitSize-1
      print "  - first split for",chkn,": ",p0,"-",p1
      for t in codebase[chkn].when:
        usedAreasByTime[t].add(p0,p1)
      codebase[chkn].positionSkew=-3
      bytesToLocate=bytesToLocate[decidedFirstSplitSize:]

    while len(bytesToLocate)>0:

      r=codebase[chkn].getRanges()
      used=r.holes(-1,65536)
      #print 'DBG Used:',used.points
      used=extendUsageMap(used,codebase[chkn].when)

      cf=codebase[chkn].chooseFragmentation(used.points,3,bytesToLocate)
      if cf==False:
        buildError("Can't find suitable hole for fragment of chunk "+chkn+"!")
        # todo support smaller fragments
      bestcand=cf

      t1=codebase[chkn].when[0]
      for t in range(t1-1,-1,-1):
        usednew=extendUsageMap(used,[t])
        cf=chooseFragmentation(usednew.points,3,bytesToLocate)
        if cf==False:
          print " - deepest valid holes reach t =",t+1
          break
        bestcand=cf
        used=usednew
        
      t1=codebase[chkn].when[len(codebase[chkn].when)-1]
      for t in range(t1,len(streamchunks),1):
        usednew=extendUsageMap(used,[t])
        cf=codebase[chkn].chooseFragmentation(usednew.points,3,bytesToLocate)
        if cf==False:
          print " - the most promising valid futures reach t =",t-1
          break
        bestcand=cf
        used=usednew

      print " - best candidate:",bestcand
      
      splits+=[bestcand[0],bestcand[1]-extra,bestcand[2]]

      p0=bestcand[0]
      p1=bestcand[0]+bestcand[1]-1
      realfit=bestcand[1]-extra
      splits+=[pos,realfit,realfit+3]
      print "  - split into:",hex(int(p0)),"-",hex(int(p1))
      for t in codebase[chkn].when:
        usedAreasByTime[t].add(p0,p1)
        usedAreasByTime[t].trim()
        print t,':',usedAreasByTime[t].points
      bytesToLocate=bytesToLocate[realfit:]

    codebase[chkn].position = splits[0]
    codebase[chkn].splits = splits

  if codebase[chkn].position<0:
     buildError('Cannot find room for chunk '+chkn+'!!!')

### infinite loop after last sc
#lastSC=streamchunks[len(streamchunks)-1]
#print ' - marking chunk',lastSC,'as final'
#codebase[lastSC].linkPresent=True
#codebase[lastSC].size+=3
#codebase[lastSC].loadsize+=3
#codebase[lastSC].next=''

############################################################################
print "Compiling final objects..."

for chnk in codebase.keys():
  if codebase[chkn].positionSkew!=0:
    newpos = codebase[chkn].position + codebase[chkn].positionSkew
    print "Chunk",chkn,"has skew",codebase[chkn].positionSkew,"; posfix",codebase[chkn].position,"->",newpos
    codebase[chkn].position = newpos
    codebase[chkn].positionSkew = 0

finalCompilation=True
for chkn in codebase.keys():
  codebase[chkn].compile(chkn)
  if codebase[chkn].loadsize>0:
    g=open(buildpath+'/'+chkn+'.bin')
    address=g.read(2)
    codebase[chkn].bytes=g.read(65536)
    g.close()

############################################################################
print "Calculating loading order..."

# depslist: memrange, chunkname

class diskChunk:
  def __init__(me,r0,r1,chkn,earliestLoad,earliestNeed):
    me.r0=r0
    me.r1=r1
    me.chkn=chkn
    me.earliestLoad=earliestLoad
    me.earliestNeed=earliestNeed
  def printInfo(me):
    global codebase
    lgt=me.r1-me.r0+1
    totalsize=codebase[me.chkn].size
    print '- load ( ti =',me.earliestLoad,') %04X'%me.r0,'-','%04X'%me.r1,':',me.chkn,'(',lgt,'/',totalsize,') reqd at',me.earliestNeed

def compareDiskChunks(x,y):
  c=cmp(x.earliestLoad,y.earliestLoad)
  if c!=0:
    return c  # if x.earliestLoad==0 or y.earliestLoad==0: return c
  else:
    if x.earliestLoad==0:
      return cmp(x.r0,y.r0) # no hurry on ti=0
    d=cmp(x.earliestNeed,y.earliestNeed)
    if d!=0:
      return d
    else:
      return cmp(x.r0,y.r0)

loadSequence=[]

notfound={}
for ti in range(0,len(streamchunks)):
 done=[]
 r=RangeSet([])
 bytecount=0
 chunkcount=0
 #print "DBG * ti=",ti
 for t in range(ti,len(streamchunks)):
   for dep in depsByTime[t]:
    if not done.__contains__(dep):
      if codebase.keys().__contains__(dep):
       if codebase[dep].size>0:
        p0=codebase[dep].position
        p1=codebase[dep].size+p0-1
        spl=r.splice(p0,p1).holes(p0,p1)
        spl.trim()
        spl=spl.points
        if codebase[dep].loadsize>0 and codebase[dep].loadedRange!=spl:
          #print "DBG  * dep ",dep,"new stuff t=",t
          newloads=RangeSet(spl)
          #print "DBG  * newloads: ",newloads.points
          lr=codebase[dep].loadedRange
          for i in range(0,len(lr),2):
            #print "DBG   * sub",lr[0],lr[1]
            newloads.sub(lr[0],lr[1])
          #print "DBG  * newloads: ",newloads.points
          newloads.trim()
          #print "DBG  * newloads: ",newloads.points
          newloads=newloads.points
          for i in range(0,len(newloads),2):
            if newloads[i]<=newloads[i+1]:
              loadSequence += [ diskChunk(newloads[i],newloads[i+1],dep,ti,t) ]
              bytecount += codebase[dep].size
              chunkcount+=1
          codebase[dep].loadedRange=spl
        done+=[dep]
        r.add(p0,p1)
        r.trim()
      else:
        notfound[dep]=1
        done+=[dep]
 if bytecount>0:
   print '- time index',ti,':',bytecount,'bytes in',chunkcount,'chunks'

for d in notfound.keys():
  print 'WARNING: chunk',d,'not found in codebase[]!?'

loadSequence.sort(cmp=compareDiskChunks)

############################################################################
print "Linking final binary..."

def writeTrackBytes(f,offset,lastbyte,bytes):
  lgt=len(bytes)
  if lgt!=lastbyte-offset+1:
    print 'WARNING: bytelength',lgt,'does not match calculated length',lastbyte-offset+1,'!!!'
  print '- writeTrackBytes (',hex(offset),'-',hex(lastbyte),')'
  if lgt>0:
    while lgt>255:
      writeTrackBytes(f,offset+lgt-255,offset+lgt-1,bytes[lgt-255:lgt])
      lgt-=255
    f.write(chr(lgt))
    offset-=1
    f.write(chr(offset&255)+chr(offset>>8))
    print "  - writing",lgt,"bytes @",offset+1
    for i in range(lgt,0,-1):
      f.write(bytes[i-1])

def writeJumpCommand(f,offset):
  print '- writeJumpCommand (',offset,')'
  f.write(chr(0)+chr(offset&255)+chr(offset>>8))

def writeWaitMarker(f,chunkno):
  global codebase
  dontloadbefore=codebase['dontloadbefore'].position
  print '- writeWaitMarker (',chunkno,')'
  writeTrackBytes(f,dontloadbefore,dontloadbefore,chr(chunkno&255))

def writeEndMarker(f):
  # write 'rts' in beginning of loader_irq to disable it
  loaderirq=0x378 # 800 # 0x375
  writeTrackBytes(f,loaderirq,loaderirq,chr(0x60))

## todo move working singleprgwriter here

t=-1
c0=c1=-1

filename='demo00.trk'
f=open(filename,'wb')

for seq in loadSequence:
  if seq.earliestLoad!=t:
    if c0>=0:
      writeTrackBytes(f,c0,c1,bytes)
      c0=c1=-1
      bytes=''
    if t==0:
      startaddr=codebase['init'].position
      writeJumpCommand(f,startaddr)
    if seq.earliestLoad>=1:
      writeWaitMarker(f,chunkctrForTime[seq.earliestLoad])
    t=seq.earliestLoad
  seq.printInfo()

      
  if c0<0:
    c0=seq.r0
    c1=seq.r1
    i=seq.r0-codebase[seq.chkn].position
    lgt=seq.r1-seq.r0+1
    if i+lgt>len(codebase[seq.chkn].bytes):
      print "WARNING: LENGTH MISCALC, COMPENSATING"
      corr=(i+lgt)-len(codebase[seq.chkn].bytes)
      i-=corr
    #print seq.chkn,'has',len(codebase[seq.chkn].bytes),'bytes vs loadsize',codebase[seq.chkn].loadsize,'... dump',lgt,'bytes from index',i,'on'
    bytes=codebase[seq.chkn].bytes[i:i+lgt]
  elif seq.r0==c1+1:
    c1=seq.r1
    ## todo: split support will complexify
    i=seq.r0-codebase[seq.chkn].position
    lgt=seq.r1-seq.r0+1
    if i+lgt>len(codebase[seq.chkn].bytes):
      print "WARNING: LENGTH MISCALC, COMPENSATING"
      corr=(i+lgt)-len(codebase[seq.chkn].bytes)
      i-=corr
    #print seq.chkn,'has',len(codebase[chkn].bytes),'bytes vs loadsize',codebase[seq.chkn].loadsize,'... dump',lgt,'bytes from index',i,'on'
    bytes+=codebase[seq.chkn].bytes[i:i+lgt]
  else:
    if c0>0:
      writeTrackBytes(f,c0,c1,bytes)
    c0=seq.r0
    c1=seq.r1
    i=seq.r0-codebase[seq.chkn].position
    lgt=seq.r1-seq.r0+1
    if i+lgt>len(codebase[seq.chkn].bytes):
      print "WARNING: LENGTH MISCALC, COMPENSATING"
      corr=(i+lgt)-len(codebase[seq.chkn].bytes)
      i-=corr
    #print seq.chkn,'has',len(codebase[seq.chkn].bytes),'bytes vs loadsize',codebase[seq.chkn].loadsize,'... dump',lgt,'bytes from index',i,'on'
    bytes=codebase[seq.chkn].bytes[i:i+lgt]

  if seq.earliestLoad>0 and seq.earliestLoad+1>=seq.earliestNeed:
    if seq.chkn[0:2]!='ch':
      print 'WARNING: TIGHT SCHEDULE! compensating with forced flush'
      writeTrackBytes(f,c0,c1,bytes)
      c0=c1=-1
    else:
      print 'WARNING: TIGHT SCHEDULE! loss is not fatal, not compensating'

# this compensation kludge works for now.
# perhaps more reliable way: append stuff from 'next'

if c0>=0:
  writeTrackBytes(f,c0,c1,bytes)

if t==0:
  startaddr=codebase['init'].position
  writeJumpCommand(f,startaddr)

writeEndMarker(f)

f.close()

exit(0)

####

def possorter(a,b):
  global codebase
  return cmp(codebase[a].position,codebase[b].position)

def linkSinglePrg(filename):
  print "Linking single-prg..."
  f=open(filename,'wb')
  offset=0x1001 
  posord=codebase.keys()
  posord.sort(possorter)
  f.write(chr(offset&255)+chr(offset>>8))
  for chkn in posord:
    if codebase[chkn].loadsize>0:
      if codebase[chkn].position < offset:
        os.remove('singleversion.prg')
        buildError("Chunk "+chkn+" has a too early position!")
      else:
        gap = codebase[chkn].position - offset
        if gap>0:
          print "- gap",gap,"@",offset
          f.write(chr(0)*gap)
          offset+=gap
      g=open(buildpath+'/'+chkn+'.bin')
      address=g.read(2)
      bytes=g.read(65536)
      g.close()
      print "- ",chkn,"@",offset,"lgt",len(bytes)
      offset+=len(bytes)
      f.write(bytes)
  f.close()


def linkTrackPrg(filename):
  print "Linking trackloader stream..."
  f=open(filename,'wb')
  posord=codebase.keys()
  posord.sort(possorter)
  for chkn in posord:
    g=open(buildpath+'/'+chkn+'.bin')
    address=g.read(2)
    bytes=g.read(65536)
    g.close()
    sz=len(bytes)
    offset=codebase[chkn].position
    if codebase[chkn].splits!=[]:
      buildError('splits not supported yet!')
    print "- ",chkn,"@",offset,"lgt",sz
    writeTrackBytes(f,offset,bytes)
  startaddr=codebase['init'].position
  f.write(chr(0)+chr(startaddr&255)+chr(startaddr>>8))
  f.close()

# linkSinglePrg('singleversion.prg')
linkTrackPrg('demo00.trk')

#rc=os.system('pucrunch -c20 -m5 -fshort -s -x'+str(codebase['main'].position)+' sing-prepu.prg > singleversion.prg')
#if rc!=0:
#  buildError("Error while pucrunching!")
#rc=os.system('pucrunch -u singleversion.prg > sing-unpu.prg')
#if rc!=0:
#  buildError("Error while verifying pucrunch!")


# TODO: support LOADSIZE & sc duration, reserve loading time
# TODO: heuristics for choosing best candidate
# TODO: SC autosplitting & binding

# TODO: GENERATOR FOR FINAL STREAM
# - loading priority of a chunk at a point of time:
#   (bytes left to be loaded) / (time left until chunk is required)
# - here we do the stuff time-progressively.
# - once chunk is no longer required,
#   check what's coming next in that space and put it to loadnext list.
# - in loadnext: 

# initial load of <4K takes >4sec! perhaps safest to assume 0.5K/sec

