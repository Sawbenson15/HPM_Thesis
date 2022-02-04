
#  - This document imports, cleans, and creates new excel data sets 
#    to be later recalled in single-line form in other code

library(readxl) # Import excel data frames
library(ggplot2) # Graphs
library(gridExtra) # Organize graphs
library(dplyr) # data_bi wrangling
library(tidyr) # data_bi wrangling
library(tinytex) #for RMarkdown
library(openxlsx) #Export data frame into Excel
library(rio) #Export data frame into Excel
library(writexl)


# Import and attach data_bi set 
data_bi <- read_excel("/Users/sawyerbenson/Documents/Master Thesis/Models/Data/data_bi_20.12.21.xlsx")
attach(data_bi)

data_bi <- drop_na(data_bi) # Drop Na Values
str(data_bi)

# Removing Outliers

# log(sold_price)
x <- log(data_bi$sold_price)

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_bi_no_outliers <- subset(data_bi, (x <= upper_limit) & (x >= lower_limit))

par(mfrow = c(1,2))
plot(data_bi$log(sold_price))
plot(data_bi_no_outliers$log(sold_price))

# photo_count
x <- data_bi_no_outliers$photo_count

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_bi_no_outliers <- subset(data_bi_no_outliers, (x <= upper_limit) & (x >= lower_limit))

par(mfrow = c(1,2))
plot(data_bi$photo_count)
plot(data_bi_no_outliers$photo_count)

# living_area
x <- data_bi_no_outliers$living_area

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_bi_no_outliers <- subset(data_bi_no_outliers, (x <= upper_limit) & (x >= lower_limit))

par(mfrow = c(1,2))
plot(data_bi$living_area)
plot(data_bi_no_outliers$living_area)

# total_area
x <- data_bi_no_outliers$total_area

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_bi_no_outliers <- subset(data_bi_no_outliers, (x <= upper_limit) & (x >= lower_limit))

par(mfrow = c(1, 2))
boxplot(data_bi$total_area)
boxplot(data_bi_no_outliers$total_area)

# land_acres
x <- data_bi_no_outliers$land_acres

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_bi_no_outliers <- subset(data_bi_no_outliers, (x <= upper_limit) & (x >= lower_limit))

par(mfrow = c(1, 2))
boxplot(data_bi$land_acres)
boxplot(data_bi_no_outliers$land_acres)

# age
x <- data_bi_no_outliers$age

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*3.5)
lower_limit = Q1 - (iqr*3.5)
data_bi_no_outliers <- subset(data_bi_no_outliers, (x <= upper_limit) & (x >= lower_limit))

par(mfrow = c(1, 2))
boxplot(data_bi$age)
boxplot(data_bi_no_outliers$age)

# days_on_market
x <- data_bi_no_outliers$days_on_market

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_bi_no_outliers <- subset(data_bi_no_outliers, (x <= upper_limit) & (x >= lower_limit))

par(mfrow = c(1, 2))
boxplot(data_bi$days_on_market)
boxplot(data_bi_no_outliers$days_on_market)

# stories
x <- data_bi_no_outliers$stories

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_bi_no_outliers <- subset(data_bi_no_outliers, (x <= 14) & (x >= 0))

par(mfrow = c(1, 2))
boxplot(data_bi$stories)
boxplot(data_bi_no_outliers$stories)

# beds_total
# - Adjusted in Excel

# bath_full
# - Adjusted in Excel

# bath_half
# - Adjusted in Excel


#Consistency Check after outlier removal
table(data_bi_no_outliers$post_corona_bi)





# Save cleaned binary data set
write_xlsx(x = data_bi_no_outliers, path = "data_bi_clean.xlsx", col_names = TRUE)

# Import and attach
data_bi_clean <- read_excel("Data/data_bi_clean_26.12.21.xlsx")
attach("data_bi_clean")

View(data_bi_clean)



