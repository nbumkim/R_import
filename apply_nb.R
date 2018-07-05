#https://www.datacamp.com/community/tutorials/r-tutorial-apply-family

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
lapply(Mylist,mean, 1, ) # 
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

iris_num <- iris[, sapply(iris, is.numeric)] # sapply(x, f, simplify = FALSE, USE.NAMES = FALSE) is the same as lapply(x, f).

# If simplify = F, sapply is same with lapply
# sapply(iris_num, mean, na.rm = T, simplify = F) 
# lapply(iris_num, mean, na.rm = T)
# vapply:  a pre-specified type of return value


