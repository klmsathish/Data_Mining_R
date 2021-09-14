# Importing Packages
library(tidyverse)
library(ggplot2)

# Importing data
data <- read_delim("DAY - 4/Data/zipIncome.csv", delim = ',')
data

# Density Plot
v <- data %>% select(MeanEducation,MeanHouseholdIncome) #pick the variable 
summary(v)
ggplot(data = v, mapping = aes(x=MeanEducation)) + 
  geom_histogram(aes(y=..density..),fill="bisque",color="white",alpha=0.7) + 
  geom_density() +
  geom_rug() +
  labs(x='mean education per house') +
  theme_minimal()


#The summary shows the range[0,19]. The median education level per house is 12.43, 
#but very close to the mean. The frequency chart with a density curve shows a bell-shaped
#distribution with a dense area between 10 and 16

#Although density curve is informative, it can be too technical for users to read.
#Better way is binning values into discrete categories and plotting the count of each bin in bars.


#Defining breaks and cut a vector into bins
# set up cut-off values 
breaks <- c(0,2,4,6,8,10,12,14,16,18,20)
# specify interval/bin labels
tags <- c("[0-2)","[2-4)", "[4-6)", "[6-8)", "[8-10)", "[10-12)","[12-14)", "[14-16)","[16-18)", "[18-20)")
# bucketing values into bins
group_tags <- cut(v$MeanEducation, 
                  breaks=breaks, 
                  include.lowest=TRUE, 
                  right=FALSE, 
                  labels=tags)
summary(group_tags)
#group_tags is now a factor which maps each original education value into one of the eleven bins.
#Each value in bins indicates the interval a value falls into.
#The summary of group_tags lists the count in each bin

#cut by default outputs an unordered factor. To get an ordered factor rebuild the factor from 
#group_tags.

education_groups <- factor(group_tags,levels = labels,ordered = TRUE)
# inspect bins


# Hist Plot
ggplot(data = as_tibble(group_tags), mapping = aes(x=value)) + 
  geom_bar(fill="bisque",color="white",alpha=0.7) + 
  stat_count(geom="text", aes(label=sprintf("%.4f",..count../length(group_tags))), vjust=-0.5) +
  labs(x='mean education per house') +
  theme_minimal() 

#Define bucket intervals and give names. The new column tag from case_when is a character vector.
tags <- c("[0-2)","[2-4)", "[4-6)", "[6-8)", "[8-10)", "[10-12)","[12-14)", "[14-16)","[16-18)", "[18-20)")

v <- data %>% select(MeanEducation,MeanHouseholdIncome) #pick the variable

# Grouping
vgroup <- as_tibble(v) %>% 
  mutate(tag = case_when(
    MeanEducation < 2 ~ tags[1],
    MeanEducation >= 2 & MeanEducation < 4 ~ tags[2],
    MeanEducation >= 4 & MeanEducation < 6 ~ tags[3],
    MeanEducation >= 6 & MeanEducation < 8 ~ tags[4],
    MeanEducation >= 8 & MeanEducation < 10 ~ tags[5],
    MeanEducation >= 10 & MeanEducation < 12 ~ tags[6],
    MeanEducation >= 12 & MeanEducation < 14 ~ tags[7],
    MeanEducation >= 14 & MeanEducation < 16 ~ tags[8],
    MeanEducation >= 16 & MeanEducation < 18 ~ tags[9],
    MeanEducation >= 18 & MeanEducation < 20 ~ tags[10]
  ))

summary(vgroup)


#To make it a factor
vgroup$tag <- factor(vgroup$tag,
                     levels = tags,
                     ordered = FALSE)

summary(vgroup$tag)

# Box Plot
ggplot(data = vgroup, mapping = aes(x=tag,y=log10(MeanHouseholdIncome))) + 
  geom_jitter(aes(color='blue'),alpha=0.2) +
  geom_boxplot(fill="bisque",color="black",alpha=0.3) + 
  labs(x='mean education per house') +
  guides(color=FALSE) +
  theme_minimal() 

