---
title: "Readme for run_analysis.R script"
author: "Steven Fu"
date: "24 Oct 2014"
output: html_document
---

###Objective###
The "run_analysis.R" script performs analysis of a set of data and generates a tidy data set.
----------------------------------------------------------------------------------------------------------------

###Input files###
The "run_analysis.R" script requires the following input files:
* \\UCI HAR Dataset\\activity_labels.txt
* \\UCI HAR Dataset\\features.txt
* \\UCI HAR Dataset\\train\\subject_train.txt
* \\UCI HAR Dataset\\train\\y_train.txt
* \\UCI HAR Dataset\\train\\X_train.txt
* \\UCI HAR Dataset\\test\\subject_test.txt
* \\UCI HAR Dataset\\test\\y_test.txt
* \\UCI HAR Dataset\\test\\X_test.txt"

All required files are obtained uncompressing the "UCI HAR Dataset.zip" (available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

----------------------------------------------------------------------------------------------------------------

###Steps###
##1. Create a temporary directory, Downloading and Unzipping zip file##
This is to create a temporary directory, download the required input file "UCI HAR Dataset.zip" and unzip it, so that the list of input files would be available for the script to use.

##2. Loading common data##
This is to load 
activity labels [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING] (2 * 6)
and features [tBodyAcc-mean()-X,tBodyAcc-mean()-Y,tBodyAcc-mean()-Z.......] (2 * 561)

##3. Loading training data##
This is to load training dataset:
load subject_train.txt data as myTrainingsubject (7352 * 1)
load y_train.txt data as myTraininglabel (7352 * 1)
load X_train.txt data as myTrainingset (7352 * 561)
then combine all columns-> myTrainingdataset (7352 * 563)
remove intermediate datasets

##4. Loading test data##
This is to load test dataset:
load subject_test.txt data as myTestsubject (2947 * 1)
load y_test.txt data as myTestlabel (2947 * 1)
load X_test.txt data as myTestset (2947 * 561)
then combine all columns-> myTestdataset (2947 * 563)
remove intermediate datasets

##5. Merging test dataset and test dataset##
Merge myTrainingdataset and myTestdataset-> mydataset (10299 * 563)

##6. Labelling dataset with descriptors##
Define column names as "subject","label" and 561 feature descriptions

##7. Extracting mean and std columns##
First, get the colomn list of mean and standard deviation features -> short_list (size: 66)
(Note:only mean and standard deviation features are selected, 
all other columns are rejected, including meanFreq, tBodyGyroJerkMean measurements etc)
subset column 1 "subject", column 2 "label", and 66 selected features -> short_dataset (10299 * 68)

##8. Loading activity names in the data set##
This is load activity names, replace the activity index with its respective name
e.g.(1->WALKING, 2->WALKING_UPSTAIRS...)

##9. Loading dplyr package##
In step 10, the dplyr package is needed. 
This is to check if dplyr package is installed, install if necessary

##10. Creating tidy dataset##
This is to group the short_dataset by column 1 "subject", column 2 "label",
and then summarize for each group -> tidyDataSet (180 * 68)
180 rows: 30 subject * 6 activity
68 columns: column 1 "subject", column 2 "label", and 66 features

##11.Writing tidyDataSet.txt output file##
First to rename the col names for the feature cols by 
adding prefix "SAMean_" ( stands for Subject Activity Mean)
Output tidyDataSet.txt as file by using write.table() and row.name=FALSE
The file can be found at the temporary directory created in the script
-----------------------------------------------------------------------------------------------------------------

###Output file###
The script generates an output file "tidyDataSet.txt". 
-----------------------------------------------------------------------------------------------------------------

*Example of RStudio Console output after a successful run*
```
[1]  "2014-10-24 16:14:25 Start to run run_analysis.R--------------------------------"
[1]  "2014-10-24 16:14:25 Downloading zip file---------------------------------------"
[1]  "2014-10-24 16:15:13 Downloading zip file completed-----------------------------"
[1]  "2014-10-24 16:15:13 Unzipping zip file-----------------------------------------"
[1]  "2014-10-24 16:15:16 Unzipping zip file-----------------------------------------"
[1]  "2014-10-24 16:15:16 Loading common data----------------------------------------"
[1]  "2014-10-24 16:15:16 Loading common data completed------------------------------"
[1]  "2014-10-24 16:15:16 Loading training data--------------------------------------"
[1]  "2014-10-24 16:15:33 Loading training data completed----------------------------"
[1]  "2014-10-24 16:15:33 Loading test data------------------------------------------"
[1]  "2014-10-24 16:15:36 Loading test data completed--------------------------------"
[1]  "2014-10-24 16:15:36 Merging training dataset and test dataset------------------"
[1]  "2014-10-24 16:15:37 Merging training dataset and test dataset completed--------"
[1]  "2014-10-24 16:15:37 Labelling dataset with descriptors-------------------------"
[1]  "2014-10-24 16:15:37 Labelling dataset with descriptors completed---------------"
[1]  "2014-10-24 16:15:37 Extracting mean and std columns----------------------------"
[1]  "2014-10-24 16:15:37 Extracting mean and std columns completed------------------"
[1]  "2014-10-24 16:15:37 Loading activity names in the data set---------------------"
[1]  "2014-10-24 16:15:37 Loading activity names in the data set completed-----------"
[1]  "2014-10-24 16:15:37 Loading dplyr package--------------------------------------"
[1]  "2014-10-24 16:15:37 Loading dplyr package completed----------------------------"
[1]  "2014-10-24 16:15:37 Creating tidy dataset--------------------------------------"
[1]  "2014-10-24 16:15:37 Creating tidy dataset completed----------------------------"
[1]  "2014-10-24 16:15:37 Writing tidyDataSet.txt output file------------------------"
[1]  "2014-10-24 16:15:37 Writing tidyDataSet.txt output file completed--------------"
[1]  "2014-10-24 16:15:37 File tidyDataSet.txt can be found at C:/Users/UserName/AppData/Local/Temp/RtmpmQm025"
[1]  "2014-10-24 16:15:37 Running run_analysis.R Script completed--------------------"
```