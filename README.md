## getting-and-cleaning-data-project

Contains the scripts required for course project of the JHU Getting and Cleaning Data course

Data was processed as follows:

* Of the original data, the following files were used to generate the tidy data set: "X_test.txt," "y_test.txt," "subject_test.txt," "X_train.txt," "y_train.txt," "subject_train.txt," "features.txt," and "activity_labels.txt."
* Test (""X_test.txt") and Training data ("X_train.txt") sets were merged with their respective files describing the subjects ("subject_test.txt" and "subject_train.txt") and their activities ("y_test.txt" and "y_train.txt") so that new columns was added to the data set the contain a number corresponding to the Subject from which the observation was made and a number correspoding to one of the six Sctivities performed.
* Resulting merged files were then themselves merged to create a dataframe so that a single dataframe contained both test and training data.
* For the column corresponding to Activity, each number was converted to a word descriptor for that activity.  The key used to match numbers to word descriptor resides in the "activity_labels.txt" file.
* Column names were then added for each of the features measured.  The key used to match the columns to features resides in the "features.txt."
* 
