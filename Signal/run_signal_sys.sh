#!bin/sh

# Define colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo "Input the path directory of your workspace"
read InputWSDirPath
#echo "$InputWSDirPath"

echo -n -e "${RED} --skipVertexScenarioSplit --> False(0); True(1) :  ${NC}"
read value
echo

# Checking if the variable is False
if [ "$value" -eq 0 ]; then
    skip=" "
    echo "Splitting VertexScenario"
else
    skip="--skipVertexScenarioSplit"
    echo "Skipping VertexScenario Splitting"
fi

echo

echo -n -e "${YELLOW}Year :${NC}"
read YEAR
#echo "$YEAR"


# Define the list of strings

string_array=("GG2HbsmM" "GG2Hsm" "GG2HMf05ph0" "VBFbsmM" "VBFsm" "VBFMf05ph0")

# Prompt the user to enter the string to skip
echo "Available strings: ${string_array[*]}"

if [ "$value" -eq 0 ]; then

	echo  "Processing All "
	strings_to_process=("GG2HbsmM" "GG2Hsm" "GG2HMf05ph0" "VBFbsmM" "VBFsm" "VBFMf05ph0")
	#strings_to_process=("WHbsmM" "WHsm" "WHMf05ph0" "ZHbsmM" "ZHsm" "ZHMf05ph0" "TTHbsmM" "TTHsm" "TTHMf05ph0")
else
	echo -n "Enter the string to process: "
	read -r proc_string
	IFS=', ' read -r -a strings_to_process <<< "$proc_string"
fi

echo

###################

j="_"



for k in "${strings_to_process[@]}"; do

    found=false  # Initialize a flag to track if the string is found in the array
    # Loop over the array of strings to check if the current string should be processed
    for string in "${string_array[@]}"; do
        if [[ "$string" = "$k" ]]; then
            echo "Processing: $k"
            found=true  # Set the flag to true as the string is found
            break  # Exit the loop once the string is found
        fi
    done

    # If the string is not found in the array, print a message
    if ! "$found"; then
        echo "String '$k' not found in the list of strings."
    fi

echo
#echo "Processing: $k"
echo

echo "##############################################################"
echo "    Making config_sig_$k_$YEAR.py "
echo "##############################################################"

echo

touch config_sig_$k\_$YEAR.py
echo -e "# Config file: options for signal fitting 
_year = '$YEAR' 

signalScriptCfg = {

  # Setup
  'inputWSDir':'$InputWSDirPath/Tree_$YEAR/ws_$k/',
  'procs':'auto', # if auto: inferred automatically from filenames
  'cats':'auto', # if auto: inferred automatically from (0) workspace
  'ext': '$j%s'%_year,
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
  'batch':'local', # ['condor','SGE','IC','local']
  'queue':'hep.q'
  #'batch':'condor', # ['condor','SGE','IC','local']
  #'queue':'longlunch',

}" > config_sig_$k\_$YEAR.py

python RunSignalScripts.py --inputConfig config_sig_$k\_$YEAR.py --mode fTest  --modeOpts "--nProcsToFTest -1 --doPlots "
python RunSignalScripts.py --inputConfig config_sig_$k\_$YEAR.py --mode calcPhotonSyst
python RunSignalScripts.py --inputConfig config_sig_$k\_$YEAR.py --mode signalFit  --modeOpts "$skip --doPlots"



echo
echo " ################## Finished the whole process for Process $k  ################ "
echo

done   # clsoe the proc loop

echo
echo -e " ################## ${RED} Running Packager  for Process $k ${NC} ################ "
echo

#echo -n -e "${RED} Would you like to run PACKAGER?  Yes(0); No (1) :  ${NC}"
#read pac
pac=0

if [ "$pac" -eq 0 ]; then
	python RunPackager.py --cats AC --exts _$YEAR --mergeYears FALSE --outputExt packaged_$YEAR
else
     	echo "Ignoring packaging"
fi

#################################

if [ "$pac" -eq 0 ]; then
	python RunPlotter.py --procs all --cats AC --years $YEAR --ext packaged_$YEAR
else
     	echo "Ignoring final plotting"
fi

echo -e "${RED} @@@@@@@################## Finished the whole process  @@@@@@@@@@@################ ${NC}"

echo " ###########@@@@@@@@@  End Combine Signal Modelling @@@@@@@@@@@############## "

#echo -e "${RED} outdir_packaged_$YEAR/CMS-HGG_sigfit_packaged_$YEAR\_AC.root --> $InputWSDirPath/Results/Models/signal/CMS-HGG_sigfit_packaged_AC_$YEAR.root ${NC}"

###########################################

cp outdir_packaged_$YEAR/CMS-HGG_sigfit_packaged_$YEAR\_AC.root $InputWSDirPath/Results/Models/signal/CMS-HGG_sigfit_packaged_AC_$YEAR.root
   
echo " ############### Renaming Output Root Files for the Datacard Maker & Storing the Results to the EOS WS Directory #####"


if [ ! -d $InputWSDirPath/Signal_Output ]; then
mkdir -p $InputWSDirPath/Signal_Output
fi

if [ ! -d $InputWSDirPath/Signal_Output/outdir/ ]; then
mkdir -p $InputWSDirPath/Signal_Output/outdir/
fi

# Check if the destination directory exists
if [ -d $InputWSDirPath/Signal_Output/outdir/outdir_$YEAR ]; then
    # If it exists, remove it
    rm -rf $InputWSDirPath/Signal_Output/outdir/outdir_$YEAR
fi

if [ ! -d $InputWSDirPath/Signal_Output/outdir_pack/ ]; then
mkdir -p $InputWSDirPath/Signal_Output/outdir_pack/
fi

# Check if the destination directory exists
if [ -d $InputWSDirPath/Signal_Output/outdir_pack/outdir_packaged_$YEAR ]; then
    # If it exists, remove it
    rm -rf $InputWSDirPath/Signal_Output/outdir_pack/outdir_packaged_$YEAR
fi

echo -n -e "${RED} Would you like to move output directory?  Yes(0); No (1): ${NC}"
read val
#val=1
#echo "The answer is No for now"

if [ "$val" -eq 0 ]; then
	mv -f outdir_$YEAR $InputWSDirPath/Signal_Output/outdir/
	mv -f outdir_packaged_$YEAR $InputWSDirPath/Signal_Output/outdir_pack/
	mv -f config_sig_*_$YEAR.py $InputWSDirPath/Signal_Output/
	echo " ############### Moving output ############## "
else
        echo "Skipping Moving Output"
fi



echo " ########### End ############## "






