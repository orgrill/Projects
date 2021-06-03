library(mosaic)
df <- read.csv("data3.csv")
str(df)

#This calculates the Minimum, Maximum, Median, Mean, Q1, Q3, and Standard Deviation that is shown in Table 1 and part of Table 2
favstats(~Height | Gender, data=df)

#This generates a PDF file for all the graphs listed below. 
pdf("data.pdf")
#This is a BoxPlot
bwplot(Gender~Height, data=df, main = "Box Plot" , col = "turquoise")
#Histogram
histogram(~Height, data=df, main = "Height of Kids" , col = "turquoise")
#DotPlot
dotPlot(~Height, groups= Gender, data=df, main = "Dot Plot" , xlab="Height in cm")
#Histrogram broken up by gender 
histogram(~Height | Gender, data=df, main = "Histrogram w/ Gender" , xlab = "Height in cm", layout= c(1,2) , col = "turquoise")
#This creates a scatter plot
xyplot(Height~Age, data=df, main = "Height and Age" , xlab = "Height in cm" , ylab = "Age in years" , type = c("p","r"), pch = 16, cex = 1.2 , col = "turquoise") 
dev.off()

#This calculates the correlation coefficient which ended up being 0.3781
(correlation <- cor(Height ~ Age, data=df, use = "complete.obs"))

