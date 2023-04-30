#Ex2:
X=matrix(c(1,1,3,-1,-1,3,1,1,-3,-1,-1,-3,1,-1,0,-1,1,0),nrow=6,byrow = TRUE)
#question 1: The standardized data matrix Z:

Z=scale(X,center=TRUE,scale=TRUE)

Z

#question 2: The correlation matrix Rx:
Rx=cor(Z)

Rx

#question 3: The spectrum of Rx:
e=eigen(Rx)

eigenvalues=e$values

eigenvalues
#question 4: The principle components matrix Cx:
U=e$vectors
U
C=Z%*%U
C

#question 5: The principle components we should retain.
#Eigenvalue criterion:
#The eigenvalues of the correlation matrix R are:
eigenvalues

#This tells us that we should only retain the first two components.

#Proportion of the total variance criterion
pca=prcomp(Rx)
summary(pca)

#here also the proportion of variance table tells us that we should 
#retain only two components.which they explains 100% of the initial data 

#Ex3:
X=data.frame(CUB= c(5,4,2,5,4,2,3,1,0,2,1,4,3,1,2),
                   PUZ= c(5,3,1,3,4,0,3,2,1,0,2,2,2,0,1),
                   CAL= c(4,3,2,5,3,1,4,1,0,1,1,4,3,0,1),
                   MEM= c(0,2,3,3,2,3,2,4,3,3,1,2,3,3,2),
                   COM= c(1,2,2,4,3,1,4,3,1,1,0,1,2,2,3),
                   VOC= c(1,1,2,3,2,1,4,3,0,0,1,2,3,2,2))
#question 1: The standardized data matrix Z:

Z=scale(X,center=TRUE,scale=TRUE)

Z

#question 2: The correlation matrix Rx:
Rx=cor(Z)

Rx

#question 3: The spectrum of Rx:
e=eigen(Rx)

eigenvalues=e$values

eigenvalues
#question 4: The principle components matrix Cx:
U=e$vectors
U
C=Z%*%U
C

#question 5: The principle components we should retain.
#Eigenvalue criterion:
#The eigenvalues of the correlation matrix R are:
eigenvalues

#This tells us that we should only retain the first two components.

#Proportion of the total variance criterion
pca=prcomp(Rx)
summary(pca)

#here also the proportion of variance table tells us that we should 
#retain only two components.which they explains 97% of the initial data 
