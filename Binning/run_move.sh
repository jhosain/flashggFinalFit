#!/bin/bash

# Base directory for copying files
TARGET_DIR="/afs/cern.ch/user/j/jhossain/Hgg_AC_Analysis/Combine/Combine_V8/CMSSW_10_2_13/src/flashggFinalFit/Binning/BINS/Opt_2017/3D_DCP_CPodd_p25_Bkg_p60_2017"

# Loop through Bin0 to Bin29
for i in {0..29}
do
    BIN_DIR="Bin$i"
    
    if [ -d "$BIN_DIR" ]; then
        echo "Entering directory $BIN_DIR"
        cd "$BIN_DIR"
        
        if compgen -G "*_central.root" > /dev/null; then
            echo "Copying files from $BIN_DIR to $TARGET_DIR/Bin$i"
            cp *_central.root "$TARGET_DIR/Bin$i"
        else
            echo "No files matching *_central.root in $BIN_DIR"
        fi
        
        cd - > /dev/null
    else
        echo "Directory $BIN_DIR does not exist"
    fi

done

echo "File copy process completed."
