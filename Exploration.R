library(ggplot2)
library(dplyr)
library(readr)
library(lubridate)

df<- read_csv("Ozone.zip")
df2<- read_csv("SO2.zip")
df3<- read_csv("pm25")

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
  
df4<- read.csv("accident.csv")

