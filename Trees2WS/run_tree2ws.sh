#!bin/sh/                                                                                                                        

#!/bin/bash

YEAR=-753
STEP=0
DIR=-753

usage(){
    echo "The script runs background scripts:"
    echo "options:"

    echo "-h|--help) "
    echo "-y|--year) "
    echo "-s|--step) "
    echo "-d|--dir) "
    echo "-i|--interactive) "
}
# options may be followed by one colon to indicate they have a required argument
if ! options=$(getopt -u -o s:y:d:ih -l help,step:,year:,dir:,interactive -- "$@")
then
# something went wrong, getopt will put out an error message for us
exit 1
fi
set -- $options
while [ $# -gt 0 ]
do
case $1 in
-h|--help) usage; exit 0;;
-y|--year) YEAR=$2; shift ;;
-s|--step) STEP=$2; shift ;;
-d|--dir) DIR=$2; shift ;;
-i|--interactive) I=$2; shift ;;
(--) shift; break;;
(-*) usage; echo "$0: error - unrecognized option $1" 1>&2; usage >> /dev/stderr; exit 1;;
(*) break;;
esac
shift
done

echo "Input directory : $DIR "


QUEUE=""
if [[ $I ]]; then
    QUEUE=" --batch local "
else
    QUEUE=" --batch condor --queue longlunch "
fi

if [[ $STEP == "mc" ]]; then

    python RunWSScripts.py --inputConfig config.py --inputDir ${DIR}/Trees_${YEAR} --mode trees2ws --modeOpts " " --year ${YEAR} --ext ${YEAR} ${QUEUE}

elif [[ $STEP == "mc-wosys" ]]; then

    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8.root --productionMode jjh0P --year ${YEAR} 
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8.root --productionMode jjh0M --year ${YEAR} 
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8.root --productionMode jjh0Mf05ph0  --year ${YEAR} 

    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8.root --productionMode vbf0P  --year ${YEAR} 
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode vbf0M  --year ${YEAR} 
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode vbf0Mf05ph0  --year ${YEAR} 

    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode wh0P --year ${YEAR}
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode wh0M --year ${YEAR}
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode wh0Mf05ph0  --year ${YEAR}

    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8.root --productionMode zh0P --year ${YEAR}
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode zh0M --year ${YEAR} 
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode zh0Mf05ph0  --year ${YEAR}

    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8.root --productionMode tth0P --year ${YEAR}
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_ttHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode tth0M --year ${YEAR}
    python trees2ws.py  --inputConfig config_simple.py  --inputTreeFile ${DIR}/Trees_${YEAR}/output_ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8.root --productionMode tth0Mf05ph0  --year ${YEAR}


    #python RunWSScripts.py --inputConfig config.py --inputDir ${DIR}/Trees_${YEAR} --mode trees2ws --year ${YEAR} --ext ${YEAR} ${QUEUE}     

elif [[ $STEP == "data" ]]; then
    
    python trees2ws_data.py  --inputConfig config.py --inputTreeFile ${DIR}/Trees_${YEAR}/output_Data.root --outputWSDir ${DIR}/Trees_${YEAR}
    #python RunWSScripts.py --inputConfig config.py --inputDir ${DIR}/Trees_${YEAR} --mode trees2ws_data --year ${YEAR} --ext ${YEAR} ${QUEUE}
else
    echo "Step $STEP is not one among mc, data. Exiting."
fi

echo " ########### End ############## "




