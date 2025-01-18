#!/bin/bash                                                                                                                                    

echo -n "Year: "
read year

# Prompt user for the input directory path                                                                                                     
echo -n "Name of the directory of your workspace: "
read InputDirectory

# Change directory to the user-specified workspace                                                                                             
cd "BINS/Opt_$year/$InputDirectory" || { echo -e "\e[31mError: Unable to access directory BINS/Opt_$year/$InputDirectory.\e[0m"; exit 1; }

# Bin to debug
#echo -n "Process:"
#read i

# Create directory to store the trees                                                                                                          
mkdir -p "Trees2WS_${year}"

bin=30  # Number of bins
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

#echo "Starting all processes in the background..."
#error_log="error_summary.txt"
#> "$error_log"

# Run all processes in the background
for index in "${!proc[@]}"; do
    selected_proc="${proc[index]}"
    (
        echo -e "\e[34mSelected process: $selected_proc\e[0m"
        echo "Collecting ROOT files for all the bins..."

        # Count files for verification
        file_count=0

        for ((i = 0; i < $bin; i++)); do
            cd "Bin$i" || { echo -e "\e[31mError: Unable to access Bin$i directory.\e[0m"; continue; }

            # Copy files to Trees2WS directory
            if [[ "$selected_proc" == "Data" ]]; then
                if [[ -f "output_${selected_proc}_central.root" ]]; then
                    cp "output_${selected_proc}_central.root" "../Trees2WS_${year}/output_${selected_proc}_Bin${i}.root"
                    ((file_count++))
                elif [[ -f "output_${selected_proc}.root" ]]; then
		     cp "output_${selected_proc}.root" "../Trees2WS_${year}/output_${selected_proc}_Bin${i}.root"
		     ((file_count++))
		else
                    echo -e "\e[33mWarning: File output_${selected_proc}_central.root not found in Bin$i.\e[0m"
                fi
            
            
		elif [[ -f "output_${selected_proc}.root" ]]; then
                    cp "output_${selected_proc}.root" "../Trees2WS_${year}/output_${selected_proc}_Bin${i}.root"
                    ((file_count++))
		elif [[ -f "output_${selected_proc}.root" ]]; then
                     cp "output_${selected_proc}.root" "../Trees2WS_${year}/output_${selected_proc}_Bin${i}.root"
                     ((file_count++))
                else
                    echo -e "\e[33mWarning: File output_${selected_proc}.root not found in Bin$i.\e[0m"
                
            fi

            cd ..
        done

        # Check if the total number of files is 30
        if ((file_count != bin)); then
            echo -e "\e[31mError: Expected $bin files but found $file_count for process $selected_proc.\e[0m"
            echo "Process $selected_proc: Expected $bin files but found $file_count" >> "../$error_log"
        fi

        cd "Trees2WS_${year}"

        # Perform hadd for the selected process
        echo -e "\e[34mPerforming hadd for the selected process...\e[0m"
        file_list=""
        for i in $(seq 0 $((bin - 1))); do
            file_list+="output_${selected_proc}_Bin${i}.root "
        done

        hadd -f "output_${selected_proc}.root" $file_list

        if [[ $? -ne 0 ]]; then
            echo -e "\e[31mError: hadd failed for process $selected_proc.\e[0m"
        else
            echo -e "\e[32mHadd completed successfully for process $selected_proc.\e[0m"
        fi

        # Clean up individual bin files
        echo "Cleaning up temporary files for process $selected_proc..."
        rm -f $file_list

        cd ..
    )   # Run each process in the background
done

# Wait for all background processes to finish
wait

# Show errors if any files were missing
if [[ -s "$error_log" ]]; then
    echo -e "\e[31mErrors encountered during the run:\e[0m"
else
    echo -e "\e[32mAll processes completed without errors.\e[0m"
fi

cd ../../../ # Exit to the initial directory
