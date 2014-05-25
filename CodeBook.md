## getting-and-cleaning-data-project

The data set used herein is derived from the "Human Activity Recognition Using Smartphones Data Set," described in 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 and http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

# Data Collection Description

[The following was copied verbatim from the "ReadMe.txt" file contained in the original data set.]

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto

Human Activity Recognition Using Smartphones Data Set 

SUMMARY: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# Feature Selection 

[The following was copied verbatim from the "features_info" file contained in the original data set.]

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

# Data Processing

To obtain a "tidy data" set, data was processed as follows:

* Data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped.  A script, designated as "run_analysis.R" and included in this directory, was generated using R v.3.0.3 to complete the subsequent steps.
* Of the original data, the following files were used to generate the tidy data set: "X_test.txt," "y_test.txt," "subject_test.txt," "X_train.txt," "y_train.txt," "subject_train.txt," "features.txt," and "activity_labels.txt."
* Test (""X_test.txt") and Training data ("X_train.txt") sets were merged with their respective files describing the subjects ("subject_test.txt" and "subject_train.txt") and their activities ("y_test.txt" and "y_train.txt") so that new columns was added to the data set the contain a number corresponding to the Subject from which the observation was made and a number correspoding to one of the six Sctivities performed.
* Resulting merged files were then themselves merged to create a dataframe so that a single dataframe contained both test and training data.  This dataframe contained 10,299 observations for 563 variables.
* For the column corresponding to Activity, each number was converted to a word descriptor for that activity.  The key used to match numbers to word descriptor resides in the "activity_labels.txt" file.
* Column names were then added for each of the features measured.  The key used to match the columns to features resides in the "features.txt."
* Columns corresponding to Subject, Activity, and features corresponding to mean and standard deviation for each measurement were retained.  All other columns were discarded. Each of these variables are described in the codebook which is included in this directory.  I chose to only include those variables containing "mean()" and "std()" as described in the "features_info.txt."  Variables containing menFreq() were discarded. This resulted in a dataframe with 10,299 observations for 68 variables.
* Next, column names were cleaned up so that variables were formatted as CamelCase.  Although, it is not the recommended formatting stipulated by the professors of the Getting and Cleaning Data course (i.e. they prefer variable names not contain capital letters) , I have chosen to use it here as the length of the variables names are quite long and unwieldy when left as lowercase.
* Finally, the tidy data set was compiled by computing the average of each variable for each activity and each subject, and this was saved as "tidydata.txt."  The tidy data set contained 180 observations for 68 variables.

# Codebook for TidyData

| names.tidyData.                                  	|   	|
|--------------------------------------------------	|---	|
| Subject                                          	|  Number 1-30 corresponding to each of the 30 individuals of whom were subjects of the experiment |
| Activity                                         	|  One of the six activities measured for each subject (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)|
| TimeBodyAccelerationMeanX                        	|  Mean value of time body accelerated in the X axial signaling direction	|
| TimeBodyAccelerationMeanY                        	|  Mean value of time body accelerated in the Y axial signaling direction	|
| TimeBodyAccelerationMeanZ                        	|  Mean value of time body accelerated in the Z axial signaling direction	|
| TimeBodyAccelerationStdDevX                      	|  Standard deviation of time body accelerated in the X axial signaling direction	|
| TimeBodyAccelerationStdDevY                      	|  Standard deviation of time body accelerated in the Y axial signaling direction	|
| TimeBodyAccelerationStdDevZ                      	|  Standard deviation of time body accelerated in the Z axial signaling direction	|
| TimeGravityAccelerationMeanX                     	|  Mean value in the X axial signaling direction	|
| TimeGravityAccelerationMeanY                     	|  Mean value in the Y axial signaling direction	|
| TimeGravityAccelerationMeanZ                     	|  Mean value in the Z axial signaling direction	|
| TimeGravityAccelerationStdDevX                   	|  Standard deviation in the X axial signaling direction	|
| TimeGravityAccelerationStdDevY                   	|  Standard deviation in the Y axial signaling direction	|
| TimeGravityAccelerationStdDevZ                   	|  Standard deviation in the Z axial signaling direction	|
| TimeBodyAccelerationJerkMeanX                    	|  Mean value in the X axial signaling direction	|
| TimeBodyAccelerationJerkMeanY                    	|  Mean value in the Y axial signaling direction	|
| TimeBodyAccelerationJerkMeanZ                    	|  Mean value in the Z axial signaling direction	|
| TimeBodyAccelerationJerkStdDevX                  	|  Standard deviation in the X axial signaling direction	|
| TimeBodyAccelerationJerkStdDevY                  	|  Standard deviation in the Y axial signaling direction	|
| TimeBodyAccelerationJerkStdDevZ                  	|  Standard deviation in the Z axial signaling direction	|
| TimeBodyGyroMeanX                                	|  Mean value in the X axial signaling direction	|
| TimeBodyGyroMeanY                                	|  Mean value in the Y axial signaling direction	|
| TimeBodyGyroMeanZ                                	|  Mean value in the Z axial signaling direction	|
| TimeBodyGyroStdDevX                              	|  Standard deviation in the X axial signaling direction 	|
| TimeBodyGyroStdDevY                              	|  Standard deviation in the Y axial signaling direction	|
| TimeBodyGyroStdDevZ                              	|  Standard deviation in the Z axial signaling direction	|
| TimeBodyGyroJerkMeanX                            	|  Mean value in the X axial signaling direction	|
| TimeBodyGyroJerkMeanY                            	|  Mean value in the Y axial signaling direction	|
| TimeBodyGyroJerkMeanZ                            	|  Mean value in the Z axial signaling direction	|
| TimeBodyGyroJerkStdDevX                          	|  Standard deviation in the X axial signaling direction	|
| TimeBodyGyroJerkStdDevY                          	|  Standard deviation in the Y axial signaling direction	|
| TimeBodyGyroJerkStdDevZ                          	|  Standard deviation in the Z axial signaling direction	|
| TimeBodyAccelerationMagnitudeMean                	|  Mean value 	|
| TimeBodyAccelerationMagnitudeStdDev              	|  Standard deviation 	|
| TimeGravityAccelerationMagnitudeMean             	|  Mean value 	|
| TimeGravityAccelerationMagnitudeStdDev           	|  Standard deviation 	|
| TimeBodyAccelerationJerkMagnitudeMean            	|  Mean value 	|
| TimeBodyAccelerationJerkMagnitudeStdDev          	|  Standard deviation 	|
| TimeBodyGyroMagnitudeMean                        	|  Mean value 	|
| TimeBodyGyroMagnitudeStdDev                      	|  Standard deviation 	|
| TimeBodyGyroJerkMagnitudeMean                    	|  Mean value 	|
| TimeBodyGyroJerkMagnitudeStdDev                  	|  Standard deviation 	|
| FrequencyBodyAccelerationMeanX                   	|  Mean value of the frequency of body acceleration in the X axial signaling direction	|
| FrequencyBodyAccelerationMeanY                   	|  Mean value of the frequency of body acceleration in the Y axial signaling direction	|
| FrequencyBodyAccelerationMeanZ                   	|  Mean value of the frequency of body acceleration in the Z axial signaling direction	|
| FrequencyBodyAccelerationStdDevX                 	|  Standard deviation of the frequency of body acceleration in the X axial signaling direction	|
| FrequencyBodyAccelerationStdDevY                 	|  Standard deviation of the frequency of body acceleration in the Y axial signaling direction	|
| FrequencyBodyAccelerationStdDevZ                 	|  Standard deviation of the frequency of body acceleration  in the Z axial signaling direction	|
| FrequencyBodyAccelerationJerkMeanX               	|  Mean value in the X axial signaling direction	|
| FrequencyBodyAccelerationJerkMeanY               	|  Mean value in the Y axial signaling direction	|
| FrequencyBodyAccelerationJerkMeanZ               	|  Mean value in the Z axial signaling direction	|
| FrequencyBodyAccelerationJerkStdDevX             	|  Standard deviation in the X axial signaling direction	|
| FrequencyBodyAccelerationJerkStdDevY             	|  Standard deviation in the Y axial signaling direction	|
| FrequencyBodyAccelerationJerkStdDevZ             	|  Standard deviation in the Z axial signaling direction	|
| FrequencyBodyGyroMeanX                           	|  Mean value in the X axial signaling direction	|
| FrequencyBodyGyroMeanY                           	|  Mean value in the Y axial signaling direction	|
| FrequencyBodyGyroMeanZ                           	|  Mean value in the Z axial signaling direction	|
| FrequencyBodyGyroStdDevX                         	|  Standard deviation in the X axial signaling direction	|
| FrequencyBodyGyroStdDevY                         	|  Standard deviation in the Y axial signaling direction	|
| FrequencyBodyGyroStdDevZ                         	|  Standard deviation in the Z axial signaling direction	|
| FrequencyBodyAccelerationMagnitudeMean           	|  Mean value 	|
| FrequencyBodyAccelerationMagnitudeStdDev         	|  Standard deviation 	|
| FrequencyBodyBodyAccelerationJerkMagnitudeMean   	|  Mean value 	|
| FrequencyBodyBodyAccelerationJerkMagnitudeStdDev 	|  Standard deviation 	|
| FrequencyBodyBodyGyroMagnitudeMean               	|  Mean value 	|
| FrequencyBodyBodyGyroMagnitudeStdDev             	|  Standard deviation 	|
| FrequencyBodyBodyGyroJerkMagnitudeMean           	|  Mean value 	|
| FrequencyBodyBodyGyroJerkMagnitudeStdDev         	|  Standard deviation 	|