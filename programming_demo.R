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

#Preinstalled data: diamonds
diamonds

#a tibble!
str(diamonds) #examine the STRucture of the data

## ggplot is part of the tidyverse

g <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + labs(title="Scatterplot", x="Carat", y="Price") 
print(g)

g2 <- g + facet_wrap( ~ cut, ncol=5)
print(g2)

g3 <- ggplot(diamonds, aes(x=carat,y=price)) + geom_point(aes(color = cut)) + labs(title = "Scatterplot", x = "Carat",y = "Price") + facet_wrap( ~ clarity, ncol=3)
print(g3)

onlyGoodDiamonds <- diamonds %>% filter(cut == "Ideal")
g4 <- ggplot(onlyGoodDiamonds, aes(x=carat,y=price)) + geom_point(aes(color = cut)) + labs(title = "Scatterplot", x = "Carat",y = "Price") + facet_wrap( ~ clarity, ncol=3)
print(g4)

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
