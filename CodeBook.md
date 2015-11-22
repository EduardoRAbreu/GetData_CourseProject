## Codebook for EduardoRAbreu's Project for Getting and Cleaning Data course

### This codebook enhances the explanatory documents provided with the assignment's data set
### The assignment data was sourced from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
### The data specific to the assignment was provided as: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### The modification that I made to the data were limited to the following:

### 1) In both the test and train data sets, I added a column heading, subject_id, to the subject_test and subject_train data
### 2) In both the test and train data sets, I added a column heading, activity, to the y_test and y_train data
### 3) In both the test abd train data sets, I added column headings to the X_test and X_train data
###   a. Please note that these headings were provided in the original data in the file labeled features.txt
###   b. Further note, I did not rename these headings so as to preserve the original nomenclature and enable traceback in the future
### 4) I also combined the train and test data sets so as to have a complete account of all 30 test subjects.
### 5) I then stripped out from the data any feature/observation that was not either a mean or a standard deviation observation
### 6) I then replaced the numeric values found in the activity column with the appropriate name as provided by the activity_labels.txt file
### 7) Finally, I summarized the data into a tidy data set so as to display only the mean of all observations, by feature, for each activity undertaken by each subject

## This is meant to supplement the codebooks that accompany the data set: README.txt and features_info.txt

## All numeric observations, as denoted in the README that accompanied the data set, are "... normalized and bounded within [-1,1]." Given this, there are no units per observation as the tidy data output are means on already normalized data.