library(plotly)
library(ggplot2)
ggplot(mtcars)+
  geom_boxplot(aes(y = mpg, x = factor(cyl)))

ggplotly()

library(dplyr)
library(tidyverse)
library(nycflights13)
planes$tailnum

flights$tailnum
planes %>% 
  count(tailnum) %>% 
  filter(n > 1)
weather %>% 
  count(year, month, day, hour, origin) %>% 
  filter(n > 1)
flights %>% 
  count(year, month, day, flight) %>% 
  filter(n > 1)
flights %>% 
  count(year, month, day, tailnum) %>% 
  filter(n > 1)

flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2
flights2 %>%
  select(-origin, -dest) %>% 
  left_join(airlines, by = "carrier")

flights2 %>%
  select(-origin, -dest) %>% 
  mutate(name = airlines$name[match(carrier, airlines$carrier)])



flights2 %>% 
  left_join(weather)



#13.3.1
k <-flights%>%
  mutate(rownum = row_number())

#13.3.2
Lahman::Batting
CS  BB  SO IBB HBP SH SF GIDP
playerID yearID stint teamID lgID   G  AB   R   H X2B X3B HR RBI  SB
#playerID teamID 

#13.3.3
k<- Lahman::Batting
kk<- Lahman::Master
kkk<- Lahman::Salaries
kkkk<- Lahman::Managers
kkkkk<- Lahman::AwardsManagers
#Batting includes the playerId and other imformation about the play, while Master and Salaries are impormation
#about the player themselves. Managers include Award Mana

#13.4.6.1
Delay_summary <- flights%>%
  group_by(dest)%>%
  summarise(meandelay = mean(arr_delay))%>%
  unique()
Delay_summary %>%
  left_join(airports, c("dest" = "faa")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point(aes( = meandelay)) +
  coord_quickmap()

#13.4.6.2
fdf<-flights %>% 
  left_join(airports, c("dest" = "faa"))

dsad<-flights %>% 
  left_join(airports, c("origin" = "faa"))

sda<- select(dsad, dest,origin,lat,lon)%>%
unique()

identical(fdf, dsad)
#13.4.6.3
flights%>%
  left_join(planes, by = "tailnum")

#13.4.6.4
flights%>%
  left_join(weather, by = "origin")


#13.5.1.1
tailnum<-flights%>%
  arrange(tailnum)
  #cancelled flights

flights%>%
  anti_join(planes,by = "tailnum")
  
#13.5.1.2
flights%>%
  count(tailnum)%>%
  filter(n >= 100)

#13.5.1.3
fueleconomy::vehicles

fueleconomy::common%>%
  arrange(desc(n))

fueleconomy::vehicles%>%
  filter(model == 'F150 Pickup 2WD')

#13.5.1.4
delay<- flights%>%
  arrange(desc(dep_delay))

delay%>%
  semi_join(weather)

#13.5.1.5
anti_join(flights, airports, by = c("dest" = "faa"))
#variables that flights have airports dont have
anti_join(airports, flights, by = c("faa" = "dest"))
#variables that ariports have flights dont have

#13.5.1.6
planes%>%
  full_join(airlines, by=c("tailnum"="carrier"))

#upload to internet
#success