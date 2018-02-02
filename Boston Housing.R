#Run this once
#install.packages('mlbench')
library(mlbench)
#http://rss.acs.unt.edu/Rdoc/library/mlbench/html/BostonHousing.html 
data(BostonHousing)
#medv   median value of owner-occupied homes in USD 1000's
# inspect the range which is 1-50
summary(BostonHousing$medv)
str(BostonHousing)

##
## model linear regression (lm command)  

lm.fit <- lm(medv ~ ., data=BostonHousing)
#This provides the summary.
summary(lm.fit)

#This provides a prediction
lm.predict <- predict(lm.fit)

#mean=22.53
mean(BostonHousing$medv)
# mean squared error: 21.89483
mean((lm.predict - BostonHousing$medv)^2) 

#This manually calcuates the R2
1-sum((lm.predict - BostonHousing$medv)^2)/sum((BostonHousing$medv-mean(BostonHousing$medv))^2)

#plot theoretical vs actual.
plot(BostonHousing$medv, lm.predict,
     main="Linear regression predictions vs actual",
     xlab="Actual")
