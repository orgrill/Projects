#1
female <- c(57,59,78,60,65,68,71,75,48,51,55,56,41,43,44,75,80,81,83,83,85)
male <- c(48,49,49,30,30,31,32,35,37,41,86,41,51,53,56,42,44,50,51,65,67,51,56,58,64,64,75)

# 2
#   Create vector of gender labels versus typing out individually for all the values
gender <- c(rep('Female', length(female)), rep('Male', length(male)))
#   Create score vector
score = c(female,male)
# Combine gender and scores into a factor vector
data = data.frame(score, gender)
print(data)
