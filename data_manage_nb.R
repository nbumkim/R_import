
#> str(prob)
#Factor w/ 2 levels "0","1": 2 1 1 2 1 1 2 1 2 2 ...
#- attr(*, "names")= chr [1:434] "100012" "100263" "100483" "100577" ...
#- attr(*, "probabilities")= num [1:434, 1:2] 0.68 0.258 0.361 0.522 0.377 ...
#..- attr(*, "dimnames")=List of 2
#.. ..$ : chr [1:434] "100012" "100263" "100483" "100577" ...
#.. ..$ : chr [1:2] "1" "0"

## Access to attr
#####################################
plot(attr(prob, "probabilities")[,2] ,imDF[,"Group"])


## access the list structure 
####################################
names(mylist) <- c("rose", "iris", " lisa")

mylist[["fun"]][1]
mylist$fun[1]
mylist[[1]][1]

## access beta values of regression result
####################################a

regression_data <- lm(Wind ~ Solar.R, data = airquality )
ls(regression_data)

# > ls(regression_data)
# [1] "assign"        "call"          "coefficients"  "df.residual"   "effects"      
# [6] "fitted.values" "model"         "na.action"     "qr"            "rank"         
# [11] "residuals"     "terms"         "xlevels"

# > typeof(regression_data)
# [1] "list"

# > regression_data$coefficient
# (Intercept)      Solar.R 
# 10.414831277 -0.002212678

regression_data$coefficients[[1]] #10.41483
regression_data$coefficients[[2]] #-0.002212678
regression_data$coefficients["Solar.R"][[1]] #-0.002212678

attributes(regression_data$coefficient)[[1]][1] #"(Intercept)"
attributes(regression_data$coefficient)[[1]][2] #""Solar.R"
 

a <- regression_data$coefficients[2] 
# > typeof(a)
# [1] "double, Nambed num


## Change from one type ot another
####################################
as.data.frame()
as.numeric()
as.factor()
as.logical()


## Select the data subset
###########################
T0_pos_n = subset(p_T0_pos, (p_T0_pos$pid %in% T0_nodules$pid))

# > head(mtcars)
# mpg cyl disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
# Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
mtcars_subset_0 <- subset(mtcars, (am == 1 & cyl == c(4, 6)), 
                          select = c( mpg, cyl, am )) #subset(x, subset, select, drop = FALSE, ...)

subset(airquality, Temp > 80, select = c(Ozone, Temp))
subset(airquality, Day == 1, select = -Temp)
subset(airquality, select = Ozone:Wind)

# > head(airquality)
#     Ozone Solar.R Wind Temp Month Day
# 1    41     190  7.4   67     5   1
# 2    36     118  8.0   72     5   2
# 3    12     149 12.6   74     5   3
# 4    18     313 11.5   62     5   4
# 5    NA      NA 14.3   56     5   5
# 6    28      NA 14.9   66     5   6      

with(airquality, subset(Ozone, Temp > 80))

## sometimes requiring a logical 'subset' argument is a nuisance
nm <- rownames(state.x77)
start_with_M <- nm %in% grep("^M", nm, value = TRUE)
subset(state.x77, start_with_M, Illiteracy:Murder)
# but in recent versions of R this can simply be
subset(state.x77, grepl("^M", nm), Illiteracy:Murder)


## Select the data subset
###########################
mymatrix <- array(sample(1:40, 16, replace=T), dim = c(4,4))
which.max(mymatrix) # max index
which.min(mymatrix)
which(mymatrix %% 2 == 0)
# > which(mymatrix %% 2 == 0)
# [1]  1  3  4  5  7  8 12 13 14

which(mymatrix %% 2 == 0, arr.ind=TRUE)
> which(mymatrix %% 2 == 0, arr.ind=TRUE) #which(x %% 2 == 0, arr.ind=TRUE, useNames = FALSE)
# row col
# [1,]   1   1
# [2,]   3   1
# [3,]   4   1
# [4,]   1   2
# [5,]   3   2
# [6,]   4   2
# [7,]   4   3
# [8,]   1   4
# [9,]   2   4

nlst_ct <- participant[which(participant$rndgroup == '1'), ]


## Renames the colume name
###########################
names(feature_list_new)[names(feature_list_new) == 'PID'] <- 'pid'
colnames(mynlst)[] <-"pid"



###########################################################################
#######   make the colume and row names
############################################################################

t1 <- as.data.frame(cbind(sct_abnormalities$SCT_AB_NUM[1:100], sct_abnormalities$pid[1:100]))
colnames(t1, do.NULL = TRUE, prefix = "col")
colnames(t1) <- c("SCT_AB_NUM", "pid")

DF$date = rownames(DF)
############################################
## Make group integers
###########################################

AVN <- read.csv("AVN.csv", header = TRUE) # read the csv data
Control <- read.csv("Control.csv", header = TRUE) # read the csv data

Var_lasso$byCompact <- ifelse(Var_lasso$Compactness.2 > 
                                median(Var_lasso$Compactness.2), 
                              c("high"), c("low")) 

Var_lasso$byVar <- ifelse(Var_lasso$Variance > 
                            median(Var_lasso$Variance), 
                          
                          
## Select the variables
                        AVN <- subset(AVN, select=c("PostC5", "PostC6", "Postcomposit",
                                                      "Visual", "Vest", "Ref"))
                          AVN <- AVN[complete.cases(AVN),] 
                          
                          Control <- subset(Control, select=c("PostC5", "PostC6", "Postcomposit",
                                                              "Visual", "Vest", "Ref"))
                          Control <- Control[complete.cases(Control),]
                          
                          ############################################################
                          ############ Change the columne orders
                          
                          LSAs_Outlier_2 <- LSAs_Outlier[c(1,9,2:8)] # column 9 moves column 2
                          
                          
                          ############################################################
                          ############ Change "" into missing ?
                          
                          LerVal$Medication[which(LerVal$Medication=="")] <-NA
                          LerVal$Sex[which(LerVal$Sex=="")] <-NA
                          
                          
                          ############################################################
                          ############ Row mean and sum
                          
                          LerVal.BHI$Base <- rowMeans(LerVal.BHI[,c(6,8)])
                          LerVal.BHI$After <- rowMeans(LerVal.BHI[,c(7,9)])
                          
                          LerVal.BHI$Diff <- LerVal.BHI$Base - LerVal.BHI$After
                          
                          apply(OxyBOLD.rois, 2, mean) # mean
                          
                          #> head(OxyBOLD.rois)
                          #Cingulum  Frontal    Hippo Occipital Parietal Temporal Thalamus id
                          #1 199.8995 151.1071 179.4961  177.2714 208.7633 152.5094 190.1156  1
                          #2 199.2443 151.3356 179.2155  177.6035 209.0535 152.7188 189.4888  2
                          #3 198.9602 150.7635 178.5874  176.5925 208.2231 152.2928 188.5305  3
                          #4 199.0933 150.6479 178.9077  176.4977 208.3255 152.3233 189.0533  4
                          #5 199.0564 150.9411 179.1762  176.9720 209.1870 152.6740 189.5373  5
                          #6 199.0921 150.9626 178.7903  177.2954 208.8174 152.6743 189.1837  6
                          
                          #> apply(OxyBOLD.rois, 2, mean) # mean
                          #Cingulum   Frontal     Hippo Occipital  Parietal  Temporal  Thalamus 
                          #203.7581  152.8810  184.7661  178.9182  212.4292  156.6524  195.3302 
                          
                          # Matrix display without row and columes names
                          ############################################################
                          print.matrix <- function(m){
                            write.table(format(m, justify="right"),
                                        row.names=F, col.names=F, quote=F)
                          }
                          
                          print.matrix(mat[1:20])
                          
                          # cbind
                          ##############################################################
                          
                          Pathology.table = table(SPN1$Pathology_2)
                          cbind(Pathology.table)
                          
                          # duplicate vector into matrix r
                          ##############################################################
                          type <- SPN1$Dx   # Levels: Benign(-1) < Malgnant(1)
                          type_all <- matrix(type ,nrow=length(type),ncol=4, byrow=F)
                          
                          
                          
                          # ????????
                          ##############################################################
                          class(rocr_TmL)
                          slotNames(rocr_TmL)
                          sn = slotNames(rocr_TmL)
                          sapply(sn, function(x) length(slot(rocr_TmL, x)))
                          sapply(sn, function(x) class(slot(rocr_TmL, x)))
                          #sapply(sn, function(x) length(x))
                          #sapply(sn, function(x) class(x))
                          
                          
                          
                          
                          #####################
                          #####################  Exploratory data analysis
                          
                          decathlon2.active_stats <- data.frame(
                            Min = apply(decathlon2.active, 2, min), # minimum
                            Q1 = apply(decathlon2.active, 2, quantile, 1/4), # First quartile
                            Med = apply(decathlon2.active, 2, median), # median
                            Mean = apply(decathlon2.active, 2, mean), # mean
                            Q3 = apply(decathlon2.active, 2, quantile, 3/4), # Third quartile
                            Max = apply(decathlon2.active, 2, max) # Maximum
                          )
                          decathlon2.active_stats <- round(decathlon2.active_stats, 1)
                          head(decathlon2.active_stats)
                          
                          
                          
                          #################################################
                          # select the cases with some conditions
                          #################################################
                          
                          mynlst <- participant[which(participant$rndgroup == '1' & 
                                                        participant$lesionsize &
                                                        (participant$scr_iso0 == '4'|
                                                           participant$scr_iso1 == '4'|
                                                           participant$scr_iso2 == '4')
                          ), ]
                          
                          ## make integer variables
                          ######################################
                          # mynew <- data.frame(x, y)
                          
                          class.AVN <- data.frame(sample(1, (nrow(AVN)), replace=T))
                          class.Control <- data.frame(sample(0, (nrow(Control)), replace=T))
                          colnames(class.AVN) <- "group"
                          colnames(class.Control ) <- "group"
                          
                          target_pred <- rbind(AVN,Control)
                          target_class <- rbind(class.AVN,class.Control)
                          target <- cbind(target_pred, target_class)
                          
                          ###### based on variable values
                          ######################################
                          nlst_d5 <- nlst_phantom_c[which(nlst_phantom_c$D =='5'),]
                          #& mydata$age > 65), ]
                          nlst_d8 <- nlst_phantom_c[which(nlst_phantom_c$D =='8'),]
                          nlst_d10 <- nlst_phantom_c[which(nlst_phantom_c$D =='10'),]
                          nlst_d20 <- nlst_phantom_c[which(nlst_phantom_c$D =='20'),]
                          
                          ###### Bar-plot
                          ############################################################
                          # Data type of nlst_phantom_c$D
                          #[1] 10 20 20  5  8  8 10 20 20  5 ...
                          #[24]  8 10 20 20  5  8 10 20 20  ...
                          freqs <- table(nlst_phantom_c$D)
                          ylim <- c(0, 1.1*max(freqs))
                          
                          xx <- barplot(table(nlst_phantom_c$D), main = "Diameter distribution",
                                        ylim = ylim,
                                        xlab = " Lung nodule diameter", 
                                        ylab = "Number of count",
                                        names.arg=c("5 mm", "8 mm", "10 mm", "20 mm"))
                          
                          ## Add text at top of bars
                          text(x = xx, y = freqs, label = freqs, 
                               pos = 3, cex = 0.8, col = "red")
                          
                          
                          ############################################
                          ## Box-plot
                          ###########################################
                          
                          par(mfrow=c(2,3))
                          attach(target)
                          ## Maybe plotting by group according to increasing number "0", "1",...
                          
                          boxplot(PostC5 ~ group, main = " PostC5", names = c(" Control", "Dx"),
                                  xlab = " Group", ylab = "Value", 
                                  par(ps = 14, cex = 0.8, cex.main = 1))
                          boxplot(PostC6 ~ group, main = " PostC6", names = c(" Control", "Dx"),
                                  xlab = " Group", ylab = "Value", 
                                  par(ps = 14, cex = 0.8, cex.main = 1))
                          boxplot(Postcomposit ~ group, main = " Postcomposit", names = c(" Control", "Dx"),
                                  xlab = " Group", ylab = "Value", 
                                  par(ps = 14, cex = 0.8, cex.main = 1))
                          boxplot(Visual ~ group, main = " Visual", names = c(" Control", "Dx"),
                                  xlab = " Group", ylab = "Value", 
                                  par(ps = 14, cex = 0.8, cex.main = 1))
                          boxplot(Vest ~ group, main = " Vest", names = c(" Control", "Dx"),
                                  xlab = " Group", ylab = "Value", 
                                  par(ps = 14, cex = 0.8, cex.main = 1))
                          boxplot(Ref ~ group, main = " Ref", names = c(" Control", "Dx"),
                                  xlab = " Group", ylab = "Value", 
                                  par(ps = 14, cex = 0.8, cex.main = 1))
                          
                          
                          ######## Summary statistics by Group
                          #############################################################
                          
                          aggdata <- aggregate(Emotional, by=list(Treatment,Repeat),
                                               FUN=stat.desc )
                          print(aggdata, digits = 1)
                          
                          ## Eliminating blank
                          ###########################
                          ALTI <- apply(ALTI, 2, function(x) gsub(" ", "", x, fixed = TRUE))
                          ALTI[,2][ALTI[,2]=="M"] <- "m"
                          
                          ## Assigning blank with "NA"
                          ###########################
                          ALTI <- apply(ALTI, 2, function(x) gsub("^$|^ $", NA, x))
                          
                          ## Two factor variables cross Tab generation
                          #########################################################
                          xtabs(~ ALTI[,"Sex"] + ALTI[, "Recur_yes"], data = ALTI)
                          #              ALTI[, "Recur_yes"]
                          # ALTI[, "Sex"]  No Yes
                          # f 131  43
                          # m  66  23
                          
                          # check others 
                          #library(pastecs)
                          #library(psych)
                          
                          ######## remove scientific notation in printing
                          #############################################################
                          options(scipen=999)
                          
                          
                          ######## Choose a file interactively.
                          #############################################################
                          
                          file.choose(new = FALSE)
                          data <- read.csv(choose.files(), header = TRUE)
                          
                          
                          ######## R remove part of string
                          #############################################################
                          ATGAS_1121
                          
                          gsub("^.*?_","_","ATGAS_1121")
                          
                          data <- read.csv(choose.files(), header = TRUE)
                          
                          ######## Clear workspace
                          #############################################################
                          rm(list=ls())
                          
                          ######## Make continue variable into categorical
                          #############################################################
                          
                          Intquan <- quantile(fnsc_temp4$Sphericity, probs=seq(0.10,0.80,0.1))
                          fnsc_temp4[,index]<- ifelse(fnsc_temp4$Sphericity > 
                                                        Intquan[i], 
                                                      c("high"), c("low"))
                          
                          ######## Make continue variable into categorical
                          #############################################################
                          
                          varNames <- varNames[!varNames %in% c("Stage", "ID", "Diag_data",
                                                                "Birth","status", "time",
                                                                "Node")]