# fill the boxes of  a boxplot with filling patterns/texture instead of colours
boxplot.pattern <- function(formula, npatterns=FALSE, data = NULL, ...){
  bp <- boxplot(formula, data=data,  ...)
  ngroups <- length(bp$names)# get number of groups in total
  ifelse(npatterns==FALSE, npatterns <- ngroups, npatterns <- npatterns) # the get number of patterns
  
  dval <- rep(20*c(0:(npatterns-1)), length = ngroups) # density vals for each group
  aval <- rep(20*c(0:(npatterns-1)), length = ngroups) # angle vals for each group
  rect((1:ngroups)-.4, bp$stats[2,], (1:ngroups)+.4, bp$stats[4,], 
       density=dval, angle=aval) # draw the rectangles
}


# test
set.seed(42)
DF1 <- data.frame(x1 = rep(letters[1:3], lengthout=150), x2 = factor(rep(1:2, lengthout=150), labels = c("Yes", "No")), y = rnorm(150))
str(DF1)

# There are six conditions in this case: x1(3 levels)*x2(2 levels)=6
# If we want to check the inertaction of x1 and x2, we can set the types of pattern = 3.
boxplot.pattern(y ~ x1*x2, data=DF1, npatterns=3)


DF2 <- data.frame(grp = rep(letters[1:3], lengthout=150), y = rnorm(150))
str(DF2)
boxplot.pattern(y ~ grp, data=DF2)


require(grDevices)
## set up the plot region:
op <- par(bg = "thistle")
plot(c(100, 250), c(300, 450), type = "n", xlab = "", ylab = "",
     main = "2 x 11 rectangles; 'rect(100+i,300+i,  150+i,380+i)'")
i <- 4*(0:10)
## draw rectangles with bottom left (100, 300)+i
## and top right (150, 380)+i
rect(100+i, 300+i, 150+i, 380+i, col = rainbow(11, start = 0.7, end = 0.1))
rect(240-i, 320+i, 250-i, 410+i, col = heat.colors(11), lwd = i/5)
## Background alternating  ( transparent / "bg" ) :
j <- 10*(0:5)
rect(125+j, 360+j,   141+j, 405+j/2, col = c(NA,0),
     border = "gold", lwd = 2)
rect(125+j, 296+j/2, 141+j, 331+j/5, col = c(NA,"midnightblue"))
mtext("+  2 x 6 rect(*, col = c(NA,0)) and  col = c(NA,\"m..blue\")")

## an example showing colouring and shading
plot(c(100, 200), c(300, 450), type= "n", xlab = "", ylab = "")
rect(100, 300, 125, 350) # transparent
rect(100, 400, 125, 450, col = "green", border = "blue") # coloured
rect(115, 375, 150, 425, col = par("bg"), border = "transparent")
rect(150, 300, 175, 350, density = 10, border = "red")
rect(150, 400, 175, 450, density = 30, col = "blue",
     angle = -30, border = "transparent")

legend(180, 450, legend = 1:4, fill = c(NA, "green", par("fg"), "blue"),
       density = c(NA, NA, 10, 30), angle = c(NA, NA, 30, -30))

par(op)