#question 1 :
X<-c(4,5,3,0,1,3,2,1,5,4,1,0,1,2,0,3,2)
Y<-c(14.56196403,16.30523747,13.03231248,0.7624644178,3.771966119,12.65243301,4.351901787,3.517254932,13.40097014,11.45176186,5.83523421,1.038325237,3.39033369,8.139768032,-2.602850041,7.929069703,8.357753776)
#question 2 :
plot(X,Y,main = "Scatterplot of X and Y", xlab = "X", ylab = "Y")
#question 3 :
regXY<-lm(Y ~ X)
#question 4 :
plot(X,Y,main = "Scatterplot of X and Y with Regression Line", xlab = "X", ylab = "Y")
abline(regXY$coefficients)
#question 5 :
anova(regXY)
DfX<-1
DfR<-15
TSS <- sum((Y - mean(Y))^2)
FSS <- sum((predict(regXY) - mean(Y))^2)
RSS <- sum(regXY$residuals^2)
MSX <- FSS/DfX
MSR <- RSS/DfR
FX <- MSX/MSR
PX <- pf(FX, 1, 15, lower.tail = FALSE)
print("         Df   Sum Sq   Mean Sq   F-value   P-value")
sprintf("X      %d   %f   %f    %f    %f ",DfX,TSS,MSX,FX,PX)
sprintf("Residuals %d   %f   %f  ",DfR,RSS,MSR)
#question 6 :
confint(regXY,level = 0.05)
#question 7 :
a<-summary(regXY)
t_value<-qt(0.475,df=15)
sprintf("the confidence interval of the intercept with confidence 5percent is :[%f  %f]",a$coefficients[1]+t_value*a$coefficients[3],a$coefficients[1]-t_value*a$coefficients[3])
sprintf("the confidence interval of the slope with confidence 5percent is :[%f  %f]",a$coefficients[2]+t_value*a$coefficients[4],a$coefficients[2]-t_value*a$coefficients[4])
#question 8 :
new_data <- data.frame(X = 500)
predict(regXY,newdata = new_data)