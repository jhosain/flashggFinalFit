# Config file: options for signal fitting                


backgroundScriptCfg = {

  # Setup                                                                                                                         
  'inputWSDir':'Trees/Opt_2018/3D_DCP_CPodd_p25_Bkg_p60/Trees2WS_2018/ws', # location of 'allData.root' file 
  'ext':'2018', # extension to add to output directory                                                                         
  'cats':'auto', # auto: automatically inferred from input ws                                                                     
  'catOffset':0, # add offset to category numbers (useful for categories from different allData.root files)                       
  'year':'2018', # Use combined when merging all years in category (for plots)                                                

  # Job submission options                                                                                                        
  'batch':'condor', # [condor,SGE,IC,local]                                                                                        
  'queue':'longlunch' # for condor e.g. microcentury for local e.g. hep.q                                                                                  

}
