STEP=0
usage(){
    echo "Script to run fits and plots of fit output."
    echo "options:"
    
    echo "-h|--help) "
    echo "-s|--step) "
    echo "-d|--dryRun) "
}
# options may be followed by one colon to indicate they have a required argument
if ! options=$(getopt -u -o s:hd -l help,step:,dryRun -- "$@")
then
# something went wrong, getopt will put out an error message for us
exit 1
fi
set -- $options
while [ $# -gt 0 ]
do
case $1 in
-h|--help) usage; exit 0;;
-s|--step) STEP=$2; shift ;;
-d|--dryRun) DR=$2; shift ;;
(--) shift; break;;
(-*) usage; echo "$0: error - unrecognized option $1" 1>&2; usage >> /dev/stderr; exit 1;;
(*) break;;
esac
shift
done


fits=("RunII") 


if [[ $STEP == "spb" ]]; then #STEP TO USE TO PRODUCE THE PLOT WITHOUT THE BANDS
    for fit in ${fits[*]} 
    do
	python  makeSplusBModelPlot.py --inputWSFile ../Combine/Datacard_$fit.root --cats all --doZeroes --ext Unblind_spb_$fit --blindingRegion 125,125 --mass 125.38 --translateCats cats.json --doSumCategories
    done

elif [[ $STEP == "spb_test" ]]; then #STEP TO USE TO PRODUCE THE PLOT WITHOUT THE BANDS
    for fit in ${fits[*]} 
    do
	python  makeSplusBModelPlot.py --doCatWeights --inputWSFile ../Combine/RunII/Datacard_$fit.root --cats AC_Bin7 --doZeroes  --blindingRegion 125,125 --mass 125.38 --translateCats cats.json 
    done
elif [[ $STEP == "bands" ]]; then
    for fit in ${fits[*]} 
    do
	python makeToys.py --outputDir /afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Analysis_2024/Unblind_RE/Stage02_$fit --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root --nToys 100 --POIs fa3_ggH,fa3,muV,mu_ggH  --batch condor --queue workday --ext _unblind_with_bands_$fit --loadSnapshot MultiDimFit
    done
  elif [[ $STEP == "spb2-calc" ]]; then
    for fit in ${fits[*]} 
    do
	python makeSplusBModelPlot.py --toydir /afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Analysis_2024/Unblind_RE/Stage02_$fit --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root --loadSnapshot MultiDimFit --cats all --doZeroes --ext _unblind_with_bands_$fit --mass 125.38 --unblind --translateCats cats.json --doBands --doToyVeto --saveToyYields --doSumCategories --doCatWeights --saveWeights 
    done  

elif [[ $STEP == "spb2" ]]; then
    # next times, when toys are merged
    python makeSplusBModelPlot.py --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root --loadSnapshot MultiDimFit --cats all --doZeroes --pdir . --ext test --doBands --loadToyYields SplusBModels_unblind_with_bands_RunII/toys/toyYields_CMS_hgg_mass.pkl --doSumCategories --doCatWeights --saveWeights

elif [[ $STEP == "catweights" ]]; then
    python getCatInfo.py --inputWSFile higgsCombine.bestfit.MultiDimFit.mH125.38.root --cats all --doBkgRenormalization --saveCatInfo --ext _allCats

elif [[ $STEP == "tables" ]]; then

    python makeYieldsTables.py --inputPklDir ../Datacard/yields_RunII --loadCatInfo pkl/catInfo_allCats.pkl --group GG2Hsm 

else
    echo "Step $STEP is not one among yields,datacard,links. Exiting."
fi

