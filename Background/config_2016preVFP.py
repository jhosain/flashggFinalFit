# Config file: options for signal fitting                


backgroundScriptCfg = {

  # Setup                                                                                                                         
  'inputWSDir':'Trees/Opt_2016preVFP/2016PreVFP/Trees2WS_2016preVFP/ws', # location of 'allData.root' file 
  'ext':'2016preVFP', # extension to add to output directory                                                                         
  'cats':'auto', # auto: automatically inferred from input ws                                                                     
  'catOffset':0, # add offset to category numbers (useful for categories from different allData.root files)                       
  'year':'2016preVFP', # Use combined when merging all years in category (for plots)                                                

  # Job submission options                                                                                                        
  'batch':'condor', # [condor,SGE,IC,local]                                                                                        
  'queue':'longlunch' # for condor e.g. microcentury for local e.g. hep.q                                                                  
  #'batch':'local', # [condor,SGE,IC,local]                                                                                                   
  #'queue':'hep.q' # for condor e.g. microcentury               

}
