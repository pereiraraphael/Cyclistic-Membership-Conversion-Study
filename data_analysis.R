g#_________________________________________________________
# Count of rides
#_________________________________________________________
    # Table - Count of rides per user type
      count_of_users_df <- bike_rides_main_df %>% 
        group_by(
          member_casual
        ) %>% 
        summarize(
          count = n() * 10
        ) %>% 
        arrange(desc(count))
      
     View(count_of_users_df)
    
    # Plot - Count of rides per user type
     count_of_users_plot <- ggplot(data = count_of_users_df, aes(x = member_casual, y = count, fill = member_casual)) + 
       geom_bar(stat = "identity", position = position_dodge(width = 0.8)) +
       scale_fill_manual(
         values = c("casual" = "#003f5c", "member" = "#ffa600")
       ) +
       labs(
         title = "Users count - Casual users vs member users",
         x = "User type",
         y = "Count",
         fill = "User type"
       ) +
       theme_minimal()
     
     count_of_users_plot
     
  
 
#_________________________________________________________
# Most used bike types per member type
#_________________________________________________________
    # Table - Count of rides per rideable_type
      count_of_trips_per_rideable_df <- bike_rides_main_df %>% 
        group_by(
          member_casual
        ) %>% 
        summarize(
          electric_bike = sum(rideable_type == "electric_bike"),
          classic_bike = sum(rideable_type == "classic_bike"),
          electric_scooter = sum(rideable_type == "electric_bike")
        )
      
      View(count_of_rides_per_rideable_df)
    
    # Table - Count of rides and percentage per rideable_type
      count_of_percentage_per_rideable_df <- bike_rides_main_df %>% 
        group_by(
          member_casual, rideable_type
        ) %>% 
        summarize(
          ride_count = n(),
          .groups = "drop"
        ) %>% 
        group_by(member_casual) %>% 
        mutate(
          percentage = round((ride_count / sum(ride_count)) * 100, 2)
        )
      
      View(count_of_percentage_per_rideable_df)
    
    # Plot - Count of rides per rideable_type
      Count_of_rides_per_rideable_plot  <- ggplot(data = count_of_percentage_per_rideable_df, aes(x = member_casual, y = ride_count, fill = rideable_type)) +
        geom_bar(stat = "identity") +
        scale_fill_manual(
          values = c(
            "classic_bike" = "#665191",
            "electric_bike" = "#d45087",
            "electric_scooter" = "#ff7c43"
          )
        ) +
        labs(
          title = "Vehicle preference per user type",
          x = "Type of user",
          y = "Number of rides"
        ) + 
        theme_minimal()
      
      Count_of_rides_per_rideable_plot
  
#_________________________________________________________
# Rides over time per member type
#_________________________________________________________
    # Average usage time
      mean_usage_time_df <- bike_rides_main_df %>% 
        group_by(member_casual) %>% 
        summarize(avg_usage_time = mean(usage_time))
      
      View(mean_usage_time_df)
      
    # Generating data frame(Month)
      rides_per_month_df <- bike_rides_main_df %>% 
        mutate(
          month = factor(
            format(
              as.POSIXct(started_at, format = "%Y-%m-%d %H:%M:%S"), "%B"
            ), #Extract the months from my data for each ride and
            levels = c(
              "January", "February", "March", "April", "May", "June",
              "July", "August", "September", "October", "November", "December"
            ) #Set in which order my data should be displayed by default
          )
        ) %>% 
        group_by(month, member_casual) %>% 
        summarize(
          ride_count = n(),
          .groups = "drop"
        ) %>% 
        mutate(
          pertentage = round((ride_count/sum(ride_count))*100,2)
        )
      
      View(rides_per_month_df)
    
    # Generating plot(Month)
      rides_per_month_plot <- ggplot(data = rides_per_month_df, aes(x = month, y = ride_count, group = member_casual, color = member_casual)) +
        geom_line(size = 1.2) + # Add lines with thickness 1.2
        labs(
          title = "Total Trips per month in this period",
          subtitle = "An analysis of rides over time per user type",
          x = "Month", # Axis title
          y = "Total Trips", # Axis title
          color = "User Type" # Legend title
        ) +
        scale_x_discrete(labels = c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")) + # Month labels
        scale_color_manual(values = c("#003f5c", "#ffa600")) +
        theme_minimal()  
      
      rides_per_month_plot
      
      
    
    # Generating data frame(Day of the week)
      rides_per_day_of_week_df <- bike_rides_main_df %>% 
        mutate(
          day_of_week = factor(
            day_of_week,
            levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
          )
        ) %>% 
        group_by(day_of_week, member_casual) %>% 
        summarize(
          ride_count = n(),
          .groups = "drop"
        ) %>% 
        mutate(percentage = round(ride_count / sum(ride_count)*100, 2))
      
      View(rides_per_day_of_week_df)
    
    # Generating plot(Day of the week)
      rides_per_day_of_week_plot <- ggplot(data = rides_per_day_of_week_df, aes(x = day_of_week, y = ride_count, group = member_casual, color = member_casual)) +
        geom_line(size = 1.5) + # Add lines with thickness 1.2
        labs(
          title = "Total Trips per day of the week",
          subtitle = "An analysis of rides over time per user type",
          x = "Month", # Axis title
          y = "Total Trips", # Axis title
          color = "User Type" # Legend title
        ) +
        scale_x_discrete(labels = c("sun", "mon", "tue", "wen", "thu", "fri", "sat")) +
        scale_y_continuous(limits = c(0, NA)) +
        scale_color_manual(values = c("#003f5c", "#ffa600")) +
        theme_minimal()
      
      rides_per_day_of_week_plot
    
    # Generating data frame(hourly)
      rides_per_hour_df <- function(user_type){
        bike_rides_main_df %>% 
          filter(member_casual == user_type) %>% 
          mutate(
            hour_of_day = hour(ymd_hms(started_at))
          ) %>% 
          group_by(hour_of_day) %>% 
          summarize(
            ride_count = n(),
            .groups = "drop"
          )
      }
      
      View(rides_per_hour_df("casual"))
    
    # Generating plot(hourly)
      rides_per_hour_plot <- function(user_type, color_code){
        ggplot(data = rides_per_hour_df(user_type), aes(x = as.numeric(hour_of_day), y = ride_count)) +
        geom_bar(
          stat = "identity",
          fill = color_code
        ) +
        labs(
          title = "Total Trips per day of the week",
          subtitle = "An analysis of rides over time per user type",
          x = "Hour of the day",
          y = "Ride count"
        ) +
        scale_x_continuous(breaks = 0:23) +
        theme_minimal()
      }
      
      rides_per_hour_plot("casual", c("#003f5c"))
      rides_per_hour_plot("member", c("#ffa600"))

#_________________________________________________________
# Ride duration per member type per month
#_________________________________________________________
  
  # Generating data frame
    avg_ride_duration_df <- bike_rides_main_df %>% 
        mutate(
          month = month(ymd_hms(started_at), label = TRUE, abbr = FALSE)
        ) %>% 
        group_by(
          month, 
          member_casual) %>%
        summarise(
          average_duration = round(mean(usage_time, na.rm = TRUE),2)
        )
    
    View(avg_ride_duration_df) 

  # Generating plot
    average_ride_duration_plot <- ggplot(data = avg_ride_duration_df, aes(x = month, y = average_duration, group = member_casual, color = member_casual)) +
        geom_line(
          size = 1.5,
          stat = "identity"
        ) +
        scale_x_discrete(labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")) +
        scale_y_continuous(limits = c(0, 30)) +
        scale_color_manual(values = c("#003f5c", "#ffa600")) +
        labs(
          Title = "Average usage time by user type per month",
          legend = "test"
        ) +
        theme_minimal()
    
    average_ride_duration_plot

  
#_________________________________________________________
# Leaflet maps - Covering usage frequency across the town
#_________________________________________________________
  
  # Generating dataframe for all stations (Both types of user)
    station_usage_df <- bike_rides_main_df %>% 
      group_by(
        start_station_name, 
        member_casual
      ) %>% 
      summarize(
        start_lat = mean(start_lat), # Makes latitud emore uniform. Before the same station had several diff lat
        start_lng = mean(start_lng ), # Makes longitude more uniform. 
        ride_count = n()*10,
        .groups = "drop"
      ) %>% 
      arrange(desc(ride_count)) %>% 
      mutate(
        station_tier = case_when(
          ride_count <= 199 ~ "E",
          ride_count > 199 & ride_count <= 1499 ~ "D",
          ride_count > 1499 & ride_count <= 4999 ~ "C",
          ride_count > 4999 & ride_count <= 10999 ~ "B",
          ride_count > 10999 ~ "A",
          TRUE ~ "N/A" #Default case if no condition it met
        )#Define a tier to the station depending on how many rides it had for members or casual users
      )
    
    View(station_usage_df)
  
  # generating leaflet for all stations (Both types of user)
    station_usage_leaflet <- leaflet(data = station_usage_df) %>% 
      addTiles() %>% 
      addCircleMarkers(
        ~start_lng, ~start_lat, #Longitude and latitude
        radius = ~ride_count^(1/4), # Radius on the market scaled by ride_count
        color = ~ifelse(member_casual == "casual", "#003f5c", "#ffa600"), # Color by user type
        fillOpacity = 0.7,
        popup = ~paste0(
          "Station: ", start_station_name, "<br>", 
          "Rides: ", ride_count
        ) 
      ) %>% #Create the popup that will appear then you hover the mouse over the circles
      addLegend(
        "bottomright",
        labels = c("Casual", "Member"),
        title = "User Type",
        colors = c("#003f5c", "#ffa600")
      ) # Creates the legend that will show up on the bottom corner of the map
    
    station_usage_leaflet
  
  
  # Generating dataframe for tier "A" stations(per user type)
    station_usage_tier_A_df <- function(user_type){ 
      station_usage_df %>% 
        filter(
          member_casual == user_type,
          station_tier == "A"
        )  
    }
    
    View(station_usage_tier_A_df("casual"))
    View(station_usage_tier_A_df("member"))
  
  # generating leaflet for Tier "A" stations (One type of user only)
    station_usage_tier_A_leaflet <- function(user_type, color){
      leaflet(data = station_usage_tier_A_df(user_type)) %>% 
        addTiles() %>% 
        addCircleMarkers(
          ~start_lng, ~start_lat, #Longitude and latitude
          radius = ~ride_count^(1/4), # Radius on the market scaled by ride_count
          color = color, # Color by user type
          fillOpacity = 0.9,
          popup = ~paste0(
            "Station: ", start_station_name, "<br>", 
            "Rides: ", ride_count
          ) 
        ) %>% #Create the popup that will appear then you hover the mouse over the circles
        addLegend(
          "bottomright",
          labels = user_type,
          title = "User Type",
          colors = color
        ) # Creates the legend that will show up on the bottom corner of the map
    }
    
    station_usage_tier_A_leaflet("casual", "#003f5c")
    station_usage_tier_A_leaflet("member", "#ffa600")

