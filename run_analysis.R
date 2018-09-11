#Peer-graded assignment
#You should create one R script called run_analysis.R that does the following.
#1: Merges the training and the test sets to create one data set.
#2: Extracts only the measurements on the mean and standard deviation for each measurement.
#3: Uses descriptive activity names to name the activities in the data set
#4: Appropriately labels the data set with descriptive variable names.
#5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#creating files
if(!file.exists("./Assignment4")){dir.create("./Assignment4")}
if(!file.exists("./Assignment4/Code")){dir.create("./Assignment4/Code")}
setwd("./Assignment4/Code")
#run_analysis.R
if(!file.exists("../Data")){dir.create("../Data")}
if(!file.exists("../Results")){dir.create("../Results")}
#0: download file and unzip
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileLocation <- "../Data/Dataset.zip"
download.file(fileURL, destfile = fileLocation)
unzip(zipfile = fileLocation, exdir="../Data")

#creating files to put the data into
#and appropriately labeling the columns while at it
features <- read.table("../Data/UCI HAR Dataset/features.txt")
train.x <- read.table("../Data/UCI HAR Dataset/train/X_train.txt", col.names = 
                            features[,2])
train.y <- read.table("../Data/UCI HAR Dataset/train/y_train.txt", col.names = 
                            "activity")
train.subject <- read.table("../Data/UCI HAR Dataset/train/subject_train.txt",
                            col.names = "subject")
test.x <- read.table("../Data/UCI HAR Dataset/test/X_test.txt", col.names = 
                           features[,2])
test.y <- read.table("../Data/UCI HAR Dataset/test/y_test.txt", col.names = 
                           "activity")
test.subject <- read.table("../Data/UCI HAR Dataset/test/subject_test.txt",
                           col.names = "subject")
activityLabels <- read.table("../Data/UCI HAR Dataset/activity_labels.txt",
                           col.names = c('activity', 'activityType'))
#merge the training and the test sets to create one data set
train.merge <- cbind(train.y, train.subject, train.x)
test.merge <- cbind(test.y, test.subject, test.x)
data.merge <- rbind(train.merge, test.merge)

#extract only the measurements on the mean and standard deviation for 
      #each measurement
colNames <- colnames(data.merge)
mean_and_std <- (grepl("activity" , colNames) | 
                      grepl("subject" , colNames) | 
                      grepl("mean.." , colNames) | 
                      grepl("std.." , colNames) 
                  )
mean_and_std2 <- data.merge[ , mean_and_std == TRUE]
#use descriptive activity names to name the activities in the data set
Data1 <- merge(mean_and_std2, activityLabels,
                              by='activity',
                              all.x=TRUE)
#improving the labeling of the data set with descriptive variable names
names(Data1)<-gsub("^t", "time", names(Data1))
names(Data1)<-gsub("^f", "frequency", names(Data1))
names(Data1)<-gsub("Acc", "Accelerometer", names(Data1))
names(Data1)<-gsub("Gyro", "Gyroscope", names(Data1))
names(Data1)<-gsub("Mag", "Magnitude", names(Data1))
names(Data1)<-gsub("BodyBody", "Body", names(Data1))


#from the data set in step 4, create a second, independent tidy data set 
      #with the average of each variable for each activity and each subject.
Data2 <- aggregate(. ~subject + activity, Data1, mean)
Data2 <- Data2[order(Data2$subject, Data2$activity),]
write.table(Data2, "../Results/secTidySet.txt", row.name=FALSE)
