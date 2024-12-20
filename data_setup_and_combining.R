#_______________________________________________________________________________
# data_setup.R
#_______________________________________________________________________________
    # Loading essential packages
      install.packages("readxl")
      install.packages("dplyr")
      install.packages("writexl")
      install.packages("lubridate")
      install.packages("ggplot2")
      install.packages("leaflet")
      
      library(readxl)
      library(dplyr)
      library(writexl)
      library(lubridate)
      library(ggplot2)
      library(leaflet)
   
    # Setting the code language
      Sys.setlocale("LC_TIME", "en_US.UTF-8")
    
    # Configuring my code so results for large numbers won't show in scientific notation
      options(scipen = 999)
      
#_______________________________________________________________________________
# Raw data loading, merging and saving
#_______________________________________________________________________________
   
    # Loading my data(df stands for dataframe. This convention will be used to name databases from now on)
      df_112023 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202311-divvy-tripdata.csv")
      df_122023 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202312-divvy-tripdata.csv")
      df_012024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202401-divvy-tripdata.csv")
      df_022024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202402-divvy-tripdata.csv")
      df_032024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202403-divvy-tripdata.csv")
      df_042024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202404-divvy-tripdata.csv")
      df_052024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202405-divvy-tripdata.csv")
      df_062024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202406-divvy-tripdata.csv")
      df_072024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202407-divvy-tripdata.csv")
      df_082024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202408-divvy-tripdata.csv")
      df_092024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202409-divvy-tripdata.csv")
      df_102024 <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic database/csv_folder/202410-divvy-tripdata.csv")
    
    # Merging all the 12 months dataframes into one with 5,933,712 rows
      bike_rides_112023_102024_df <- bind_rows(df_112023, df_122023, df_012024, df_022024, df_032024, df_042024, df_052024, df_062024, df_072024, df_082024, df_092024, df_102024)
  
    # Sampling my data to make data manipulation faster. 
      bike_rides_sampled_df <- bike_rides_112023_102024_df %>% 
        slice_sample(n = 593371) # The function slice_sample will pick 10% of my rows randomly
      
    # Saving merged file for further use in data exploration
      write.csv(bike_rides_sampled_df, "C:/Users/Raphael Pereira/Documents/R projects/R cyclistic project capstone/cyclistic capstone/bike_rides_raw_df.csv")
      