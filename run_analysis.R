##start of run_analysis.R script
print(paste(Sys.time(),"Start to run run_analysis.R--------------------------------")) 

# create a temporary directory
td <- tempdir()
# set working directory to the temporary directory
setwd(td)
# create the placeholder file
tf = tempfile(tmpdir=td, fileext=".zip")

# download into the placeholder file
print(paste(Sys.time(),"Downloading zip file---------------------------------------")) 
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, tf)
print(paste(Sys.time(),"Downloading zip file completed-----------------------------")) 

# unzip the file to the temporary directory
print(paste(Sys.time(),"Unzipping zip file-----------------------------------------")) 
unzip(tf, exdir=td, overwrite=TRUE)
print(paste(Sys.time(),"Unzipping zip file-----------------------------------------")) 


##load common data
print(paste(Sys.time(),"Loading common data----------------------------------------")) 
labels_fp<- ".\\UCI HAR Dataset\\activity_labels.txt"
activity_labels<-read.table(labels_fp)
features_fp<-".\\UCI HAR Dataset\\features.txt"
features<-read.table(features_fp)
print(paste(Sys.time(),"Loading common data completed------------------------------"))

##load training data
print(paste(Sys.time(),"Loading training data--------------------------------------")) 
subject_train_fp<-".\\UCI HAR Dataset\\train\\subject_train.txt"
Traininglabel_fp<-".\\UCI HAR Dataset\\train\\y_train.txt"
Trainingset_fp<-".\\UCI HAR Dataset\\train\\X_train.txt"

myTrainingsubject<-data.frame(read.table(subject_train_fp))
myTraininglabel<-data.frame(read.table(Traininglabel_fp))
myTrainingset<-data.frame(read.table(Trainingset_fp))

myTrainingdataset<-cbind(myTrainingsubject,myTraininglabel,myTrainingset)
rm(myTrainingsubject)
rm(myTraininglabel)
rm(myTrainingset)
print(paste(Sys.time(),"Loading training data completed----------------------------"))

##load test data
print(paste(Sys.time(),"Loading test data------------------------------------------")) 
subject_test_fp<-".\\UCI HAR Dataset\\test\\subject_test.txt"
Testlabel_fp<-".\\UCI HAR Dataset\\test\\y_test.txt"
Testset_fp<-".\\UCI HAR Dataset\\test\\X_test.txt"

myTestsubject<-data.frame(read.table(subject_test_fp))
myTestlabel<-data.frame(read.table(Testlabel_fp))
myTestset<-data.frame(read.table(Testset_fp))

myTestdataset<-cbind(myTestsubject,myTestlabel,myTestset)
rm(myTestsubject)
rm(myTestlabel)
rm(myTestset)
print(paste(Sys.time(),"Loading test data completed--------------------------------"))

## Merges the training and the test sets to create one data set.
print(paste(Sys.time(),"Merging training dataset and test dataset------------------")) 
mydataset<-rbind(myTrainingdataset,myTestdataset)
rm(myTrainingdataset)
rm(myTestdataset)
print(paste(Sys.time(),"Merging training dataset and test dataset completed--------")) 

##Appropriately labels the data set with descriptive variable names.
print(paste(Sys.time(),"Labelling dataset with descriptors-------------------------")) 
colnames(mydataset)<-c("subject","activity",as.character(features[1:561,2]))
print(paste(Sys.time(),"Labelling dataset with descriptors completed---------------")) 

## Extracts only the measurements on the mean and standard deviation for each measurement.
print(paste(Sys.time(),"Extracting mean and std columns----------------------------")) 
#get the colomn list of mean and standard deviation features 
short_list<-grep("mean[(]|std[(]",features[1:561,2])
#to add 2 to the colomn list, since col1 is subject, col2 is activity, measurement cols start from col3 onwards  
#to subset from the main dataset
short_dataset<-mydataset[,c(1,2,(short_list+2))]
print(paste(Sys.time(),"Extracting mean and std columns completed------------------")) 

## Uses descriptive activity names to name the activities in the data set
print(paste(Sys.time(),"Loading activity names in the data set---------------------")) 
short_dataset<-mutate(short_dataset, activity = activity_labels[activity,2])
print(paste(Sys.time(),"Loading activity names in the data set completed-----------")) 

# to use group_by and summarise_each, we need to load the dplyr package
print(paste(Sys.time(),"Loading dplyr package--------------------------------------")) 
# to check if dplyr package is installed, install if necessary
is.installed <- function(x) is.element(x, installed.packages()[,1]) 
if (!is.installed("dplyr")){
  install.packages("dplyr")
}
library(dplyr)
print(paste(Sys.time(),"Loading dplyr package completed----------------------------")) 

##  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
print(paste(Sys.time(),"Creating tidy dataset--------------------------------------"))
tidyDataSet<-group_by(short_dataset,subject,activity) %>% summarise_each(funs(mean))
print(paste(Sys.time(),"Creating tidy dataset completed----------------------------"))
#rename the col names for the feature cols
#SAMean stands for the Mean value for the group for each Subject and Activity
newNames <- c(colnames(tidyDataSet[,1:2]), paste("SAMean_",colnames(tidyDataSet)[3:ncol(tidyDataSet)],sep=""))
names(tidyDataSet)<-newNames
print(paste(Sys.time(),"Writing tidyDataSet.txt output file------------------------"))
write.table(tidyDataSet,"tidyDataSet.txt",row.name=FALSE)
print(paste(Sys.time(),"Writing tidyDataSet.txt output file completed--------------"))
print(paste(Sys.time(),"File tidyDataSet.txt can be found at", as.character(getwd())))
print(paste(Sys.time(),"Running run_analysis.R Script completed--------------------"))
