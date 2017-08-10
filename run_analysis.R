##########################################################################################################################################
##########################################################################################################################################
################################################## Read the data files into R ############################################################
##########################################################################################################################################
##########################################################################################################################################

##### Setting the working directory:
setwd("D:/Data Science/Course 3/Week 4")

##### Creating a folder that will contain the project files:
if(!file.exists("./Final Project")){dir.create("./Final Project")} 

##### Reading the data from the provided link:
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataURL,destfile = "./Final Project/Dataset.zip")

##### Unzip the dataset folder:
unzip ("./Final Project/Dataset.zip",exdir = "./Final Project")

##### Read the different data files that are relevant for this assignment:

#### features:
features <- read.table("./Final Project/UCI HAR Dataset/features.txt")
### look at the data from the file:
head(features)
### Give meaningful variable names:
names(features) <- c("feature.code","variable.name")

#### activity labels:
activity_labels <- read.table("./Final Project/UCI HAR Dataset/activity_labels.txt")
### look at the data from the file:
head(activity_labels)
### Give meaningful variable names:
names(activity_labels) <- c("activity.code","activity.name")

#### test dataset:
fptest <- "./Final Project/UCI HAR Dataset/test"                   ## the file path to the test dataset
subject_test <- read.table(paste0(fptest,"/subject_test.txt"))     ## read the subject_test file
xtest <- read.table(paste0(fptest,"/X_test.txt"))                  ## read the X_test file
ytest <- read.table(paste0(fptest,"/y_test.txt"))                  ## read the y_test file
### Visually examine the different files:
head(subject_test)
head(xtest)
head(ytest)

#### train dataset:
fptrain <- "./Final Project/UCI HAR Dataset/train"                    ## the file path to the train dataset
subject_train <- read.table(paste0(fptrain,"/subject_train.txt"))     ## read the subject_train file
xtrain <- read.table(paste0(fptrain,"/X_train.txt"))                  ## read the X_train file
ytrain <- read.table(paste0(fptrain,"/y_train.txt"))                  ## read the y_train file
### Visually examine the different files:
head(subject_train)
head(xtrain)
head(ytrain)


##########################################################################################################################################
##########################################################################################################################################
######################################## Assignment #1: Merge the train and test datasetsts: #############################################
##########################################################################################################################################
##########################################################################################################################################

#### Test whether the columns of xtest and xtrain are identical:
#### If identical rbind the two datasets and create a new dataset called "dat":
if(identical(names(xtest),names(xtrain))) {dat <- rbind(xtrain,xtest)}

#### Add the activity code column to the dataset:
dat <- data.frame(rbind(ytrain,ytest),dat)

#### Add the subject id column to the dataset:
dat <- data.frame(rbind(subject_train,subject_test),dat)

#### Visually examine the merged dataset:
head(dat)
tail(dat)
str(dat)

### Provide temporary variable names to the dataset:

### The first column is the subject ID:
names(dat)[1] <- "subject.id"

### The second column is the activity code:
names(dat)[2] <- "activity.code"

### The following 561 columns match with the features.txt names:
names(dat)[3:563] <- as.character(features$variable.name)


##########################################################################################################################################
##########################################################################################################################################
################################### Assignment #2: Extract the mean and std for each variable: ###########################################
##########################################################################################################################################
##########################################################################################################################################

### Find the indices of the columns that contain mean or std:
inx.mean <- grep("mean()",names(dat),fixed=T)        ## using fixed as TRUE to not extract meanFrequency or angle of Mean values
inx.std <- grep("std()",names(dat),fixed=T)

### Visually examine the column names chosen above:
names(dat)[inx.mean]
names(dat)[inx.std]

### Extract the mean and std columns
dat <- dat[,c(1,2,inx.mean,inx.std)]                  ## I added 1 and 2 to select subject.id and activity.code as well

### Visually examine the new data set:
head(dat)


##########################################################################################################################################
##########################################################################################################################################
############################################# Assignment #3: Provide activity labels: ####################################################
##########################################################################################################################################
##########################################################################################################################################

## The activity label names are stored in the activity_labels.txt file we read above:
## I will replace the numeric code in column 2 (activity.code) of my dataset /w the 
## labels from the activity_labels.txt file:
new.activity <- activity_labels$activity.name[dat$activity.code]

## I will now replace the activity.code column with the new.activity variable I created above:
dat$activity.code <- new.activity

## I will rename this variable from "activity.code" to "activity.label":
names(dat)[2] <- "activity.label"

## Visually examine the new dataset:
head(dat)


##########################################################################################################################################
##########################################################################################################################################
############################################# Assignment #4: Provide variable names: #####################################################
##########################################################################################################################################
##########################################################################################################################################

## I already did this step when merging the two datasets
## Each of my columns are given a meaningful label
## I copy in here the column names:
# [1] "subject.id"                  "activity.label"               "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
# [5] "tBodyAcc-mean()-Z"           "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"       
# [9] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyGyro-mean()-X"         
# [13] "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
# [17] "tBodyGyroJerk-mean()-Z"      "tBodyAccMag-mean()"          "tGravityAccMag-mean()"       "tBodyAccJerkMag-mean()"     
# [21] "tBodyGyroMag-mean()"         "tBodyGyroJerkMag-mean()"     "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
# [25] "fBodyAcc-mean()-Z"           "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
# [29] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyAccMag-mean()"         
# [33] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroJerkMag-mean()" "tBodyAcc-std()-X"           
# [37] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"        
# [41] "tGravityAcc-std()-Z"         "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
# [45] "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-std()-X"      
# [49] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-std()"           "tGravityAccMag-std()"       
# [53] "tBodyAccJerkMag-std()"       "tBodyGyroMag-std()"          "tBodyGyroJerkMag-std()"      "fBodyAcc-std()-X"           
# [57] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"       
# [61] "fBodyAccJerk-std()-Z"        "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
# [65] "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-std()" 


## I will further edit the column names to facilitate manipulations of the dataset in the next assignment:
## More specifically, I will replace the hyphens "-" with dots "." using the gsub function:
names(dat) <- gsub("-", ".", names(dat))

## I will also remove the parentheses:
names(dat) <- gsub("()", "", names(dat),fixed=T)

## Here are the new variable names:
# [1] "subject.id"                "activity.label"            "tBodyAcc.mean.X"           "tBodyAcc.mean.Y"           "tBodyAcc.mean.Z"          
# [6] "tGravityAcc.mean.X"        "tGravityAcc.mean.Y"        "tGravityAcc.mean.Z"        "tBodyAccJerk.mean.X"       "tBodyAccJerk.mean.Y"      
# [11] "tBodyAccJerk.mean.Z"       "tBodyGyro.mean.X"          "tBodyGyro.mean.Y"          "tBodyGyro.mean.Z"          "tBodyGyroJerk.mean.X"     
# [16] "tBodyGyroJerk.mean.Y"      "tBodyGyroJerk.mean.Z"      "tBodyAccMag.mean"          "tGravityAccMag.mean"       "tBodyAccJerkMag.mean"     
# [21] "tBodyGyroMag.mean"         "tBodyGyroJerkMag.mean"     "fBodyAcc.mean.X"           "fBodyAcc.mean.Y"           "fBodyAcc.mean.Z"          
# [26] "fBodyAccJerk.mean.X"       "fBodyAccJerk.mean.Y"       "fBodyAccJerk.mean.Z"       "fBodyGyro.mean.X"          "fBodyGyro.mean.Y"         
# [31] "fBodyGyro.mean.Z"          "fBodyAccMag.mean"          "fBodyBodyAccJerkMag.mean"  "fBodyBodyGyroMag.mean"     "fBodyBodyGyroJerkMag.mean"
# [36] "tBodyAcc.std.X"            "tBodyAcc.std.Y"            "tBodyAcc.std.Z"            "tGravityAcc.std.X"         "tGravityAcc.std.Y"        
# [41] "tGravityAcc.std.Z"         "tBodyAccJerk.std.X"        "tBodyAccJerk.std.Y"        "tBodyAccJerk.std.Z"        "tBodyGyro.std.X"          
# [46] "tBodyGyro.std.Y"           "tBodyGyro.std.Z"           "tBodyGyroJerk.std.X"       "tBodyGyroJerk.std.Y"       "tBodyGyroJerk.std.Z"      
# [51] "tBodyAccMag.std"           "tGravityAccMag.std"        "tBodyAccJerkMag.std"       "tBodyGyroMag.std"          "tBodyGyroJerkMag.std"     
# [56] "fBodyAcc.std.X"            "fBodyAcc.std.Y"            "fBodyAcc.std.Z"            "fBodyAccJerk.std.X"        "fBodyAccJerk.std.Y"       
# [61] "fBodyAccJerk.std.Z"        "fBodyGyro.std.X"           "fBodyGyro.std.Y"           "fBodyGyro.std.Z"           "fBodyAccMag.std"          
# [66] "fBodyBodyAccJerkMag.std"   "fBodyBodyGyroMag.std"      "fBodyBodyGyroJerkMag.std"

### Now that I have a tidy dataset I can write it into my project folder:
write.table(dat,"./Final Project/Tidy activity data.txt",sep="\t",row.names = F)

##########################################################################################################################################
##########################################################################################################################################
############### Assignment #5: create data set with the average of each variable for each activity and each subject: #####################
##########################################################################################################################################
##########################################################################################################################################

### To summarize the data I will use the function "aggregate" which allows applying a function on multiple columns
### by a group (or multiple groups) in the original data frame:
summary_dat <- aggregate(dat[,-c(1,2)],by=list(dat$subject.id,dat$activity.label), mean)

### I will give my new dataset meaningful variable names:
names(summary_dat)[1:2] <- c("subject.id","activity.label")

## I will write the tidy new dataset into my project folder:
write.table(summary_dat,"./Final Project/Summary of activity data.txt",sep="\t",row.names = F)
