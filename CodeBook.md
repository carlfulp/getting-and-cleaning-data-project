## getting-and-cleaning-data-project
## =================================

# Data Collection Description

[The following was copied verbatim from the ReadMe.txt file contained in the original data set.]

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto

Human Activity Recognition Using Smartphones Data Set 

SUMMARY: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

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