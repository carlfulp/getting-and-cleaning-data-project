## Getting and Cleaning Data Project

This GitHub repo contains the scripts necessary for the completion of the course project for the Johns Hopkins University Getting and Cleaning Data course.  The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare a tidy data that can be used for later analysis.

To fulfill this goal, students were instructed to create a single R script called run_analysis.R that performs the following tasks: 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The dataset to be cleaned and summarized is the "Human Activity Recognition Using Smartphones Data Set," described here (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and in greater detail in the CodeBook contained withing this directly.  Briefly, the data set is a large multivariate, time-series (10299 instances of 561 attributes) built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

To fulfill the assigned goal, data was processed as follows:

* Data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped.  A script, designated as "run_analysis.R" and included in this directory, was generated using R v.3.0.3 to complete the subsequent steps.
* Of the original data, the following files were used to generate the tidy data set: "X_test.txt," "y_test.txt," "subject_test.txt," "X_train.txt," "y_train.txt," "subject_train.txt," "features.txt," and "activity_labels.txt."
* Test (""X_test.txt") and Training data ("X_train.txt") sets were merged with their respective files describing the subjects ("subject_test.txt" and "subject_train.txt") and their activities ("y_test.txt" and "y_train.txt") so that new columns was added to the data set the contain a number corresponding to the Subject from which the observation was made and a number correspoding to one of the six Sctivities performed.
* Resulting merged files were then themselves merged to create a dataframe so that a single dataframe contained both test and training data.  This dataframe contained 10,299 observations for 563 variables.
* For the column corresponding to Activity, each number was converted to a word descriptor for that activity.  The key used to match numbers to word descriptor resides in the "activity_labels.txt" file.
* Column names were then added for each of the features measured.  The key used to match the columns to features resides in the "features.txt."
* Columns corresponding to Subject, Activity, and features corresponding to mean and standard deviation for each measurement were retained.  All other columns were discarded. Each of these variables are described in the codebook which is included in this directory.  I chose to only include those variables containing "mean()" and "std()" as described in the "features_info.txt."  Variables containing menFreq() were discarded. This resulted in a dataframe with 10,299 observations for 68 variables.
* Next, column names were cleaned up so that variables were formatted as CamelCase.  Although, it is not the recommended formatting stipulated by the professors of the Getting and Cleaning Data course (i.e. they prefer variable names not contain capital letters) , I have chosen to use it here as the length of the variables names are quite long and unwieldy when left as lowercase.
* Finally, the tidy data set was compiled by computing the average of each variable for each activity and each subject, and this was saved as "tidydata.txt."  The tidy data set contained 180 observations for 68 variables.

