# Final Fits

(For Flshggfinal fit use Combine v8 & for Combine fit use v9)

Welcome to the new Final Fits package. Here lies a a series of scripts which are used to run the final stages of the CMS Hgg analysis: signal modelling, background modelling, datacard creation, final statistical interpretation and final result plots.

Slides from the flashgg tutorial series can be found [here](https://indico.cern.ch/event/963619/contributions/4112177/attachments/2151275/3627204/finalfits_tutorial_201126.pdf)

## Download and Combine v8/v9 setup instructions

```

cmssw-el7
cmsrel CMSSW_10_2_13 # To install Combine v9 use CMSSW_11_3_4 
cd CMSSW_10_2_13/src
cmsenv

# Install Combine
git clone https://github.com/cms-analysis/HiggsAnalysis-CombinedLimit.git HiggsAnalysis/CombinedLimit
cd HiggsAnalysis/CombinedLimit

cd $CMSSW_BASE/src/HiggsAnalysis/CombinedLimit
git fetch origin
git checkout v8.2.0  # For Combine v9 checkout v9.2.1 for the CombineLimit
scramv1 b clean; scramv1 b # always make a clean build

# Install Combine Harvester for parallelizing fits
cd CMSSW_10_2_13/src
git clone https://github.com/cms-analysis/CombineHarvester.git CombineHarvester
cd CombineHarvester
git checkout v2.1.0   # main dev branch v3.0.0 for CMSSW 14_1_X & v2.1.0 for CMSSW 10_2_X or 11_3_X
scram b


# Install Flashgg Final Fit packages
cd CMSSW_10_2_13/src
git clone -b gghAC-dev git@github.com:jhosain/flashggFinalFit.git 
cd flashggFinalFit/
```

In every new shell run the following to export Condor
```
source start_el7.sh   
```

In every new shell run the following to add `tools/commonTools` and `tools/commonObjects` to your `${PYTHONPATH}`:
```
cmsenv
source setup.sh
```

## Combine v10 Setup:

The nominal installation method is inside CMSSW. The current release targets the CMSSW 14_1_X series because of the recent switct to el9 at lxplus machines.
```

cmsrel CMSSW_14_1_0_pre4
cd CMSSW_14_1_0_pre4/src
cmsenv
git clone https://github.com/cms-analysis/HiggsAnalysis-CombinedLimit.git HiggsAnalysis/CombinedLimit
cd HiggsAnalysis/CombinedLimit

#Update to a recommended tag - currently the recommended tag is v10.0.2:

cd $CMSSW_BASE/src/HiggsAnalysis/CombinedLimit
git fetch origin
git checkout v10.0.2
scramv1 b clean; scramv1 b # always make a clean build

# Install Combine Harvester for parallelizing fits
cd CMSSW_14_1_0_pre4/src
git clone https://github.com/cms-analysis/CombineHarvester.git CombineHarvester
cd CombineHarvester
git checkout v3.0.0
scram b

# Install Flashgg Final Fit packages
cd CMSSW_10_2_13/src
git clone -b gghAC-dev git@github.com:jhosain/flashggFinalFit.git
cd flashggFinalFit/
```

In every new shell run the following to add `tools/commonTools` and `tools/commonObjects` to your `${PYTHONPATH}`:
```
cmsenv
source setup.sh
```

## Contents
The Finals Fits package contains several subfolders which are used for the following steps:

* Create Bins for the different categories (see `Binning` dir)
* Creat the WorkSpace for the Trees (see `Trees2WS` dir) )
* Create the Signal Model (see `Signal` dir)
* Create the Background Model (see `Background` dir)
* Generate a Datacard (see `Datacard` dir)
* Running fits with combine (see `Combine` dir)
* Scripts to produce plots (see `Plots` dir)

The signal modelling, background modelling and datacard creation can be ran in parallel. Of course the final fits (`Combine`) requires the output of these three steps. In addition, the scripts in the `Trees2WS` dir are a series of lightweight scripts for converting standard ROOT trees into a RooWorkspace that can be read by the Final Fits package.

Finally, the objects and tools which are common to all subfolders are defined in the `tools` directory. If your input workspaces differ from the flashgg output workspace structure, then you may need to change the options here.

Each of the relevant folders are documented with specific `README.md` files. Some (temporary) instructions can be found in this [google docs](https://docs.google.com/document/d/1NwUrPvOZ2bByaHNqt_Fr6oYcP7icpbw1mPlw_3lHhEE/edit)


## Link
CombineLimit: https://cms-analysis.github.io/HiggsAnalysis-CombinedLimit/latest/#for-developers
CombineHarvestar: https://github.com/cms-analysis/CombineHarvester?tab=readme-ov-file#quick-start
FlashggFinalFit: https://github.com/jhosain/flashggFinalFit
		 https://github.com/emanueledimarco/flashggFinalFit
		 https://github.com/cms-analysis/flashggFinalFit/tree/higgsdnafinalfit