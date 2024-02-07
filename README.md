1. INTRODUCTION

COVID 19 pandemic is an ongoing pandemic start started around December 2019 and began to spread across the world ever since (Khanna et al., 2020). The disease is contagious and is primarily transmitted through respiratory system (Ciotti et al., 2020). The pandemic had a global impact and all nations, be it developed or developing, was affected by this.

There are two aims to this study. First one is to analyse the relation between the government response based on stringency index with new cases per million in Asian countries. Second is to find a relationship between total deaths and various factors such as Human Development Index (HDI), number of female and male smokers, cardiovascular death rate, hospital beds per thousand, stringency index and population by building a regression model.

The Stringency Index used in this study would be Oxford Stringency Index (SI) (Hale et al., 2021). Stringency Index and other policy measures of different nations had a positive effect in controlling the spread of the pandemic (S. Chen et al., 2021; Furceri et al., 2021; Khan et al., 2021). Study by  Chen et al., (2021) shows that countries such as China initially managed to flatten the covid curve by increasing its stringency index, whereas in Hong Kong, delay in government response resulted in spiking of new cases. The study also highlighted South Koreas high SI with its relatively low number of cases. Furceri et al., (2021) shows that decision by countries such as India, Indonesia, Philippines to reopen their economies before the decline of new cases resulted in spike of COVID cases. These instances show SI is an important factor in reducing the occurrence of new cases.

Studies showed correlation between COVID mortality and social factors such as populations age structure, public healthcare, hospital beds available, smoking habits (Banik et al., 2020; Haldar & Sethi, 2020.) However, poor people in both developing and developed countries suffered the most due to COVID (Banik et al., 2020). A study by Mirahmadizadeh et al., (2022) showed Human Development Index (HDI) has a positive relation with COVID mortality. However, studies show conflicting results also since Haldar and Sethi (2020) shows indicators such as Gross Domestic Product (GDP) per capita and HDI had no significant relation.

The focus of this study is to do an analysis on Asian countries since they have huge population and many of them are developing nations. How the governments of these nations managed to tackle the pandemic with the resources they had and a huge demographic load would be interesting to analyse. Moreover, the countries had a good availability of data barring a few nations such as North Korea.

2. METHODOLOGY

The data was gathered from Our World In Data (OWID) and can be accessed from GitHub through the link https://github.com/owid/covid-19-data/tree/master/public/data. The data is collected and collated by OWID through various sources such as COVID data repository of John Hopkins University (JHU), United Nations, World Bank and Blavatnik School of Government. The dataset includes country wise data that is periodically updated with information on several parameters. 

Table 1: Variable description
<img width="524" alt="COVID data variable description" src="https://github.com/abhishekvs95/COVID-19/assets/122197528/fcc77b0f-6996-48db-9372-3ff0ab17ba09">

R packages used in the analysis are ggpubr, tidyverse, hmisc and corrplot. tidyverse helps to clean the dataset and visualise it better. Tidyverse contains packages such as ggplot2, dplyr. dplyr package helps to handle data easily through its select, filter, mutate, summarise functions. ggplot2 is a Grammar of Graphics based plotting package that helps in visualisation. hmisc package is used for some data analysis such as the describe function which is highly useful for showing statistical description of dataset. Corrplot package is used for plotting the correlation matrix plot and ggpubr is used for displaying multiple plots.

After loading the dataset, it is filtered for continent Asia. The function unique is used to see if there are any locations other than Asian countries in the dataset. Date column was in character format and was changed to date format by using as.Date() function. Then a map for total deaths for Asia was plotted. Here logarithmic transformation of total deaths was used to show clearer contrast. Left join was used to join dataset with map data. Then the Asian countries were arranged using order function to see countries with most covid deaths. Top six countries were taken to limit the scope of this study. Plots of total deaths, stringency index, people fully vaccinated against time was plotted. Then for those countries new cases smoothed per million and stringency index was plotted into a single graph each. 

For creating a multiple regression model, a new dataset was created by choosing the variables that were required for analysis. These include location, total cases, total deaths, population, GDP per capita, cardiovascular death rate, diabetes prevalence, female and male smokers, hospital beds per thousand, life expectancy, total deaths per million, stringency index and HDI. The function which() and is.na() was used to find NA values. Countries such as North Korea, Northern Cyprus, Turkmenistan, Taiwan and so on were eliminated due to lack of data and poor update frequency. For the rest of the dataset, NA values were filled using respective mean values. 

Then for all variables, histograms were plotted to see if the data is skewed or not and logarithmic transformation was done where necessary. Then a correlation test was done on the variables and correlation matrix was plotted. After this, a multiple linear regression test was done by taking log of total deaths as dependent variable and GDP per capita, female and male smokers, population, hospital beds per thousand, HDI, cardiovascular death rate, stringency index as independent variables.

3. RESULTS AND DISCUSSION

India, Indonesia, Iran, Turkey and Philippines had very large number of fatalities. This can also be inferred from the plot showing trend of total deaths in six countries that were affected the most in case of fatalities. The fatality in India is shown to be much higher, more than 3 times the fatality of second most affected country, Indonesia.

Table 2: COVID-19 deaths
<img width="462" alt="covid death and log" src="https://github.com/abhishekvs95/COVID-19/assets/122197528/f89ecfa1-0a9b-4499-99eb-f7599027b03b">

 4.1 ANALYSING TRENDS OF STRINGENCY INDEX AND RISE IN NEW CASES

Figure.1 Map of Asia highlighting COVID mortalities

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/3c9e9737-3bd5-4471-bee3-c34290ad5b8c)

 
Figure.2 Trend showing total deaths
 



From observing Figure 2, India and Indonesia had a considerable spike in fatalities during the second wave of COVID 19. This is consistent with studies that indicate that these countries started reopening their economies before they could observe a considerable decline in new cases (Furceri et al., 2021)
