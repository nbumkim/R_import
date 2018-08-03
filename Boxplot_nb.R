## Data import 
###########################

# setwd("D:/kmong/Pointcc/R")
# mydata <- read.csv("type_R.csv", header = TRUE, stringsAsFactors = T) # read the csv data
# mydata <- mydata[complete.cases(mydata),] 
# > head(mydata)
#      �迭Ÿ�� ���� ����� �����     �ҿ�ð� �̵��Ÿ�
# 1        A   45   ���� ���簳����       43       54
# 2        A   45   ���� ���簳����       78       40
# 3        A   45   ���� ���簳����       24       20
# 4        A   45   ���� ���簳����       24       70
# 5        A   45   ���� ���簳����      164       14
# 6        A   45   ���� ���簳����       44       55

## Color setting
library(RColorBrewer)
attach(mydata)

par(cex = 1, cex.main = 1.5, ps =14, cex.lab = 2) # label size
par(mar=c(4.1, 4.1, 4.1, 9.1), xpd=TRUE) # Graph margin size e.g., right side legend
cols <- rainbow(3, s=0.7, v=1.0, alpha=0.5) # color set
#brewer.pal(n = 1, name = "Set1")

boxplot(�ҿ�ð� ~ �����+�迭Ÿ��, main = "�ҿ�ð�", 
            outline = TRUE, las = 1, 
            at = c(1:3, 5:7, 9:11), col=cols,
            names = c("", "A", "", "", "B", "","", "C", ""),
            xlab = " ", ylab = "", #xaxs = FALSE,
            ylim=c(0, max(�ҿ�ð�)+20)
        )
stripchart(�ҿ�ð� ~ �����+�迭Ÿ��,
               vertical = TRUE, method = "jitter",
               pch = 21, col = "maroon", bg = "bisque",
               at = c(1:3, 5:7, 9:11),
               add = TRUE)
legend("topright", fill = cols, legend = levels(mydata$�����), horiz = F,
       bty ="n", inset=c(-0.25,0))