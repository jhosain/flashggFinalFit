#!/bin/bash

# Prompt for year
echo -n "Enter the year (e.g., 2018, 2017, 2016preVFP, 2016postVFP): "
read year

# Prompt for directory name
echo -n "Enter the directory name (e.g., 3D_DCP_CPodd_p25_Bkg_p60_year): "
read directory

# Prompt for s types
echo -n "Enter the s types as a comma-separated list (e.g., data,test,mc-ggh,mc-vbf,mc-wh,mc-zh,mc-tth): "
read s_types

# Convert comma-separated s types into an array
IFS=',' read -r -a s_array <<< "$s_types"

# Run each process in the background
for s_type in "${s_array[@]}"; do

    if [[ $s_types == "data" ]]; then
    echo "Running: source run_tree2ws.sh -s $s_type -y $year -d $directory -i &> $log_file &"
    source run_tree2ws.sh -s "$s_type" -y "$year" -d "$directory" -i &> output_log_${s_type}_${year}.txt &
    elif [[ $s_types == "mc-ggh" ]]; then
    source run_tree2ws.sh -s mc-gghSM -y "$year" -d "$directory" -i &> output_log_${s_type}_SM_${year}.txt &
    source run_tree2ws.sh -s mc-gghBSM -y "$year" -d "$directory" -i &> output_log_${s_type}_BSM_${year}.txt &
    source run_tree2ws.sh -s mc-gghMM -y "$year" -d "$directory" -i &> output_log_${s_type}_MM_${year}.txt &      
    elif [[ $s_types == "mc-vbf" ]]; then
    source run_tree2ws.sh -s mc-vbfSM -y "$year" -d "$directory" -i &> output_log_${s_type}_SM_${year}.txt &
    source run_tree2ws.sh -s mc-vbfBSM -y "$year" -d "$directory" -i &> output_log_${s_type}_BSM_${year}.txt &
    source run_tree2ws.sh -s mc-vbfMM -y "$year" -d "$directory" -i &> output_log_${s_type}_MM_${year}.txt &
    elif [[ $s_types == "mc-wh" ]]; then
    source run_tree2ws.sh -s mc-whSM -y "$year" -d "$directory" -i &> output_log_${s_type}_SM_${year}.txt &
    source run_tree2ws.sh -s mc-whBSM -y "$year" -d "$directory" -i &> output_log_${s_type}_BSM_${year}.txt &
    source run_tree2ws.sh -s mc-whMM -y "$year" -d "$directory" -i &> output_log_${s_type}_MM_${year}.txt &
    elif [[ $s_types == "mc-zh" ]]; then
    source run_tree2ws.sh -s mc-zhSM -y "$year" -d "$directory" -i &> output_log_${s_type}_SM_${year}.txt &
    source run_tree2ws.sh -s mc-zhBSM -y "$year" -d "$directory" -i &> output_log_${s_type}_BSM_${year}.txt &
    source run_tree2ws.sh -s mc-zhMM -y "$year" -d "$directory" -i &> output_log_${s_type}_MM_${year}.txt &
    else
    source run_tree2ws.sh -s "$s_type" -y "$year" -d "$directory" -i &> output_log_${s_type}_${year}.txt &
    fi
done

# Wait for all background processes to finish
wait

echo "All processes completed!"

