#!/bin/bash

echo -n "Year: "
read year

# Prompt user for the input directory path
echo -n "Name of the directory of your workspace: "
read InputDirectory

# Change directory to the user-specified workspace
cd "BINS/Opt_$year/$InputDirectory" || { echo -e "\e[31mError: Unable to access directory BINS/Opt_$year/$InputDirectory.\e[0m"; exit 1; }


# Create directory to store the trees
mkdir -p "Trees2WS_${year}"

#echo -n "Number of Bin? "
bin=30

proc=(
    "Data"
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
    echo "Collecting ROOT files for all the bins"


    for ((i = 0; i < $bin; i++)); do
        cd "Bin$i" || exit 1

	if [[ "$selected_proc" == "Data" ]]; then
		cp "output_${selected_proc}_central.root" "../Trees2WS_${year}/output_${selected_proc}_Bin${i}.root"
        else
        	cp "output_${selected_proc}.root" "../Trees2WS_${year}/output_${selected_proc}_Bin${i}.root"
	fi

	cd ..
    done

    cd Trees2WS_${year}

    echo "Performing hadd for the selected process"

    # Generate file list for hadd
    file_list=""
    for i in $(seq 0 $((bin - 1))); do
        file_list+="output_${selected_proc}_Bin${i}.root "
    done

    hadd -f "output_${selected_proc}.root" $file_list

    
    
done
    # Remove the Trees for each bins 
    rm -f ${file_list}

cd ../../../../ #exit input directory
