# Cyclistic_repository
 This repository contains analysis and insights for the Cyclistic bike-share case study, part of the Google Data Analytics Certificate. It explores usage differences between casual riders and members, providing recommendations to boost memberships. Tools include RStudio for data cleaning, processing, and visualization.

 ---
title: "Google Data Analytics Capstone - Cyclistic, a bike share company"

author: "Raphael Pereira"

date: "2024-12-07"

output: html_document

---

# Introduction
<hr>

This is a capstone study case necessary to conclude the [**Google Data Analytics Professional Certificate**](https://www.coursera.org/professional-certificates/google-data-analytics) course on **Coursera**. Throughout this document, I will perform different analysis on the data provided by the fictional company **Cyclistic**, and respond some business questions. I will adopt as guideline for this project Google's standard data analysis steps:

* **Ask**
* **Prepare**
* **Process**
* **Analyse**
* **Share**
* **Act**

Although this project could be carried using different tools that would fill the same purpose, I opted for using two very versatile softwares for my analysis. I carried this project using excel an Rstudio.
<br>

### Useful information
<hr>

In order to check my entire code in R studio, you can access  objects: **(IMPLEMENT ON GITHUB)**

* [**data_setup.R**](data_setup_and_combining.R)
* [**data_exploration.R**](data_exploration.R)
* [**data_cleaning.R**](data_cleaning.R)
* [**data_analysis.R**](data_analysis.R)

## Study case and company background


### About Cyclistic

*Cyclistic bike-share* is a fictional bike share company launched in 2016 operating its services throughout Chicago Metropolitan Area in the state of Illinois. According with the initial data provided on the study case, the company has more than **5.800 tracked bicycles**, and has almost **700 stations** scattered across the city. 


Cyclistic clients have a preference for 2 wheel bikes, while only 8% of it's clients use bikes with any assistive options. 30% of the company's bike rides are used for communing purposes, and the majority of it is used for leisure.


The company's marketing states that they were very successful in their past with more flexible pricing-plans, implements options to do single-rides, have unlimited usage with daily passes or have unlimited usage with annual member passes.


It is important to notice that Cyclistic's finance analysts came to the conclusion that annual members were potentially more profitable than casual users, so the company decided to put some work into expanding it's members base by adopting new marketing strategies.


## Data analysis process

## 1. Ask
<hr>

Lily Moreno, the director of marketing, has decided that the company efforts will be towards converting casual users to members, and for that, she needs to understand why would somebody become a member and how could digital media affect future members. The following questions will be helpful and guide me on how to approach this study case:

  1. How do annual members and casual riders use Cyclistic bikes differently?
  2. Why would casual riders buy Cyclistic annual memberships?
  3. How can Cyclistic use digital media to influence casual riders to become members?
  
The question number one will be my main focus on this study, but elements important for the questions two and three will also be developed along the way.

### 1.1 Business task

The company aims to maximize the number of annual memberships to increase profitability. The marketing team will work on studying using habits and understanding how differently members and casual users ride in order to segment targeted marketing strategies to encourage casual users to sign up for the membership.

## 2. Prepare
<hr>

Data location: [divvy-data](https://divvy-tripdata.s3.amazonaws.com/index.html)<br>
License: [here](https://divvybikes.com/data-license-agreement)
 
#### Data location
All data used during this study and the license for non-profitable use can be found on the links above and complied with the Divvy data license agreement, ensuring no personally identifiable information was accessed or processed.This data was sourced from Divvy's public available trip data, which contains information on bike rides taken in the Chicago Metropolitan Area.

I chose to work with recent data, ranging from **November, 2023** to **October, 2024.**  This data was made available sectioned by months. 

The first step on my journey to analyze this case was to download all the files necessary. There are a total of 12 files, downloaded in a CSV(Comma separated Values) format, using a specific company naming convention that made easier to organize these files.

These data frames had a total of 13 columns each. See the data below to better understand the information I will be working with.:

![colnames](https://github.com/user-attachments/assets/d28758be-aa4b-4489-bf2a-477e44ab869e)

The raw data is not complete, although every ride has been registered in the period I'm studying, several rows came with wrong or missing information, duplicates and null values. This data frames will give me useful information about using habits over time and where Cyclistic service is more demanded. To start I will describe the process used to clean this data and start working with it effectively. 

## 3. Process
<hr>

 

To work with Cyclistic's data, I had to apply previous knowledge I acquired during the Google Data Analytics Professional Certificate. Excel and RStudio.

Excel was used for initial data exploration due to its ease of use for quick visualization and manipulation of small data sets. RStudio was selected for advanced data cleaning and statistical analysis making it easier to handle large data sets more efficiently.

* [**Excel**](https://www.microsoft.com/en-us/microsoft-365/excel) 
  * I used this tool to initially load my data, and store it in a CSV format that could be manitulated using Rstudio.
* [**R Studio**](https://posit.co/download/rstudio-desktop/) - 
  * This is Integrated Development Environment(IDE) made for the R language. I   where I processed all my data and transformed it into useful insights that will be discussed on this document. I used Rstudio to process all the cleaning in my data.

To clean the data mentioned, I will follow the next steps in order to make my data cleaner and more organized and reliable:

* Uploading and merging data
* Sampling data
* Checking data types
* Checking data for null values
* checking data for duplicates
* Checking for blank values

### 3.1 Data manipulation - Uploading and merging data

Scripts [here](data_setup_and_combining.R)(data_setup_and_combining.R)

The first step with my data set was to upload and combine the 12 tables provided into one readable file called bike_rides_112023_102024_df, portraying the subject(Bike rides), the period studied(11/2023 to 10/2024). Note: **df** stands for **data frame** and will be user constantly throughout my code. This step generated a data frame with 5,933,712 rows with individual rides each. 
  
### 3.2 Sampling data

Scripts [here](data_setup_and_combining.R)(data_setup_and_combining.R)

To make working with this data faster, due to hardware limitations, all the calculations from this point and beyond were done using **statistical inference.** For those who are not familiarized with this term, this is how the  [Meriam-Webster](https://www.merriam-webster.com/dictionary/statistical%20inference) Dictionary describes statistical inference:
  
  > *"The making of estimates concerning a population from information gathered from samples"*
  
Starting with the sample size, I used the sample calculator from [Qualtrics](https://www.qualtrics.com/blog/calculating-sample-size/) to determine what would be considered a safe sample size. Base on this calculator's metric, to achieve a confidence level above 99% in a population of 5933712 with less than 1% margin of error, we could work with any sample larger than 16,531. To be in a comfortable zone, I chose to use a sample size of  593,371, representing 10% of our total population.
  
### 3.3 Data exploration

Scripts [here](data_exploration.R)(data_exploration.R)

All the results for calculations on this section will be done by adjusting it by the population size, which is 10 times larger that our sample.

Before working with the data to draw conclusions, it is important to make sure the data set we have available is ROCCC(Reliable, Original, Comprehensive, Current and Cited).
  
  * Reliable: This data source is unbiased. It analyzes every ride the company had during a certain period of time. The data doesn't seem to be complete though
  * Original: This data is from the company itself, not relying on third party sources.
  * Comprehensive: Comprehensive data should contain all the data necessary to respond the company's proposed questions. This point will be determined throughout this study.
  * Current: The data we are working with is recent and updated data.
  * Cited: The sources for my data are mentioned in the study case and the data set is easily accessible.

Now that we know our data is reliable, original, current and cited, let's explore the data.
  
#### 3.3.1 Checking data types
  
The data used for this study was organized in 13 columns. The two following images are part of the same table, and will show us the name, data type and some rows for each column.
  
![glimpse_1](https://github.com/user-attachments/assets/60ccdb37-1bf9-48fa-babf-17c309e028ed)

  
Now the second part of our data frame:
  
![glimpse_2](https://github.com/user-attachments/assets/31884ba9-f830-4b62-91c7-6857fede6e27)


The columns ride_id, rideable_type, started_at, ended_at, start_station_name, end_station_name, member_casual and day_of_week had a ***character*** type, used to store textual data.
  
  The columns start_lat, start_lng, end_lat, end_lng have a ***dbl*** type, used to describe integer numbers.

#### 3.3.2 Checking data for null values
<br>

To make sure the data is complete, we used the function head to look for the presence of null values in any of our columns. The table bellow indicates that we have 748 null rows in our sample for the columns end_lat and end_lng.

  ![count_null](https://github.com/user-attachments/assets/93853372-56df-47ff-93b0-a666da95999b)
 
When we adjust this data to the population size, the columns **end_lat** and **end_lng** had 7480 rows with null values each, totaling 14960 nulls spotted. One of the things I realized is that many stations have multiple different coordinates, and a theory I will test is that some of the rows with null latitudes and longitudes, probable have other rows with the same station name and with the right coordinates. 

#### 3.3.3 Checking data for duplicates

Throughout the data, I also noticed we have some duplicated rows, they will be eliminated in the future to make the data more precise.

There is a total of 5 duplicates for the sample studied or 50 duplicates in the entire population of users.
  
#### 3.3.4 Checking for blank values
  
![count_blank](https://github.com/user-attachments/assets/a0c7e7a0-31cf-4017-a1ac-ae2cd9c2f085)

All these columns above had_id had more than 100,000 rolls with blank values each. many rows could have multiple columns with blank spaces.
  
#### 3.3.5 Checking for distinct rideable_type

The data returned 3 types of vehicles that Cyclistic's clients can use. 
  
![rideable_type](https://github.com/user-attachments/assets/8f458d45-35e6-4cfc-960c-bdc12d8f78da)

After inspecting and exploring the data, I noticed that **748 rows** with null coordinates need to be fixed, 5 duplicates need to be deleted as well and more than 400,000 cells has blank spaces that will be corrected.
  
### 3.4 Data cleaning

Scripts [here](data_cleaning.R)(data_cleaning.R)
  
#### 3.4.1 Null values and blank values

  As mentioned before, many stations names in the data frame had very close coordinates. To make sure we have a standard data regarding each station name location, I dropped all the stations with null values.
  
This fixed 748 end_lng and 748 end_lat the null values in the sample.

All the columns with blank values were also removed. After this step,Our data  had 427,250 rows left and 166,008 rows eliminated.
  
#### 3.4.2 duplicates

All the five duplicated rows were dropped from the data set, so they don't interfere in out analysis.
  
## 4. Analyze and Share
<hr>

Scripts [here](data_analysis.R)()

With the data cleaned and ready to be analyzed, I used R studios to test different hypothesis and draw conclusions about it.

I will check categories like:
* user demographics
* Ride behaviour( e.g., duration, frequency, times)
* Geographical insights(e.g., hotspots, station usage)
* Seasonal trends

This study tries to understand better the using habits of Cyclistic users.

### 4.1  - Measuring Cyclistic's user base post cleaning

Among Cyclistic users, there is a predominance of members(64%), but more than a third of it's clients are casual users(36%), showing a huge market that can be targeted by the marketing team.

![user_base_plot-1](https://github.com/user-attachments/assets/b81c7b87-d115-46bc-b348-c11a0dfc7b9b)

![count_of_users_df](https://github.com/user-attachments/assets/72c9edb1-be3e-4757-a003-f1cc4ef86495)


### 4.2  - What type of bikes/scooters user prefer?
  
This data was processed to validate my hypothesis that members would be more inclined to pick electric scooters. The data on the graph above did not support this hypothesis. It shows that 1,68% of the casual members use electric scooters to move around the town. We can also notice that 0,78% of the members use this same service. This tells me that casual users are more inclined to use electric scooters.

![user_base_per_rideable_df-1](https://github.com/user-attachments/assets/22e00dc0-ef1d-48e6-8dd4-a02eaa981450)


Summary of users:

* Casual users
  * Classic bike - 64%
  * Electric bike - 34.4%
  * Electric Scooter - 1,69%
  
* Members
  * Classic bike - 65,9%
  * Electric bike - 33,3%
  * Electric Scooter - 0,78%    

### 4.3  - What is the average usage time of these vehicles?
 
The average trip time of each ride was calculated and grouped that by user type to understand more about the user habits. The plot and table bellow suggests that our casual users tend to take either longer routes or to use the bikes for more time, with an average usage time peaking almost 27 minutes during july, what could be indicative of a more exploratory ride for leisure purposes, while members have a tendency for short rides and very objective paths, with the longest average usage time peak of 13,5 minutes, in June.

![avg_usage_time-1](https://github.com/user-attachments/assets/a36519d9-f717-454d-a5ea-04d574573f5b)


### 4.4  -   Hotspots for bike rides across the city

The heat map bellow will give us a general perspective of the most used stations in town. This map will have results for all the rides separated by user type(Member or casual). 

Larger circles indicate more activity per station. 

If you're using a web browser to open the original file in html format, this is an interactive map, you can rover your pointer over the circles to see how many rides started on that station. In addition to that, you can zoom in and zoom out the map to better investigate the data.


![Rplot - Both user types](https://github.com/user-attachments/assets/b1e15e1f-4b70-4666-93ca-32fad8aafac4)


The next map depicts the same information, but displaying only stations with high concentration of rides starting from(11000 rides or more - Already adjusted by sample size). We can see that casual users have more hot spots along the shoreline, with strong activity near the docs and ports area  of the town.  

This can be due to the abundant presence of tourists that might prefer to use the service as a quick and cheap way to leave the docks and roam across the town. The most used station was the one on Streeter Dr & Grand Avenue, with more than 48,730 rides. This station is located right next to a huge dock for cruise ships and several parks.

![Rplot - Casual Users](https://github.com/user-attachments/assets/cb52192d-5cf1-4aef-83eb-1b29d36a35a3)

Next, we can see the activity map for members, with a high concentration of rides near downtown, in areas with large presence of mass transit, which could indicate a possible integration between the bicycles from Ciclystic and mass transit like trains or buses in town. 

Two other location where the rides were very concentrated were near the University of Chicago area, inside the campus, near museums and parks and then near the University of Illinois, one of the largest universities in the state of Illinois. 

The University of Chicago had two stations with high usage:

* University Ave & 57th st with 17200 rides starting there
* Ellis Ave & 55th st with 13700 rides starting there

The university of Illinois had one station with high usage:

* State St & 33rd St with 13740 rides starting there

Other several stations with high usage are located inside and around the Chicago Loop area, a central business district home of large companies like United Airlines, Exelon, CNA Financial, Hyatt and Boeing. This area is also surrounded by an elevated train system, giving the "Loop" name to the area.

![Rplot - Members](https://github.com/user-attachments/assets/4948c9c6-11fe-4bf3-a495-02c58fecd123)


### 4.5  -  When is the client using the bike service?

This section will be split into 3 parts:

  * **Main hours of use**
  * **Week days of use**
  * **Year seasonality**
 
Biking habits can be influenced by a hand full of reasons like leisure, commuting, studying, working, changing health habits, among others. I separated a few more graphs that could help us understanding what influences how out users bike. The hours where this service is used the most could help us understanding more about our user and identifying possible habits that could influence on peak hours.

### 4.5.1 Peak hours for casual users and members

The first graph depicts peak hours for casual users. It show us very few activity on the late night hours, as well as low usage during peak hours between 7a.m. and 8a.m. Casual users tend to use more the bike service by the afternoon, after lunch time. This could be due to a mix of tourists and residents using the bikes for leisure.

![peak_hour_1-1](https://github.com/user-attachments/assets/4e7dfc52-f2fa-452e-a9e0-75283f2b4eb5)

Now notice that when we are doing the same analysis focused on members, the peak hours in the morning also have a drastic increase, indicating a higher activity for the service when people tend to go to work or school/university.

![peak_hour_2-1](https://github.com/user-attachments/assets/897ea2c8-21f7-4733-8c37-cbfd3259cad2)

### 4.5.2 On which days of the week we see more activity for the users?

Considering the average week, the graph shows that the casual users have a very diluted usage of the bikes service on the week days, with a noticeable increase on weekend. This could be indicative of weekend travelers or city residents that don't use the bike service for commuting, but use it for leisure on their days off.

At the same time, members have a heavy usage on the week-days, but that decreases over the weekends. My hypothesis is that this is, motivated by working habits. These are users that use the bikes to commute to work and back.
 
![peak_dak_of_week 1-1](https://github.com/user-attachments/assets/ea6b16c9-5dce-4ae7-98e2-5413676cc9cb)

### 4.5.3 Annual seasonality on bike usage

I also extracted from the database the annual seasonality for the bike services. This can help us understanding if factors like weather has a role on the number of rides. In order to do that, I will group the data of the last 12 months and inform the frequency of use per month.

![seasonality-1](https://github.com/user-attachments/assets/b5253c34-9d3c-432e-87cc-50ee5df34c1e)

The graph indicates a higher number of rides between May and October, and low usage during the early and late months of the year. This could be explained due to the drastic changes in temperature throughout the year.

Information about the temperature for the region of Chicago can be found on the National Weather Service website, with data collected by the National Oceanic and Atmospheric Administration [here](https://www.weather.gov/lot/ord_rfd_monthly_yearly_normals). This data show us a similar trend where the warmest months would align with the months with more bike rides.

### 4.5.4 Analysis Summary

#### User base overview
* Cyclistic's user base consists of 2,740,060 members(65%) and 1,532,440 casual users(35%), this numbers shows us a significant opportunity to convert casual users into members.
* Classic bikes are the most popular ride for casual users and members, being used by more than 63% of the users in each group.
* Casual users take longer rides, suggesting leisure and exploration, while members tend to use very short routes, optimal for commuting.
* Casual users prefer stations near the shoreline, parks, docks and tourist areas, while members concentrate their rides near downtown, universities, banks and mass transit hubs.
* Casual users peak usage is in the afternoon, post-lunch, while members have their peak usage on the regular commute hours, between 7-8 AM and at the end of the evening.
* There is a higher usage from May to October, aligning with warmer months, while activity drops during cold months, suggesting seasonal weather influence.

## 5. Act
 <hr>
 
The data acquired with this study case was very useful to me to develop suggestions on how to make this company more competitive, when it comes to number of members. To better understand how to implement any suggestions, first we need to visualize where are the main areas of opportunity for the company.

### 5.1 S.W.O.T analysis

![SWOT](https://github.com/user-attachments/assets/4252ce3b-cb72-4769-9735-7867c40e9472)

The company offers two very important pricing plans, one that is used by members, where they can ride Cyclist bikes throughout the whole year, and one plan where casual users can take the bike for the day. Although this is a proven business practice, it also exposes the fact that no other plans accommodate the year seasonality. Casual users also do not have enough reasons to subscribe to an annual pass if they usage during Winter is almost 14 times smaller than the usage during Summer.

The company has very strong assets, with a wide net of bike stations and a very large number of bikes, this alone makes the service very accessible in Chicago.

Although the company already leads the bike-share business in that city, the existence of a large number of casual users that are not member is a great opportunity to solidify its position in the market

### 5.2  - How can Cyclistic use digital media to infuence casual riders to become members?

We prepared a series of actions our company and marketing team could take in order to reach a large base of users and increase conversion rates from casual users to members. Please check the table below for a detailed version of these suggestions.

![4W1H capstone](https://github.com/user-attachments/assets/e0df8542-e8bd-41f9-886d-1af39c6dee95)

The analysis revealed clear distinctions between casual riders and members. Casual riders primarily use bikes for leisure during weekends and afternoons, while members use bikes for commuting during weekdays. These insights highlight the need for targeted marketing strategies that appeal to casual riders' motivations and usage patterns.
