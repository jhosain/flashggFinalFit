#!/usr/bin/env bash

# run_combine_fa3ggH.sh: Run a grid scan over fa3_ggH with configurable points, wosys and expected flags
# Usage: ./run_combine_fa3ggH.sh [-p POINTS] [-w|--wosys] [--doExp] -P POI

SCRIPT_NAME=$(basename "$0")
POINTS=30       # Default number of grid points
WOSYS=0         # Use wosys datacard flag? (0=no,1=yes)
DOEXP=0         # Use Asimov dataset? (0=no,1=yes)
POI=""        # Parameter of interest

usage() {
  echo "Usage: $0 [-p POINTS] [-w|--wosys] [--doExp] -P POI"
  exit 1
}

# Parse options
while [[ $# -gt 0 ]]; do
  case "$1" in
    -p|--points)
      if [[ -z "$2" || ! "$2" =~ ^[0-9]+$ ]]; then
        echo "Error: -p requires a positive integer."
        usage
      fi
      POINTS="$2"
      shift 2
      ;;
    -w|--wosys)
      WOSYS=1
      shift
      ;;
    --doExp)
      DOEXP=1
      shift
      ;;
    -P)
      POI="$2"
      shift 2
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Unknown option: $1"
      usage
      ;;
  esac
done

# Validate POI
if [[ -z "$POI" ]]; then
  echo "Error: POI must be specified with -P"
  usage
fi

# Select datacard and suffix
if [[ $WOSYS -eq 1 ]]; then
  DATACARD="Datacard_wosys_RunII.root"
  NAME_SUFF="stat"
else
  DATACARD="Datacard_RunII.root"
  NAME_SUFF="sys"
fi

# Determine run type and extra args
if [[ $DOEXP -eq 1 ]]; then
  RUN_TYPE="exp"
  EXTRA_ARGS="-t -1"
else
  RUN_TYPE="obs"
  EXTRA_ARGS=""
fi

# Build scan name and task name
SCAN_NAME="_scan1D_${RUN_TYPE}_${NAME_SUFF}_${POI}.RunII"
TASK_NAME="mytask_${RUN_TYPE}_${NAME_SUFF}_${POI}"


# Execute combineTool
echo "Running grid scan for POI $POI (points=$POINTS, datacard=$DATACARD, run=$RUN_TYPE)"
python combineTool.py \
  --floatOtherPOIs 1 \
  -P "$POI" \
  --algo grid \
  --alignEdges 1 \
  --redefineSignalPOIs fa3_ggH,mu_ggH,muV \
  --saveInactivePOI 1 \
  --setParameters muV=1.0,mu_ggH=1.0,fa3=0.0,fa3_ggH=0.0 \
  --setParameterRanges muV=0.0,5.0:mu_ggH=0.0,5.0:fa3_ggH=-1.0,1.0 \
  --freezeParameters MH,fa3 \
  --robustFit 1 \
  --setRobustFitAlgo Minuit2,Migrad \
  --X-rtd FITTER_NEW_CROSSING_ALGO \
  --setRobustFitTolerance 0.2 \
  --X-rtd FITTER_NEVER_GIVE_UP \
  --X-rtd FITTER_BOUND \
  --cminFallbackAlgo Minuit2,0:1. \
  --cminDefaultMinimizerStrategy 0 \
  --X-rtd MINIMIZER_freezeDisassociatedParams \
  --X-rtd MINIMIZER_multiMin_hideConstants \
  --X-rtd MINIMIZER_multiMin_maskConstraints \
  --X-rtd MINIMIZER_multiMin_maskChannels=2 \
  -M MultiDimFit \
  -m 125.38 \
  -d "$DATACARD" \
  --points "$POINTS" \
  $EXTRA_ARGS \
  -n "$SCAN_NAME" \
  --setCrossingTolerance 0.000001 \
  --X-rtd REMOVE_CONSTANT_ZERO_POINT=1 \
  -v 1 \
  --job-mode condor --split-points 10 --sub-opts='+JobFlavour="workday"' \
  --task-name "$TASK_NAME"

echo "Submitted scan: $SCAN_NAME (task: $TASK_NAME)"
