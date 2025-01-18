#!bin/sh

echo -n "YEAR: "
read YEAR

echo -n "Name of the directory of your workspace:"
read InputWSDirPath

###################


python RunPackager.py --cats "AC_Bin0,AC_Bin1,AC_Bin2,AC_Bin3,AC_Bin4,AC_Bin5,AC_Bin6,AC_Bin7,AC_Bin8,AC_Bin9,AC_Bin10,AC_Bin11,AC_Bin12,AC_Bin13,AC_Bin14,AC_Bin15,AC_Bin16,AC_Bin17,AC_Bin18,AC_Bin19,AC_Bin20,AC_Bin21,AC_Bin22,AC_Bin23,AC_Bin24,AC_Bin25,AC_Bin26,AC_Bin27,AC_Bin28,AC_Bin29" --exts $YEAR --mergeYears FALSE --outputExt packaged_$YEAR

python RunPlotter.py --procs all --cats all --year $YEAR --ext packaged_$YEAR

echo " @@@@@@@################## Finished the whole process  @@@@@@@@@@@################ "

echo " ############### Renaming Output Root Files for the Datacard Maker & Storing the Results to the EOS WS Directory ############ "

for ((i = 0; i < 30; i++));
do
cp outdir_packaged_$YEAR/CMS-HGG_sigfit_packaged_$YEAR\_AC_Bin$i.root Trees/Opt_$YEAR/$InputWSDirPath/Results/Models/signal/CMS-HGG_sigfit_packaged_AC_Bin$i\_$YEAR.root
done

echo " ############### Moving output ############## "


# Check if the destination directory exists                                                                                      
if [ -d Trees/Opt_$YEAR/$InputWSDirPath/Signal_Output/outdir_$YEAR ]; then
    # If it exists, remove it                                                                                                    
    rm -rf Trees/Opt_$YEAR/$InputWSDirPath/Signal_Output/outdir_$YEAR
fi

cp -rf outdir_$YEAR Trees/Opt_$YEAR/$InputWSDirPath/Signal_Output/


# Check if the destination directory exists                                                                                     

if [ -d Trees/Opt_$YEAR/$InputWSDirPath/Signal_Output/outdir_packaged_$YEAR ]; then
    # If it exists, remove it                                                                                                    
    rm -rf Trees/Opt_$YEAR/$InputWSDirPath/Signal_Output/outdir_packaged_$YEAR
fi

cp -rf outdir_packaged_$YEAR Trees/Opt_$YEAR/$InputWSDirPath/Signal_Output/outdir/

cp -rf config_sig_*_$YEAR.py Trees/Opt_$YEAR/$InputWSDirPath/Signal_Output/

echo " ########### End ############## "






