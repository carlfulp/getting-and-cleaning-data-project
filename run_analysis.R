## This script merges and cleans up data within the "UCI Human Activity 
## Recognition Using Smartphones Data Set" (described in Anguita et al. (2012) 
## IWAAL 2012. Dec 2012; http://goo.gl/SMwNJz), to create a "Tidy Data" set 
## (defined by Wickham (submitted ) J Stat Software; http://goo.gl/QEfMpV).

# Set working directory.  Note: Change path to relevant directory if you choose
# to run on your machine.
setwd("C:/Users/Carl/Desktop/Coursera Data Science/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# Load relevent data sets
xTest          <- read.table("test/X_test.txt", quote="\"")
yTest          <- read.table("test/y_test.txt", quote="\"")
subjectTest    <- read.table("test/subject_test.txt", quote="\"")
xTrain         <- read.table("train/X_train.txt", quote="\"")
yTrain         <- read.table("train/y_train.txt", quote="\"")
subjectTrain   <- read.table("train/subject_train.txt", quote="\"")
features       <- read.table("features.txt", quote="\"")
activityLabels <- read.table("activity_labels.txt", quote="\"")

# Merge the training and the test data sets to create a single data set
testData  <- cbind(subjectTest, yTest, xTest)
trainData <- cbind(subjectTrain, yTrain, xTrain)
totalData <- rbind(testData, trainData)

# Define a function for replacing a list of items with a new defined list of 
# items
Gsub2 <- function(pattern, replacement, x, ...) {
        for(i in 1:length(pattern))
                x <- gsub(pattern[i], replacement[i], x, ...)
        x
}

# Replace the numbers in the Activity column with their corresponding 
# descriptors as defined in "activity_labels.txt"
activityFrom   <- activityLabels$V1
activityTo     <- as.character(activityLabels$V2)
totalData[, 2] <- Gsub2(activityFrom, activityTo, totalData[,2])

# Replace column names with their corresponding descriptors as defined in 
# "features.txt"
newColNames         <- paste(c("Subject","Activity",as.character(features$V2)))
colnames(totalData) <- newColNames

# Retain only those columns that contain "mean()" or "std()"
keepVariables <- c("Subject", "Activity", "\\<mean()\\>", "std()")
totalData     <- totalData[, grepl(paste(keepVariables, collapse="|"),
        colnames(totalData))]

# Clean up column names
colnames(totalData) <- gsub('[[:punct:]]', '', colnames(totalData))
colnames(totalData) <- gsub("Acc", "Acceleration", colnames(totalData))
colnames(totalData) <- gsub("Mag", "Magnitude", colnames(totalData))
colnames(totalData) <- gsub("fBody", "FrequencyBody", colnames(totalData))
colnames(totalData) <- gsub("tBody", "TimeBody", colnames(totalData))
colnames(totalData) <- gsub("tGravity", "TimeGravity", colnames(totalData))
colnames(totalData) <- gsub("mean", "Mean", colnames(totalData))
colnames(totalData) <- gsub("std", "StdDev", colnames(totalData))

# Create tidy data set and write it to the disk
require(reshape2)
meltData <- melt(totalData, id=c("Subject", "Activity"))
tidyData <- dcast(meltData, Subject + Activity ~ variable, fun.aggregate=mean)
write.table(tidyData, file = "tidydata.txt", sep = ",")