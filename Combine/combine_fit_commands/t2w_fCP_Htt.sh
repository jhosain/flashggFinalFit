#!/bin/bash
source /cvmfs/cms.cern.ch/cmsset_default.sh 
eval `scramv1 runtime -sh`

text2workspace.py Datacard_fCP_Htt.txt -m 125.38 -P HiggsAnalysis.CombinedLimit.FCP_Htt_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase:FCP_Htt_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase -o Datacard_fCP_Htt.root
