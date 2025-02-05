#!/bin/bash

echo -n "Year: "
read YEAR

echo -n "Target Directory: "
read DIR

# Base directory for copying files
TARGET_DIR="/afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Analysis_2024/Categorization/3D_Cat_DCP/Opt_$YEAR/$DIR"

# Loop through Bin0 to Bin29
for i in {0..29}
do
    BIN_DIR="Bin$i"
    
    if [ -d "$BIN_DIR" ]; then
        echo "Entering directory $BIN_DIR"
        cd "$BIN_DIR"
        
        if compgen -G "*.root" > /dev/null; then
            echo "Copying files from $BIN_DIR to $TARGET_DIR/Bin$i"
	    cp Bin* "$TARGET_DIR/Bin$i"
            cp *.root "$TARGET_DIR/Bin$i"
         else
           echo "No files matching *.root in $BIN_DIR"
        fi
        
        cd - > /dev/null
    else
        echo "Directory $BIN_DIR does not exist"
    fi

done

echo "File copy process completed."
