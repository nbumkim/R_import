#https://www.datacamp.com/community/tutorials/r-tutorial-apply-family

#####aggregate() 
########################################
#Splits the data into subsets, computes summary statistics for each
#aggregate(x, by, FUN, ..., simplify = TRUE, drop = TRUE)
#aggregate(formula, data, FUN, ..., subset, na.action = na.omit)

# > head(state.x77)
# Population Income Illiteracy Life Exp Murder HS Grad Frost   Area
# Alabama          3615   3624        2.1    69.05   15.1    41.3    20  50708
# Alaska            365   6315        1.5    69.31   11.3    66.7   152 566432
# Arizona          2212   4530        1.8    70.55    7.8    58.1    15 113417
# Arkansas         2110   3378        1.9    70.66   10.1    39.9    65  51945
# California      21198   5114        1.1    71.71   10.3    62.6    20 156361
# Colorado         2541   4884        0.7    72.06    6.8    63.9   166 103766

aggregate(state.x77, list(Region = state.region), mean)

## Compute the averages according to region and the occurrence of more
## than 130 days of frost.
aggregate(state.x77,
          list(Region = state.region,
               Cold = state.x77[,"Frost"] > 130),
          mean)

## example with character variables and NAs
testDF <- data.frame(v1 = c(1,3,5,7,8,3,5,NA,4,5,7,9),
                     v2 = c(11,33,55,77,88,33,55,NA,44,55,77,99) )

by1 <- c("red", "blue", 1, 2, NA, "big", 1, 2, "red", 1, NA, 12)
by2 <- c("wet", "dry", 99, 95, NA, "damp", 95, 99, "red", 99, NA, NA)

aggregate(x = testDF, by = list(by1, by2), FUN = "mean")


#####apply() 
########################################
#apply(array[matrix], margin, fun, ...) # ...	optional arguments to FUN.
# a <- array(sample(1:40, 12, replace=T), dim = c(4,3))
# > a
# [,1] [,2] [,3]
# [1,]    1    5    9
# [2,]    2    6   10
# [3,]    3    7   11
# [4,]    4    8   12
apply(a, 2, max)  # margin 1->rows, 2-> column
# >> [1] 30 29 33
#lapply(a, max)  # margin 1->rows, 2-> column
# >> [1] 30 29 33

b <- array(sample(1:40, 24, replace=T), dim = c(4,3,2))
apply(b, c(1,2), max)  # margin 1->rows, 2-> column

# > apply(b, c(1,2), max)  # margin 1->rows, 2-> column
# [,1] [,2] [,3]
# [1,]   29   33   37
# [2,]   13   13   26
# [3,]   16   40    3
# [4,]   32   14   30


apply(cars, 2, mean, na.rm = T)
apply(cars, 2, function(x) { x*2 + 1 })
#speed dist
#[1,]     9    5
#[2,]     9   21
#[3,]    15    9
#[4,]    15   45

myfunc <- function(x){
  y <- cos(x)
}

apply(a, 1, myfunc)

#####lapply() 
########################################
a <- array(sample(1:40, 24, replace=T), dim = c(3,3))
b <- array(sample(1:40, 24, replace=T), dim = c(4,3))
c <- array(sample(1:40, 24, replace=T), dim = c(3,2))
  
Mylist <- list(a,b,c)
lapply(Mylist,"[", 1, ) # extract first row in each list element
lapply(Mylist,mean, 1, ) # mean of first row in each list element
lapply(Mylist,"[", , 1) # extract first col in each list element
# > lapply(Mylist,"[", 1, )
# [[1]]
# [1] 38  6 13
# 
# [[2]]
# [1] 29 29 21
# 
# [[3]]
# [1] 11 37


#####sapply() 
########################################

iris_num <- iris[, sapply(iris, is.numeric)]

# If simplify = F, sapply is same with lapply
# sapply(iris_num, mean, na.rm = T, simplify = F) = lapply(iris_num, mean, na.rm = T)
# vapply:  a pre-specified type of return value



