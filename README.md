# EduardoRAbreu's Project for Getting and Cleaning Data course

## The R script included in this repo, run_analysis.R, is used to summarize the data provided for the assignment
## The assignment data was sourced from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## The data specific to the assignment was provided as: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# !! Please note that before running the script described below, that you need to install the R package reshape2!!

## My script takes the data sets provided and performs the following steps:

## 1) it loads the reshape2 package for use at the end of the script
## 2) loads the data into R, from working directory. At this point, it also loads the labels and relabel headers needed later
## 3) begins working with the test data, performing the following manipulations:
##   3.a) it labels the data set sourced from subject_test.txt as subject_id
##   3.b) it labels the data set sourced from y_test.txt as activity
##   3.c) it labels the data set sourced from X_test.txt as the appropriate observation so as to know what the data are.
## 4) the script then repeats step 3 for the train data.
## 5) the script then combines the test and train data sets through the use of an rbind
## 6) now the script creates index values for observations that contain either a mean or a standard deviation observation
## 7) the script then parses out the subject_id and activity columns as well as any that are either a mean or standard deviation
## 8) now the script replaces the numeric values found in the activity column with the appropriate name as provided by the activity_labels.txt file
## 9) finally, the script uses melt and dcast from the reshape2 package to create a tidy data set

# Please note that the tidy data set prepared by the script is the wide form and the data are summarized by subject_id, then by activity and that
# the data provided for each observation is the mean of the normalized observation data from the original data set.