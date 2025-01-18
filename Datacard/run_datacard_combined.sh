#!bin/sh

# Define colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -n "YEAR :"
read year

echo -n "Name of the directory of your workspace:"
read InputTreePathdirectory

echo -n -e "${RED} doSystematics --> YES or NO:  ${NC}"
read flag
echo

# Checking if the variable is False
if [ "$flag" = "NO" ]; then
    syst=" "
    echo "Not doing Systematics "
else
    syst="--doSystematics"
    echo "Doing Systematics"
fi


if [ ! -d Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS ]; then
        mkdir -p Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        echo "WS directory is created"
fi

python RunYields.py --inputWSDirMap 2016preVFP=Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS_2016preVFP,2016postVFP=Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS_2016postVFP,2017=Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS_2017,2018=Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS_2018 --cats auto  --procs auto --mergeYears $syst --batch local --queue hep.q --ext $year $syst --ignore-warnings

python makeDatacard.py --years 2016preVFP,2016postVFP,2017,2018 $syst --ext $year --output Datacard_woint_$year 

if [ ! -d Trees/Opt_$year/$InputTreePathdirectory/Results ]; then
mkdir -p Trees/Opt_$year/$InputTreePathdirectory/Results 
fi

cp Datacard_$year.txt Trees/Opt_$year/$InputTreePathdirectory/Results/


echo " ########### End ############## "
