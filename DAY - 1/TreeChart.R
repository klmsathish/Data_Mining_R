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


# Renaming the columns
colnames(df_country_quarterly) <-c("YEAR","QUARTER","COUNTRY_NAME","PASSENGERS_TO_INDIA","PASSENGERS_FROM_INDIA","FREIGHT_TO_INDIA","FREIGHT_FROM_INDIA")

# Renaming county name
df_country_quarterly$COUNTRY_NAME[df_country_quarterly$COUNTRY_NAME=="UNITED ARAB EMIRATES*"] <-"UNITED ARAB EMIRATES"

# Tree Chart
# Count of passengers - Top 20 countries in 2016
df_country_quarterly %>% filter(YEAR=="2016") %>% group_by(COUNTRY_NAME) %>% 
  summarise(Total = sum(PASSENGERS_TO_INDIA)) %>%
  arrange(desc(Total)) %>% top_n(n=20, Total) %>%
  hchart(type="treemap",hcaes(x=COUNTRY_NAME,value=Total,color=Total)) %>%
  hc_add_theme(hc_theme_google()) %>%
  hc_title(text="Top 20 Countries-Passengers to India 2016")
  scale_y_continuous(labels = comma) +
  labs(title="Quarter Wise Travellers -Foreign Flights",x="Quarter",y="Passengers") 
