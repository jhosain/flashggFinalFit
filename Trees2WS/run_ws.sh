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
    log_file="output_log_${s_type}_${year}.txt"
    if [[ $s_types == "data" ]]; then
    echo "Running: source run_tree2ws.sh -s $s_type -y $year -d $directory -i &> $log_file &"
    source run_tree2ws.sh -s "$s_type" -y "$year" -d "$directory" -i &> "$log_file" &
    else
    echo "Running: source run_tree2ws.sh -s $s_type -y $year -d $directory -i -t &> $log_file "
    source run_tree2ws.sh -s "$s_type" -y "$year" -d "$directory" -i &> "$log_file" &   
    fi
done

# Wait for all background processes to finish
wait

echo "All processes completed!"

