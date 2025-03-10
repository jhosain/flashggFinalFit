text2workspace.py Datacard.txt -m 125.0  -P HiggsAnalysis.CombinedLimit.FA3_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase:FA3_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase  -o Datacard.root

python combineTool.py -M MultiDimFit Datacard.root -n _scan_exp_fa3_ggH_from_AC_HGG_HPlus2Jets -m 125 --freezeParameters MH --algo=grid --alignEdges 1 --points=160  -P fa3_ggH --floatOtherPOIs=1 --setParameterRanges muV=0,5:mu_ggH=0,5:fa3_ggH=-1,1:fa3=-1,1 --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0 --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 -t -1 -v 2 --job-mode condor --split-points 10 --robustFit=1 --sub-opts='+JobFlavour="workday"' --task-name mytask 

 python combineTool.py -M Impacts -n _scan_fa3_ggH_from_AC_HGG_HPlus2Jets -d Datacard_Combine.root -m 125 -o impacts_Combine.json --job-mode condor --sub-opts='+JobFlavour="workday"' --task-name mytask 
