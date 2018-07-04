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

#####sapply() 
########################################
iris_num <- iris[, sapply(iris, is.numeric)]


