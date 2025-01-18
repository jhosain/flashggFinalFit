#!/bin/bash

# Define color codes for output formatting
RED='\033[0;31m'  # Red color for highlighting
NC='\033[0m'      # No color (reset)

echo -n "YEAR : "
read year

# Prompt user for the input directory path
echo -n "Name of the directory of your workspace: "
read InputDirectory

# Change directory to the user-specified workspace
cd "BINS/Opt_$year/$InputDirectory"
#|| { echo -e "${RED}Error: Unable to access directory BINS/Opt_$year/$InputDirectory.${NC}"; exit 1; }

# Define the number of bins for different categories
Nbinx=5  # Number of Dzero bins
Nbiny=3  # Number of stxsMVA bins
Nbinz=2  # Number of CPodd BDT bins
Nbinu=2

# Calculate the total number of bins (Nbinx * Nbiny * Nbinz)
Nbins=$((Nbinx * Nbiny * Nbinz * Nbinu))

# Output file to store the results
output_file="bin_table_${year}.txt"

# Write the header for the table with columns for each Proc value
echo -ne "Bin" > "$output_file"
for ((proc = 1; proc <= 6; proc++)); do
    case $proc in
        1) column_header="ggH SM Yield" ;;
        2) column_header="ggH MIX Yield" ;;
        3) column_header="ggH BSM Yield" ;;
        4) column_header="VBF SM Yield" ;;
        5) column_header="VBF MIX Yield" ;;
        6) column_header="VBF BSM Yield" ;;
        #0) column_header="Data Yield" ;;
        *) column_header="Unknown" ;;
    esac
    echo -ne "\t$column_header" >> "$output_file"
done
echo >> "$output_file"

# Loop through each bin index
for ((bin_index = 0; bin_index < Nbins; bin_index++)); do
    # Start the line with the bin index
    echo -ne "${bin_index}" >> "$output_file"

    # Loop through Proc values from 0 to 6
    for ((proc = 1; proc <= 6; proc++)); do
        # Change to the corresponding Bin directory
        cd "Bin$bin_index" || { echo -e "${RED}Error: Unable to access Bin$bin_index directory.${NC}"; exit 1; }

        # Define the log file name for the current bin and Proc value
        #log_file="run${bin_index}${proc}.log"
	log_file="Bin${bin_index}_process${proc}_cent.sub.out"

        # Extract the values for "Total weight" and "MC statistical uncertainty" using grep and awk
        total_weight=$(grep "Total weight: " "$log_file" | awk '{print $3}')
        mc_uncertainty=$(grep "MC statistical uncertainty: " "$log_file" | awk '{print $4}')

        # If the values are not found, set them to "N/A"
        total_weight=${total_weight:-"N/A"}
        mc_uncertainty=${mc_uncertainty:-"N/A"}

        # Format the values to two decimal places if they are numeric
        if [[ $total_weight != "N/A" ]]; then
            total_weight=$(printf "%.2f" "$total_weight")
        fi
        if [[ $mc_uncertainty != "N/A" ]]; then
            mc_uncertainty=$(printf "%.2f" "$mc_uncertainty")
        fi

        # Combine the Total weight and MC statistical uncertainty with the format "Total weight ± MC statistical uncertainty"
        combined_value="${total_weight}±${mc_uncertainty}"

        # Append the combined value to the output file
        echo -ne "\t${combined_value}" >> "../$output_file"

        # Return to the previous directory (workspace)
        cd ..
    done

    # End the line for the current bin
    echo >> "$output_file"
done

# Go back to the original directory
cd ../../../

# Notify the user that the table has been created
echo -e "${RED}Table has been written to $output_file${NC}"
