#!/bin/bash
ulimit -s unlimited
set -e
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Datacard
export PYTHONPATH=$PYTHONPATH:/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/tools:/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Datacard/tools

python /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Datacard/makeYields.py --cat AC_Bin24 --procs auto --ext 2016PostVFP --mass 125 --inputWSDirMap 2016PostVFP=Trees/Opt_2016PostVFP/3D_DCP_CPodd_p25_Bkg_p60_2016PostVFP/Trees2WS_2016PostVFP/WS --sigModelWSDir ./Models/signal --sigModelExt packaged --bkgModelWSDir ./Models/background --bkgModelExt multipdf  --skipZeroes
