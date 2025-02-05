#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src ; eval $(scram runtime -sh); cd -
cp /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Binning/TMVAClassification__BDT_Xgrad_multiclass_CPodd_threeclass_VBF.weights.xml .
cp /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Binning/TreeMakerForWorkspace_multiclassBDT_3D_Central.C .
root -l -b -q 'TreeMakerForWorkspace_multiclassBDT_3D_Central.C(0,0,0,9,0,"2017")'
