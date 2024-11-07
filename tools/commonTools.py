import os, sys
import glob
import re
import ROOT
import math
from collections import OrderedDict as od
from commonObjects import *

# Function for iterating over ROOT argsets in workspace
def rooiter(x):
  iter = x.iterator()
  ret = iter.Next()
  while ret:
    yield ret
    ret = iter.Next()

def extractWSFileNames( _inputWSDir ): 
  if not os.path.isdir(_inputWSDir):
    print " --> [ERROR] No such directory (%s)"
    return False
  return glob.glob("%s/output_*.root"%_inputWSDir)

def extractListOfProcs( _listOfWSFileNames ):
  procs = []
  for fName in _listOfWSFileNames:
    p = fName.split("pythia8_")[1].split(".root")[0]
    if p not in procs: procs.append(p)
  return ",".join(procs)

def extractListOfCats( _listOfWSFileNames ):
  f0 = ROOT.TFile(_listOfWSFileNames[0]) 
  ws = f0.Get(inputWSName__)
  allData = ws.allData()
  cats = []
  for d in allData:
    # Skip systematics shifts
    if "sigma" in d.GetName(): continue
    # Skip NOTAG
    elif "NOTAG" in d.GetName(): continue
    # Add to list: name of the form {proc}_{mass}_{sqrts}_{cat}
    cats.append(d.GetName().split("_%s_"%sqrts__)[-1])
  ws.Delete()
  f0.Close()
  return ",".join(cats)

def extractListOfCatsFromData( _fileName ):
  f = ROOT.TFile(_fileName)
  ws = f.Get(inputWSName__)
  allData = ws.allData()
  cats = []
  for d in allData:
    c = d.GetName().split("Data_%s_"%sqrts__)[-1]
    cats.append(c)
  cats.sort()
  ws.Delete()
  f.Close()
  return ",".join(cats)

def containsNOTAG( _listOfWSFileNames ):
  f0 = ROOT.TFile(_listOfWSFileNames[0]) 
  ws = f0.Get(inputWSName__)
  allData = ws.allData()
  for d in allData:
    if "NOTAG" in d.GetName(): return True
  return False

# Function to return signal production (and decay extension if required) from input file name
def signalFromFileName(_fileName):
  p, d = None, None
  if "ggZH" in _fileName:
    p = "ggzh"
    if "ZToLL" in _fileName: d = "_ZToLL"
    elif "ZToNuNu" in _fileName: d = "_ZToNuNu"
    else: d = "_ZToQQ"
  elif "GluGlu" in _fileName: p = "jjh"
  elif "VBF" in _fileName: p = "vbf"
  elif "WH" in _fileName: p = "wh"
  elif "ZH" in _fileName: p = "zh"
  elif "ttH" in _fileName: p = "tth"
  elif "THQ" in _fileName: p = "thq"
  elif "THW" in _fileName: p = "thw"
  elif "bbH" in _fileName: p = "bbh"
  else:
    print " --> [ERROR]: cannot extract production mode from input file name. Please update tools.commonTools.signalFromFileName"
    exit(1)
  if "minlo" in _fileName:
    if "SM" in _fileName:
      p += "0P"
    elif "MM" in _fileName:
      p += "0Mf05ph0"
    elif "CPodd" in _fileName:
      p += "0M"
    else:
      print " --> [ERROR]: cannot extract production mode from input file name. Please update tools.commonTools.signalFromFileName"
      exit(1)
  if "JHUGen" in _fileName:
    if "f05ph0" in _fileName:
      p += "0Mf05ph0"
    elif "0M" in _fileName:
      p += "0M"
    elif "0PM" in _fileName:
      p += "0P"
    else:
      print " --> [ERROR]: cannot extract production mode from input file name. Please update tools.commonTools.signalFromFileName"
      exit(1)
  if "-powheg-" in _fileName:
    p += "0P"
  elif "-amcatnlo-" in _fileName:
    p += "0P"
  else:
    print " --> [ERROR]: cannot extract production mode from input file name. Please update tools.commonTools.signalFromFileName"
    exit(1)
    return p,d

# Function for converting STXS process to production mode in dataset name
procToDataMap = od()
procToDataMap['HHH'] = 'gghhh'
procToDataMap['GG2H'] = 'ggh'
procToDataMap['GG2HbsmM'] = 'jjh0M'
procToDataMap['GG2HMf05ph0'] = 'jjh0Mf05ph0'
procToDataMap['GG2Hsm'] = 'jjh0P'
procToDataMap['VBF'] = 'vbf'
procToDataMap['VBFbsmM'] = 'vbf0M'
procToDataMap['VBFMf05ph0'] = 'vbf0Mf05ph0'
procToDataMap['VBFsm'] = 'vbf0P'
procToDataMap['WHbsmM'] = 'wh0M'
procToDataMap['WHMf05ph0'] = 'wh0Mf05ph0'
procToDataMap['WHsm'] = 'wh0P'
procToDataMap['ZHbsmM'] = 'zh0M'
procToDataMap['ZHMf05ph0'] = 'zh0Mf05ph0'
procToDataMap['ZHsm'] = 'zh0P'
procToDataMap['TTHbsmM'] = 'tth0M'
procToDataMap['TTHMf05ph0'] = 'tth0Mf05ph0'
procToDataMap['TTHsm'] = 'tth0P'
procToDataMap['WH2HQQ'] = 'wh'
procToDataMap['ZH2HQQ'] = 'zh'
procToDataMap['QQ2HLNU'] = 'wh'
procToDataMap['QQ2HLL'] = 'zh'
procToDataMap['TTH'] = 'tth'
procToDataMap['BBH'] = 'bbh'
procToDataMap['THQ'] = 'thq'
procToDataMap['THW'] = 'thw'
procToDataMap['GG2HQQ'] = 'ggzh'
procToDataMap['GG2HLL'] = 'ggzh'
procToDataMap['GG2HNUNU'] = 'ggzh'
def procToData( _proc ):
  k = _proc.split("_")[0]
  if k in procToDataMap: _proc = re.sub( k, procToDataMap[k], _proc )
  return _proc

def dataToProc( _d ):
  dataToProcMap = {v:k for k,v in procToDataMap.iteritems()}
  if _d in dataToProcMap: return dataToProcMap[_d]
  else: return _d

# Mapping of process to name in datacard
procToDatacardNameMap = od()
procToDatacardNameMap['GG2H'] = "ggH"
procToDatacardNameMap['HHH'] = "gghhh"
procToDatacardNameMap['GGH2JetspseudoscalarM'] = 'jjh0M'
procToDatacardNameMap['GGH2JetspseudoscalarMf05ph0'] = 'jjh0Mf05ph0'
procToDatacardNameMap['GGH2Jetssm'] = 'jjh0P'
procToDatacardNameMap['GG2HbsmM'] = 'jjh0M'
procToDatacardNameMap['GG2HMf05ph0'] = 'jjh0Mf05ph0'
procToDatacardNameMap['GG2Hsm'] = 'jjh0P'
procToDatacardNameMap['VBF'] = "vbf"
procToDatacardNameMap['VBFbsmM'] = 'vbf0M'
procToDatacardNameMap['VBFMf05ph0'] = 'vbf0Mf05ph0'
procToDatacardNameMap['VBFsm'] = 'vbf0P'
procToDatacardNameMap['WHbsmM'] = 'wh0M'
procToDatacardNameMap['WHMf05ph0'] = 'wh0Mf05ph0'
procToDatacardNameMap['WHsm'] = 'wh0P'
procToDatacardNameMap['ZHbsmM'] = 'zh0M'
procToDatacardNameMap['ZHMf05ph0'] = 'zh0Mf05ph0'
procToDatacardNameMap['ZHsm'] = 'zh0P'
procToDatacardNameMap['TTHbsmM'] = 'tth0M'
procToDatacardNameMap['TTHMf05ph0'] = 'tth0Mf05ph0'
procToDatacardNameMap['TTHsm'] = 'tth0P'
procToDatacardNameMap['WH2HQQ'] = "WH_had"
procToDatacardNameMap["ZH2HQQ"] = "ZH_had"
procToDatacardNameMap["QQ2HLNU"] = "WH_lep"
procToDatacardNameMap["QQ2HLL"] = "ZH_lep"
procToDatacardNameMap["TTH"] = "ttH"
procToDatacardNameMap["BBH"] = "bbH"
procToDatacardNameMap["THQ"] = "tHq"
procToDatacardNameMap["THW"] = "tHW"
procToDatacardNameMap["TH"] = "tHq"
procToDatacardNameMap["GG2HQQ"] = "ggZH_had"
procToDatacardNameMap["GG2HLL"] = "ggZH_ll"
procToDatacardNameMap["GG2HNUNU"] = "ggZH_nunu"

def procToDatacardName( _proc ):
  k = _proc.split("_")[0]
  if k in procToDatacardNameMap: _proc = re.sub( k, procToDatacardNameMap[k], _proc )
  return _proc
