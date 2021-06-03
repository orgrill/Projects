#importing data into R. "Namee of file"<-read.csv(file="~/"path of file")
wages<-read.csv(file="~/Homework/prob/wages.csv")

#This will print the data out in terminal 
print(wages)

#data is malformed needed to replace non-numeric characters
wages$Average.Wage <- gsub('[$,]','',wages$Average.Wage)
wages$Average.Wage <- as.numeric(wages$Average.Wage) 

print("Mean wage by Gender:")
tapply(wages$Average.Wage, wages$Gender, FUN=mean)
print("Median wage by Gender")
tapply(wages$Average.Wage, wages$Gender, FUN=median)
print("Standard Deviation by Gender")
tapply(wages$Average.Wage, wages$Gender, FUN=sd)

#create a two way table for ID.Gender and Year.Enlisted. Creates table for Gender ID as rows and Year Enlisted as column
print("Two Way Table")
table(wages$ID.Gender, wages$Year.Enlisted)

# Random sample size n
n <- 30

Sample <- sample(wages$Average.Wage, n) 

#Part 2
# Find wages that meet the given criteria ( > 65000 )
x <- wages$Average.Wage[wages$Average.Wage > 65000]
# Find probability 
p = length(x) / length(wages$Average.Wage)
# Round to 4 decimal places
print("Probability that an Average Wage is > $65,000: ")
sprintf("%.2f%%", p * 100)

#This gives values between 70000 and 80000
x <- wages$Average.Wage[wages$Average.Wage > 70000 & wages$Average.Wage < 80000]
p=length(x)/length(wages$Average.Wage)
print("Percentage of wages are between $70,000 and $80,000 ")
sprintf("%.2f%%", p * 100)

#Part 3
X<-wages$Average.Wage
N<-1000

Y <- matrix(nrow=30, ncol=N)
wage_mean <- vector()
wage_variance <- vector()
for (i in 1:N) {
    Y[,i] <- sample(wages$Average.Wage, 30)
    wage_mean[i] <- mean(Y[,i])
    wage_variance[i] <- var(Y[,i])
}

hist(wage_mean,freq=F,main='Distribution of Sample Means')
lines(density(wage_mean),lwd=1, col='red')
hist(wage_variance,freq=F,main='Distribution of the Sample Variances')
lines(density(wage_variance),lwd=1, col='red')

#Wages of radnom sample mean that are > 50000
x<-wage_mean[wage_mean > 50000]
p= length(x)/length(wage_mean)
print("Probability that a randomly selected sample mean is > $50,000")
sprintf("%.4f%%", p * 100)

x<- wage_mean[wage_mean > 45000 & wage_mean < 55000]
p=length(x)/length(wage_mean)
print("Probability that a randomly selected sample mean is between $45,000 and $55,000 ")
sprintf("%.4f%%", p * 100)


