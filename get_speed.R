library(jsonlite)
library(stringr)
library(tidyr)

d = fromJSON("data/full_data.json", flatten = TRUE)

years = as.character(2007:2019)
event = "SPEED"

speed_data = data.frame()
for(y in years){
  
  # all events for a year
  evnt = d[[y]]$events
  
  # for each event
  for(e in seq_along(evnt)){
    ev = evnt[[e]]
    # for each category
    for(cat in seq_along(ev$categories)){
      
      if(str_detect(names(ev$results)[cat], pattern = event)){
        print("SPEED")
        evnt_results = ev$results[[cat]]
        
        speed_data = rbind(speed_data, evnt_results)
      }  
    }
  }
}

# reformat results to only have columsn for the round_id roun name and score
# *ignore things like speed_elimination_rounds*
for(i in 1:nrow(speed_data)){
  r = speed_data$rounds[i]
  
}

# convert to a row per run, rather than per athlete
speed_dataflat = unnest(speed_data, "rounds")

