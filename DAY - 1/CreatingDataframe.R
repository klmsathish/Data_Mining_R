
# Question
# https://ibb.co/PjR9PCd

# Vectors Creation
age <- c(45,89,23)
marital_status <- c("Married","Unmarried","Divorce")
quality <- c("Excellent","Good","Poor")
Time_spent <- c(100,80,60)
num_of_people <- c(2,6,3)
type_of_people <- c("Friends","Alone","Others") 

# Creating the dataframe
df <- data.frame(age,marital_status,quality,Time_spent,num_of_people,type_of_people)

# writing df into csv file
write.csv(df,"Day - 1/Data/Survey.csv",row.names = FALSE)
