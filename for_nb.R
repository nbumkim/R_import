#http://kkokkilkon.tistory.com/67 [�������� �м�����]

ir <-iris
iris_num <- NULL 
for(x in 1:ncol(iris)){ if(is.numeric(iris[, x])) iris_num <- cbind(iris_num, iris[, x]) } 

iris_num <- data.frame(iris_num)
