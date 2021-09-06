# After analyzing covid 19 data,A data scientist claims the following insights

#1. People who die are older - Age column
#2. There is no effect on gender - gender Column

library(Hmisc)
df_covid <- read.csv("DAY - 1/Data/COVID19_line_list_data.csv")

View(df_covid)

dim(df_covid)

# Cleaning death variable
df_covid$death_dummy <- as.integer(df_covid$death !=0)
df_covid$death_dummy

# Death Rate
sum(df_covid$death_dummy)/nrow(df_covid)


# Claim 1
# Null hypothesis - There is effect on gender
# Alternate Hypothesis - There is no effect on gender

# Subsetting for each category
dead = subset(df_covid,death_dummy == 1)
dead

alive  = subset(df_covid,death_dummy == 0)
alive

# Average
mean(dead$age,na.rm = TRUE)
mean(alive$age,na.rm = TRUE)

#Is this claim statistically significant
t.test(alive$age,dead$age,alternative = "two.sided",conf.level = 0.99)

# here we reject the null hypothesis as p value is lesser than 0.05


# Claim 2
# Null hypothesis - People who die are not older
# Alternate Hypothesis - People who die are not older

# Subsetting for each category
men = subset(df_covid,gender == "male")
men
women = subset(df_covid,gender == "female")
women

# Average
mean(men$death_dummy,na.rm = TRUE)
mean(women$death_dummy,na.rm = TRUE)

#Is this claim statistically significant
t.test(men$death_dummy,women$death_dummy,alternative = "two.sided",conf.level = 0.99)

# here we reject the null hypothesis as p value is lesser than 0.05
