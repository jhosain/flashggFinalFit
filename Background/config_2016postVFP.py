# Config file: options for signal fitting                


backgroundScriptCfg = {

  # Setup                                                                                                                         
  'inputWSDir':'Trees/Opt_2016postVFP/2016PostVFP/Trees2WS_2016postVFP/ws', # location of 'allData.root' file 
  'ext':'2016postVFP', # extension to add to output directory                                                                         
  'cats':'auto', # auto: automatically inferred from input ws                                                                     
  'catOffset':0, # add offset to category numbers (useful for categories from different allData.root files)                       
  'year':'2016postVFP', # Use combined when merging all years in category (for plots)                                                

  # Job submission options                                                                                                        
  'batch':'condor', # [condor,SGE,IC,local]                                                                                        
  'queue':'espresso' # for condor e.g. microcentury for local e.g. hep.q                                                                  
  #'batch':'local', # [condor,SGE,IC,local]                                                                                                   
  #'queue':'hep.q' # for condor e.g. microcentury               

}
