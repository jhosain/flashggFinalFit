#!/bin/sh
ulimit -s unlimited
set -e
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src
export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh
eval `scramv1 runtime -sh`
cd /afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Combine/Impact_unblind_2018

if [ $1 -eq 0 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_BR_hgg --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P BR_hgg --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 1 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_JetHEM_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_JetHEM_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 2 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_LooseMvaSF_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_LooseMvaSF_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 3 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_PUJIDShift_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_PUJIDShift_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 4 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_PreselSF_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_PreselSF_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 5 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_SigmaEOverEShift_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_SigmaEOverEShift_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 6 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_TriggerWeight_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_TriggerWeight_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 7 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_electronVetoSF_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_electronVetoSF_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 8 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_FNUFEB_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_FNUFEB_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 9 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_FNUFEE_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_FNUFEE_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 10 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_HighR9EBPhi_13TeVsmear_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_HighR9EBPhi_13TeVsmear_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 11 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_HighR9EBRho_13TeVsmear_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_HighR9EBRho_13TeVsmear_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 12 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_HighR9EB_13TeVscale_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_HighR9EB_13TeVscale_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 13 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_HighR9EEPhi_13TeVsmear_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_HighR9EEPhi_13TeVsmear_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 14 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_HighR9EERho_13TeVsmear_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_HighR9EERho_13TeVsmear_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 15 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_HighR9EE_13TeVscale_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_HighR9EE_13TeVscale_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 16 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_LowR9EBPhi_13TeVsmear_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_LowR9EBPhi_13TeVsmear_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 17 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_LowR9EBRho_13TeVsmear_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_LowR9EBRho_13TeVsmear_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 18 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_LowR9EB_13TeVscale_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_LowR9EB_13TeVscale_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 19 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_LowR9EEPhi_13TeVsmear_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_LowR9EEPhi_13TeVsmear_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 20 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_LowR9EERho_13TeVsmear_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_LowR9EERho_13TeVsmear_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 21 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_LowR9EE_13TeVscale_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_LowR9EE_13TeVscale_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 22 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_MaterialCentralBarrel_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_MaterialCentralBarrel_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 23 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_MaterialForward_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_MaterialForward_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 24 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_MaterialOuterBarrel_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_MaterialOuterBarrel_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 25 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_ShowerShapeHighR9EB_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_ShowerShapeHighR9EB_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 26 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_ShowerShapeHighR9EE_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_ShowerShapeHighR9EE_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 27 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_ShowerShapeLowR9EB_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_ShowerShapeLowR9EB_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 28 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_nuisance_ShowerShapeLowR9EE_13TeVscaleCorr --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_nuisance_ShowerShapeLowR9EE_13TeVscaleCorr --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 29 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_hgg_phoIdMva_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_hgg_phoIdMva_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 30 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_res_j_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_res_j_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 31 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_CMS_scale_j_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P CMS_scale_j_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 32 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_MH --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P MH --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 33 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 34 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 35 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 36 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 37 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 38 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 39 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 40 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 41 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_0_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_0_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 42 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 43 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 44 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 45 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 46 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 47 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern4_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern4_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 48 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern4_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern4_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 49 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern4_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern4_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 50 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_bern4_p3 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_bern4_p3 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 51 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 52 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_exp3_f1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_exp3_f1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 53 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_exp3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_exp3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 54 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_exp3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_exp3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 55 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 56 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_10_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_10_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 57 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 58 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 59 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 60 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 61 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 62 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern4_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern4_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 63 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern4_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern4_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 64 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern4_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern4_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 65 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_bern4_p3 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_bern4_p3 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 66 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 67 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 68 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_11_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_11_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 69 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 70 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 71 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 72 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 73 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 74 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 75 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_exp3_f1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_exp3_f1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 76 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_exp3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_exp3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 77 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_exp3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_exp3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 78 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 79 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_12_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_12_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 80 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 81 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 82 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 83 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 84 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 85 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 86 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 87 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 88 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_13_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_13_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 89 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_14_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_14_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 90 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_14_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_14_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 91 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_14_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_14_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 92 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_14_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_14_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 93 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_14_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_14_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 94 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_14_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_14_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 95 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 96 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 97 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 98 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 99 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 100 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 101 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_exp3_f1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_exp3_f1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 102 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_exp3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_exp3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 103 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_exp3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_exp3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 104 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 105 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_lau2_h1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_lau2_h1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 106 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_lau2_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_lau2_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 107 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_15_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_15_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 108 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 109 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 110 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 111 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 112 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 113 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 114 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern4_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern4_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 115 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern4_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern4_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 116 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern4_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern4_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 117 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_bern4_p3 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_bern4_p3 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 118 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 119 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 120 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_16_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_16_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 121 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 122 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 123 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 124 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 125 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 126 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 127 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 128 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 129 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_17_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_17_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 130 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_18_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_18_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 131 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_18_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_18_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 132 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_18_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_18_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 133 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_18_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_18_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 134 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_18_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_18_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 135 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_18_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_18_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 136 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_19_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_19_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 137 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_19_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_19_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 138 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_19_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_19_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 139 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_19_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_19_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 140 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_19_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_19_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 141 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_19_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_19_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 142 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_19_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_19_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 143 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_19_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_19_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 144 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 145 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 146 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 147 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 148 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 149 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 150 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 151 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 152 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_1_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_1_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 153 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 154 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 155 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 156 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 157 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 158 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 159 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 160 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 161 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_20_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_20_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 162 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_21_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_21_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 163 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_21_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_21_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 164 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_21_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_21_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 165 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_21_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_21_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 166 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_21_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_21_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 167 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_21_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_21_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 168 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 169 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 170 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 171 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 172 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 173 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 174 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 175 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 176 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_22_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_22_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 177 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_23_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_23_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 178 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_23_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_23_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 179 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_23_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_23_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 180 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_23_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_23_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 181 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_23_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_23_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 182 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_23_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_23_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 183 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_23_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_23_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 184 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_23_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_23_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 185 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 186 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 187 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 188 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 189 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 190 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 191 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 192 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 193 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_24_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_24_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 194 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 195 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 196 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 197 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 198 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 199 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 200 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 201 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 202 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_25_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_25_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 203 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 204 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 205 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 206 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 207 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 208 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 209 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 210 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 211 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_26_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_26_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 212 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 213 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 214 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 215 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 216 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 217 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 218 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_exp3_f1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_exp3_f1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 219 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_exp3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_exp3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 220 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_exp3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_exp3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 221 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 222 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_lau2_h1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_lau2_h1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 223 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_lau2_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_lau2_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 224 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_27_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_27_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 225 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_28_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_28_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 226 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_28_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_28_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 227 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_28_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_28_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 228 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_28_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_28_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 229 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_28_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_28_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 230 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_28_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_28_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 231 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_28_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_28_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 232 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_28_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_28_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 233 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_29_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_29_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 234 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_29_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_29_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 235 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_29_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_29_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 236 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_29_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_29_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 237 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_29_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_29_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 238 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_29_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_29_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 239 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_29_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_29_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 240 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_29_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_29_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 241 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_2_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_2_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 242 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_2_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_2_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 243 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_2_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_2_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 244 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_2_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_2_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 245 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_2_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_2_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 246 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_2_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_2_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 247 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 248 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 249 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 250 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 251 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 252 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 253 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 254 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 255 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_3_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_3_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 256 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_4_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_4_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 257 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_4_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_4_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 258 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_4_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_4_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 259 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_4_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_4_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 260 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_4_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_4_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 261 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_4_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_4_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 262 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_5_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_5_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 263 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_5_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_5_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 264 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_5_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_5_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 265 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_5_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_5_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 266 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_5_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_5_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 267 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_5_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_5_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 268 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_5_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_5_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 269 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_5_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_5_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 270 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_6_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_6_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 271 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_6_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_6_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 272 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_6_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_6_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 273 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_6_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_6_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 274 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_6_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_6_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 275 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_6_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_6_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 276 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_7_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_7_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 277 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_7_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_7_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 278 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_7_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_7_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 279 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_7_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_7_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 280 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_7_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_7_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 281 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_7_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_7_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 282 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern1_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern1_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 283 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 284 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 285 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 286 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 287 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 288 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern4_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern4_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 289 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern4_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern4_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 290 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern4_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern4_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 291 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_bern4_p3 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_bern4_p3 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 292 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 293 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_exp3_f1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_exp3_f1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 294 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_exp3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_exp3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 295 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_exp3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_exp3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 296 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 297 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_8_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_8_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 298 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_9_2018_13TeV_bern2_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_9_2018_13TeV_bern2_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 299 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_9_2018_13TeV_bern2_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_9_2018_13TeV_bern2_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 300 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_9_2018_13TeV_bern3_p0 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_9_2018_13TeV_bern3_p0 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 301 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_9_2018_13TeV_bern3_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_9_2018_13TeV_bern3_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 302 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_9_2018_13TeV_bern3_p2 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_9_2018_13TeV_bern3_p2 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 303 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_9_2018_13TeV_exp1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_9_2018_13TeV_exp1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 304 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_9_2018_13TeV_lau1_l1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_9_2018_13TeV_lau1_l1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 305 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_env_pdf_9_2018_13TeV_pow1_p1 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P env_pdf_9_2018_13TeV_pow1_p1 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 306 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_lumi_13TeV_Correlated --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P lumi_13TeV_Correlated --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 307 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_lumi_13TeV_Correlated_1718 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P lumi_13TeV_Correlated_1718 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 308 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_lumi_13TeV_Uncorrelated_2018 --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P lumi_13TeV_Uncorrelated_2018 --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 309 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin0_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin0_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 310 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin10_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin10_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 311 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin11_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin11_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 312 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin12_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin12_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 313 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin13_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin13_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 314 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin14_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin14_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 315 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin15_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin15_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 316 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin16_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin16_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 317 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin17_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin17_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 318 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin18_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin18_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 319 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin19_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin19_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 320 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin1_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin1_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 321 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin20_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin20_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 322 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin21_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin21_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 323 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin22_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin22_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 324 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin23_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin23_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 325 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin24_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin24_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 326 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin25_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin25_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 327 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin26_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin26_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 328 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin27_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin27_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 329 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin28_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin28_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 330 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin29_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin29_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 331 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin2_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin2_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 332 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin3_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin3_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 333 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin4_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin4_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 334 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin5_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin5_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 335 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin6_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin6_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 336 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin7_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin7_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 337 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin8_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin8_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi
if [ $1 -eq 338 ]; then
  combine -M MultiDimFit -n _paramFit__scan_fa3_ggH_from_AC_HGG_HPlus2Jets_shapeBkg_bkg_mass_AC_Bin9_2018__norm --algo impact --redefineSignalPOIs fa3,fa3_ggH,muV,mu_ggH -P shapeBkg_bkg_mass_AC_Bin9_2018__norm --floatOtherPOIs 1 --saveInactivePOI 1 --freezeParameters MH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -v 1 --robustFit 1 -m 125.38 -d Datacard_2018.root --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0
fi

