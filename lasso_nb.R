########### apply lasso  ################################
# https://web.stanford.edu/~hastie/glmnet/glmnet_alpha.html
library(glmnet) # lasso package

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
# ECoG_after OAE_before OAE_after Treatment   X
# 1         NA       <NA>      <NA>         D Yes
# 2         NA   abnormal      <NA>         A Yes
# 3         NA       <NA>  abnormal         D Yes
# 4         NA   abnormal    normal         D Yes
# 5         NA       <NA>  abnormal         C Yes
# 6         NA       <NA>      <NA>         D Yes

mydata <- ALTI_poster_2018
mydata <- subset(mydata, select = -c(ID, ECoG_after, OAE_after, Treatment, X)) # Input variables
mydata <- mydata[complete.cases(mydata),] # NA remove

features <- mydata[,!(names(mydata) %in% "Recur_yes")] # Input variables
target <- mydata[,(names(mydata) %in% "Recur_yes")] # Target to be classified

## If categorical variables exist
features_sparse<- sparse.model.matrix(~  ., features) 

glmmod <-glmnet(features_sparse, target, family="binomial", # 
                alpha=1,                  # alpha=1 is the lasso penalty   
                standardize = F       # x variable standardization, prior to fitting the model 
)

plot(glmmod,xvar="lambda");grid()


##  Cross-validation for glmnet with 
cvglmmod <- cv.glmnet(features_sparse, target,
                      family="binomial",
                      #weights = 1,
                      #offset,
                      lambda = NULL,
                      type.measure = "deviance",
                      nfolds = 10,
                      #foldid,
                      grouped = FALSE,
                      keep = FALSE,parallel = FALSE, standardize = F) 
plot(cvglmmod)
#coef(glmmod)[,glmmod$lambda==cvglmmod$lambda.min]
coef(glmmod)[,12]  # 
