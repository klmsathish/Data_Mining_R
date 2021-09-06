# Installing Packages
install.packages("gmodels")

# Loading Packages
library(gmodels)

# Reading data
df_sharks <- read.csv("Day - 2/Data/sharks.csv")

# Crosstable for comparison of two columns
cross_name_length <- CrossTable(df_sharks$COMMON.NAME,df_sharks$LENGTH..m.)

# Exporting crosstable into  csv
write.csv(cross_name_length,"Day - 2/Data/crosstable_commonname_length.csv")


