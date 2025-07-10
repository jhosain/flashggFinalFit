#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`

## command for the expected case where fa3 and MH fixed

python combineTool.py --floatOtherPOIs 1 -P fa3_ggH --algo grid --alignEdges 1 --redefineSignalPOIs fCP_Htt,mu_ggH,muV --saveInactivePOI 1 --setParameterRanges muV=0,5:mu_ggH=0,5:fCP_Htt=-1,1 --setParameters muV=1,mu_ggH=1,fCP_Htt=0,fa3=0 --freezeParameters MH,fa3 --robustFit=1 --setRobustFitAlgo=Minuit2,Migrad --X-rtd FITTER_NEW_CROSSING_ALGO --setRobustFitTolerance=0.2 --X-rtd FITTER_NEVER_GIVE_UP --X-rtd FITTER_BOUND --cminFallbackAlgo Minuit2,0:1. --cminDefaultMinimizerStrategy 0 --X-rtd MINIMIZER_freezeDisassociatedParams --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2 -M MultiDimFit -m 125.38 -d Datacard_fa3_ggH.root --points 80 -n _scan_exp_fa3_ggH_from_AC_HGG_HPlus2Jets --setCrossingTolerance 0.000001 --X-rtd REMOVE_CONSTANT_ZERO_POINT=1 -t -1 -v 1 --job-mode condor --split-points 10 --sub-opts='+JobFlavour="workday"' --task-name mytask_fa3_ggH

