wages<-read.csv(file="~/Homework/prob/wages.csv")

print(wages)

#data is malformed needed to replace non-numeric characters
wages$Average.Wage <- gsub('[$,]','',wages$Average.Wage)
wages$Average.Wage <- as.numeric(wages$Average.Wage) 


x <- wages$Average.Wage
print(x)

#calling the package qcc
library("qcc")

c <- qcc(data = x,
    type= "xbar.one",
    plot = FALSE)

summary(c)
plot(c, title="Control Chart for Average Wage", xlab = "Enlisted Air Force Military", ylab = "Salary")
abline (h = 50000)
abline (h = 50000 + 1.96 + 17000)
abline(h = 50000 - 1.96 * 17000)
abline(h = 50000 + 2.58 * 17000)
abline(h = 50000 - 2.58 * 17000)
