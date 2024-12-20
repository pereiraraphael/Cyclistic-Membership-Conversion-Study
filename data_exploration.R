#_______________________________________________________________________________
# data exploration
#_______________________________________________________________________________
    # loading merged data for exploration
      bike_rides_raw_df <- read.csv("C:/Users/Raphael Pereira/Documents/R projects/R cyclistic project capstone/cyclistic capstone/bike_rides_raw_df.csv")
    
    # Checking data types of all columns(Generated 5933712 rows)
      glimpse(bike_rides_raw_df)
   
    # COunting user base
      df_count_of_users <- bike_rides_raw_df %>% 
        group_by(
          member_casual
        ) %>% 
        summarize(
          count = n() *10
        ) %>% 
        arrange(desc(count))
      
      View(df_count_of_users)
    
    # Counting all null values per column in my dataset
      count_nulls_dplyr <- function(data){
        data %>% 
          summarize(across(everything(), ~sum(is.na(.)))) 
      }
      
      View(count_nulls_dplyr(bike_rides_raw_df)) # Found 748 null values for end_lat and end_lng in our sample
    
    # Counting all duplicated values per column in my dataset
      count_duplicate_dplyr <- function(data, column_name){ 
        if(!column_name%in%colnames(data)){
          stop(paste("Column", column_name, "does not exist within this data frame."))
        } #Checking if this column exist in the data frame
        
        count_duplicated <- data %>% 
            summarize(duplicate_count = sum(duplicated(.data[[column_name]])))
        
        print(paste0("There are ", count_duplicated, " duplicates for the column ", column_name))
      }
      
      count_duplicate_dplyr(bike_rides_raw_df, "ride_id") #Found 5 duplicates for ride_id in our sample or 50 duplicates for the database)
      
    
    # Counting all blank values per column in my dataset
      count_blank_dplyr <- function(data){
        data %>% 
          summarize(across(everything(), ~sum(.=="")))
      }
      
      count_blank_dplyr(bike_rides_raw_df)
    
    
    # Listing distinct values in "rideable_type"(3 values found as expected)
      distinct(bike_rides_raw_df, rideable_type)
      