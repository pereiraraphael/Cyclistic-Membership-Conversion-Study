#_______________________________________________________________________________
# Working with null and blank values
#_______________________________________________________________________________    
    # Testing again for blanks
      count_blank_dplyr(bike_rides_raw_df)
    
    # Filtering data set to exclude blank spaces
    station_no_blank_null_df <- bike_rides_raw_df %>% 
      filter(
        !is.na(start_station_id),
        start_station_id != "",
        !is.na(end_station_id),
        end_station_id != ""
      )
    
    # Testing again for blanks post cleaning 
      count_blank_dplyr(station_no_blank_null_df) # 427,254 rows left - 166,117 rows eliminated.

  
#_______________________________________________________________________________
# Working with duplicates in ride_id
#_______________________________________________________________________________ 
    # Testing again for duplicates
      count_duplicate_dplyr(station_no_blank_null_df, "ride_id")
    
    # Creating function to removing duplicates based on column_name
      remove_duplicates <- function(data, column_name) {
        if(!column_name %in% colnames(data)){
          stop(paste("Column ", column_name, " doest not exist in the dataframe."))
        }# Checking if the column exists in the data frame
        
        cleaned_data <- data %>% 
          distinct(across(all_of(column_name)), .keep_all = TRUE)# Use distinct to remove duplicates based on 'ride_id' and keep all columns
        
        return(cleaned_data)
      }
    
    # Eliminating duplicates and testing
      station_no_dup_df <- remove_duplicates(station_no_blank_null_df, "ride_id")
      
      count_duplicate_dplyr(station_no_dup_df, "ride_id") # 427250 rows left - 4 rows eliminated.  
  
 
#_______________________________________________________________________________
# Extras - New columns and sampling
#_______________________________________________________________________________   
   # Creating columns for the ride length(usage_time) and for the week day(day_of_week)
      bike_rides_cleaned_df <- station_no_dup_df %>% 
        mutate(
          usage_time = round(as.numeric(difftime(ended_at, started_at, units = "mins")),0), # Creates a new column for the ride length in minutes.
          day_of_week = wday(started_at, label = TRUE, abbr = FALSE) # Extract the day of the week  
        )
    
    # Saving my new dataframe as a CSV file in the project folder
      write.csv(bike_rides_cleaned_df, "C:/Users/Raphael Pereira/Documents/R projects/R cyclistic project capstone/cyclistic capstone/bike_rides_main_df.csv")
    
    # loading data stored in the project folder
      bike_rides_main_df <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic project capstone/cyclistic capstone/bike_rides_main_df.csv")
  