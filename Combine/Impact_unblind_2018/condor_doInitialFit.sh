#!/bin/sh
ulimit -s unlimited
set -e
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Combine/Impact_unblind_2018

if [ $1 -eq 0 ]; then
  combine -M MultiDimFit -n _initialFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets --algo singles --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi

