#!/bin/sh

year=2017
type=cent
InputDirectory="Opt_2017"

echo "YEAR : "$year 
echo "Directory of your work space : "$InputDirectory  
echo "Type of the trees (cent or syst) : "$type

if [ ! -d $InputDirectory ]; then
    mkdir $InputDirectory
    echo "$InputDirectory directory has been created"
fi

echo "Making Results folder"
cwr=$PWD #directory with macros and weightfile
cd ../../.. 
cmssw_dir=$PWD
cd -

if [ ! -d $InputDirectory/Results ]; then
    mkdir -p $InputDirectory/Results
fi
if [ ! -d $InputDirectory/Results/Models ]; then
    mkdir -p $InputDirectory/Results/Models
fi
if [ ! -d $InputDirectory/Results/Models/background ]; then
    mkdir -p $InputDirectory/Results/Models/background
fi
if [ ! -d $InputDirectory/Results/Models/signal ]; then
    mkdir -p $InputDirectory/Results/Models/signal
fi
echo "Making Output folder"

if [ ! -d $InputDirectory/Signal_Output ]; then
    mkdir -p $InputDirectory/Signal_Output
fi
if [ ! -d $InputDirectory/Signal_Output/outdir ]; then
    mkdir -p $InputDirectory/Signal_Output/outdir
fi
if [ ! -d $InputDirectory/Signal_Output/outdir_pack ]; then
    mkdir -p $InputDirectory/Signal_Output/outdir_pack
fi
if [ ! -d $InputDirectory/Background_Output/ ]; then
    mkdir -p $InputDirectory/Background_Output/
fi

echo "##### Creating $InputDirectory/Bin directories #####"

cp TMVAClassification__BDT_Xgrad_multiclass_CPodd_threeclass_VBF.weights.xml $InputDirectory
cp TreeMakerForWorkspace_multiclassBDT_3D_Central.C $InputDirectory
cp TreeMakerForWorkspace_multiclassBDT_3D_SYS.C $InputDirectory

cd $InputDirectory

Nbinx=5 #Dzero bins
Nbiny=3 #stxsMVA bins
Nbinz=2 #DCP bins 

vars=("Up" "Down")

# Check if year is 2018
#systematics=( "FNUFEE"  ) 

systematics=( "FNUFEE" "FNUFEB" "JEC" "JER" "MCScaleGain1EB" "MCScaleGain6EB" "MCScaleHighR9EB" "MCScaleHighR9EE" "MCScaleLowR9EB" "MCScaleLowR9EE" "MCSmearHighR9EBPhi" "MCSmearHighR9EBRho" "MCSmearHighR9EEPhi" "MCSmearHighR9EERho" "MCSmearLowR9EBPhi" "MCSmearLowR9EBRho" "MCSmearLowR9EEPhi" "MCSmearLowR9EERho" "MaterialCentralBarrel" "MaterialForward" "MaterialOuterBarrel" "MvaShift" "PUJIDShift" "ShowerShapeHighR9EB" "ShowerShapeHighR9EE" "ShowerShapeLowR9EB" "ShowerShapeLowR9EE" "SigmaEOverEShift" ) 

if [ "$year" = "2018" ]; then
    systematics+=( "JetHEM" "ExtraSystFor2018" )
fi

#Number of processes ggH, VBF, WH, ZH, ttH * SM/BSM/mixed
last_p=16 # Data in central tree
if [ "$type" = "syst" ]; then
    last_p=15
fi

bin_index=0

#Loop over all 3 categories
for ((k = 0; k < $Nbinz; k++)); do

    for ((j = 0; j < $Nbiny; j++)); do

	for ((i = 0; i < $Nbinx; i++)); do

	    if [ ! -d Bin$bin_index ]; then
		mkdir -p Bin$bin_index
		echo "$InputDirectory/Bin$bin_index directory has been created"
	    fi    
	    cd Bin$bin_index || exit 1
	    
	    #Copy files
	    cp ../TreeMakerForWorkspace_multiclassBDT_3D_Central.C .
	    cp ../TreeMakerForWorkspace_multiclassBDT_3D_SYS.C .

	    #Process loop
	    for ((p =0; p < $last_p; p++)); do

		#Executable for condor submission for each process
		#Copying of files to condor pool
		wrapper="Bin${bin_index}_process${p}.sh"

                echo "#!/bin/bash" > $wrapper
                echo "source /cvmfs/cms.cern.ch/cmsset_default.sh" >> $wrapper
		echo "cd "$cmssw_dir"/src ; eval \$(scram runtime -sh); cd -" >> $wrapper
		echo "cp "$cwr"/TMVAClassification__BDT_Xgrad_multiclass_CPodd_threeclass_VBF.weights.xml ." >> $wrapper
                chmod +x $wrapper
		subfile="Bin${bin_index}_process${p}_cent.sub"

		if  [ "$type" = "cent" ]; then
		 # Generate a submission file for central tree
		    #Central tree loop
		    echo "cp "$cwr"/TreeMakerForWorkspace_multiclassBDT_3D_Central.C ." >> $wrapper
		    echo "root -l -b -q 'TreeMakerForWorkspace_multiclassBDT_3D_Central.C($i,$j,$k,$p,$bin_index,\"$year\")'"  >> $wrapper
		    
		elif [ "$type" = "syst" ]; then
                 # Generate a submission file for all systematic variations
                    subfile="Bin${bin_index}_process${p}_sys.sub"
		    echo "cp "$cwr"/TreeMakerForWorkspace_multiclassBDT_3D_SYS.C ." >> $wrapper
                    for systematic in "${systematics[@]}"; do
                        for var in "${vars[@]}"; do
			    echo "root -l -b -q 'TreeMakerForWorkspace_multiclassBDT_3D_SYS.C($i,$j,$k,$p,$bin_index,\"$systematic\",\"$var\",\"$year\")'" >> $wrapper
			    done
		    done

		    # Create Condor submission file: my singularity image needed on el7 
                cat > $subfile << EOF
universe              = vanilla
executable            = $wrapper
output                = run_${bin_index}_${p}_all_systematics.out
error                 = run_${bin_index}_${p}_all_systematics.err
log                   = run_${bin_index}_${p}_all_systematics.log
request_cpus          = 1
+JobFlavour = "tomorrow"
request_memory        = 4GB
request_disk          = 1GB
should_transfer_files = YES
when_to_transfer_output = ON_EXIT
MY.SingularityImage     = "/cvmfs/unpacked.cern.ch/gitlab-registry.cern.ch/cms-cat/cmssw-lxplus/cmssw-el7-lxplus:latest/"
queue 1                                                                                                                                                                                                   
EOF
		echo " "
		echo "HTCondor submission file created: $subfile"
		condor_submit $subfile

		else echo "Type is not central or systematic variation"
		fi

	    done #process loop

	    wait
	    cd ..
       	    ((bin_index++))

	done #binx
    done #biny
done #binz

echo "All jobs submitted"


