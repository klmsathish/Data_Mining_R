## levenshtein Distance

# Importing Package
library(stringdist)

# Comparing two words
stringdist("party","part",method="lv")

stringdist("Data Analytics","Science",method="lv")


# Dataframes
df <- data.frame(string1 = c('Sathish','Fail','Win'),
                 String2 = c('Data Scientist','Pass','Wint'))

# Adding levenshtein distance for all down
df$len_dist <- stringdist(df$string1,df$String2,method = "lv")

# Updated df
df