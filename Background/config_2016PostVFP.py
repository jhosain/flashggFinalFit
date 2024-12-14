# Config file: options for signal fitting                


backgroundScriptCfg = {

  # Setup                                                                                                                         
  'inputWSDir':'Trees/Opt_2016PostVFP/3D_DCP_CPodd_p25_Bkg_p60_2016PostVFP/Trees2WS_2016PostVFP/ws', # location of 'allData.root' file 
  'ext':'2016PostVFP', # extension to add to output directory                                                                         
  'cats':'auto', # auto: automatically inferred from input ws                                                                     
  'catOffset':0, # add offset to category numbers (useful for categories from different allData.root files)                       
  'year':'2016PostVFP', # Use combined when merging all years in category (for plots)                                                

  # Job submission options                                                                                                        
  'batch':'condor', # [condor,SGE,IC,local]                                                                                        
  'queue':'longlunch' # for condor e.g. microcentury for local e.g. hep.q                                                                                  

}
