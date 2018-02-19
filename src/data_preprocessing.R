# Data Preprocessing

# Importing the dataset
dataSet = read.csv('Data.csv')

# Taking care of missing data
dataSet$Age = ifelse(is.na(dataSet$Age),
                     ave(dataSet$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataSet$Age)

dataSet$Salary = ifelse(is.na(dataSet$Salary),
                     ave(dataSet$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataSet$Salary)

# Encoding categorical data
dataSet$Country = factor(dataSet$Country, 
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))

dataSet$Purchased = factor(dataSet$Purchased, 
                         levels = c('No', 'Yes'),
                         labels = c(0, 1))

# Splitting the dataset into Training set and Testing set
# install.packages('caTools')
# library(caTools) to enable through scripting
set.seed(123)
split = sample.split(dataSet$Purchased, SplitRatio = 0.8)
training_set = subset(dataSet, split == TRUE)
testing_split = subset(dataSet, split == FALSE)

# Feature scalling
training_set[, 2:3] = scale(training_set[, 2:3])
testing_split[, 2:3] = scale(testing_split[, 2:3])

