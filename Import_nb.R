#https://www.datacamp.com/community/tutorials/r-tutorial-read-excel-into-r#step1
 
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

