# Final Fits (lite)
Welcome to the new Final Fits package. Here lies a a series of scripts which are used to run the final stages of the CMS Hgg analysis: signal modelling, background modelling, datacard creation, final statistical interpretation and final result plots.

Slides from the flashgg tutorial series can be found [here](https://indico.cern.ch/event/963619/contributions/4112177/attachments/2151275/3627204/finalfits_tutorial_201126.pdf)

## Download and setup instructions for Combine version 8

```
export SCRAM_ARCH=slc7_amd64_gcc700
cmsrel CMSSW_10_2_13
cd CMSSW_10_2_13/src
cmsenv

# Install Combine as per the documentation here: cms-analysis.github.io/HiggsAnalysis-CombinedLimit/
git clone https://github.com/cms-analysis/HiggsAnalysis-CombinedLimit.git   HiggsAnalysis/CombinedLimit
cmsenv

# Switch to combine v8.2.0
cd $CMSSW_BASE/src/HiggsAnalysis/CombinedLimit
git fetch origin
git checkout v8.2.0
scramv1 b clean; scramv1 b # always make a clean build

# Install Combine Harvester for parallelizing fits
cd $CMSSW_BASE/src/
git clone https://github.com/cms-analysis/CombineHarvester.git CombineHarvester

# Install Flashgg Final Fit packages
git clone -b jhossain_hggAC git@github.com:jhosain/flashggFinalFit.git 
cd flashggFinalFit/
cmsenv
source setup.sh

# Install the GBRLikelihood package which contains the RooDoubleCBFast implementation
git clone git@github.com:jonathon-langford/HiggsAnalysis.git

# Compile external libraries
cmsenv
scram b -j 9
```

In every new shell run the following to add `tools/commonTools` and `tools/commonObjects` to your `${PYTHONPATH}`:
```
cmsenv
source setup.sh
```
## Copy Physics model in the CombinedLimit 
```
cd Combine
cp FA3_Interference_JHU_ggHSyst_rw_MengsMuV_HeshyXsec_ggHInt_ggHphase.py ../../HiggsAnalysis/CombinedLimit/python/
```



## Contents
The Finals Fits package contains several subfolders which are used for the following steps:

* Create the Signal Model (see `Signal` dir)
* Create the Background Model (see `Background` dir)
* Generate a Datacard (see `Datacard` dir)
* Running fits with combine (see `Combine` dir)
* Scripts to produce plots (see `Plots` dir)

The signal modelling, background modelling and datacard creation can be ran in parallel. Of course the final fits (`Combine`) requires the output of these three steps. In addition, the scripts in the `Trees2WS` dir are a series of lightweight scripts for converting standard ROOT trees into a RooWorkspace that can be read by the Final Fits package.

Finally, the objects and tools which are common to all subfolders are defined in the `tools` directory. If your input workspaces differ from the flashgg output workspace structure, then you may need to change the options here.

Each of the relevant folders are documented with specific `README.md` files. Some (temporary) instructions can be found in this [google docs](https://docs.google.com/document/d/1NwUrPvOZ2bByaHNqt_Fr6oYcP7icpbw1mPlw_3lHhEE/edit)
