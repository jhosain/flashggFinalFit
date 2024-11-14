import pandas, pickle
import glob
import re

yfiles = glob.glob("yields_2022-09-01_xsec/*.pkl")
df = pandas.concat([pandas.read_pickle(f) for f in yfiles])
with open("test.pkl","w") as fopkl: pickle.dump(df,fopkl)  


  
