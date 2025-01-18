#!/bin/bash

# Prompt for year
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

# Initialize error log
error_log="error_log.txt"
> "$error_log"

# Expected file count
expected_files=57
[[ "$year" == "2018" ]] && expected_files=58

# Function to process each process
process_task() {
    local index=$1
    local selected_proc="${proc[index]}"
    echo "Processing: $selected_proc"

    Nbins=$((Nbinx * Nbiny * Nbinz))
    for ((bin_index = 0; bin_index < Nbins; bin_index++)); do
        cd "Bin$bin_index" || { echo "Error: Unable to access Bin$bin_index" >> "../$error_log"; continue; }

        # Count the number of files to merge
        file_count=$(ls -1q "output_${selected_proc}"*.root 2>/dev/null | wc -l)
        if ((file_count == 0)); then
            echo -e "\e[33mNo files to merge for process $selected_proc in bin $bin_index.\e[0m"
            cd ..
            continue
        fi

        echo -e "\e[34mMerging $file_count files for bin $bin_index...\e[0m"

        # Remove existing output file if it exists
        if [[ -f "output_${selected_proc}.root" ]]; then
            echo -e "\e[33mRemoving existing output file: output_${selected_proc}.root\e[0m"
            rm "output_${selected_proc}.root"
        fi

	if [[ -f "output_${selected_proc}_ExtraSystFor2018_Down.root" ]]; then
            echo -e "\e[33mRemoving existing output file: output_${selected_proc}.root\e[0m"
            rm "output_${selected_proc}_ExtraSystFor2018_Down.root"
        fi

	if [[ -f "output_${selected_proc}_ExtraSystFor2018_Up.root" ]]; then
            echo -e "\e[33mRemoving existing output file: output_${selected_proc}.root\e[0m"
            rm "output_${selected_proc}_ExtraSystFor2018_Up.root"
        fi

	# Perform hadd for the selected process
        hadd -f "output_${selected_proc}.root" "output_${selected_proc}"*.root
        if [[ $? -ne 0 ]]; then
            echo -e "\e[31mError: hadd failed for bin $bin_index and process $selected_proc.\e[0m"
            echo "Error: hadd failed for bin $bin_index and process $selected_proc." >> "../$error_log"
            echo -en "\a" # Beep sound
        else
            echo -e "\e[32mHadd completed successfully for bin $bin_index.\e[0m"
        fi

        # Check if the total file count matches the expected
        if ((file_count != expected_files)); then
            echo -e "\e[33mWarning: Expected $expected_files files but found $file_count for process $selected_proc in bin $bin_index.\e[0m"
            echo "Warning: Expected $expected_files files but found $file_count for process $selected_proc in bin $bin_index." >> "../$error_log"
        fi

        cd ..
    done
}

# Run tasks in parallel by sending them to the background
for i in {0..14}; do
    process_task "$i" &> log_$i.txt
done

# Wait for all background processes to complete
wait

# Print all errors and warnings at the end of the run
if [[ -s "$error_log" ]]; then
    echo -e "\e[31mErrors and warnings encountered during the run:\e[0m"
    cat "$error_log"
else
    echo -e "\e[32mNo errors or warnings encountered during the run.\e[0m"
fi

cd ../../../
