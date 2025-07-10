#!/bin/sh
ulimit -s unlimited
set -e
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Combine

if [ $1 -eq 0 ]; then
  combine Datacard_RunII.root --saveWorkspace --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0 --freezeParameters MH,muV,mu_ggH,fa3,fa3_ggH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -M MultiDimFit -m 125.38 --setParameterRanges muV=0,5:mu_ggH=0,5:fa3_ggH=-1,1 -n .bestfit
fi

