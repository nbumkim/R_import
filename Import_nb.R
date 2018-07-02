#https://www.datacamp.com/community/tutorials/r-tutorial-read-excel-into-r#step1
#https://www.rdocumentation.org/packages/utils/versions/3.5.0/topics/read.table
 
## Datasets for Data Mining and Data Science
###########################################

#https://www.kdnuggets.com/datasets/index.html; 
#https://www.quandl.com/
#https://www.kaggle.com

## Data import 
###########################
setwd(getwd()) #"D:/github/R_import"
path <- file.path("~", "datasets", "states.csv") # path
# => "~/datasets/states.csv"

mydata <- read.csv("mydata.csv", header = TRUE, stringsAsFactors = FALSE) # read the csv data
mydata <- read.csv(path, header = TRUE, stringsAsFactors = FALSE) # read the csv data

# mydata.csv; A tab-delimited text file
#Index var1 var2
#1   6   a
#2   7   b
#3   8   c
#4   9   d
#5   10  e
mydata <- read.table("c:/mydata.csv", header=TRUE, 
                     sep=",", row.names="id")

#scores_timed.txt
#1/6/12:01:03/0.50/WORST
#2/16/07:42:51/0.32/ BEST
#3/19/12:01:29/0.50/"EMPTY"
#4/13/03:22:50/0.14/INTERMEDIATE
#5/8/09:30:03/0.40/WORST

mydata <- read.table("https://s3.amazonaws.com/
                     assets.datacamp.com/blog_assets/scores_timed.txt", 
                 header = FALSE, 
                 sep="/", 
                 strip.white = TRUE,  #the white spaces from unquoted character fields stripped
                 na.strings = "EMPTY") #strings should be interpreted as NA values

#read.delim(file, header = TRUE, sep = "\t", quote = "\"",
#           dec = ".", fill = TRUE, comment.char = "", ¡¦)


#Webdata import
#http://www.sthda.com/upload/decathlon.txt
#name	    100m	Long.jump	Shot.put	High.jump	400m	110m.hurdle	Discus	Pole.vault	Javeline	1500m	Rank	Points	Competition
#SEBRLE 	 11.04 	 7.58 	 14.83 	 2.07 	 49.81 	 14.69 	 43.75 	 5.02 	 63.19 	 291.7 	1	8217	1
#CLAY 	   10.76 	 7.4 	 14.26 	 1.86 	 49.37 	 14.05 	 50.72 	 4.92 	 60.15 	 301.5 	2	8122	1
#KARPOV 	 11.02 	 7.3 	 14.77 	 2.04 	 48.37 	 14.09 	 48.95 	 4.92 	 50.31 	 300.2 	3	8099	1
#BERNARD 	 11.02 	 7.23 	 14.25 	 1.92 	 48.93 	 14.99 	 40.87 	 5.32 	 62.77 	 280.1 	4	8067	1

mydat <- read.table('http://www.sthda.com/upload/decathlon.txt', sep="")
mydat <- read.table('http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat', sep="")


read.csv("https://raw.github.com/sciruela/Happiness-Salaries/master/data.csv")

# Win
read.url <- function(url, ...){
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  url.data <- read.table(tmpFile, ...)
  return(url.data)
}
mydat4 <- read.url("http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat", sep ="")


# install.packages("RCurl")
library(RCurl)
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
x <- getURL(URL)
## Or 
## x <- getURL(URL, ssl.verifypeer = FALSE)
out <- read.csv(textConnection(x))
head(out[1:6])
#   RT SERIALNO DIVISION PUMA REGION ST
# 1  H      186        8  700      4 16
# 2  H      306        8  700      4 16
# 3  H      395        8  100      4 16
# 4  H      506        8  700      4 16
# 5  H      835        8  800      4 16d
# 6  H      989        8  700      4 16
dim(out)
# [1] 6496  188

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="reviews.csv",method="libcurl")
#https://cehd.gmu.edu/book/dimitrov/spss
url <- "http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat"
download.file(url, destfile = "ch11b.csv", method = "curl")
url.data <- read.table('ch11b.csv', sep="")
