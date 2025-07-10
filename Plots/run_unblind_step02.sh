python makeSplusBModelPlot.py --inputWSFile Datacard_RunII.root --cats all --doZeroes --ext RunII_unblind --translateCats cats.json --unblind --doSumCategories


python combineTool.py -M MultiDimFit Datacard_RunII.root -m 125.38 --saveWorkspace -n .bestfit --setParameterRanges muV=0,5:mu_ggH=0,5:fa3_ggH=-1,1:fa3=-1,1 --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0 --freezeParameters MH,muV,mu_ggH,fa3,fa3_ggH --X-rtd MINIMIZER_analytic --cminDefaultMinimizerStrategy 0 --cminDefaultMinimizerTolerance 1 --job-mode condor --sub-opts='+JobFlavour="workday"' --task-name mytask


python makeSplusBModelPlot.py --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root  --loadSnapshot MultiDimFit --cats all --doZeroes --ext _test --unblind

python getCatInfo.py --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root --cats all --doBkgRenormalization --saveCatInfo --ext _allCats

python makeToys.py --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root --loadSnapshot MultiDimFit --nToys 100 --POIs mu_ggH,muV,fa3,fa3_ggH --batch condor --queue longlunch --ext _test_with_bands


python makeSplusBModelPlot.py --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root --loadSnapshot MultiDimFit --cats all --doZeroes --ext _test_with_bands --unblind --doBands --saveToyYields --doSumCategories --doCatWeights --saveWeights


python makeSplusBModelPlot.py --toydir /afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Analysis_2024/Unblind_RE/Stage02_RunII --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root --loadSnapshot MultiDimFit --cats all --doZeroes --ext _unblind_with_bands_bonly_RunII --mass 125.38 --blindingRegion 125,125 --translateCats cats.json --doBands --doToyVeto --saveToyYields --doSumCategories --doCatWeights --saveWeights
