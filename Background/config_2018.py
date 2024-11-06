# Config file: options for signal fitting

backgroundScriptCfg = {
  
  # Setup
  'inputWSDir':'/afs/cern.ch/user/j/jhossain/eos/Hgg_AC_analysis/Analysis_2024/Categorization/3D_Cat_DCP/Opt_2018/3D_DCP_CPodd_p25_Bkg_p85/Trees_2018/ws', # location of 'allData.root' file
  'cats':'auto', # auto: automatically inferred from input ws
  'catOffset':0, # add offset to category numbers (useful for categories from different allData.root files)  
  'ext':'2018', # extension to add to output directory
  'year':'2018', # Use combined when merging all years in category (for plots)

  # Job submission options
  #'batch':'local', # [condor,SGE,IC,local]
  #'queue':'hep.q' # for condor e.g. microcentury

  'batch':'condor', # [condor,SGE,IC,local]                                                                                                                                
  'queue':'longlunch' # for condor e.g. microcentury 


}
