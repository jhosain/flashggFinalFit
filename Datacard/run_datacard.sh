
#!bin/sh

echo -n "YEAR :"
read year

echo -n "Name of the directory of your workspace:"
read InputTreePathdirectory


if [ ! -d Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS ]; then
        mkdir -p Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        echo "WS directory is created"
fi

        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws/allData.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_GG2Hsm/output_GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2Hsm.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_GG2HMf05ph0/output_GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2HMf05ph0.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_GG2HbsmM/output_GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8_GG2HbsmM.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_VBFbsmM/output_VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_VBFbsmM.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_VBFMf05ph0/output_VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_VBFMf05ph0.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_VBFsm/output_VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8_VBFsm.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
	cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_VBFsm/output_VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8_VBFsm.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_WHbsmM/output_WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHbsmM.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_WHMf05ph0/output_WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHMf05ph0.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_WHsm/output_WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_WHsm.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_ZHbsmM/output_ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_ZHbsmM.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_ZHMf05ph0/output_ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_ZHMf05ph0.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_ZHsm/output_ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8_ZHsm.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        #cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_TTHbsmM/output_ttHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_TTHbsmM.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        #cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_TTHMf05ph0/output_ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8_TTHMf05ph0.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS
        cp Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/ws_TTHsm/output_ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8_TTHsm.root Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS

echo "all the root files are copied to WS"


#python RunYields.py --inputWSDirMap $year=Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS --skipZeroes True --cats "AC_Bin0,AC_Bin1,AC_Bin2,AC_Bin3,AC_Bin4,AC_Bin5,AC_Bin6,AC_Bin7,AC_Bin8,AC_Bin9,AC_Bin10,AC_Bin11,AC_Bin12,AC_Bin13,AC_Bin14,AC_Bin15,AC_Bin16,AC_Bin17,AC_Bin18,AC_Bin19,AC_Bin20,AC_Bin21,AC_Bin22,AC_Bin23,AC_Bin24,AC_Bin25,AC_Bin26,AC_Bin27,AC_Bin28,AC_Bin29" --procs auto --batch local --queue hep.q --ext $year --doSystematics

python RunYields.py --inputWSDirMap $year=Trees/Opt_$year/$InputTreePathdirectory/Trees2WS_$year/WS --cats auto  --procs auto --doSystematics --batch local --queue hep.q --ext $year

python makeDatacard.py --years $year --prune --doSystematics --ext $year --output Datacard_$year


if [ ! -d Trees/Opt_$year/$InputTreePathdirectory/Results ]; then
mkdir -p Trees/Opt_$year/$InputTreePathdirectory/Results 
fi

mv Datacard* Trees/Opt_$year/$InputTreePathdirectory/Results/

if [ ! -d Trees/Opt_$year/$InputTreePathdirectory/Datacard_Output ]; then
mkdir -p Trees/Opt_$year/$InputTreePathdirectory/Datacard_Output                                                                
fi

if [ -d Trees/Opt_$year/$InputTreePathdirectory/Datacard_Output/yields_* ]; then
rm -rf yields_*
fi

mv -if yields_* Trees/Opt_$year/$InputTreePathdirectory/Datacard_Output/


echo " ########### End ############## "
