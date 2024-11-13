#!/bin/sh/

cmsenv
#make clean
make 

echo -n "Year : "
read year

echo -n "Name of the directory of your workspace :"
read InputWSDirPath

###################


touch config_$year.py

echo -e "# Config file: options for signal fitting                


backgroundScriptCfg = {

  # Setup                                                                                                                         
  'inputWSDir':'Trees/Opt_$year/$InputWSDirPath/Trees2WS_$year/ws', # location of 'allData.root' file 
  'ext':'$year', # extension to add to output directory                                                                         
  'cats':'auto', # auto: automatically inferred from input ws                                                                     
  'catOffset':0, # add offset to category numbers (useful for categories from different allData.root files)                       
  'year':'$year', # Use combined when merging all years in category (for plots)                                                

  # Job submission options                                                                                                        
  'batch':'condor', # [condor,SGE,IC,local]                                                                                        
  'queue':'longlunch' # for condor e.g. microcentury for local e.g. hep.q                                                                                  

}" > config_$year.py


echo "####  Running backgournd #####"

python RunBackgroundScripts.py --inputConfig config_$year.py --mode fTestParallel
 

echo " ########### End ############## "
