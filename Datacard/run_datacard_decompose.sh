for i in {0..29}; do
    combineCards.py Datacard_RunII.txt --ic=AC_Bin$i > Datacard_RunII_Bin$i.txt
done
