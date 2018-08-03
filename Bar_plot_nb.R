# setwd("I:/MyExperiment/Statisticrefer_20151229/SinyoungYou/2018_ENT_poster/R")
# mydata <- read.csv("mydata_poster_2018_2.csv", header = TRUE, stringsAsFactors = T)

# > head(mydata)
# X.1   ID Sex Age Time Recur Recur_yes Recur_no X250Hz_before X500Hz_before
# 1   1   85   f  48    7    no      <NA>       no            70            40
# 2   2  666   f  33    3   yes       yes     <NA>            55            40
# 3   3 1714   f  52    1    no      <NA>       no            40            30
# 4   4 1950   f  45    1    no      <NA>       no            55            50
# 5   5 2171   f  54    2    no      <NA>       no            55            40
# 6   6 2607   f  32    1    no      <NA>       no            50            45
# X2000Hz_before X4000Hz_before X250Hz_after X500Hz_after Tinnitus Dizziness
# 1             20             15           25           15      Yes       Yes
# 2             15             10           10           10      Yes        No
# 3             25             25           25           15      Yes        No
# 4             15             20           15           10      Yes        No
# 5             25             20           25           15      Yes        No
# 6             15             10           15           15       No       Yes
# ECoG_ipsilateral ECoG_contralateral ECoG_after OAE_before OAE_after Treatment   X
# 1             0.31                 NA         NA       <NA>      <NA>         D Yes
# 2             0.44               0.13         NA   abnormal      <NA>         A Yes
# 3             0.17               0.38         NA       <NA>  abnormal         D Yes
# 4             0.35               0.13         NA   abnormal    normal         D Yes
# 5             0.40               0.19         NA       <NA>  abnormal         C Yes
# 6             0.33               0.29         NA       <NA>      <NA>         D Yes

# ### Draw Bar-plot
## Graphic parameter
###############################
par(mfrow=c(2,4))
par(ps = 12, cex = 1, cex.main = 1) # ps: the point size of text (but not symbols)
options(digits = 3)

## Set x, y variables to plot
###############################
yVarNam <- c("Sex", "Tinnitus", "Dizziness",
             "OAE_before","OAE_after", "Treatment", "X" )  # Set barplot variables

xVarNam <- c("Recur")



chi_result <- list()  #

for(i in 1:length(yVarNam)){
  
  freqs <- xtabs(~ mydata[,yVarNam[i]] + mydata[, xVarNam],  #yVarNam[1]] = "Sex", 
                 data = mydata)
  # freqs
  #                      mydata[, xVarNam]
  # mydata[, yVarNam[i]] no yes
  #                 No   1   4
  #                 Yes 92  51 
  
  chi_result[[i]] <- summary(xtabs(~ mydata[,yVarNam[i]] + mydata[, xVarNam], 
                                   data = mydata))
  # > chi_result[3]
  # [[1]]
  # Call: xtabs(formula = ~mydata[, yVarNam[i]] + mydata[, xVarNam], data = mydata)
  # Number of cases in table: 160 
  # Number of factors: 2 
  # Test for independence of all factors:
  #   Chisq = 0.23, df = 1, p-value = 0.6
  
  pal_num <- length(levels(factor(mydata[,yVarNam[i]])))
  palette(gray.colors(pal_num, start = 0.3, end = 0.9, gamma = 2.2, alpha = NULL))
  
  xx <- barplot(xtabs(~ mydata[,yVarNam[i]] + mydata[, xVarNam], 
                      data = mydata), ylab = yVarNam[i],
                col =  palette(),
                ylim = c(0, max(freqs)+30),
                #names = c("0", "1 ~ 20", "21 ~ 40", "41 ~ 60", "61 ~ 69", "70"),
                beside=TRUE)
  ## Add text at top of bars
  text(x = xx, y = freqs, label = freqs, 
       pos = 3, cex = 1, col = "black")  # pos: a position specifier for the text
  
  legend("topleft", legend=as.character(levels(factor(mydata[,yVarNam[i]]))), 
         text.col="black",
         fill = palette(),
         bty = "n",            # No box around legend
         border ="black" ) # lty = 1:2 ; line and dotted  
}
