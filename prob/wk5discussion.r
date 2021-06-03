print("----------------PART 1------------------")
wages<-read.csv(file="~/Homework/prob/wages.csv")

print(wages)

#takes the symbols out of the data 
wages$Average.Wage <- gsub('[$,]','',wages$Average.Wage)
wages$Average.Wage <- as.numeric(wages$Average.Wage) 

#Creates a random sample of 30 
n <- 30

Sample <- sample(wages$Average.Wage, n) 
print(Sample)
m<-mean(Sample)
print(m)
y<-sd(Sample)
print(y)

#Finding the prob that the Avg. Salary from the sample is less than the True Average Salary
prob <- pnorm(m, 48011, 17329)
sprintf("%.4f%%", prob * 100)

print("----------------PART 2------------------")
population_size <- length(wages$Average.Wage)
b <- wages$Average.Wage[wages$Average.Wage > 48011]
P_b <- length(b) / population_size
sprintf("%.4f%%", P_b * 100)
a <- wages$Average.Wage[wages$Average.Wage > (m + 5000)]
P_a <- length(a) / population_size
sprintf("%.4f%%", P_a * 100)

#sprintf("A= %f", a)
#sprintf("P_A= %f", P_a)
#sprintf("B= %f", b)
#sprintf("P_B= %f", P_b)
c <- P_b * P_a / P_b
sprintf("%.4f%%", c * 100)

print("----------------PART 3------------------")

a<-pnorm(m,51000,17329)
sprintf("%.4f%%", a * 100)
b<-pnorm(m,45000,17329)
sprintf("%.4f%%", b * 100)
print("----------------PART 4------------------")

qnorm(0.25,m,y)
qnorm(0.50,m,y)
qnorm(0.75,m,y)
qnorm(0.10,m,y)
qnorm(0.05,m,y)

print("----------------PART 5a------------------")

curve(dnorm(x,m,y),from = m-4*y , to= m+4*y, n=30, add= FALSE, ylab="f(x)", xlab="Salary")

print("----------------PART 5b------------------")
plot(NA,xlab = "Height(m)",xlim = c(0.5,3), ylab = "f(x)",ylim = c(0,1.6))
curve(dnorm(x,1.65,0.25), add = TRUE)
curve(dnorm(x,1.85,0.25), add = TRUE)
text(1.15, 0.5, "Females")
text(2.35, 0.5, "Males")