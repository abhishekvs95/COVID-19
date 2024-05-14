You can view the .R file for the code. The below is a report written to interpret the results of the analysis.

EFFECT OF COVID-19 ON ASIAN COUNTRIES

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

 3.1. ANALYSING TRENDS OF STRINGENCY INDEX AND RISE IN NEW CASES

Figure.1 Map of Asia highlighting COVID mortalities

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/3c9e9737-3bd5-4471-bee3-c34290ad5b8c)

 
Figure.2 Trend showing total deaths
 
![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/920b329e-020d-49e6-95aa-cae5c5b7867f)


From observing Figure 2, India and Indonesia had a considerable spike in fatalities during the second wave of COVID 19. This is consistent with studies that indicate that these countries started reopening their economies before they could observe a considerable decline in new cases (Furceri et al., 2021)

Figure.3 Trend showing vaccinations per hundred
 
![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/52e053b6-246f-4e8a-a1a0-bfa184d8e671)


Figure 3 shows the percentage of people fully vaccinated across the six countries. Japan has crossed 80% of people fully vaccinated within one year span of 2021-2022. Other countries are yet to follow this, but considering the global vaccine shortage and more population, others have done a good job of getting 60% of people fully vaccinated.


Figure.4 Trend showing stringency Index

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/29463f82-214c-4def-b557-af92d7c91fdb)


Stringency Index (SI) pattern (Figure 4) shows the countries followed very strict response while tackling the first wave of COVID. India, Philippines have achieved SI value of 100 during this time, and it correlated with the reduced mortality they saw during this time. As is evidenced by literatures such as Chen et al., (2021) and Furceri et al., (2021) stringency played a key role in reducing the spread of COVID 19 during the first wave.

Figure.5 Trend of new cases per million and stringency for India

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/7363c4c9-657a-4297-9e2c-8c594a23a6c5)


Figure.6 Trend of new cases per million and stringency for Indonesia

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/308f8716-30b2-4316-9cee-77c4b5295597)


Figure.7 Trend of new cases per million and stringency for Iran

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/c688090a-89ed-4ec3-97da-10a935b4f34d)


Figure.8 Trend of new cases per million and stringency for Turkey

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/49c5f0eb-4a5f-4973-a1c4-c68226fbd1d0)


Figure.9 Trend of new cases per million and stringency for Philippines

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/bccc64f1-1a01-4913-9b9e-4b4a1b8e104b)


Figure.10 Trend of new cases per million and stringency for Japan

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/6d3dae4e-0f86-4958-99a2-5d044b0c93d0)


Table.3 Mean Stringency Index values

<img width="459" alt="mean stringency index" src="https://github.com/abhishekvs95/COVID-19/assets/122197528/6c2be247-5a9b-4df6-a4fb-ccdefcdd7ea7">

Stringent non pharmaceutical interventions play a key factor in controlling the spread of pandemic (Zhao et al., 2021).  Study by Yang et al., (2021) showed that Stringency Index (SI) has a strong effect in curbing new cases. As observed from Figures 5 to 10, countries that had high SI during the onset of pandemic has managed to keep the rise in cases low. But countries like India have lowered their stringency following the first wave and this has led to a spike in cases especially during the second wave (Sarkar et al., 2021). This has resulted in rise in mortality in these countries even after successfully fighting the first COVID 19 wave. Average value of SI for Japan and Turkey is approximately 41 and 46 respectively, which is the lowest among the compared countries. This can be correlated to the very high new cases of COVID for these countries. 

For countries like India, Indonesia and Iran the new COVID cases are seeing a decline. But the trend for Philippines and Japan is quite concerning as there is an increasing trend in new cases. The second wave of COVID 19 was due to the Delta variant and the third wave was due to another variant called Omicron that started to spread by the end of 2021 (Ranjan, 2022). Japan has shown strength in fighting the spread of COVID 19 during the initial two waves of the pandemic. But Japan showed a significant rise in new COVID cases after 2021 when the third wave hit. From Figure 2, the mortality is seeing an upward trend in Japan. This is shows that a lower SI value will result in a spike in COVID cases even though Japan has attained fully vaccinated percentage of above 80%. All countries included in this study were affected by the first three waves. But the trend after the Omicron induced wave is different. India, Indonesia, Iran, Philippines shows an overall reduction in trend of new cases even though peaks of infection can be observed. But for Japan and Turkey, the pandemic remains infectious and is seeing a large increase in new cases per million, especially for Japan which seems to be the period of highest number of new cases per million. 

Observing the trend for total deaths all other countries except Japan has flattened the curve. A simultaneous decline in SI values is also observed as daily cases and deaths decline. But it is important to remain vigilant even when the issue is observed to be subsiding. Stringency is one of the most effective tools to contain the spread of the COVID pandemic (Khan et al., 2021). In the event of emergence of a new variant, it is important that government keeps vigilance and make the people aware that the ongoing COVID 19 pandemic has not subsided yet.


3.2. CREATING A MULTIPLE LINEAR REGRESSION MODEL

A study on relation between total deaths and factors such as GDP per capita, female smokers, male smokers, population, hospital beds per thousand, Human Development Index (HDI), cardiovascular death rate, stringency index was done by creating a multiple regression model. Some variables such as total deaths, female smokers were skewed while observing histograms (Figures 11 and 12). A logarithmic transformation was done to normalise the data. Figure 13 and 14 shows the log transformed distribution of variables.


Figure.11 Histogram of total deaths

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/94bdeb07-e2f9-4070-ba13-0eb811719ba2)

 
Figure.12 Histogram of female smokers

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/a5c23c02-7ad3-44fc-a405-0a26063e8af6)

 
Figure.13 Histogram of logarithmically transformed female smokers
 
![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/9fdfb63c-e6b6-4e34-8b5f-4d8297d0e755)


Figure.14 Histogram of logarithmically transformed total deaths

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/127fd14d-c23b-4f4c-ab4d-0f6dc54ce2f9)

 
Two correlation plots, Pearson and Spearman, were made to observe the correlation between selected variables  


Figure.15. Pearson Correlation Plot


![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/093a7779-a4b8-4cdf-832f-b61292696588)


Figure.16. Spearman Correlation Plot

![image](https://github.com/abhishekvs95/COVID-19/assets/122197528/dc42f864-adf2-467a-a78d-92cb8ec6397a)


Table.4. Pearson Correlation coefficients

<img width="569" alt="Pearson" src="https://github.com/abhishekvs95/COVID-19/assets/122197528/18dbf9ce-7763-415c-96ad-ea3d532a678c">


Table.5. Spearman Correlation Coefficients

<img width="573" alt="spearman" src="https://github.com/abhishekvs95/COVID-19/assets/122197528/b8e02cb2-f210-4f13-a89a-30404f5605bf">


A multiple linear regression model was created to investigate the relations further. Logarithmically transformed values of total deaths was taken as the dependent variable. GDP per capita, Log female smokers (log transformed because of skew), male smokers, hospital beds per thousand, population, Human Development Index, Cardiovascular deaths rate, Stringency Index were taken as independent variables. Summary of the model is shown in tables 6 and 7.

Table.6. Residuals

<img width="460" alt="residuals" src="https://github.com/abhishekvs95/COVID-19/assets/122197528/bcf4a1f1-23c2-4c10-8c9a-a6f52d46dbb5">

 
Table.7. Coefficients

<img width="530" alt="coefficients" src="https://github.com/abhishekvs95/COVID-19/assets/122197528/36e11f12-896b-469b-ade1-c83c813bcd56">

Significant codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
Residual standard error: 1.707 on 35 degrees of freedom
Multiple R-squared:  0.4546,	Adjusted R-squared:   0.33 
F-statistic: 3.647 on 8 and 35 DF,       p-value: 0.003484

Residual standard error for the model is 1.707 on 35 degrees of freedom. This indicates that the model predicts the log of total deaths with an average error of 1.707, which is good. The p-value is 0.003484 which is less than 0.05, making the model statistically significant. The multiple R-squared value indicates the quality of the model and the model has a value of 0.4546. The model shows that the combined effect of development parameters such as HDI, GDP per capita, public health system, government response to the pandemic and demographic indicators such as the prevalence of smoking, cardiovascular death rate influenced the COVID mortality of Asian countries.

According to Banik et al. (2020) COVID 19 affected all countries, be it developing or developed. It had a disproportionate impact on the poor as they worked as migrants, lived in high population density areas, had poor medical access and lacked the ability to purchase sanitary products. Factors considered in the study are only some of the determinants of mortality due to the pandemic. There are other factors that affected people during the pandemics as well. One is the role of migration. Study by Varkey et al. (2021) found out countries having high GNI (Gross National Income) and reverse migration were more affected. As per World Migration Report 2022, more than 40% of international migrants originated from Asia. Therefore, countries such as India who has a very large inflow of migration were more prone to COVID 19 and its effects (Suhardiman et al., 2021). One should also factor in the role of internal migration. 

Another factor would be people’s response to COVID 19 policies. The level of willingness people shows to practice social distancing measures and maintaining personal hygiene impacted the effect of pandemic. Study by Chen et al. (2021) shows countries such as South Korea that had a favourable response from people helped in fighting the pandemic.

 Also, it is important to investigate when and how the governments tackled the pandemic. Chen et al. (2021) studied the policy response in various Asian countries. In Singapore even as the government undertook stringent measures, it still affected the poor especially migrants who were neglected in the policy measures. In Japan the government had a delayed response which resulted in spike in cases. Whereas Taiwan took proactive measures before they reported their first case which was applauded by people worldwide. India, Indonesia, Philippine governments decided to reopen their economy rather quickly, which led to increase in the spread of the disease (Furceri et al., 2021). This was because the containment measures took a heavy toll on economy. The poor who worked as daily wage earners suffered as they were left without any social security and was not able to afford sanitary products. Globalisation, where the world economy is interconnected and interdependent also contributed to the spread of pandemic through migration. 

According to Banik et al. (2020) factors such as strong public health system, population age structure, prevalence of poverty, vaccination policies including BCG vaccinations were determinants of mortality. Such social determinants tend to have more effect on mortality than GDP per capita and HDI (Haldar & Sethi, 2020). The COVID 19 pandemic took a toll on all countries without discrimination. The result of this analysis shows the mortality associated with the pandemic was influenced by combined effect of the independent variables used for the study. But these parameters were not the only factors as the topic is quite complex and factors in many issues discussed above.

4.CONCLUSION

The purpose of this study was twofold. One was to know the effect of stringency on new COVID 19 cases in Asia. The second one was to determine the relationship between total deaths, development and demographic parameters. For the purpose of this study GDP per capita, prevalence of smoking habits, hospital beds per thousand, population, HDI, cardiovascular death rate, stringency index was considered to create a multiple regression model taking total deaths as the dependent variable. 

From studying the trends of stringency index and rise in COVID cases, it was seen that the government response in the top six affected countries the level of stringency correlated with the spike in cases. This is also in accordance with the studies that point out non pharmaceutical interventions that include stringent government response is the key to slow down the infection during a pandemic. The study also shows how the government responded also makes a difference. For instance, India did a very good job in tackling the first wave by implementing strict lockdown measures, but due to relaxation of stringency measures early on resulted in significant rise in cases(Sarkar et al., 2021). Presently in countries like Japan and Philippines there is an increasing trend of new cases. 

Coming to the second aim of the study, it was observed that factors such as GDP per capita, female and male smokers, hospital beds per thousand, population, HDI, cardiovascular death rate, stringency index influenced the mortality rates observed in Asian countries. Residual standard error for the model is 1.707 on 35 degrees of freedom, p-value is 0.003484 and multiple R squared value is 0.4546. This also conforms to the studies that indicated the same. 

From the analysis and studying literatures that researched on the same issue, non-pharmaceutical interventions such as stringent government response and social distancing measures have the most impact when it comes to reducing the spread of infection and curbing mortality rates. Development and demographic indicators did play a role in determining COVID mortality, but their influence was rather limited. COVID 19 was an outlier event and affected all countries in the world equally. The study highlights it is important to focus on improving public health infrastructure such as number of hospital beds per thousand, reduce prevalence of co morbidities such as cardiovascular diseases, improve GDP per capita and HDI. But in a highly globalised world, these factors have their limits. The key finding is that a high level of Stringency Index coupled with strong adherence to social distancing norms by the public goes a long way in fighting the pandemic. Development and demographic quality help reduce the impact of pandemic, but only as assisting factors. Such finding is important to keep in mind when the next global pandemic comes.

It is also understood that there are factors outside the scope of this study that affected how the pandemic played out. Migration, people’s awareness and response, the timing of government response, poverty, public health policies such as immunisation programmes, economic situations affected how COVID impacted Asian countries.

The study finds limitation in the analysis as only six countries were analysed to observe the trend of new cases and Stringency Index. This was done to reduce the scope and save time. Also, it would have been better to factor in the lag effect of stringency measures with respect to rise is new cases. This could have been done through a time series analysis by looking into the delayed trend of new cases. As for the linear regression model, the study should have considered gathering data about migration, people’s response to government measures, public health policies to develop a better model that could have predicted the relation to COVID mortality more strongly.

Nevertheless, the study has shown vigilance and timely action by government and public cooperation through social distancing norms is crucial for controlling the spread of disease. Development and demographic quality are also linked to the mortality associated with the pandemic. This will help guide us in handling the next pandemic and possibly reduce its impact on the public, especially the poor.

5. REFERENCES

Banik, A., Nag, T., Chowdhury, S. R., & Chatterjee, R. (2020). Why Do COVID-19 Fatality Rates Differ Across Countries? An Explorative Cross-country Study Based on Select Indicators. Global Business Review, 21(3), 607–625. https://doi.org/10.1177/0972150920929897/FORMAT/EPUB

Chen, S., Guo, L., Alghaith, T., Dong, D., Alluhidan, M., Hamza, M. M., Herbst, C. H., Zhang, X., Tagtag, G. C. A., Zhang, Y., Alazemi, N., Saber, R., Alsukait, R., & Tang, S. (2021). Effective COVID-19 Control: A Comparative Analysis of the Stringency and Timeliness of Government Responses in Asia. International Journal of Environmental Research and Public Health 2021, Vol. 18, Page 8686, 18(16), 8686. https://doi.org/10.3390/IJERPH18168686

Chen, S. X., Lam, B. C. P., Liu, J. H., Choi, H. S., Kashima, E., & Bernardo, A. B. I. (2021). Effects of containment and closure policies on controlling the COVID-19 pandemic in East Asia. Asian Journal of Social Psychology, 24(1), 42–47. https://doi.org/10.1111/AJSP.12459

Ciotti, M., Ciccozzi, M., Terrinoni, A., Jiang, W. C., Wang, C. bin, & Bernardini, S. (2020). The COVID-19 pandemic. Critical Reviews in Clinical Laboratory Sciences, 365–388. https://doi.org/10.1080/10408363.2020.1783198

Furceri, D., Kothari, S., & Zhang, L. (2021). The effects of COVID-19 containment measures on the Asia-Pacific region. Pacific Economic Review, 26(4), 469–497. https://doi.org/10.1111/1468-0106.12369



Haldar, A., & Sethi, N. (2020). The Effect of Country-level Factors and Government Intervention on the Incidence of COVID-19 The Effect of Country-level Factors and Government Intervention on the The Effect of Country-level Factors and Government Intervention on the Incidence of COVID-19 Incidence of COVID-19 Asian Economics Letters. https://doi.org/10.46557/001c.17804

Hale, T., Angrist, N., Goldszmidt, R., Kira, B., Petherick, A., Phillips, T., Webster, S., Cameron-Blake, E., Hallas, L., Majumdar, S., & Tatlow, H. (2021). A global panel database of pandemic policies (Oxford COVID-19 Government Response Tracker). Nature Human Behaviour, 5(4), 529–538. https://doi.org/10.1038/S41562-021-01079-8

Khan, D., Ahmed, N., Mehmed, B., & Haq, I. U. (2021). Assessing the impact of policy measures in reducing the covid-19 pandemic: A case study of South Asia. Sustainability (Switzerland), 13(20). https://doi.org/10.3390/SU132011315

Khanna, R. C., Cicinelli, M. V., Gilbert, S. S., Honavar, S. G., & Murthy, G. V. S. (2020). COVID-19 pandemic: Lessons learned and future directions. Indian Journal of Ophthalmology, 68(5), 703–710. https://doi.org/10.4103/ijo.IJO_843_20

Mirahmadizadeh, A., Ghelichi-Ghojogh, M., Vali, M., Jokari, K., Ghaem, H., Hemmati, A., Jafari, F., Dehghani, S. S., Hassani, A. H., Jafari, A., & Rezaei, F. (2022). Correlation between human development index and its components with COVID-19 indices: a global level ecologic study. BMC Public Health, 22(1). https://doi.org/10.1186/S12889-022-13698-5

Ranjan, R. (2022). Omicron Impact in India: Analysis of the Ongoing COVID-19 Third Wave Based on Global Data. MedRxiv, 2022.01.09.22268969. https://doi.org/10.1101/2022.01.09.22268969
Sarkar, A., Chakrabarti, A. K., & Dutta, S. (2021). Covid-19 infection in india: A comparative analysis of the second wave with the first wave. Pathogens, 10(9). 
https://doi.org/10.3390/PATHOGENS10091222

Suhardiman, D., Rigg, J., Bandur, M., Marschke, M., Miller, M. A., Pheuangsavanh, N., Sayatham, M., & Taylor, D. (2021). On the Coattails of globalization: migration, migrants and COVID-19 in Asia. Journal of Ethnic and Migration Studies, 47(1), 88–109. https://doi.org/10.1080/1369183X.2020.1844561

Varkey, R. S., Joy, J., Sarmah, G., & Panda, P. K. (2021). Socioeconomic determinants of COVID-19 in Asian countries: An empirical analysis. Journal of Public Affairs, 21(4). https://doi.org/10.1002/PA.2532

World Migration Report 2022 | IOM Publications Platform. (2022). Retrieved January 16, 2023, from 
https://publications.iom.int/books/world-migration-report-2022

Yang, Q. C., Chen, X., Chang, C. P., Chen, D., & Hao, Y. (2021). What is the relationship between government response and COVID-19 pandemics? Global evidence of 118 countries. Structural Change and Economic Dynamics, 59, 98–107. 
https://doi.org/10.1016/J.STRUECO.2021.08.007

Zhao, Z., Li, X., Liu, F., Jin, R., Ma, C., Huang, B., Wu, A., & Nie, X. (2021). Stringent nonpharmaceutical interventions are crucial for curbing COVID-19 transmission in the course of vaccination: A case study of South and Southeast Asian countries. Healthcare (Switzerland), 9(10). https://doi.org/10.3390/HEALTHCARE9101292
