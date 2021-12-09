#Loading data into R
project3 <-read.csv(file="~/Homework/linearreg2/proj3.csv")

#Creating data frame
df <- data.frame(x = c(project3))

#make sure to put in family = binomial, diff results if not added
model <- glm(x.Yi ~ x.Xi, df, family = binomial)
summary(model)

#Plotting fitted line of logistic model values to scatter plot of x & y
newdata <- data.frame(x.Xi = seq(min(df$x.Xi), 
                                 max(df$x.Xi), 
                                 len = 30))
newdata$x.Yi = predict(model, 
                       newdata, 
                       type="response")

plot(x.Yi~x.Xi, df, col="blue", main = "Fitted Logistic Response", 
     xlab = "Months in School", ylab = "Turned in Assignment")
lines(x.Yi ~ x.Xi, newdata, col="green", lwd=2)

#Creating a Lowess Smooth Superimposed plot
x <- c(df$x.Xi)
y <- c(df$x.Yi)
plot(x,y, main = "Lowess Smoothed",  xlab = "Months in School", 
     ylab = "Turned in Assignment")
lowess_lines <- lines(lowess(x,y,f=3))

#Checking fit
anova(model, test = "Chisq")

