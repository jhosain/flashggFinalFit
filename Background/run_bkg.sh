#!/bin/sh/

cmsenv
#make clean
make 

echo -n "Year : "
read year

###################

echo "####  Running backgournd #####"

python RunBackgroundScripts.py --inputConfig config_$year.py --mode fTestParallel
 
echo " ########### End ############## "
