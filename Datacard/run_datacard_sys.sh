
#!bin/sh

echo "Input the path directory of your workspace and no \ at the end"
read InputTreePathdirectory

echo -n "Year : "
read year

echo -n "Number of Bin : "
read bin

j=$(
	for ((i = 0; i < $bin; i++));
	do 
	echo "Datacard_AC_Bin$i.txt" 
	done
)


for ((i = 0; i < $bin; i++));
do

if [ ! -d $InputTreePathdirectory/Bin$i/WS ]; then
        mkdir -p $InputTreePathdirectory/Bin$i/WS
        echo "WS directory is created"
fi

        cp $InputTreePathdirectory/Bin$i/ws/allData.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_GG2Hsm/output_GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2Hsm.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_GG2HMf05ph0/output_GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2HMf05ph0.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_GG2HbsmM/output_GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2HbsmM.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_VBFbsmM/output_VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_VBFbsmM.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_VBFMf05ph0/output_VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_VBFMf05ph0.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_VBFsm/output_VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8_VBFsm.root $InputTreePathdirectory/Bin$i/WS

echo "all the root files are copied to WS"


python RunYields.py --inputWSDirMap $year=$InputTreePathdirectory/Bin$i/WS --cats auto  --procs auto --doSystematics --batch local --queue hep.q --ext bin$i

python makeDatacard.py --years $year --prune --doSystematics --ext bin$i --output Datacard_AC_Bin$i

done


combineCards.py $j > Datacard.txt 


if [ ! -d $InputTreePathdirectory/Results ]; then
mkdir -p $InputTreePathdirectory/Results 
fi

mv Datacard* $InputTreePathdirectory/Results/

if [ ! -d $InputTreePathdirectory/Datacard_Output ]; then
mkdir -p $InputTreePathdirectory/Datacard_Output                                                                
fi

mv -if yields_bin* $InputTreePathdirectory/Datacard_Output/


echo " ########### End ############## "
