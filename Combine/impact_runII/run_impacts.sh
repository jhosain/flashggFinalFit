outdate=`date +%F`

STEP=0
YEAR=0

usage(){
    echo "Script to run fits and plots of fit output. dryRun option is for the fitting only, that can be run in batch."
    echo "options:"

    echo "-y|--year <year> Specify the year"
    echo "-h|--help       Display this help message"
    echo "-s|--step <step> Specify the step"
 
}

# options may be followed by one colon to indicate they have a required argument                                                  
if ! options=$(getopt -u -o s:hd -l help,step:,year: -- "$@")
then
    # something went wrong, getopt will put out an error message for us                                                          
    exit 1
fi
set -- $options
while [ $# -gt 0 ]
do
    case $1 in
        -h|--help) usage; shift;;
        -y|--year) YEAR=$2; shift ;;
        -s|--step) STEP=$2; shift ;;
	(--) shift; break;;
	(-*) usage; echo "$0: error - unrecognized option $1" 1>&2; usage >> /dev/stderr; exit 1;;
	(*) break;;
    esac
    shift
done

#pois=("mu_ggH","fa3_ggH")


if [[ $STEP == "t2w" ]]; then

	text2workspace.py Datacard_${YEAR}.txt -m 125.0  -P HiggsAnalysis.CombinedLimit.FA3_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase:FA3_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase  -o Datacard_${YEAR}.root


elif [[ $STEP == "impacts-initial" ]]; then

	python combineTool.py -M Impacts -d Datacard_${YEAR}.root -n _scan_fa3_ggH_from_AC_HGG_HPlus2Jets -m 125.38 --setParameterRanges muV=0,5:mu_ggH=0,5:fa3_ggH=-1,1 --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0 --freezeParameters MH,fa3 --robustFit=1 --setRobustFitAlgo=Minuit2,Migrad --X-rtd FITTER_NEW_CROSSING_ALGO --setRobustFitTolerance=0.2 --X-rtd FITTER_NEVER_GIVE_UP --X-rtd FITTER_BOUND --cminFallbackAlgo Minuit2,0:1. --cminDefaultMinimizerStrategy 0 --X-rtd MINIMIZER_freezeDisassociatedParams --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2 --setCrossingTolerance 0.000001 --X-rtd REMOVE_CONSTANT_ZERO_POINT=1 -v 1 --doInitialFit --job-mode condor --sub-opts='+JobFlavour="tomorrow"' --task-name doInitialFit 

elif [[ $STEP == "impacts-scans" ]]; then

	python combineTool.py -M Impacts -d Datacard_${YEAR}.root -n _scan_fa3_ggH_from_AC_HGG_HPlus2Jets -m 125.38 --setParameters muV=1,mu_ggH=1,fa3_ggH=0,fa3=0 --setParameterRanges muV=0,5:mu_ggH=0,5:fa3_ggH=-1,1 --freezeParameters MH,fa3  --robustFit=1 --setRobustFitAlgo=Minuit2,Migrad --X-rtd FITTER_NEW_CROSSING_ALGO --setRobustFitTolerance=0.2 --X-rtd FITTER_NEVER_GIVE_UP --X-rtd FITTER_BOUND --cminFallbackAlgo Minuit2,0:1. --cminDefaultMinimizerStrategy 0 --X-rtd MINIMIZER_freezeDisassociatedParams --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2 --setCrossingTolerance 0.000001 --X-rtd REMOVE_CONSTANT_ZERO_POINT=1 -v 1 --doFits --job-mode condor --sub-opts='+JobFlavour="tomorrow"' --task-name doFits  

elif [[ $STEP == "impacts-collect" ]]; then

	#python combineTool.py -M Impacts -n _scan_fa3_ggH_from_AC_HGG_HPlus2Jets -d Datacard_${YEAR}.root -m 125.38 -o impacts_${YEAR}.json  
        #for poi in ${pois[*]}
        #do
            echo "    ===> Producing impact plots for the *** main-only *** systematics for fit: === $fit === and POI: == $poi === "
	python plotImpacts.py -i impacts_${YEAR}.json -o impacts_fa3_ggH_${YEAR} --POI fa3_ggH --translate pois.json

	wait

	python plotImpacts.py -i impacts_${YEAR}.json -o impacts_mu_ggH_${YEAR} --POI mu_ggH --translate pois.json

        wait

        python plotImpacts.py -i impacts_${YEAR}.json -o impacts_muV_${YEAR} --POI muV --translate pois.json

	wait 

	python  makeSystSummary.py --inputJson impacts_${YEAR}.json --pois fa3_ggH --year ${YEAR} --translate pois.json

	wait

	python makeSystSummary.py --inputJson impacts_${YEAR}.json --pois mu_ggH --year ${YEAR} --translate pois.json

        wait

        python makeSystSummary.py --inputJson impacts_${YEAR}.json --pois muV --year ${YEAR} --translate pois.json

        #done

else
    echo "Step $STEP is not one among t2w,impacts-initial,impacts-scans,impacts-collect. Exiting."
fi


