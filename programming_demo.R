#R Demo Code                                                     #
#Some material adopted/revised from r-statistics.co              #
##################################################################
##################################################################
##################################################################
#Let's clear the workspace, in case you had any open projects

rm(list=ls())

# LEVEL 1: R is just a fancy calculator

2+2
15/7
16.3^1.2

7%%2 # The modulus or modulo or remainder operator is represented by %% 
6%%2

#Run each of the above lines one at a time by hitting CTRL+Enter

# LEVEL 2: The nouns of R - Storage and Display

# Element variables
x <- 3
y <- 2 + 2
print(x + y)
typeof(y)

# a character object
h <- "hello world"
print(h)
typeof(h)

# logicals
l <- 3 > 5
typeof(l)

# vectors
vec.bldg <- c("Sage", "Kroon", "Greeley")
# subsetting
vec.bldg[3]

vec.bldg <- c("Sage", "Kroon", 47)
x + vec.bldg[3]

vec.bldg <- c("Sage", "Kroon", Greeley)

# lists
l.stuff <- list(vec.bldg, x, pi)
print(l.stuff)

# matrices
m.numbers <- matrix(1:12, nrow = 3, ncol = 4)
print(m.numbers)

# arrays
a.numbers <- array(1:12, dim = c(2, 3, 2))
print(a.numbers)

# dataframes
df.bldgs <- data.frame(name = vec.bldg, importance = c(10, 6, 2))
df.bldgs[1,]
df.bldgs[,1]
df.bldgs[3,2]
df.bldgs$importance > 5
df.bldgs[df.bldgs$importance > 5,]

# LEVEL 3: + BUILT-IN COMMANDS

sqrt(4)
seq(1,10)
seq(1,10, length.out = 14)
rep(14,4)
min(1,2,3,4,12,-19)
max(1,2,3,4,12,-19)

#You can also read documentation
help(seq)

# LEVEL 4: + Packages! and Plotting (Intro to the tidyverse) 

install.packages('tidyverse') #this is how to install a package
library(tidyverse) #this is how to load up a package so you can use it (if already installed)

#Load traffic stops data

df.traffic <- read_csv("traffic_stops_2018.csv")

#a tibble!
str(df.traffic) #examine the STRucture of the data

#create a new variable
df.traffic <- mutate(df.traffic, race_ethnicity = if_else(SubjectRaceCode == "W" & SubjectEthnicityCode == "H", "H", SubjectRaceCode))

## ggplot is part of the tidyverse

g <- ggplot(df.traffic) + 
        geom_bar(aes(x = race_ethnicity)) + 
        labs(title = "Traffic Stops by Race") 
print(g)

df.searches <- filter(df.traffic, VehicleSearchedIndicator==1)

g2 <- ggplot(df.searches) + 
        geom_bar(aes(x = race_ethnicity)) + 
        labs(title = "Traffic Stops by Race", x = "Race/Ethnicity") 
print(g2)

g3 <- ggplot(df.searches) + 
        geom_bar(aes(x = race_ethnicity, fill = ContrabandIndicator)) + 
        labs(title = "Traffic Stops by Race", x = "Race/Ethnicity") 
print(g3)

g4 <- g3 + 
        facet_wrap( ~ `Department Name`, scales = "free")
print(g4)

### Actual numbers and CT demographics

df.demos <- data.frame(race_ethnicity = c("A", "B", "H", "I", "W"),
                       population = c(.048, .107, .157, .003, .685))

df.stops <- df.traffic %>%
        group_by(race_ethnicity) %>%
        summarize(stops = n()/nrow(df.traffic),
                  search = mean(VehicleSearchedIndicator, na.rm = TRUE))

df.contra <- df.searches %>%
        group_by(race_ethnicity) %>%
        summarize(contraband = mean(ContrabandIndicator, na.rm = TRUE))

df.ct <- merge(df.demos, df.stops, by = "race_ethnicity")
df.ct <- merge(df.ct, df.contra, by = "race_ethnicity")
df.ct <- pivot_longer(df.ct, !race_ethnicity, names_to = "variable", values_to = "percent")

ggplot(df.ct) +
        geom_col(aes(x = race_ethnicity, y = percent, fill = race_ethnicity)) +
        facet_wrap(~variable, scales = "free")

# LEVEL 5: Functions and Optimization

cakeBaker <- function(eggs, flour, butter, sugar, vanilla) {
  #This is a function that takes as inputs:
  #quantity of eggs
  #cups of flour
  #sticks of butter
  #cups of sugar
  #tsp of vanilla
  
  eggToCake <- eggs / 2
  flourToCake <- flour / 4
  butterToCake <- butter / 2
  sugarToCake <- sugar / 1.5
  vanillaToCake <- vanilla / 1
  cakesToBake <- min(eggToCake,flourToCake,butterToCake,sugarToCake,vanillaToCake)
  return(cakesToBake)
}

cakeBaker(12,5,4,12,10)

bakeryProfits <- function(cakesSold) {
  profits <- -10 + cakesSold - 0.015*cakesSold^2
  return(profits)
}

#Visualize it....
cakes <- seq(0,100,0.1)
profits <- bakeryProfits(cakes)

ggplot() + 
        geom_line(aes(x=cakes,y=profits))

optimize(bakeryProfits, c(0,100), maximum = TRUE)

# LEVEL 6: Loops and control flow

years <- seq(0,100) # year 0 to 100

newBalance <- function(oldBalance, t) {
        if (t%%10 == 0) {
                amt <- oldBalance*0.4
        } else {
                amt <- oldBalance*1.07 + 100*(t%%2)
        }
        return(amt)
}

balance <- rep(NA,101)
balance[1] <- 50

for (t in 1:100){
        balance[t + 1] <- newBalance(balance[t],t)
}

ggplot() + 
        geom_point(aes(x = years, y = balance, color = years%%10))
