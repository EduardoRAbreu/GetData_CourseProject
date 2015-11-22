library(reshape2)

## Load data into R for use, load labels, relabel headers, combine data frames
features_labels <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

subject_test <- read.table("subject_test.txt")
names(subject_test) <- c("subject_id")

test_labels <- read.table("y_test.txt")
names(test_labels) <- c("activity")

test_set <- read.table("X_test.txt")

## Doing step 4, appropriately labels the data set with descriptive variable names, early
names(test_set) <- features_labels$V2 

unified_test <- cbind(subject_test, test_labels, test_set)



## Repeat steps for train data

subject_train <- read.table("subject_train.txt")
names(subject_train) <- c("subject_id")

train_labels <- read.table("y_train.txt")
names(train_labels) <- c("activity")

train_set <- read.table("X_train.txt")

## Doing step 4, appropriately labels the data set with descriptive variable names, early
names(train_set) <- features_labels$V2

unified_train <- cbind(subject_train, train_labels, train_set)



## 1. Merges the training and the test sets to create one data set

unified_data <- rbind(unified_test, unified_train)


## 2. Extracts only the measurements on the mean and standard deviation for
## each measurement

mean_index_id <- grep("mean", names(unified_data), ignore.case = TRUE, value = FALSE)
std_index_id <- grep("std", names(unified_data), ignore.case = TRUE, value = FALSE)

selected_data <- unified_data[,sort(c(mean_index_id, std_index_id, 1, 2))] #indexes 1, 2 for subject id and activity


## 3. Uses descriptive activity names to name the activities in the data set

selected_data_labeled <- selected_data
selected_data_labeled$activity <- with(activity_labels, activity_labels$V2[match(selected_data_labeled$activity, activity_labels$V1)])


## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

melt_data <- melt(selected_data_labeled, id = c("subject_id", "activity"), measure.vars = names(selected_data_labeled[,3:ncol(selected_data_labeled)]))
tidy_data <- dcast(melt_data, subject_id + activity ~ variable, mean)