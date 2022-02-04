
#  - This document imports, cleans, and creates new excel data sets 
#    to be later recalled in single-line form in other code


# Read in Packages
library(readxl) # Import excel data frames
library(ggplot2) # Graphs
library(gridExtra) # Organize graphs
library(dplyr) # data_factor wrangling
library(tidyr) # data_factor wrangling
library(tinytex) #for RMarkdown
library(openxlsx) #Export data frame into Excel
library(rio) #Export data frame into Excel
library(writexl)


# Import and attach data_factor set 
data_factor <- read_excel("/Users/sawyerbenson/Documents/Master Thesis/Thesis_Github/Models/Data/New Data/3. data_factor_cleaned.xlsx")
attach(data_factor)

data_factor <- drop_na(data_factor) # Drop Na Values

# Removing Outliers

# log(sold_price)


x <- data_factor$sold_price

Q1 <- quantile(x, probs=.25)
Q2 <- quantile(x, probs=.50)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

data_factor$top25_sold_price <- as.numeric(data_factor$sold_price >= Q3)
data_factor$top50_sold_price <- as.numeric(data_factor$sold_price >= Q2)
data_factor$bottom25_sold_price <- as.numeric(data_factor$sold_price <= Q1)


# photo_count
x <- data_factor$photo_count

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

# living_area
x <- data_factor$area_living

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

data_factor$top25_area_living <- as.numeric(data_factor$area_living >= Q3)
data_factor$bottom25_area_living <- as.numeric(data_factor$area_living <= Q1)

# total_area
x <- data_factor$area_total

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

# land_acres
x <- data_factor$land_acres

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

boxplot(land_acres)
boxplot(data_factor$land_acres)

# age
x <- data_factor$age

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*2.5)
lower_limit = Q1 - (iqr*3.5)
data_factor <- subset(data_factor, (x < upper_limit))

data_factor$top25_age <- as.numeric(data_factor$age >= Q3)
data_factor$bottom25_age <- as.numeric(data_factor$age <= Q1)

# days_on_market
x <- data_factor$dom

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

data_factor$top25_dom <- as.numeric(data_factor$dom >= Q3)
data_factor$bottom25_dom <- as.numeric(data_factor$dom <= Q1)

# beds_total
# - Adjusted in Excel

# bath_full
# - Adjusted in Excel

# bath_half
# - Adjusted in Excel

# Save cleaned binary data set
write_xlsx(x = data_factor, path = "3. data_factor_cleaned.xlsx", col_names = TRUE)


#end of code

