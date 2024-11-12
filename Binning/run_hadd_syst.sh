#!/bin/bash

echo -n "YEAR: "
read year

# Prompt user for the input directory path
echo -n "Input the path directory of your workspace: "
read InputDirectory

# Change directory to the user-specified workspace
cd "BINS/Opt_$year/$InputDirectory" || { echo -e "\e[31mError: Unable to access directory BINS/Opt_$year/$InputDirectory.\e[0m"; exit 1; }

Nbinx=5 # Dzero bins
Nbiny=3 # stxsMVA bins
Nbinz=2  # CPodd bdt bins

proc=(

    "GluGluHToGGPlusTwoJets_SM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8"
    "GluGluHToGGPlusTwoJets_MM_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8"
    "GluGluHToGGPlusTwoJets_CPodd_M125_TuneCP5_13TeV-amcatnlopowheg-minlo-pythia8"
    "VBFHToGG_M125_TuneCP5_13TeV-amcatnlo-pythia8"
    "VBFHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    "VBFHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    "WHiggs0PMToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    "WHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    "WHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    "ZH_HToGG_ZToAll_M125_TuneCP5_13TeV-powheg-pythia8"
    "ZHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    "ZHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    "ttHJetToGG_M125_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8"
    "ttHiggs0Mf05ph0ToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"
    "ttHiggs0MToGG_M125_TuneCP5_13TeV-JHUGenV7011-pythia8"

)

echo "Select process(es) by entering the index/indices separated by commas:"
for i in "${!proc[@]}"; do
    echo "$i: ${proc[i]}"
done

read -p "Enter the index/indices of the process(es): " indices

# Validate the indices
if ! [[ "$indices" =~ ^[0-9,]+$ ]]; then
    echo "Invalid input. Please enter comma-separated numbers corresponding to the process indices."
    exit 1
fi

# Convert the comma-separated string into an array of indices
IFS=',' read -r -a index_array <<< "$indices"

# Perform the hadd operation for each selected process
for index in "${index_array[@]}"; do
    if ((index < 0)) || ((index >= ${#proc[@]})); then
        echo "Invalid index: $index"
        continue
    fi

    selected_proc="${proc[index]}"
    echo "Selected process: $selected_proc"

    # Perform the hadd operation
    Nbins=$((Nbinx * Nbiny * Nbinz))
    for ((bin_index = 0; bin_index < Nbins; bin_index++)); do
        cd "Bin$bin_index" || exit 1

        # Perform hadd for the selected process
        hadd "output_${selected_proc}.root" "output_${selected_proc}"*".root"

        # Echo the associated bin number
        echo "Hadd completed for bin $bin_index"

        cd ..
    done
done

cd ../../../
