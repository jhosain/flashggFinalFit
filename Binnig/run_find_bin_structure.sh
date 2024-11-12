# Prompt for directory input
echo -n "Input the path directory of your workspace : "
read InputDirectory

# Navigate to the input directory
cd "$InputDirectory" || { echo "Directory not found!"; exit 1; }

# Output file to store the results
output_file="bin_structure.txt"

# Write the header for the table with columns
echo -e "Bin\tDCP_ggH Range\tDiPho_MVA Range\tD0_minus_ggH Range" > "$output_file"

# Define bin parameters
Nbinx=5  # Dzero bins
Nbiny=3  # stxsMVA bins
Nbinz=2  # CPodd bdt bins

Proc=6   # Data Process
Nbins=$((Nbinx * Nbiny * Nbinz))

for ((bin_index = 0; bin_index < Nbins; bin_index++)); do
    # Enter the specific Bin directory
    cd "Bin$bin_index" || { echo "Bin$bin_index not found!"; cd ..; continue; }

    # Specify the log file
    log_file="run${bin_index}${Proc}.log"

    # Check if the log file exists
    if [[ ! -f "$log_file" ]]; then
        echo "Log file $log_file not found for Bin$bin_index"
        cd ..
        continue
    fi

    # Read the line containing "Bin structure" and parse the values
    bin_structure=$(grep "Bin structure " "$log_file" | sed -n '1p')

    # Check if bin_structure is empty
    if [ -z "$bin_structure" ]; then
        echo "No 'Bin structure' line found in $log_file for Bin$bin_index"
        cd ..
        continue
    fi

    # Extract ranges using updated regex patterns
    DCP_range=$(echo "$bin_structure" | grep -oP 'DCP_ggH\s*\|\s*lower\s*:\s*\K[-0-9.]+\s*\|\s*upper\s*:\s*[-0-9.]+' | sed 's/ | upper : / to /')
    diPho_MVA_range=$(echo "$bin_structure" | grep -oP 'diPho_MVA\s*\|\s*lower\s*:\s*\K[-0-9.]+\s*\|\s*upper\s*:\s*[-0-9.]+' | sed 's/ | upper : / to /')
    D0_minus_range=$(echo "$bin_structure" | grep -oP 'D0_minus_ggH \| lower  : [-0-9.]+ \| upper  : [-0-9.]+' | sed 's/.*lower  : \([-0-9.]*\).*upper  : \([-0-9.]*\)/\1 to \2/')

    # Set default values if any field is empty
    DCP_range=${DCP_range:-"N/A"}
    diPho_MVA_range=${diPho_MVA_range:-"N/A"}
    D0_minus_range=${D0_minus_range:-"N/A"}

    # Print the values in the specified format
    printf "%-10s %-12s %-15s %-10s\n" "Bin$bin_index" "$DCP_range" "$diPho_MVA_range" "$D0_minus_range"

    # Append the values in the specified format to the output file
    echo -e "Bin$bin_index\t$DCP_range\t$diPho_MVA_range\t$D0_minus_range" >> "../$output_file"

    # Move back to parent directory
    cd ..
done

# Move back to the initial directory
cd ..

# Confirmation message
echo "Table successfully saved to $output_file."
