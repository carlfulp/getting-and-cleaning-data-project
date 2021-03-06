# Getting and Cleaning Data Project

The data set used herein are derived from the "Human Activity Recognition Using Smartphones Data Set," described in 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

and at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Data Collection Description

[_The following was copied verbatim from the "ReadMe.txt" file contained in the original data set._]

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto

Human Activity Recognition Using Smartphones Data Set 

SUMMARY: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Feature Selection 

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

[_The following was copied verbatim from the "features_info" file contained in the original data set._]

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Data Processing

To obtain a "tidy data" set, data was processed as follows:

* Data were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped into a directy on my PC.  A script, designated as "run_analysis.R" and included in this directory, was generated using R v.3.0.3 to complete the subsequent steps.
* Of the original data, the following files were used to generate the tidy data set: "X_test.txt," "y_test.txt," "subject_test.txt," "X_train.txt," "y_train.txt," "subject_train.txt," "features.txt," and "activity_labels.txt."
* Test (""X_test.txt") and Training data ("X_train.txt") sets were first merged with their respective files describing the subjects ("subject_test.txt" and "subject_train.txt") and their activities ("y_test.txt" and "y_train.txt") so that new columns were added to the data sets the contain a number corresponding to the Subject from which the observation was made and a number corresponding to one of the six Activities performed.
* Resulting merged files were then themselves merged to create a single dataframe containing both the test and training data sets.  This dataframe contained 10,299 observations for 563 variables.
* For the column corresponding to Activity, each number was then converted to a word descriptor corresponding to that activity.  The key used to match numbers to word descriptors resides in the "activity_labels.txt" file.
* Column names were then added for each of the features measured.  The key used to match the columns to features resides in the "features.txt."
* Columns corresponding to Subject, Activity, and features representing the mean and standard deviations for each measurement were retained.  All other columns were discarded. Each of the retained variables are described in detail within the CodeBook which is included in this directory.  I chose to only include those variables containing "mean()" and "std()" as described in the "features_info.txt."  Variables containing menFreq() were thus discarded. This resulted in a dataframe with 10,299 observations for 68 variables.
* Next, column names were cleaned up so that variables were formatted in the CamelCase format.  Although, it is not the format recommended by the course professors (i.e. they generally prefer variable names that do not contain capital letters) , I have chosen to take this approach for readability purposes, as the length of the variables names are quite long and unwieldy when left as lowercase.
* Finally, the tidy data set was compiled by computing the average of each variable for each activity and each subject, and these results were saved as "tidydata.txt."  The tidy data set contained 180 observations for 68 variables.

## Codebook for TidyData

The summarized tidy data set, generated from the "run_analysis.R" script, contains 180 observations (30 subjects * 6 activities/subject) for 68 variables.  The 68 variables are described below.

|Variable Name                                  	|  Variable Description 	|
|--------------------------------------------------	|---	|
| Subject                                          	|  Number 1-30 corresponding to each of the 30 individuals of whom were subjects of the experiment |
| Activity                                         	|  One of the six activities measured for each subject (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)|
| TimeBodyAccelerationMeanX                        	|  Mean value of acceleration force along the X axis (including gravity) for the time domain, measured in m/s2	|
| TimeBodyAccelerationMeanY                        	|  Mean value of acceleration force along the Y axis (including gravity) for the time domain, measured in m/s2	|
| TimeBodyAccelerationMeanZ                        	|  Mean value of acceleration force along the Z axis (including gravity) for the time domain, measured in m/s2	|
| TimeBodyAccelerationStdDevX                      	|  Normalized standard deviation of acceleration force along the X axis (including gravity) for the time domain	|
| TimeBodyAccelerationStdDevY                      	|  Normalized standard deviation of acceleration force along the Y axis (including gravity) for the time domain	|
| TimeBodyAccelerationStdDevZ                      	|  Normalized standard deviation of acceleration force along the Y axis (including gravity) for the time domain	|
| TimeGravityAccelerationMeanX                     	|  Mean value of force of gravity along the X axis for the time domain, measured in m/s2	|
| TimeGravityAccelerationMeanY                     	|  Mean value of force of gravity along the Y axis for the time domain, measured in m/s2	|
| TimeGravityAccelerationMeanZ                     	|  Mean value of force of gravity along the Z axis for the time domain, measured in m/s2	|
| TimeGravityAccelerationStdDevX                   	|  Normalized standard deviation of force of gravity along the X axis for the time domain	|
| TimeGravityAccelerationStdDevY                   	|  Normalized standard deviation of force of gravity along the Y axis for the time domain	|
| TimeGravityAccelerationStdDevZ                   	|  Normalized standard deviation of force of gravity along the Z axis for the time domain	|
| TimeBodyAccelerationJerkMeanX                    	|  Mean value of acceleration force along the X axis during jerk signal for the time domain, measured in m/s2	|
| TimeBodyAccelerationJerkMeanY                    	|  Mean value of acceleration force along the Y axis during jerk signal for the time domain, measured in m/s2	|
| TimeBodyAccelerationJerkMeanZ                    	|  Mean value of acceleration force along the Z axis during jerk signal for the time domain, measured in m/s2	|
| TimeBodyAccelerationJerkStdDevX                  	|  Normalized standard deviation of acceleration force along the X axis during jerk signal for the time domain	|
| TimeBodyAccelerationJerkStdDevY                  	|  Normalized standard deviation of acceleration force along the Y axis during jerk signal for the time domain	|
| TimeBodyAccelerationJerkStdDevZ                  	|  Normalized standard deviation of acceleration force along the Z axis during jerk signal for the time domain	|
| TimeBodyGyroMeanX                                	|  Mean value of rate of rotation around the X axis for the time domain, measured in rad/s	|
| TimeBodyGyroMeanY                                	|  Mean value of rate of rotation around the Y axis for the time domain, measured in rad/s	|
| TimeBodyGyroMeanZ                                	|  Mean value of rate of rotation around the X axis for the time domain, measured in rad/s	|
| TimeBodyGyroStdDevX                              	|  Normalized standard deviation of rate of rotation around the X axis for the time domain 	|
| TimeBodyGyroStdDevY                              	|  Normalized standard deviation of rate of rotation around the Y axis for the time domain	|
| TimeBodyGyroStdDevZ                              	|  Normalized standard deviation of rate of rotation around the Z axis for the time domain	|
| TimeBodyGyroJerkMeanX                            	|  Mean value of rate of rotation around the X axis during jerk signal for the time domain, measured in rad/s	|
| TimeBodyGyroJerkMeanY                            	|  Mean value of rate of rotation around the Y axis during jerk signal for the time domain, measured in rad/s	|
| TimeBodyGyroJerkMeanZ                            	|  Mean value of rate of rotation around the Z axis during jerk signal for the time domain, measured in rad/s	|
| TimeBodyGyroJerkStdDevX                          	|  Normalized standard deviation of rate of rotation around the X axis during jerk signal for the time domain	|
| TimeBodyGyroJerkStdDevY                          	|  Normalized standard deviation of rate of rotation around the Y axis during jerk signal for the time domain	|
| TimeBodyGyroJerkStdDevZ                          	|  Normalized standard deviation of rate of rotation around the Z axis during jerk signal for the time domain	|
| TimeBodyAccelerationMagnitudeMean                	|  Mean value of acceleration force magnitude for the time domain, measured in m/s2 	|
| TimeBodyAccelerationMagnitudeStdDev              	|  Normalized standard deviation of acceleration force magnitude for the time domain 	|
| TimeGravityAccelerationMagnitudeMean             	|  Mean value of force of gravity magnitude for the time domain, measured in m/s2	|
| TimeGravityAccelerationMagnitudeStdDev           	|  Normalized standard deviation of force of gravity magnitude for the time domain	|
| TimeBodyAccelerationJerkMagnitudeMean            	|  Mean value of acceleration force magnitude during jerk signal for the time domain, measured in m/s2	|
| TimeBodyAccelerationJerkMagnitudeStdDev          	|  Normalized standard deviation of acceleration force magnitude during jerk signal for the time domain 	|
| TimeBodyGyroMagnitudeMean                        	|  Mean value of rate of rotation magnitude for the time domain, measured in rad/s 	|
| TimeBodyGyroMagnitudeStdDev                      	|  Normalized standard deviation of rate of rotation magnitude for the time domain	|
| TimeBodyGyroJerkMagnitudeMean                    	|  Mean value of rate of rotation magnitude during jerk signal for the time domain, measured in rad/s 	|
| TimeBodyGyroJerkMagnitudeStdDev                  	|  Normalized standard deviation of rate of rotation magnitude during jerk signal for the time domain	|
| FrequencyBodyAccelerationMeanX                   	|  Mean value of acceleration force along the X axis (including gravity) for the frequency domain, measured in m/s2	|
| FrequencyBodyAccelerationMeanY                   	|  Mean value of acceleration force along the Y axis (including gravity) for the frequency domain, measured in m/s2	|
| FrequencyBodyAccelerationMeanZ                   	|  Mean value of acceleration force along the Z axis (including gravity) for the frequency domain, measured in m/s2	|
| FrequencyBodyAccelerationStdDevX                 	|  Normalized standard deviation of acceleration force along the X axis (including gravity) for the frequency domain	|
| FrequencyBodyAccelerationStdDevY                 	|  Normalized standard deviation of acceleration force along the Y axis (including gravity) for the frequency domain	|
| FrequencyBodyAccelerationStdDevZ                 	|  Normalized standard deviation of acceleration force along the Z axis (including gravity) for the frequency domain	|
| FrequencyBodyAccelerationJerkMeanX               	|  Mean value of acceleration force along the X axis during jerk signal for the frequency domain, measured in m/s2	|
| FrequencyBodyAccelerationJerkMeanY               	|  Mean value of acceleration force along the Y axis during jerk signal for the frequency domain, measured in m/s2	|
| FrequencyBodyAccelerationJerkMeanZ               	|  Mean value of acceleration force along the Z axis during jerk signal for the frequency domain, measured in m/s2	|
| FrequencyBodyAccelerationJerkStdDevX             	|  Normalized standard deviation of acceleration force along the X axis during jerk signal for the frequency domain	|
| FrequencyBodyAccelerationJerkStdDevY             	|  Normalized standard deviation of acceleration force along the Y axis during jerk signal for the frequency domain	|
| FrequencyBodyAccelerationJerkStdDevZ             	|  Normalized standard deviation of acceleration force along the Z axis during jerk signal for the frequency domain	|
| FrequencyBodyGyroMeanX                           	|  Mean value of frequency of angular velocity in the X axial signaling direction for the frequency domain, measured in Hz	|
| FrequencyBodyGyroMeanY                           	|  Mean value of frequency of angular velocity in the Y axial signaling direction for the frequency domain, measured in Hz	|
| FrequencyBodyGyroMeanZ                           	|  Mean value of frequency of angular velocity in the Z axial signaling direction for the frequency domain, measured in Hz	|
| FrequencyBodyGyroStdDevX                         	|  Normalized standard deviation of frequency of angular velocity in the X axial signaling direction for the frequency domain	|
| FrequencyBodyGyroStdDevY                         	|  Normalized standard deviation of frequency of angular velocity in the Y axial signaling direction for the frequency domain	|
| FrequencyBodyGyroStdDevZ                         	|  Normalized standard deviation of frequency of angular velocity in the Z axial signaling direction for the frequency domain	|
| FrequencyBodyAccelerationMagnitudeMean           	|  Mean value of acceleration force magnitude for the frequency domain, measured in m/s2 	|
| FrequencyBodyAccelerationMagnitudeStdDev         	|  Normalized standard deviation of acceleration force magnitude for the frequency domain	|
| FrequencyBodyBodyAccelerationJerkMagnitudeMean   	|  Mean value of acceleration force magnitude during jerk signal for the frequency domain, measured in m/s2	|
| FrequencyBodyBodyAccelerationJerkMagnitudeStdDev 	|  Normalized standard deviation of acceleration force magnitude during jerk signal for the frequency domain	|
| FrequencyBodyBodyGyroMagnitudeMean               	|  Mean value of rate of rotation magnitude for the frequency domain, measured in rad/s	|
| FrequencyBodyBodyGyroMagnitudeStdDev             	|  Normalized standard deviation of rate of rotation magnitude for the frequency domain	|
| FrequencyBodyBodyGyroJerkMagnitudeMean           	|  Mean value of rate of rotation magnitude during jerk signal for the frequency domain, measured in rad/s	|
| FrequencyBodyBodyGyroJerkMagnitudeStdDev         	|  Normalized standard deviation of rate of rotation magnitude during jerk signal for the frequency domain	|