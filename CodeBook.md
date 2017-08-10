---
title: "Code Book"
author: "Miriam Ben-Hamo"
date: "August 10, 2017"
---

## Tidy data set

The **Tidy activity data.csv** file found in this repository consists of the following columns:

1. **subject.id**: This column gives integers ranging from 1-30 identifying the subject who performed the activity.
2. **activity.label**: This column is a factor providing of the type of activity performed by each subject. levels of this factor are:"LAYING","SITTING","STANDING","WALKING","WALKING_DOWNSTAIRS","WALKING_UPSTAIRS" 
3. **Columns 3-563**: Features are normalized and bounded within [-1,1]

    a. These columns provide measures taken from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
    b. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
    c. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
    d. These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
        * tBodyAcc-XYZ
        * tGravityAcc-XYZ
        * tBodyAccJerk-XYZ
        * tBodyGyro-XYZ
        * tBodyGyroJerk-XYZ
        * tBodyAccMag
        * tGravityAccMag
        * tBodyAccJerkMag
        * tBodyGyroMag
        * tBodyGyroJerkMag
        * fBodyAcc-XYZ
        * fBodyAccJerk-XYZ
        * fBodyGyro-XYZ
        * fBodyAccMag
        * fBodyAccJerkMag
        * fBodyGyroMag
        * fBodyGyroJerkMag
     e. The set of variables that were estimated from these signals are: 
        * **mean**: Mean value
        * **std**: Standard deviation
        
## Summary data set

The **Summary of activity data.csv** file saved in this repository consists summary table of the dataset described above.

The columns are identical to the columns described above, only that there is a single value per subject-activity type combination

Each row provides the mean for a specific subject-activity type combination