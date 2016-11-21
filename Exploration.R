ibrary(ggplot2)
library(dplyr)
library(readr)
library(lubridate)

df<- read_csv("hourly_44201_2015.zip")
df2<- read_csv("hourly_42401_2015.zip")


#Number of Method used /Tues
df%>%
  group_by(`Method Name`)%>%
  summarise(n())

df%>%
  group_by(`Method Type`)%>%
  summarise(mean(`Sample Measurement`))
#Data after filtered with country 003
kkk <-df%>%
  filter(`County Code`== "003")%>%
  mutate(Time_in_Min = `Time Local`/60)

#Boxplot of time(minute) with Measure separated by the method Name
ggplot(kkk)+
  geom_boxplot(mapping = aes(x=factor(Time_in_Min), y=`Sample Measurement`))+
  facet_wrap(~`Method Name`)

df%>%
  group_by(`Method Type`,`Method Name`)%>%
  summarise(n())
  