
#!bin/sh

echo "Input the path directory of your workspace : "
read InputTreePathdirectory

echo -n "Year : "
read year

#echo -n "Initial Bin : "
#read init_bin

#echo -n "Number of Bin : "
#read bin

#j=$(
#	for ((i = $init_bin; i < $bin; i++));
#	do 
#	echo "Datacard_wosys_AC_Bin$i.txt" 
#	done
#)


#for ((i = $init_bin; i < $bin; i++));
#do

if [ ! -d $InputTreePathdirectory/Trees_$year/WS ]; then
        mkdir -p $InputTreePathdirectory/Trees_$year/WS
        echo "WS directory is created"
fi

        cp $InputTreePathdirectory/Trees_$year/ws/allData.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_GG2Hsm/output_GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2Hsm.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_GG2HMf05ph0/output_GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2HMf05ph0.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_GG2HbsmM/output_GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2HbsmM.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_VBFbsmM/output_VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_VBFbsmM.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_VBFMf05ph0/output_VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_VBFMf05ph0.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_VBFsm/output_VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8_VBFsm.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_WHbsmM/output_WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHbsmM.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_WHMf05ph0/output_WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHMf05ph0.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_WHsm/output_WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHsm.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_ZHbsmM/output_ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_ZHbsmM.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_ZHMf05ph0/output_ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_ZHMf05ph0.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_ZHsm/output_ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8_ZHsm.root $InputTreePathdirectory/Trees_$year/WS
        #cp $InputTreePathdirectory/Trees_$year/ws_TTHbsmM/output_ttHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_TTHbsmM.root $InputTreePathdirectory/Trees_$year/WS
        #cp $InputTreePathdirectory/Trees_$year/ws_TTHMf05ph0/output_ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_TTHMf05ph0.root $InputTreePathdirectory/Trees_$year/WS
        cp $InputTreePathdirectory/Trees_$year/ws_TTHsm/output_ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8_TTHsm.root $InputTreePathdirectory/Trees_$year/WS


python RunYields.py --inputWSDirMap $year=$InputTreePathdirectory/Trees_$year/WS --cats "AC_Bin0,AC_Bin1,AC_Bin2,AC_Bin3,AC_Bin4,AC_Bin5,AC_Bin6,AC_Bin7,AC_Bin8,AC_Bin9,AC_Bin10,AC_Bin11,AC_Bin12,AC_Bin13,AC_Bin14,AC_Bin15,AC_Bin16,AC_Bin17,AC_Bin18,AC_Bin19,AC_Bin20,AC_Bin21,AC_Bin22,AC_Bin23,AC_Bin24,AC_Bin25,AC_Bin26,AC_Bin27,AC_Bin28,AC_Bin29" --procs auto --batch local --queue hep.q --ext wosys

python makeDatacard.py --prune --ext wosys --output Datacard_wosys

#done


#combineCards.py $j > Datacard_wosys.txt 


#mv Datacard_wosys.txt $InputTreePathdirectory/Results/

if [ ! -d $InputTreePathdirectory/Datacard_Output ]; then
mkdir -p $InputTreePathdirectory/Datacard_Output                                                                
fi

mv -if yields_wosys $InputTreePathdirectory/Datacard_Output/


echo " ########### End ############## "
