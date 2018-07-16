
library(e1071) # SVM package
library(caret) # Confusion matrix
# > head(ALTI_poster)

# ID Sex Age Timetotreat Recur_yes X250Hz_before X500Hz_before X2000Hz_before
# 1   85   f  48           7        No            70            40             20
# 2  666   f  33           3       Yes            55            40             15
# 3 1714   f  52           1        No            40            30             25
# 4 1950   f  45           1        No            55            50             15
# 5 2171   f  54           2        No            55            40             25
# 6 2607   f  32           1        No            50            45             15
# X4000Hz_before X250Hz_after X500Hz_after Tinnitus Dizziness ECoG_before
# 1             15           25           15      Yes       Yes        0.31
# 2             10           10           10      Yes        No        0.44
# 3             25           25           15      Yes        No        0.17
# 4             20           15           10      Yes        No        0.35
# 5             20           25           15      Yes        No        0.40
# 6             10           15           15       No       Yes        0.33

# Feature selection
x <- subset(features, select = c("Timetotreat", "X2000Hz_before", "X4000Hz_before",
                                 "X250Hz_after", "X500Hz_after"))
y <- target

Lagm <- seq(0.1, 20, by=0.1) # Lagrange multiplier inverse lamda

mylist <- list(invlamda=c(), result=c()) 
myresult <- rep(list(mylist), length(Lagm)) # lists ( 2 by length(Lagm))

for (i in 1:length(Lagm)){ 
  svmfit <- svm(x,y, kernel = "radial",
                cost = Lagm[i], scale = T)
  
  pred <- fitted(svmfit) # test with train data
  Per <- table(pred, y) # Check accuracy:
  
  result <- confusionMatrix(pred, y, positive = 'Yes') # Accuracy, Sensitivity, ...
  
  myresult[[i]]$lamda <- cvalue[i]
  myresult[[i]]$result <- confusionMatrix(pred, y, positive = 'Yes')
}

## Extract Acc, Sensitivity, Specificity
lamda <- sapply(myresult, function(x){as.numeric(x[1])})
acc <- sapply(myresult, function(x){as.numeric(x$result$overall[1])})
sen <- sapply(myresult, function(x){as.numeric(x$result$byClass[1])})
spe <- sapply(myresult, function(x){as.numeric(x$result$byClass[2])})

# plot ACC, Sensitivity, Specificity
plot(lamda, acc, type="b", pch=21, col="red", lty=3, ylim=c(0, 1))
lines(lamda, sen,,col="green",lwd=2)
lines(lamda, spe,,col="blue",lwd=2)

legend("bottomright", legend=c("Accuracy", "Sensitivity", "Specificity"), 
       col=c("red","green", "blue"), pch = "o", bty = "n",            # No box around legend
       lty = 2)  #lty = 2; dotted


