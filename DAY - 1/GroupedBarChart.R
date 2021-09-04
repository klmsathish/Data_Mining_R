# Installing the Pacakges
#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("lubridate")
#install.packages("highcharter")
#install.packages("scales")


# Loading the Packages
library(dplyr)
library(tidyr)
library(ggplot2)
library(lubridate)
library(highcharter)
library(scales)



# Loading the datasets
df_airline_monthly = read.csv("Day - 1/Data/Airlinewise Monthly International Air Traffic To And From The Indian Territory.csv")
df_airline_monthly

df_country_quarterly = read.csv("Day - 1/Data/Countrywise Quarterly International Air Traffic To And From The Indian Territory.csv")
df_country_quarterly

df_city_quarterly = read.csv("Day - 1/Data/Citypairwise Quarterly International  Air Traffic To And From The Indian Territory.csv")
df_city_quarterly

# Viewing the dataframe
View(df_airline_monthly)

# Quarter Wise Travellers Domestic Flights
quarter_wise_domestic <-df_airline_monthly %>% 
                        filter(CARRIER.TYPE=="DOMESTIC") %>% 
                        group_by(YEAR,QUARTER) %>% 
                        summarise(Passengers_ToInd=sum(PASSENGERS.TO.INDIA),
                        Passengers_FromInd=sum(PASSENGERS.FROM.INDIA)) 

  gather(quarter_wise_domestic,key=Category,Total,3:4) %>%
  ggplot(aes(x=QUARTER,y=Total,fill=Category)) +
  geom_bar(stat="identity",position="dodge") +
  facet_wrap(~YEAR) +
  scale_y_continuous(labels = comma) +
  labs(title="Quarter Wise Travellers Domestic Flights",x="Quarter",y="Passengers") 

# Quarter Wise Travellers Foriegn Flights
quarter_wise_foreign <-df_airline_monthly %>% 
                      filter(CARRIER.TYPE=="FOREIGN") %>%
                      group_by(YEAR,QUARTER) %>%
                      summarise(Passengers_ToInd=sum(PASSENGERS.TO.INDIA),
                      Passengers_FromInd=sum(PASSENGERS.FROM.INDIA)) 
  gather(quarter_wise_domestic,key=Category,Total,3:4) %>%
  ggplot(aes(x=QUARTER,y=Total,fill=Category)) +
  geom_bar(stat="identity",position="dodge") +
  facet_wrap(~YEAR) +
  scale_y_continuous(labels = comma) +
  labs(title="Quarter Wise Travellers Domestic Flights",x="Quarter",y="Passengers") 

  
  