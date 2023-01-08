          ##LIBRARIES#
install.packages("car")
library(dplyr)
library(ggplot2)
library(tidyverse)
library(tidyr)
library(Hmisc)
library(corrplot)
library(car)

            
          ##DATA CLEANING##
          
#loading data
df_covid<-read.csv("owid-covid-data-4.csv", header = TRUE) 

#selecting G20 countries
df_g20<-filter(df_covid, location %in% c("Argentina", "Australia","Brazil","Canada","China","France",
                                         "Germany","India","Indonesia","Italy","Japan","South Korea",
                                         "Mexico","Russia","Saudi Arabia","South Africa","Turkey",
                                         "United Kingdom","United States","Austria","Belgium","Bulgaria",
                                         "Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France",
                                         "Germany","Greece","Hungary","Ireland","Italy","Latvia",
                                         "Lithuania","Luxembourg","Malta","Netherlands","Poland",
                                         "Portugal","Romania","Slovakia","Slovenia","Spain","Sweden"))


#Getting largest value for Total Deaths for each country
df_g20_1<-df_g20 %>% group_by(location) %>% arrange(desc(total_deaths)) %>% filter(row_number()==1)

#Selecting variables that are relevant for the study
 df_g20_2<-select(df_g20_1,location,total_cases,total_deaths,population,median_age,
                     aged_65_older,gdp_per_capita,cardiovasc_death_rate,diabetes_prevalence,
                     female_smokers,male_smokers,hospital_beds_per_thousand,
                     life_expectancy,human_development_index) 
 
 
 
view(df_g20_2)


          ##EXPLORATORY DATA ANALYSIS##

describe(df_g20_2)

boxplot(df_g20_2$human_development_index)

outlier_points <- boxplot.stats(df_g20_2$human_development_index)$out
text(x = rep(1, length(outlier_points)), y = outlier_points, labels = outlier_points, pos = 3) #identify outliers

hdi <- filter(df_g20_2,human_development_index>0.718)
boxplot(hdi$human_development_index)
view(hdi)
cor_hdi <- hdi %>% group_by(total_deaths) %>% select(-location)
corrplot(cor(cor_hdi), tl.cex=0.8, method='number',number.cex = 0.9)


boxplot(df_g20_2$life_expectancy)
boxplot(df_g20_2$hospital_beds_per_thousand)
boxplot(df_g20_2$gdp_per_capita)
boxplot(df_g20_2$total_deaths)

plot(df_g20_22$total_deaths_per_million,df_g20_22$human_development_index)

plot(df_g20_2)

#shows class of all variables
str(df_g20_2)

#standard deviation of all variables
apply(df_g20_2,2,sd)

#to view correlation between all variables
cor_g20 <- df_g20_2 %>% group_by(total_deaths) %>% select(-location)


#creates correlation plot
corrplot(cor(cor_g20), tl.cex=0.8, method='number',number.cex = 0.9)

          ##ANALYSIS##



