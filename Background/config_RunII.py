# Config file: options for signal fitting                


backgroundScriptCfg = {

  # Setup                                                                                                                         
  'inputWSDir':'Trees/Opt_RunII/RunII/Trees2WS_RunII/ws', # location of 'allData.root' file 
  'ext':'RunII', # extension to add to output directory                                                                         
  'cats':'auto', # auto: automatically inferred from input ws                                                                     
  'catOffset':0, # add offset to category numbers (useful for categories from different allData.root files)                       
  'year':'combined', # Use combined when merging all years in category (for plots)                                                

  # Job submission options                                                                                                        
  'batch':'condor', # [condor,SGE,IC,local]                                                                                        
  'queue':'longlunch' # for condor e.g. microcentury for local e.g. hep.q                                                                  
  #'batch':'local', # [condor,SGE,IC,local]                                                                                                   
  #'queue':'hep.q' # for condor e.g. microcentury               

}
