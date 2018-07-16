# flist <- c("Sex", "Tinnitus", "Dizziness",
#                    "OAE_before","OAE_after", "Treatment", "X" )
# > head(ALTI)
# ID Sex Age Timetotreat Recur_yes Recur_no X250Hz_before X500Hz_before X2000Hz_before X4000Hz_before
# 1   85   f  48           7        No        O            70            40             20             15
# 2  666   f  33           3       Yes     <NA>            55            40             15             10
# 3 1714   f  52           1        No        O            40            30             25             25
# 4 1950   f  45           1        No        O            55            50             15             20
# 5 2171   f  54           2        No        O            55            40             25             20
# 6 2607   f  32           1        No        O            50            45             15             10
# X250Hz_after X500Hz_after Tinnitus Dizziness ECoG_before ECoG_after OAE_before OAE_after Treatment   X
# 1           25           15      Yes       Yes        0.31         NA       <NA>      <NA>         D Yes
# 2           10           10      Yes        No        0.44         NA   abnormal      <NA>         A Yes
# 3           25           15      Yes        No        0.17         NA       <NA>  abnormal         D Yes
# 4           15           10      Yes        No        0.35         NA   abnormal    normal         D Yes
# 5           25           15      Yes        No        0.40         NA       <NA>  abnormal         C Yes
# 6           15           15       No       Yes        0.33         NA       <NA>      <NA>         D Yes
# ### Draw Bar-plot

par(mfrow=c(2,4))
par(ps = 14, cex = 1, cex.main = 2)
options(digits = 3)

chi_result <- list()

for(i in 1:length(flist)){
  freqs <- xtabs(~ ALTI[,flist[i]] + ALTI[, "Recur_yes"], 
                 data = ALTI)
  chi_result[[i]] <- summary(xtabs(~ ALTI[,flist[i]] + ALTI[, "Recur_yes"], 
                                   data = ALTI))
  pal_num <- length(levels(factor(ALTI[,flist[i]])))
  palette(gray.colors(pal_num, start = 0.3, end = 0.9, gamma = 2.2, alpha = NULL))
  xx <- barplot(xtabs(~ ALTI[,flist[i]] + ALTI[, "Recur_yes"], 
                      data = ALTI), ylab = flist[i],
                col =  palette(),
                ylim = c(0, max(freqs)+30),
                #col=c("blue","red"),
                beside=TRUE)
  ## Add text at top of bars
  text(x = xx, y = freqs, label = freqs, 
       pos = 3, cex = 1, col = "black")
  
  legend("topleft", legend=as.character(levels(factor(ALTI[,flist[i]]))), 
         text.col="black",
         fill = palette(),
         bty = "n",            # No box around legend
         border ="black" ) # lty = 1:2 ; line and dotted  
}
