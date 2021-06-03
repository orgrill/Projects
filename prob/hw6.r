print("HW Question 1")
p1 <- read.csv(file="~/Homework/prob/p1.csv")
print(p1)

library("qcc")

c <- qcc(data = p1,
    type= "xbar.one",
    plot = FALSE)   

summary(c)
plot(c, title="Control Chart for Question 1")


library("qcc")
cusum(p1, plot=TRUE)

print("HW Quesiton 2")
p2 <- read.csv(file="~/Homework/prob/p2.csv")
print(p2)

library("qcc")

c <- qcc(data = p2,
    type= "xbar.one",
    plot = FALSE)
summary(c)
plot(c, title="Control Chart for Question 2")


print("HW Question 5")
p5 <- read.csv(file="~/Homework/prob/p5.csv")
print(p5)

library("qcc")

c <- qcc(data = p5,
    type= "xbar.one",
    plot = FALSE)

summary(c)
plot(c, title="Control Chart for Question 5")