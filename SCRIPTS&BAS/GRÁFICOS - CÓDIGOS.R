library(pacman)

pacman::p_load(
  rio,       # import/export
  here,      # filepaths
  lubridate, # working with dates
  plotly,    # interactive plots
  scales,    # quick percents
  tidyverse  # data management and visualization
) 

#rio package 

# import case linelist 
linelist <- import("linelist_cleaned.rds")
