#!/usr/bin/env bash

# run_plot_scans_comp.sh: Merge ROOT scan outputs and plot (with optional comparison to other dataset)
# Usage: ./run_plot_scans_comp.sh [--compare] <TAG> <NAME_SUFF> <POI>
#   --compare   Overlay the opposite run-type (e.g., obs vs exp) on the plot

usage() {
  echo "Usage: $0 [--compare] <TAG> <NAME_SUFF> <POI>"
  exit 1
}

# Parse compare flag
COMPARE=0
if [[ "$1" == "--compare" ]]; then
  COMPARE=1
  shift
fi

# Positional arguments
TAG=$1         # exp or obs
NAME_SUFF=$2   # stat or sys
POI=$3         # e.g. fa3_ggH

# Validate inputs
if [[ -z "$TAG" || -z "$NAME_SUFF" || -z "$POI" ]]; then
  usage
fi

# Patterns for merged file
MERGED="higgsCombine_scan1D_${TAG}_${NAME_SUFF}_${POI}.RunII.MultiDimFit.mH125.38.root"
INPUT_PATTERN="higgsCombine_scan1D_${TAG}_${NAME_SUFF}_${POI}.RunII.POINTS.*.MultiDimFit.mH125.38.root"

# Merge chunks if present
if ls $INPUT_PATTERN 1> /dev/null 2>&1; then
  echo "Merging chunked files into: $MERGED"
  hadd -f "$MERGED" $INPUT_PATTERN && rm -v $INPUT_PATTERN
elif [[ -f "$MERGED" ]]; then
  echo "Using existing merged file: $MERGED"
else
  echo "Error: No scan file found: $MERGED or chunks" >&2
  exit 2
fi

#(#mu_{f},#mu_{V} floated)
# Determine main label
LABEL=$( [[ "$TAG" == "exp" ]] && echo "Expected (#mu_{f}, #mu_{V}floated)" || echo "Observed (#mu_{f}, #mu_{V}floated)" )


# Plotting
if [[ $COMPARE -eq 1 ]]; then
  # Determine opposite tag
  if [[ "$TAG" == "exp" ]]; then
    OTHER_TAG="obs"
    OTHER_LABEL="Observed (#mu_{f}- #mu_{V}floated)"
  else
    OTHER_TAG="exp"
    OTHER_LABEL="Expected (#mu_{f}- #mu_{V}floated)"
  fi
  OTHER_FILE="higgsCombine_scan1D_${OTHER_TAG}_${NAME_SUFF}_${POI}.RunII.MultiDimFit.mH125.38.root"
  if [[ ! -f "$OTHER_FILE" ]]; then
    echo "Error: Comparison file not found: $OTHER_FILE" >&2
    exit 3
  fi

  OUTPUT_NAME="scan_compare_${TAG}_${NAME_SUFF}_${POI}"
  echo "Plotting comparison scan: $OUTPUT_NAME"
  python plot1DScan.py "$MERGED" \
    --POI "$POI" \
    --main-label "$LABEL" \
    --main-color 1 \
    --others "$OTHER_FILE:$OTHER_LABEL:2" \
    -o "$OUTPUT_NAME" \
    --y-max 8 \
    --translate pois.json \
    --Not_show1sigma 

else
  OUTPUT_NAME="scan_quick_${TAG}_${NAME_SUFF}_${POI}"
  echo "Plotting quick scan: $OUTPUT_NAME"
  python plot1DScan.py "$MERGED" \
    --POI "$POI" \
    --main-label "$LABEL" \
    -o "$OUTPUT_NAME" \
    --translate pois.json 
fi

# Display the plot
display "${OUTPUT_NAME}.png" &
