#!/usr/bin/env bash

# text2workspace_wrapper.sh: Convert datacards into workspaces for FCP or FA3 analyses
# Supports both wosys and regular datacards, and FCP vs FA3 analysis.
# Usage: ./text2workspace_wrapper.sh [-w|--wosys] [-f|--fcp]

# Default flags
WOSYS=0  # use wosys datacard if set
FCP=0    # use FCP plugin if set; otherwise use FA3 plugin

usage() {
  echo "Usage: $0 [-w|--wosys] [-f|--fcp]"
  echo "  -w, --wosys    Use wosys datacard (Datacard_wosys_RunII.txt)"
  echo "  -f, --fcp      Use FCP plugin (default is FA3 plugin)"
  exit 1
}

# Parse options
while [[ $# -gt 0 ]]; do
  case "$1" in
    -w|--wosys)
      WOSYS=1; shift ;;  
    -f|--fcp)
      FCP=1; shift ;; 
    -h|--help)
      usage ;; 
    *)
      break ;; 
  esac
done

# Determine input datacard and base output name
if [[ "$WOSYS" -eq 1 ]]; then
  INPUT_DATACARD="Datacard_wosys_RunII.txt"
  BASE_NAME="Datacard_wosys_RunII"
else
  INPUT_DATACARD="Datacard_RunII.txt"
  BASE_NAME="Datacard_RunII"
fi

# Check that input exists
if [[ ! -f "$INPUT_DATACARD" ]]; then
  echo "Error: Input datacard '$INPUT_DATACARD' not found." >&2
  exit 1
fi

# Choose plugin and output file based on FCP flag
if [[ "$FCP" -eq 1 ]]; then
  # FCP analysis
  PLUGIN="HiggsAnalysis.CombinedLimit.FCP_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase:"
  PLUGIN+="FCP_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase"
  OUTPUT_WORKSPACE="${BASE_NAME}_FCP.root"
else
  # FA3 analysis
  PLUGIN="HiggsAnalysis.CombinedLimit.FA3_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase:"
  PLUGIN+="FA3_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase"
  OUTPUT_WORKSPACE="${BASE_NAME}.root"
fi

# Set mass
MASS=125.38

# Run text2workspace
echo "Converting '$INPUT_DATACARD' -> '$OUTPUT_WORKSPACE' with mass $MASS"
text2workspace.py "$INPUT_DATACARD" \
  -m "$MASS" \
  -P "$PLUGIN" \
  -o "$OUTPUT_WORKSPACE"

# Check exit status
if [[ $? -eq 0 ]]; then
  echo "Workspace created successfully: $OUTPUT_WORKSPACE"
  exit 0
else
  echo "Error: text2workspace.py failed." >&2
  exit 1
fi
