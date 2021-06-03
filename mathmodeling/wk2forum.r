#creating vectors for the given numbers 
a <- c(1,2,4,5)
b <- c(1,3,3,5)

#this prints my vectors in my command line
print(a)
print(b)

plot(a,b)

#had to switch a&b values because putting a first results in wrong answer. 
lm(b ~ a)
#line of best fit
abline(lm(b~a))
