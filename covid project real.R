#to download dataset
download.file('https://covid.ourworldindata.org/data/owid-covid-data.csv', destfile = 'owid-covid-data.csv')


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
asia<-filter(df_covid, continent=="Asia" )

view(asia)
#check unique values in location
unique(asia$location) 
#decription of asia dataset
describe(asia)
str(asia$date)
#change date variable from character to date format
asia$date<-as.Date(asia$date, "%Y-%m-%d")
print(unique(asia$location)) #shows all unique countries


#MAPS

#create subset for covid total deaths
covid_deaths <- asia %>% group_by(location) %>% arrange(desc(total_deaths)) %>% filter(row_number()==1) %>% 
  filter(!is.na(total_deaths))
#Rename location to region for joining with map data
colnames(covid_deaths)[colnames(covid_deaths)=="location"] <- "region"
view(covid_deaths)
hist(covid_deaths$total_deaths)
covid_deaths <- select(covid_deaths,region,total_deaths)

#creating a new column for taking logarithm of total deaths as the the data is highly skewed
covid_deaths$log_total_deaths <- log(covid_deaths$total_deaths)

mapdata <- map_data("world")
#using left join to join map and total deaths data set
mapdata <- left_join(mapdata,covid_deaths, by="region")
#filtering countries with na values for total deaths
mapdata1 <- mapdata %>% filter(!is.na(mapdata$total_deaths))

#creating a map
map1 <- ggplot(mapdata1, aes(x=long,y=lat,group=group))+   
  geom_polygon(aes(fill=log_total_deaths),color="black")+
  labs(title = "IMPACT OF COVID 19 ACROSS ASIA",x=NULL,y=NULL, subtitle = "Data as of 4th January 2023")
map1



#plots for ASIA continent

describe(covid_deaths)
#to see top 6 countries with most total deaths
total_deaths_order <- covid_deaths[order(covid_deaths$total_deaths, decreasing = TRUE), ] 

#plot the death vs time for those 6 countries
asia %>% 
  filter(location %in% c("India", "Indonesia", "Iran", "Turkey","Philippines","Japan")) %>% 
  ggplot(aes(date, total_deaths, col = `location`)) + 
  geom_line() +
  theme(legend.position = "bottom")+
  labs(title = "Trend of Total Deaths Across Six Countries Affected The Most In Asia",x="Date",y="Total Deaths")


asia %>% 
  filter(location %in% c("India", "Indonesia", "Iran", "Turkey","Philippines","Japan")) %>% 
  ggplot(aes(date, people_fully_vaccinated_per_hundred, col = `location`)) + 
  geom_line() +
  theme(legend.position = "bottom")+
  labs(title = "Trend of Vaccination Across Six Countries Affected The Most In Asia",x="Date",y="Percentage Fully Vaccinated")

asia %>% 
  filter(location %in% c("India", "Indonesia", "Iran", "Turkey","Philippines","Japan")) %>% 
  ggplot(aes(date, stringency_index, col = `location`)) + 
  geom_line() +
  theme(legend.position = "bottom")+
  labs(title = "Trend of Stringency Index Across Six Most Affected Countries in Asia",x="Date",y="Stringency Index")



india <- filter(asia, location=="India")
view(india)
plot(india$date,                              # Draw first time series
     india$new_cases_smoothed_per_million,
     type = "l",
     col = 2,
     ylim = c(0, 300),
     main = "INDIA",
     xlab = "Year",
     ylab = "Values")
lines(india$date,                             # Draw second time series
      india$stringency_index,
      type = "l",
      col = 3)
legend("topright",                            # Add legend to plot
       c("New Cases per Million","Stringency Index"),
       lty = 1,
       col = 2:4)

indonesia <- filter(asia,location=="Indonesia")
plot(indonesia$date,                              # Draw first time series
     indonesia$new_cases_smoothed_per_million,
     type = "l",
     col = 2,
     ylim = c(0, 300),
     main = "INDONESIA",
     xlab = "Year",
     ylab = "Values")
lines(indonesia$date,                             # Draw second time series
      indonesia$stringency_index,
      type = "l",
      col = 3)
legend("topright",                            # Add legend to plot
       c("New Cases per Million","Stringency Index"),
       lty = 1,
       col = 2:4)

iran <- filter(asia,location=="Iran")
plot(iran$date,                              # Draw first time series
     iran$new_cases_smoothed_per_million,
     type = "l",
     col = 2,
     ylim = c(0, 500),
     main = "IRAN",
     xlab = "Year",
     ylab = "Values")
lines(iran$date,                             # Draw second time series
      iran$stringency_index,
      type = "l",
      col = 3)
legend("topright",                            # Add legend to plot
       c("New Cases per Million","Stringency Index"),
       lty = 1,
       col = 2:4)


turkey <- filter(asia,location=="Turkey")
plot(turkey$date,                              # Draw first time series
     turkey$new_cases_smoothed_per_million,
     type = "l",
     col = 2,
     ylim = c(0, 1500),
     main = "TURKEY",
     xlab = "Year",
     ylab = "Values")
lines(turkey$date,                             # Draw second time series
      turkey$stringency_index,
      type = "l",
      col = 3)
legend("topright",                            # Add legend to plot
       c("New Cases per Million","Stringency Index"),
       lty = 1,
       col = 2:4)


philippines <- filter(asia,location=="Philippines")
plot(philippines$date,                              # Draw first time series
     philippines$new_cases_smoothed_per_million,
     type = "l",
     col = 2,
     ylim = c(0, 400),
     main = "PHILIPPINES",
     xlab = "Year",
     ylab = "Values")
lines(philippines$date,                             # Draw second time series
      philippines$stringency_index,
      type = "l",
      col = 3)
legend("topright",                            # Add legend to plot
       c("New Cases per Million","Stringency Index"),
       lty = 1,
       col = 2:4)


japan <- filter(asia,location=="Japan")
plot(japan$date,                              # Draw first time series
     japan$new_cases_smoothed_per_million,
     type = "l",
     col = 2,
     ylim = c(0, 2500),
     main = "JAPAN",
     xlab = "Year",
     ylab = "Values")
lines(japan$date,                             # Draw second time series
      japan$stringency_index,
      type = "l",
      col = 3)
legend("topright",                            # Add legend to plot
       c("New Cases per Million","Stringency Index"),
       lty = 1,
       col = 2:4)

#finding mean Strigency Index
mean(india$stringency_index,na.rm = TRUE)
mean(indonesia$stringency_index,na.rm = TRUE)
mean(turkey$stringency_index,na.rm = TRUE)
mean(philippines$stringency_index,na.rm = TRUE)
mean(iran$stringency_index,na.rm = TRUE)
mean(japan$stringency_index,na.rm = TRUE)





#~~~~~~~~~#
#ANALYSIS#
#~~~~~~~~#
asia2 <- select(asia,location,total_cases,total_deaths,population,gdp_per_capita,
                cardiovasc_death_rate,diabetes_prevalence,female_smokers,male_smokers,
                hospital_beds_per_thousand,life_expectancy,human_development_index)

asia3<-asia2 %>% group_by(location) %>% arrange(desc(total_deaths)) %>% filter(row_number()==1)
asia4<-asia %>% group_by(location) %>% summarise(total_deaths_per_million=max(total_deaths_per_million,na.rm = TRUE),
                                                  stringency_index=mean(stringency_index,na.rm=TRUE))
asia_analysis <- left_join(asia3,asia4, by="location") 

asia_analysis[asia_analysis==-Inf] <- NA
asia_analysis[asia_analysis=="NaN"] <- NA

#check for NA values 
which(is.na(asia_analysis$total_cases)) #shows Northern Cyprus and Turkmenistan has NA values
which(is.na(asia_analysis$total_deaths))# Northern Cyprus and Turkmenistan NA
which(is.na(asia_analysis$gdp_per_capita))#Taiwan, Syria, North Korea, Northern Cyprus NA
which(is.na(asia_analysis$stringency_index))#North Korea, N.Cyprus, Turkmenistan NA
which(is.na(asia_analysis$human_development_index)) #Taiwan,Macao, N.Korea, N.Cyprus NA
which(is.na(asia_analysis$cardiovasc_death_rate))#Hong kong, Macao, N.Cyprus
which(is.na(asia_analysis$diabetes_prevalence))#Hong Kong, N.Korea, N.Cyprus, Syria

#decision= to remove N.Korea, N.Cyprus, Turkmenistan, Taiwan, Macao, Hong Kong due to pausity of data

asia_analysis1 <- filter(asia_analysis, location!=c("Northern Cyprus"))
asia_analysis1 <- filter(asia_analysis1,location!=c("North Korea"))
asia_analysis1 <- filter(asia_analysis1,location!=c("Turkmenistan"))
asia_analysis1 <- filter(asia_analysis1,location!=c("Taiwan"))
asia_analysis1 <- filter(asia_analysis1,location!=c("Macao"))
asia_analysis1 <- filter(asia_analysis1,location!=c("Hong Kong"))
asia_analysis1 <- filter(asia_analysis1,location!=c("China"))

which(is.na(asia_analysis1$female_smokers))
which(is.na(asia_analysis1$hospital_beds_per_thousand))
which(is.na(asia_analysis1$stringency_index))

#need to replace NA values with mean values

#finding mean
mean_SI<-mean(asia_analysis1$stringency_index,na.rm= TRUE)
mean_gdp<-mean(asia_analysis1$gdp_per_capita,na.rm= TRUE)
mean_fem_smoke<-mean(asia_analysis1$female_smokers,na.rm= TRUE)
mean_male_smoke<-mean(asia_analysis1$male_smokers,na.rm= TRUE)
mean_diabetes<-mean(asia_analysis1$diabetes_prevalence,na.rm= TRUE)
mean_hosp_beds<-mean(asia_analysis1$hospital_beds_per_thousand,na.rm= TRUE)

#replacing NA with mean
asia_analysis1$gdp_per_capita[is.na(asia_analysis1$gdp_per_capita)] <- mean_gdp
asia_analysis1$diabetes_prevalence[is.na(asia_analysis1$diabetes_prevalence)] <- mean_diabetes
asia_analysis1$female_smokers[is.na(asia_analysis1$female_smokers)] <- mean_fem_smoke
asia_analysis1$male_smokers[is.na(asia_analysis1$male_smokers)] <- mean_male_smoke
asia_analysis1$hospital_beds_per_thousand[is.na(asia_analysis1$hospital_beds_per_thousand)] <- mean_hosp_beds
asia_analysis1$stringency_index[is.na(asia_analysis1$stringency_index)]<- mean_SI


hist(asia_analysis1$total_deaths) #right skewed data
hist(asia_analysis1$total_deaths_per_million) #right skewed
hist(asia_analysis1$gdp_per_capita)#right skewed
hist(asia_analysis1$cardiovasc_death_rate)# slight skew
hist(asia_analysis1$diabetes_prevalence)#slight skew
hist(asia_analysis1$female_smokers)#right skew
hist(asia_analysis1$male_smokers)#only slight skew
hist(asia_analysis1$hospital_beds_per_thousand)#right skew
hist(asia_analysis1$life_expectancy)#slight skew
hist(asia_analysis1$human_development_index)#slight left skew
hist(asia_analysis1$stringency_index)#slight left skew

#log transformations on variables
asia_analysis1$log_total_deaths <- log(asia_analysis1$total_deaths)
asia_analysis1$log_total_deaths_per_million <- log(asia_analysis1$total_deaths_per_million)
asia_analysis1$log_gdp_per_capita <- log(asia_analysis1$gdp_per_capita)
asia_analysis1$log_female_smokers <- log(asia_analysis1$female_smokers)
asia_analysis1$log_hospital_beds_per_thousand <- log(asia_analysis1$hospital_beds_per_thousand)
asia_analysis1$log_human_development_index<- log(asia_analysis1$human_development_index)

hist(asia_analysis1$log_female_smokers)
hist(asia_analysis1$log_total_deaths)


######CORRELATIONS TEST######

#viewing correlations for log values
cor_asia <- asia_analysis1 %>% group_by(total_deaths) %>% select(-location,-total_cases,-total_deaths_per_million,
                                                                 -gdp_per_capita,-female_smokers,-hospital_beds_per_thousand,
                                                                 -human_development_index)
#viewing correlations for actual values
cor_asia1 <- asia_analysis1 %>% group_by(total_deaths) %>% select(-location,-total_cases,-log_total_deaths_per_million,
                                                                 -log_gdp_per_capita,-female_smokers,-log_hospital_beds_per_thousand,
                                                                 -log_human_development_index)

corrplot(cor(cor_asia), tl.cex=0.8, method='number',number.cex = 0.9)

#correlation plot for Pearson correlation
corrplot(cor(cor_asia1), tl.cex=0.8, method='number',number.cex = 0.9)

#correlation plot for Spearman correlation
corrplot(cor(cor_asia1, method = "spearman"), tl.cex=0.8, method='number',number.cex = 0.9)



#making a multiple regression model

model<- lm(log_total_deaths~gdp_per_capita+log_female_smokers+male_smokers+
             hospital_beds_per_thousand+population+human_development_index+
             cardiovasc_death_rate+stringency_index,
           data = asia_analysis1)
summary(model)
