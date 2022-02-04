
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
data_factor <- read_excel("/Users/sawyerbenson/Documents/Master Thesis/Thesis_Github/Models/Data/Data_Factor/data_factor.xlsx")
attach(data_factor)

data_factor <- drop_na(data_factor) # Drop Na Values

# Removing Outliers

# log(sold_price)
x <- log(data_factor$sold_price)

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

# photo_count
x <- data_factor$photo_count

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

# living_area
x <- data_factor$living_area

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

# total_area
x <- data_factor$total_area

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

# age
x <- data_factor$age

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*3.5)
lower_limit = Q1 - (iqr*3.5)
data_factor <- subset(data_factor, (x <= upper_limit))

# days_on_market
x <- data_factor$days_on_market

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= upper_limit) & (x >= lower_limit))

# stories
x <- data_factor$stories

Q1 <- quantile(x, probs=.25)
Q3 <- quantile(x, probs=.75)
iqr = Q3-Q1
upper_limit = Q3 + (iqr*1.5)
lower_limit = Q1 - (iqr*1.5)
data_factor <- subset(data_factor, (x <= 14) & (x >= 0))

# beds_total
# - Adjusted in Excel

# bath_full
# - Adjusted in Excel

# bath_half
# - Adjusted in Excel

#Consistency Check after outlier removal
table(data_factor$post_corona_bi)

str(data_factor)
# Structure Change
data_factor$property_type <- as.factor(data_factor$property_type)
data_factor$air_conditioning <- as.factor(data_factor$air_conditioning)
data_factor$appartment_bi <- as.factor(data_factor$appartment_bi)
data_factor$patio_bi <- as.factor(data_factor$patio_bi)
data_factor$school_general <- as.factor(data_factor$school_general)
data_factor$pool_bi <- as.factor(data_factor$pool_bi)
data_factor$rear_yard_access_bi <- as.factor(data_factor$rear_yard_access_bi)
data_factor$roof_type <- as.factor(data_factor$roof_type)
data_factor$gas_type <- as.factor(data_factor$gas_type)
data_factor$out_building_livable_bi <- as.factor(data_factor$out_building_livable_bi)
data_factor$out_building_not_livable_bi <- as.factor(data_factor$out_building_not_livable_bi)
data_factor$appliances_included_bi <- as.factor(data_factor$appliances_included_bi)
data_factor$garage_bi <- as.factor(data_factor$garage_bi)
data_factor$condition <- as.factor(data_factor$condition)
data_factor$energy_efficient_bi <- as.factor(data_factor$energy_efficient_bi)
data_factor$exterior_type <- as.factor(data_factor$exterior_type)
data_factor$exterior_features <- as.factor(data_factor$exterior_features)
data_factor$fire_place_bi <- as.factor(data_factor$fire_place_bi)
data_factor$foundation_type <- as.factor(data_factor$foundation_type)
data_factor$beds_total <- as.factor(data_factor$beds_total)
data_factor$bath_full <- as.factor(data_factor$bath_full)
data_factor$bath_half <- as.factor(data_factor$bath_half)
data_factor$sewer_type <- as.factor(data_factor$sewer_type)
data_factor$spa_location <- as.factor(data_factor$spa_location)
data_factor$stories <- as.factor(data_factor$stories)
data_factor$property_style <- as.factor(data_factor$property_style)
data_factor$city_limit_bi <- as.factor(data_factor$city_limit_bi)
data_factor$subdivision_bi <- as.factor(data_factor$subdivision_bi)
data_factor$termite_contract2 <- as.factor(data_factor$termite_contract2)
data_factor$water_type <- as.factor(data_factor$water_type )
data_factor$waterfront_bi <- as.factor(data_factor$waterfront_bi)
str(data_factor)

# Splits
data_factor$post_corona_bi <- as.factor(data_factor$post_corona_bi)
data_factor$top25_living_area <- as.factor(data_factor$top25_living_area)
data_factor$top50_living_area <- as.factor(data_factor$top50_living_area)
data_factor$bottom25_living_area  <- as.factor(data_factor$bottom25_living_area )
data_factor$bottom50_living_area <- as.factor(data_factor$bottom50_living_area)
data_factor$top25_total_area <- as.factor(data_factor$top25_total_area)
data_factor$top50_total_area <- as.factor(data_factor$top50_total_area)
data_factor$bottom25_total_area <- as.factor(data_factor$bottom25_total_area)
data_factor$bottom50_total_area <- as.factor(data_factor$bottom50_total_area)
data_factor$top25_beds_total <- as.factor(data_factor$top25_beds_total)
data_factor$top50_beds_total <- as.factor(data_factor$top50_beds_total)
data_factor$bottom25_beds_total <- as.factor(data_factor$bottom25_beds_total)
data_factor$bottom50_beds_total <- as.factor(data_factor$bottom50_beds_total)
data_factor$top25_sold_price <- as.factor(data_factor$top25_sold_price)
data_factor$top50_sold_price <- as.factor(data_factor$top50_sold_price)
data_factor$bottom25_sold_price <- as.factor(data_factor$bottom25_sold_price)
data_factor$bottom50_sold_price <- as.factor(data_factor$bottom50_sold_price)
data_factor$top25_dom <- as.factor(data_factor$top25_dom)
data_factor$top50_dom <- as.factor(data_factor$top50_dom)
data_factor$bottom25_dom <- as.factor(data_factor$bottom25_dom)
data_factor$bottom50_dom <- as.factor(data_factor$bottom50_dom)
data_factor$top25_age <- as.factor(data_factor$top25_age)
data_factor$top50_age <- as.factor(data_factor$top50_age)
data_factor$bottom25_age <- as.factor(data_factor$bottom25_age)
data_factor$bottom50_age <- as.factor(data_factor$bottom50_age)
str(data_factor)



# Save cleaned binary data set
write_xlsx(x = data_factor, path = "data_factor_clean.xlsx", col_names = TRUE)

# Test Import and attach
data_factor_clean <- read_excel("/Users/sawyerbenson/Documents/Master Thesis/Github_Thesis_SMB/Models/Data/Data gbm/data_factor_clean.xlsx")
attach("data_factor_clean")
str(data_factor_clean)
View(data_factor_clean)



