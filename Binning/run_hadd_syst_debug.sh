#!/bin/bash

# Prompt for year
echo -n "YEAR: "
read year

# Prompt user for the input directory path
echo -n "Input the path directory of your workspace: "
read InputDirectory

# Change directory to the user-specified workspace
cd "BINS/Opt_$year/$InputDirectory" || { echo -e "\e[31mError: Unable to access directory BINS/Opt_$year/$InputDirectory.\e[0m"; exit 1; }

# Bin to debug
echo -n "Bin to debug:"
read bin_index


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

# Iterate through all processes
for index in {0..14}; do
    selected_proc="${proc[index]}"
    echo "Processing: $selected_proc"

    # Perform the hadd operation
    Nbins=$((Nbinx * Nbiny * Nbinz))
    #for ((bin_index = 0; bin_index < Nbins; bin_index++)); do
        cd "Bin$bin_index" || { echo -e "\e[31mError: Unable to access Bin$bin_index.\e[0m"; exit 1; }

        # Count the number of files to merge
        file_count=$(ls -1q "output_${selected_proc}"*.root 2>/dev/null | wc -l)
        if ((file_count == 0)); then
            echo "No files to merge for process $selected_proc in bin $bin_index."
            cd ..
            continue
        fi

        echo "Merging $file_count files for bin $bin_index..."

        # Check if output file exists and remove it
        if [[ -f "output_${selected_proc}.root" ]]; then
            echo "Removing existing output file: output_${selected_proc}.root"
            rm "output_${selected_proc}.root"
        fi

        # Perform hadd for the selected process
        hadd -f "output_${selected_proc}.root" "output_${selected_proc}"*.root
        if [[ $? -ne 0 ]]; then
            echo -e "\e[31mError: hadd failed for bin $bin_index and process $selected_proc.\e[0m"
        else
            echo "Hadd completed for bin $bin_index."
        fi

        cd ..
    #done

done

# Print all errors and warnings at the end of the run                                                                                          
if [[ -s "$error_log" ]]; then
    echo -e "\e[31mErrors and warnings encountered during the run:\e[0m"
    cat "$error_log"
else
    echo -e "\e[32mNo errors or warnings encountered during the run.\e[0m"
fi

cd ../../../
