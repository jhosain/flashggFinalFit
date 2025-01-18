#!bin/sh

# Define colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -n -e "${YELLOW}Year :${NC}"
read YEAR
#echo "$YEAR"

echo -n "Name of directory of your workspace :"
read InputWSDirPath
#echo "$InputWSDirPath"

echo -n -e "${RED} --skipVertexScenarioSplit --> False(0); True(1) :  ${NC}"
read value
echo

echo -n -e "${RED} --skipSystematics --> False(0); True(1) :  ${NC}"
read val
echo

# Checking if the variable is False
if [ "$value" -eq 0 ]; then
    split=" "
    echo "Splitting VertexScenario"
else
    split="--skipVertexScenarioSplit"
    echo "Skipping VertexScenario Splitting"
fi

# Checking if the variable is False                                                                                                            
if [ "$val" -eq 0 ]; then
    skip=" "
    echo "Doing Systematics"
else
    skip="--skipSystematics"
    echo "Skipping Systematics"
fi

echo

# Define the list of strings

string_array=("GG2HbsmM" "GG2Hsm" "GG2HMf05ph0" "VBFbsmM" "VBFsm" "VBFMf05ph0" "WHbsmM" "WHsm" "WHMf05ph0" "ZHbsmM" "ZHsm" "ZHMf05ph0" "TTHbsmM" "TTHsm" "TTHMf05ph0")

# Prompt the user to enter the string to skip

echo "Available strings: ${string_array[*]}"




###################



echo "##############################################################"
echo "    Making config_sig_$YEAR.py "
echo "##############################################################"

echo

touch config_sig_$YEAR.py
echo -e "# Config file: options for signal fitting 
_year = '$YEAR' 

signalScriptCfg = {

  # Setup
  'inputWSDir':'Trees/Opt_$YEAR/$InputWSDirPath/Trees2WS_$YEAR/WS/',
  'procs':'auto', # if auto: inferred automatically from filenames
  'cats':'auto', # if auto: inferred automatically from (0) workspace
  'ext': '%s'%_year,
  'analysis':'AC', # To specify which replacement dataset mapping (defined in ./python/replacementMap.py)
  'year':'%s'%_year, # Use 'combined' if merging all years: not recommended
  'massPoints':'125',
  'xvar': 'CMS_hgg_mass',
  'outdir': 'plots',

  #Photon shape systematics
  'scales':'HighR9EB,HighR9EE,LowR9EB,LowR9EE,Gain1EB,Gain6EB', # separate nuisance per year
  'scalesCorr':'MaterialCentralBarrel,MaterialOuterBarrel,MaterialForward,FNUFEE,FNUFEB,ShowerShapeHighR9EE,ShowerShapeHighR9EB,ShowerShapeLowR9EE,ShowerShapeLowR9EB', # correlated across years
  'scalesGlobal':'NonLinearity,Geant4', # affect all processes equally, correlated across years
  'smears':'HighR9EBPhi,HighR9EBRho,HighR9EEPhi,HighR9EERho,LowR9EBPhi,LowR9EBRho,LowR9EEPhi,LowR9EERho', # separate nuisance per year

  # Job submission options
  #'batch':'local', # ['condor','SGE','IC','local']
  #'queue':'hep.q'
  'batch':'condor', # ['condor','SGE','IC','local']
  'queue':'longlunch',

}" > config_sig_$YEAR.py

python RunSignalScripts.py --inputConfig config_sig_$YEAR.py --mode fTest  --modeOpts "--nProcsToFTest -1 --doPlots "
python RunSignalScripts.py --inputConfig config_sig_$YEAR.py --mode calcPhotonSyst
#python RunSignalScripts.py --inputConfig config_sig_$YEAR.py --mode signalFit  --modeOpts "$skip $split --doPlots"


echo " ########### End ############## "






