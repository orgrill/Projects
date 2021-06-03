#Part 1
print("----------------PART 1------------------")
wages<-read.csv(file="~/Homework/prob/wages.csv")

print(wages)

str(wages)
dim(wages)
summary(wages)


for (i in 1:length(wages$Degree.Type)) {
    wages$Degree.Level[i] <- switch(wages$Degree.Type[i],
                                    "High School Degree" = 1,
                                    "High School Degree and Certificate" = 1,
                                    "Associate's Degree and Certificate" = 2,
                                    "Associate's Degree and/or Certificate" = 2,
                                    "Bachelor's Degree" = 3,
                                    "Bachelor's Degree and Certification" = 3,
                                    "Master's Degree" = 4)
}

wages$Average.Wage <- gsub('[$,]','',wages$Average.Wage)
wages$Average.Wage <- as.numeric(wages$Average.Wage) 

print("Maximum Wages Across Degree Levels")
tapply(wages$Average.Wage, wages$Degree.Level, max)
print("Mean Wages Across Degree Levels")
tapply(wages$Average.Wage, wages$Degree.Level, mean)
print("Minimum Wages Across Degree Levels")
tapply(wages$Average.Wage, wages$Degree.Level, min)
print("Median Wages Across Degree Levels")
tapply(wages$Average.Wage, wages$Degree.Level, median)
print("Standard Deviation for Wages Across Degree Levels")
tapply(wages$Average.Wage, wages$Degree.Level, sd)

#Part 2
print("----------------PART 2------------------")
N<-1000
n<-40 

Y<- matrix(nrow=n,ncol=N)

Means <- vector()
Variances <- vector()
for (i in 1:N) {
    Y[,i]<-sample(wages$Average.Wage,n)
    Means[i]<- mean(Y[,i])
    Variances[i]<-var(Y[,i])
}

print("Means (summary)")
print(summary(Means))
print("Variances (summary")
print(summary(Variances))



#Part 3
print("----------------PART 3------------------")
print("Probability of 50000<Y<52000")
p <- length(Means[Means > 52000]) / length(Means[Means > 50000])
sprintf("%.4f%%", p * 100)

print("Probability of Y<52000 and 49000<Y<55000")
p <- length(Means[Means > 52000]) / length(Means[Means > 49000 & Means < 55000])
sprintf("%.4f%%", p * 100)

#Part 4a
print("----------------PART 4a------------------")
print("Half Original Sample Size")
wages_sample<-wages[sample(1:nrow(wages),round(dim(wages)[1])/2,0),]
dim(wages_sample)

#Part 4b
print("----------------PART 4b------------------")
a <- wages_sample$Average.Wage[wages_sample$Average.Wage < 50000 & wages_sample$Degree.Level == 3]
b <- wages_sample$Degree.Level[wages_sample$Degree.Level == 3]
Probability_4ii <- length(a) / length(b)
Probability_4ii <- round(Probability_4ii, 4)
print("Probability for 4B")
print(Probability_4ii)

#Part 4c 
print("----------------PART 4c------------------")
degree_table = vector()
for (i in 1:4) {
    a <- wages_sample$Average.Wage[wages_sample$Average.Wage < 50000 & wages_sample$Degree.Level == i]
    b <- wages_sample$Degree.Level[wages_sample$Degree.Level == i]
    c <- length(a) / length(b)
    degree_table[i] <- round(c, 4)
}
print("Average Wage is <50000 for all i")
print(degree_table)

#Part 4d
print("----------------PART 4d------------------")
degree_table = vector()
for (i in 1:4) {
    a <- wages_sample$Average.Wage[wages_sample$Average.Wage > 80000 & wages_sample$Degree.Level == i]
    b <- wages_sample$Degree.Level[wages_sample$Degree.Level == i]
    c <- length(a) / length(b)
    degree_table[i] <- round(c, 4)
}
print("Average Wage >80000 for all i")
print(degree_table)

#Part 5a
print("----------------PART 5a------------------")
degree_table = vector()
for (i in 1:4) {
    a <- wages_sample$Average.Wage[wages_sample$Average.Wage > 70000 & wages_sample$Degree.Level == i]
    b <- wages_sample$Degree.Level[wages_sample$Degree.Level == i]
    c <- length(a) / length(b)
    degree_table[i] <- round(c, 4)
}
print("Average Wage >70000 for all i")
print(degree_table)

#Part 5b
print("----------------PART 5b------------------")
degree_table = vector()
for (i in 1:4) {
    a <- wages_sample$Average.Wage[wages_sample$Average.Wage > 70000 & wages_sample$Degree.Level == i]
    b <- wages_sample$Average.Wage[wages_sample$Average.Wage > 70000]
    c <- length(a) / length(b)
    degree_table[i] <- round(c, 4)
}
print("Randomly selected i, wage is >70000")
print(degree_table)


print("----------------PART 5c------------------")
a<-length(wages_sample$Average.Wage[wages_sample$Average.Wage>70000])
b<-length(wages_sample$Average.Wage)
p_A<-round(a/b, 4)

p_B <- vector()
for (i in 1:4) {
    a <- length(wages_sample$Degree.Level[wages_sample$Degree.Level == i])
    b <- length(wages_sample$Degree.Level)
    p_B[i] = round(a/b, 4)
}

p_AB <- vector()
for (i in 1:4) {
    a <- wages_sample$Average.Wage[wages_sample$Average.Wage > 70000 & wages_sample$Degree.Level == i]
    b <- wages_sample$Degree.Level[wages_sample$Degree.Level == i]
    c <- length(a) / length(b)
    p_AB[i] <- round(c, 4)
}

#Finding P(B|A) using Bayes' law
p_BA = p_AB * p_B / p_A
print("P(B|A) using Bayes' law = ")
print(p_BA)