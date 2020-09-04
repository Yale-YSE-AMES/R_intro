#Thinking Like a Computer: Workshop Code                         #
#Prepared for Introduction Applied Math for Environmental Science#
#Author: Ethan Addicott & Matthew Gordon                         #
##################################################################
#USER NOTE: Follow the commented instructions to complete each   #
#          line of code. Complete code by either replacing       #
#         question mark symbols (?) or writing your own line.    #
##################################################################
##################################################################
#Let's clear the workspace, in case you had any open projects

rm(list=ls())

# Question 1 -----------------------------------------------------
#Let's store the integer 2 to a variable t

t <- 2

#Now how about the character F to a variable called eff

eff <- ?F?

#Now let's make a vector of letters and numbers

myvector <- ?(t,eff,7,"S",6,"E")

#Now type myvector in the console and press enter. 
#How does R store the numbers? What type of vector is this?

#Let's store the same collection as a list.

mylist ?? list(t,eff,7,6,"E","S")

#Type mylist in the console and press enter.
#How does this structure store things differently?

#Can you reorder the elements to make something meaningful? (Hint: The course code is FES762)

myvector.newseq <- myvector[c(?,?,?,?,?,?)]

#What does it say?

#We can run this extra little line of code to make it clearer

msg <- paste(myvector.newseq,collapse = "")

#Can the computer compare msg to a string?
#Replace ? with a string you think the msg might say

msg == ?
        
#Test whether each element of myvector is equal to "E"

myvector ?? "E"

#Test whether the first element of myvector equals 2 or the third element equals 4

myvector[?] == 2 ? myvector[?] == 4 
        
#Question 2 -------------------------------------------------------
#How annoying can you make your computer?
#Fill in the ? correctly to make R sing you a song!

phrase1 <- "bottles of beer"
phrase2 <- "on the wall \n"
jbottles <- 99
for (j in ?:?) {
  cbottles <- jbottles - ?
  cat(cbottles , phrase1 ,  phrase2)
  cat( cbottles , phrase1 , "\n" )
  cat("Take one down, pass it around", "\n")
  cat( cbottles ? ? , phrase1 ,  phrase2 )
  cat("-------------------------------","\n")
  
  if (j == jbottles) {
    
    print("END OF SONG")
    
    }
  
  }

#Isn't that great! It's called a *for loop*.
#for loops repeat a sequence of steps a given number of times
#In the above example we use *i* as the index. Every time 
#the computer finishes the list of steps, it increases the index
#by one and repeats the steps again.

#YOUR TURN!
#Write a for loop that prints out the elements of the list we made
#earlier. You can choose from the following options to fill
#the ? symbols: length(mylist)   mylist[i]   print(?) i   1 

for (? in ?:?){
        #thing to repeat
}


#Writing fast code#
########

#Growing Result Vector - in this example, each iteration of the loop adds another
# element to the sqr.squared vector
sqr = seq(1, 1000, by=0.01)
sqr.squared = NULL
system.time(for (n in 1:length(sqr)) {sqr.squared[n] = sqr[n]^2})

#Now look what happens if we pre populate the sqr.squared vector with the right
# number of (NA) elements
sqr = seq(1, 1000, by=0.01)
sqr.squared = rep(NA, length(sqr))
system.time(for (n in 1:length(sqr)) {sqr.squared[n] = sqr[n]^2})

## Which is faster?

#####################
#Your first function#
#####################

sqrfcn <- function(x) {
  out <- x^2
}
sqr = seq(1, 10, by=0.01)
sqr.sequence=sapply(sqr, FUN= sqrfcn)

#What is sapply? What does that even do? Try running 
?(apply)
#to see what apply does. NOTE: sapply is related to apply, 
#the sapply help page is less informative.

system.time(sapply(sqr, FUN= sqrfcn))

system.time(for (n in 1:length(sqr)) {sqr.squared[n] = sqr[n]^2})

#Which is faster, sapply or a loop?

#################################################################
#Question 3 ----------------------------------------------------
#Let's do some math now.
#First, define a quadratic function

quadfn <- function(x) {
  return(a*x^2+b*x+c)
}

#Now let's define the coefficients. Write three lines of code 
#to set the coefficients and then use the function quadfn(x) to
#determine the value of f(7621) if f(x)= 2x^2+6.1x-14

#Ok, but a single value is not big deal.
#In the book "e" you are reading you learned that Napier and others
#spent months and years tabulating values for logarithms among other
#operations by hand. Let's make a table of the values of the function f(x)
#for every number starting from 6 and incrementing by .2 all the way to 16.

#First make a list of numbers satisfying this criteria called vals
vals <- ?

#Then evaluate the function for each of the values. HINT: You can do
# a for loop, but take a guess at an easier approach.


#Now let's plot these values!
library(ggplot2)

ggplot() + 
        geom_line(aes(x=?, y=?))

###################################################
