---
title: "CodeBook for run_analysis.R script"
author: "Steven Fu"
date: "24 Oct 2014"
output: html_document
---

###Background###
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

###Introduction###
This file is to describe the input and output dataset of script "run_analysis.R".

###Script Input###
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/subject_train.txt': Training subjects
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.

- 'test/subject_test.txt': Test subjects
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

A detailed description of the sourcing files can be found browsing the original website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


###Script Output###
The output tidy dataset consists of:
* 180 rows: 30 subject * 6 activity

* 68 columns: subject, activity and 66 selected features - 

* subject
    - Position: 01/68
    - Type: Numeric
    - Description: Numeric value identifying the subject who performed the activity. 
    - Range: [1 to 30]
    
---------------------------------------------------------------------
    
* label
    - Position: 02/68
    - Type: Characters  
    - Description: Descriptive name of the activity performed by the subject.
    - Range: ["WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"]

* selected features
	"SAMean_tBodyAcc-mean()-X"           "SAMean_tBodyAcc-mean()-Y"          
	"SAMean_tBodyAcc-mean()-Z"           "SAMean_tBodyAcc-std()-X"           
	"SAMean_tBodyAcc-std()-Y"            "SAMean_tBodyAcc-std()-Z"           
	"SAMean_tGravityAcc-mean()-X"        "SAMean_tGravityAcc-mean()-Y"       
	"SAMean_tGravityAcc-mean()-Z"        "SAMean_tGravityAcc-std()-X"        
	"SAMean_tGravityAcc-std()-Y"         "SAMean_tGravityAcc-std()-Z"        
	"SAMean_tBodyAccJerk-mean()-X"       "SAMean_tBodyAccJerk-mean()-Y"      
	"SAMean_tBodyAccJerk-mean()-Z"       "SAMean_tBodyAccJerk-std()-X"       
	"SAMean_tBodyAccJerk-std()-Y"        "SAMean_tBodyAccJerk-std()-Z"       
	"SAMean_tBodyGyro-mean()-X"          "SAMean_tBodyGyro-mean()-Y"         
	"SAMean_tBodyGyro-mean()-Z"          "SAMean_tBodyGyro-std()-X"          
	"SAMean_tBodyGyro-std()-Y"           "SAMean_tBodyGyro-std()-Z"          
	"SAMean_tBodyGyroJerk-mean()-X"      "SAMean_tBodyGyroJerk-mean()-Y"     
	"SAMean_tBodyGyroJerk-mean()-Z"      "SAMean_tBodyGyroJerk-std()-X"      
	"SAMean_tBodyGyroJerk-std()-Y"       "SAMean_tBodyGyroJerk-std()-Z"      
	"SAMean_tBodyAccMag-mean()"          "SAMean_tBodyAccMag-std()"          
	"SAMean_tGravityAccMag-mean()"       "SAMean_tGravityAccMag-std()"       
	"SAMean_tBodyAccJerkMag-mean()"      "SAMean_tBodyAccJerkMag-std()"      
	"SAMean_tBodyGyroMag-mean()"         "SAMean_tBodyGyroMag-std()"         
	"SAMean_tBodyGyroJerkMag-mean()"     "SAMean_tBodyGyroJerkMag-std()"     
	"SAMean_fBodyAcc-mean()-X"           "SAMean_fBodyAcc-mean()-Y"          
	"SAMean_fBodyAcc-mean()-Z"           "SAMean_fBodyAcc-std()-X"           
	"SAMean_fBodyAcc-std()-Y"            "SAMean_fBodyAcc-std()-Z"           
	"SAMean_fBodyAccJerk-mean()-X"       "SAMean_fBodyAccJerk-mean()-Y"      
	"SAMean_fBodyAccJerk-mean()-Z"       "SAMean_fBodyAccJerk-std()-X"       
	"SAMean_fBodyAccJerk-std()-Y"        "SAMean_fBodyAccJerk-std()-Z"       
	"SAMean_fBodyGyro-mean()-X"          "SAMean_fBodyGyro-mean()-Y"         
	"SAMean_fBodyGyro-mean()-Z"          "SAMean_fBodyGyro-std()-X"          
	"SAMean_fBodyGyro-std()-Y"           "SAMean_fBodyGyro-std()-Z"          
	"SAMean_fBodyAccMag-mean()"          "SAMean_fBodyAccMag-std()"          
	"SAMean_fBodyBodyAccJerkMag-mean()"  "SAMean_fBodyBodyAccJerkMag-std()"  
	"SAMean_fBodyBodyGyroMag-mean()"     "SAMean_fBodyBodyGyroMag-std()"     
	"SAMean_fBodyBodyGyroJerkMag-mean()" "SAMean_fBodyBodyGyroJerkMag-std()" 
 
    - Position: 03-68/68
    - Type: Numeric
    - Description: Mean of the respective measurements for the same subject and activity.
    - Range:[-1,1]
