#!/bin/sh/

echo -n "Year : "
read year

echo -n "Name of the  directory of your workspace : "
read InputWSDirPath

#echo -n "Number of Bin : "
#read bin
bin=30

###################                                                                                                                                                         
for ((i = 0 ; i < $bin; i++));
do
echo "############### Renaming Output Root Files for the Datacard Maker & Storing the Results to the EOS WS Directory #######"

cp outdir_$year/CMS-HGG_multipdf_AC_Bin$i.root  Trees/Opt_$year/$InputWSDirPath/Results/Models/background/CMS-HGG_multipdf_AC_Bin$i\_$year.root

done

echo "###### Moving cofing & output fils to the WS directory #######"

if [ -d Trees/Opt_$year/$InputWSDirPath/Background_Output/outdir_$year ]; then
rm -rf Trees/Opt_$year/$InputWSDirPath/Background_Output/outdir_$year
mv -if outdir_$year Trees/Opt_$year/$InputWSDirPath/Background_Output/
fi

echo " ########### End ############## "
