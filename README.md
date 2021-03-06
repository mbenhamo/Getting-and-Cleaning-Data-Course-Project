## Getting-and-Cleaning-Data-Course-Project

* This repository was created to satisfy the requirements of the Coursera specialization in Data Science
* The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
* The repository consists of the following:
    + a tidy data set called *Tidy activity data.csv*
    + a summary data set called *Summary of activity data.csv*
    + a code book that describes the variables, the data, and any transformations performed to clean up the data called *CodeBook.md* 

### First, I merged the training and the test sets to create one data set.

* I downloaded the zipped folder and used *unzip* function to unzip the downloaded folder
* I then read all of the relevant data files into R
* I merged the **X_test** and the **X_train** files
* I added to the merged data set 2 additional columns:
    + **subject ID**
    + **Activity code**
* I provided variable names that I extracted from the **features.txt* file

### Second, I extracted only the variables that give either the mean or the standard deviation of each of the variables

* I did this by using the *grep* function to identify column names with the characters:
    + **mean**
    + or:
    + **std**
* I then selected only the relevant columns to get a new, smaller, dataset

### Third, I replaced the numeric code of the activity codes with the actual activity labels

* I did this by matching the activity codes in my dataset with the activity labels provided by the **activity_labels.txt* file


### Forth, I provided meaningful variable names

* I did this by using the *gsub* function that allows removing all of the problematic characters from the column names
* Below are the final variable names that I have:
    + "subject.id"                
    + "activity.label"            
    + "tBodyAcc.mean.X"           
    + "tBodyAcc.mean.Y"           
    + "tBodyAcc.mean.Z"          
    + "tGravityAcc.mean.X"        
    + "tGravityAcc.mean.Y"        
    + "tGravityAcc.mean.Z"        
    + "tBodyAccJerk.mean.X"       
    + "tBodyAccJerk.mean.Y"      
    + "tBodyAccJerk.mean.Z"       
    + "tBodyGyro.mean.X"          
    + "tBodyGyro.mean.Y"          
    + "tBodyGyro.mean.Z"          
    + "tBodyGyroJerk.mean.X"     
    + "tBodyGyroJerk.mean.Y"      
    + "tBodyGyroJerk.mean.Z"      
    + "tBodyAccMag.mean"          
    + "tGravityAccMag.mean"       
    + "tBodyAccJerkMag.mean"     
    + "tBodyGyroMag.mean"         
    + "tBodyGyroJerkMag.mean"     
    + "fBodyAcc.mean.X"           
    + "fBodyAcc.mean.Y"           
    + "fBodyAcc.mean.Z"          
    + "fBodyAccJerk.mean.X"       
    + "fBodyAccJerk.mean.Y"       
    + "fBodyAccJerk.mean.Z"       
    + "fBodyGyro.mean.X"          
    + "fBodyGyro.mean.Y"         
    + "fBodyGyro.mean.Z"          
    + "fBodyAccMag.mean"          
    + "fBodyBodyAccJerkMag.mean"  
    + "fBodyBodyGyroMag.mean"     
    + "fBodyBodyGyroJerkMag.mean"
    + "tBodyAcc.std.X"            
    + "tBodyAcc.std.Y"            
    + "tBodyAcc.std.Z"            
    + "tGravityAcc.std.X"         
    + "tGravityAcc.std.Y"        
    + "tGravityAcc.std.Z"         
    + "tBodyAccJerk.std.X"        
    + "tBodyAccJerk.std.Y"        
    + "tBodyAccJerk.std.Z"        
    + "tBodyGyro.std.X"          
    + "tBodyGyro.std.Y"           
    + "tBodyGyro.std.Z"           
    + "tBodyGyroJerk.std.X"       
    + "tBodyGyroJerk.std.Y"       
    + "tBodyGyroJerk.std.Z"      
    + "tBodyAccMag.std"           
    + "tGravityAccMag.std"        
    + "tBodyAccJerkMag.std"       
    + "tBodyGyroMag.std"          
    + "fBodyAcc.std.X"            
    + "fBodyAcc.std.Y"            
    + "fBodyAcc.std.Z"            
    + "fBodyAccJerk.std.X"        
    + "fBodyAccJerk.std.Y"       
    + "fBodyAccJerk.std.Z"        
    + "fBodyGyro.std.X"           
    + "fBodyGyro.std.Y"           
    + "fBodyGyro.std.Z"           
    + "fBodyAccMag.std"          
    + "fBodyBodyAccJerkMag.std"   
    + "fBodyBodyGyroMag.std"      
    + "fBodyBodyGyroJerkMag.std"

### Fifth, I created a summary dataset:

* I did this by using the *aggregate* function of R that allows applying a function on multiple columns by groups
* I called the new summary data frame **Summary of activity data.csv**
