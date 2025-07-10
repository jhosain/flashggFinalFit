# Script for running background fitting jobs for flashggFinalFit

from optparse import OptionParser
from collections import OrderedDict as od
from tools import *
import numpy as np
import os
import concurrent.futures
import ROOT
import glob
import re
import os
from optparse import OptionParser
import subprocess
import json
from biasUtils import *



# Import tools

from commonTools import *
from commonObjects import *
# python GOF_test.py --step Toy --ext GOF_ALT_0PH_2sigma --FixValue 0.000958
# python GOF_test.py --step Toy --ext GOF_ALT_0PH_2sigma --FixValue 0.
# python GOF_test.py --step Toy --ext GOF_ALT_0PH_2sigma --FixValue -0.000846
import ROOT as r
r.gROOT.SetBatch(True)
r.gStyle.SetOptStat(2211)

def get_options():
  parser = OptionParser()
  parser.add_option('--step', dest='step', default='Fit', help="Toy or Fit")
  parser.add_option('--nToys', dest='nToys', default=10, type='int', help="Number of toys")
  parser.add_option('--nJobs', dest='nJobs', default=300, type='int', help="Number of jobs")
  parser.add_option('--ext', dest='ext', default='GOF', help="Estensione che vuoi per i jobs")
  parser.add_option('--poi', dest='poi', default='fa3_ggH', help="parameter of interest")
  parser.add_option('--FixValue', dest='FixValue', default='0.0', help="Fix Value of the parameter of interest")
  parser.add_option('--printOnly', dest='printOnly', default=False, action="store_true", help="Dry run: print submission files only")
  parser.add_option('--batch', dest='batch', default='condor', help='Batch: [crab,condor/SGE/IC/lxbatch]')
  parser.add_option('--queue', dest='queue', default='nextweek', help='Queue e.g. for condor=workday, for IC=hep.q')
  parser.add_option('--subOpts', dest='subOpts', default="", help="Submission options")

  return parser.parse_args() 
(opt,args) = get_options()

# Options for job submission                                                                                                     
                                                                                                                                  
if opt.batch == 'condor':
  sub_opts = "--sub-opts=\'+JobFlavour = \"%s\""%opt.queue
  if opt.subOpts != "": sub_opts += "\n%s"%opt.subOpts
  sub_opts += "\'"
  job_opts = "--job-mode condor %s"%sub_opts
elif( opt.batch == 'SGE' )|( opt.batch == 'IC' )|( opt.batch == 'lxbatch' ):
  sub_opts = "--sub-opts=\'-q %s"%opt.queue
  if opt.subOpts != "": sub_opts += " %s"%opt.subOpts
  sub_opts += "\'"
  job_opts = "--job-mode %s %s"%(opt.batch,sub_opts)
elif opt.batch == "local":
  job_opts = ""
  print "--> Will print the commands to run combine without combineTool interactively\n\n"
else:
  print " --> [ERROR] Batch mode (%s) not supported. Leaving"%opt.batch
  leave()

print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RUNNING TOYS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
def leave():
  print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ RUNNING TOYS (END) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  sys.exit(1)

#Datacard = '/eos/cms/store/group/phys_higgs/cmshgg/fderiggi/Datacards_DecemberProduction/Datacard_ALT_0M_TTH.root'

#Datacard = '/afs/cern.ch/user/f/fderiggi/AC/CMSSW_10_2_13/src/flashggFinalFit/Combine/Checks/GOF/Datacard_ALT_0M_OneSyst.root'
Datacard = '/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V9/CMSSW_11_3_4/src/flashggFinalFit/Combine/Gofits/Datacard.root'

data_jobDir = "NominalData_%s"%(opt.ext)
data_outputDir = "/eos/home-j/jhossain/Hgg_AC_analysis/Analysis_2024/Categorization/3D_Cat_DCP/Opt_RunII/RunII/Gofit/Output"+data_jobDir

toy_jobDir = "NominalToys_%s"%(opt.ext)
toy_outputDir = "/eos/home-j/jhossain/Hgg_AC_analysis/Analysis_2024/Categorization/3D_Cat_DCP/Opt_RunII/RunII/Gofit/Output"+toy_jobDir

collect_jobDir = "NominalCollect_%s"%(opt.ext)
collect_outputDir = "/eos/home-j/jhossain/Hgg_AC_analysis/Analysis_2024/Categorization/3D_Cat_DCP/Opt_RunII/RunII/Gofit/Output"+collect_jobDir


fit_jobDir = "NominalFits_%s_%s"%(opt.ext, opt.poi) 
fit_outputDir = "/eos/home-j/jhossain/Hgg_AC_analysis/Analysis_2024/Categorization/3D_Cat_DCP/Opt_RunII/RunII/Gofit/Output_NominalFits_%s_%s"%(opt.ext, opt.poi)


if opt.step == "Data":
 
  cmdLine = "mkdir -p  %s"%(data_jobDir)
  run(cmdLine)

  cmdLine = "mkdir -p  %s"%(data_outputDir )
  run(cmdLine)

  #_f = open("%s/Data.txt"%(data_jobDir),"w")
  #for n in range(eval(opt.nToys)):
  _cmd = "combine -m 125 -d %s  --X-rtd FITTER_NEW_CROSSING_ALGO  --X-rtd FITTER_NEVER_GIVE_UP --X-rtd FITTER_BOUND --cminFallbackAlgo Minuit2,0:1. --cminDefaultMinimizerStrategy 0 --X-rtd MINIMIZER_freezeDisassociatedParams --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2 -M GoodnessOfFit --algo=saturated  --setParameterRanges muV=0,5:mu_ggH=0,5:fa3_ggH=-1,1:fa3=-1,1 -n DataGOF --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0 ;mv higgsCombine*DataGOF* %s/DataGOF_data.root "%(Datacard,data_outputDir)
  print(_cmd)
  os.system(_cmd)
  #_f.write("%s\n"%_cmd)
  #_f.close()
  #writeSubFiles('Output_'+opt.ext+'_'+opt.step+'_Jobs',"%s/Data.txt"%(data_jobDir), batch = 'condor')


if opt.step == "Toy":
 
  cmdLine = "mkdir -p  %s"%(toy_jobDir)
  run(cmdLine)

  cmdLine = "mkdir -p  %s"%(toy_outputDir )
  run(cmdLine)

  #_f = open("%s/Toy.txt"%(toy_jobDir),"w")
  for i_job in range(opt.nJobs):

     _cmd = "python combineTool.py -m 125 -s -1 -t %s -d %s --X-rtd FITTER_NEW_CROSSING_ALGO  --X-rtd FITTER_NEVER_GIVE_UP --X-rtd FITTER_BOUND --cminFallbackAlgo Minuit2,0:1. --cminDefaultMinimizerStrategy 0 --X-rtd MINIMIZER_freezeDisassociatedParams --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2 -M GoodnessOfFit -n ToyGOF --algo=saturated --setParameterRanges muV=0,5:mu_ggH=0,5:fa3_ggH=-1,1:fa3=-1,1 --setParameters  muV=1,mu_ggH=1,fa3_ggH=0,fa3=0 --task-name toy_%g"%(opt.nToys,Datacard,i_job)
 
  #_f.write("%s\n"%_cmd)
  #_f.close()
  #writeSubFiles('Output_'+opt.ext+'_'+opt.step+'_Jobs',"%s/Toy.txt"%(toy_jobDir), batch = 'condor')

     _cmd += " %s;"%job_opts
  
  #_cmd += "mv higgsCombine*ToyGOF*mH125.%s.root %s/ToysGOF_toys_%s.root ;"%(i_job,toy_outputDir,i_job)
     print(_cmd)
     os.system(_cmd)


if opt.step == "Collect":

  txt_file = "Collect.txt"
  cmdLine = "mkdir -p  %s"%(collect_jobDir)
  run(cmdLine)

  cmdLine = "mkdir -p  %s"%(collect_outputDir )
  run(cmdLine)


  for i_job in range(opt.nJobs):
    cmd = "mv higgsCombineToyGOF.GoodnessOfFit.mH125.%s.root %s/ToysGOF_toys_%s.root ;"%(i_job,toy_outputDir,i_job)


    print(cmd)
    os.system(cmd)
    
  _f = open("%s/%s"%(toy_jobDir,txt_file),"w")

  
  _cmd = "hadd -f  %s/ToysGOF_toys.root %s/ToysGOF_toys_*.root "%(collect_outputDir,toy_outputDir)
  _f.write("%s\n"%_cmd)
  _f.close()
  writeSubFiles('Output_'+opt.ext+'_'+opt.step+'_Jobs',"%s/%s"%(toy_jobDir,txt_file), batch = 'condor')




if opt.step == "Json":
  txt_file = "Json.txt"
  _f = open("%s/%s"%(toy_jobDir,txt_file),"w")
 
  _cmd = "pythond combineTool.py -M CollectGoodnessOfFit --input  %s/ToysGOF_toys.root %s/DataGOF_data.root -m 125.0 "%(collect_outputDir,data_outputDir)
  print(_cmd)
  _f.write("%s\n"%_cmd)
  _f.close()
  writeSubFiles('Output_'+opt.ext+'_'+opt.step+'_Jobs',"%s/%s"%(toy_jobDir,txt_file), batch = 'condor')

