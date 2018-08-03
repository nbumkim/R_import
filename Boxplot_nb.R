## Data import 
###########################

# setwd("D:/kmong/Pointcc/R")
# mydata <- read.csv("type_R.csv", header = TRUE, stringsAsFactors = T) # read the csv data
# mydata <- mydata[complete.cases(mydata),] 
# > head(mydata)
#      배열타입 각도 측면부 대상종     소요시간 이동거리
# 1        A   45   개방 무당개구리       43       54
# 2        A   45   개방 무당개구리       78       40
# 3        A   45   개방 무당개구리       24       20
# 4        A   45   개방 무당개구리       24       70
# 5        A   45   개방 무당개구리      164       14
# 6        A   45   개방 무당개구리       44       55

## Color setting
library(RColorBrewer)
attach(mydata)

par(cex = 1, cex.main = 1.5, ps =14, cex.lab = 2) # label size
par(mar=c(4.1, 4.1, 4.1, 9.1), xpd=TRUE) # Graph margin size e.g., right side legend
cols <- rainbow(3, s=0.7, v=1.0, alpha=0.5) # color set
#brewer.pal(n = 1, name = "Set1")

boxplot(소요시간 ~ 대상종+배열타입, main = "소요시간", 
            outline = TRUE, las = 1, 
            at = c(1:3, 5:7, 9:11), col=cols,
            names = c("", "A", "", "", "B", "","", "C", ""),
            xlab = " ", ylab = "", #xaxs = FALSE,
            ylim=c(0, max(소요시간)+20)
        )
stripchart(소요시간 ~ 대상종+배열타입,
               vertical = TRUE, method = "jitter",
               pch = 21, col = "maroon", bg = "bisque",
               at = c(1:3, 5:7, 9:11),
               add = TRUE)
legend("topright", fill = cols, legend = levels(mydata$대상종), horiz = F,
       bty ="n", inset=c(-0.25,0))
