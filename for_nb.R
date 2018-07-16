#http://kkokkilkon.tistory.com/67 [꼬낄콘의 분석일지]

ir <-iris
iris_num <- NULL 
for(x in 1:ncol(iris)){ if(is.numeric(iris[, x])) iris_num <- cbind(iris_num, iris[, x]) } 

iris_num <- data.frame(iris_num)
