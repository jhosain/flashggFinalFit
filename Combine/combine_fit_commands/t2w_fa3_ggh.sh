#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh 
eval `scramv1 runtime -sh`

text2workspace.py Datacard_fa3_ggH.txt -m 125.38 -P HiggsAnalysis.CombinedLimit.FA3_ggH_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase:FA3_ggH_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase -o Datacard_fa3_ggH.root
