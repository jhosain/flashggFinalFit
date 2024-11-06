#!/bin/sh/

echo "Input the path directory of your workspace : "
read InputWSDirPath

echo -n "Year : "
read year

echo -n "Number of Bin : "
read bin

###################                                                                                                                                                         
for ((i = 0 ; i < $bin; i++));
do
echo "############### Renaming Output Root Files for the Datacard Maker & Storing the Results to the EOS WS Directory #######"

cp outdir_$year/CMS-HGG_multipdf_AC_Bin$i.root  $InputWSDirPath/Results/Models/background/CMS-HGG_multipdf_AC_Bin$i\_$year.root

done

echo "###### Moving cofing & output fils to the WS directory #######"

mv -if outdir_$year $InputWSDirPath/Background_Output/

echo " ########### End ############## "
