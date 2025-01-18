
#!bin/sh

echo "Input the path directory of your workspace and no / at the end"
read InputTreePathdirectory

echo -n "Year : "
read year

echo -n "Initial Bin : "
read init_bin

echo -n "Number of Bin : "
read bin

j=$(
	for ((i = $init_bin; i < $bin; i++));
	do 
	echo "Datacard_AC_Bin$i.txt" 
	done
)


for ((i = $init_bin; i < $bin; i++));
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
	cp $InputTreePathdirectory/Bin$i/ws_WHbsmM/output_WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHbsmM.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_WHMf05ph0/output_WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHMf05ph0.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_WHsm/output_WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHsm.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_ZHbsmM/output_ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_ZHbsmM.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_ZHMf05ph0/output_ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_ZHMf05ph0.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_ZHsm/output_ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8_ZHsm.root $InputTreePathdirectory/Bin$i/WS
        #cp $InputTreePathdirectory/Bin$i/ws_TTHbsmM/output_ttHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_TTHbsmM.root $InputTreePathdirectory/Bin$i/WS
        #cp $InputTreePathdirectory/Bin$i/ws_TTHMf05ph0/output_ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_TTHMf05ph0.root $InputTreePathdirectory/Bin$i/WS
        cp $InputTreePathdirectory/Bin$i/ws_TTHsm/output_ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8_TTHsm.root $InputTreePathdirectory/Bin$i/WS

echo "all the root files are copied to WS"


python RunYields.py --inputWSDirMap $year=$InputTreePathdirectory/Bin$i/WS --cats auto  --procs auto --doSystematics --batch local --queue hep.q --ext bin$i

python makeDatacard.py --years $year --prune --doSystematics --ext bin$i --output Datacard_AC_Bin$i

done


combineCards.py $j > Datacard_$year.txt 


if [ ! -d $InputTreePathdirectory/Results ]; then
mkdir -p $InputTreePathdirectory/Results 
fi

mv Datacard* $InputTreePathdirectory/Results/

for ((i = $init_bin; i < $bin; i++));
do

if [ ! -d $InputTreePathdirectory/Datacard_Output ]; then
mkdir -p $InputTreePathdirectory/Datacard_Output
fi

# Check if the destination directory exists
if [ -d $InputTreePathdirectory/Datacard_Output/yields_bin$i ]; then
    # If it exists, remove it
    rm -rf $InputTreePathdirectory/Datacard_Output/yields_bin$i       
fi

mv -f yields_bin$i $InputTreePathdirectory/Datacard_Output/

done

echo " ########### End ############## "
