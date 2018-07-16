########### inverse lamda = 15
svmfit <- svm(x,y, kernel = "radial",  # x = inputs, y = tartget
              cost = 15, scale = T) 

# compute decision values
predc <- predict(svmfit, x, decision.values = TRUE) #logistic theta'x values;attr(predc, "decision.values") 
pre_auc <- prediction(attr(predc, "decision.values"), y)
perf_auc <- performance(pre_auc,"tpr","fpr")

# plotting the ROC curve
plot(perf_auc,  colorize=T, lwd= 3,
     main= " ROC curves ")
