The run_analysis.R script performs the data preparation and followed by the following steps required as described in the course project’s definition.

#### 1. Download the dataset
* Downloaded the dataset and extracted under the folder called UCI HAR Dataset.

#### 2. Assign each data to variables
* x_train <- X_train.txt : 7352 rows, 561 columns \
  contains recorded features train data
* y_train <- y_train.txt : 7352 rows, 1 columns \
  contains train data of activities’code labelsfeatures <- features.txt : 561 rows, 2 columns
* subject_train <- subject_train.txt : 7352 rows, 1 column
* x_test <- X_test.txt : 2947 rows, 561 columns \
  contains recorded features test data
* y_test <- y_test.txt : 2947 rows, 1 columns \
  contains test data of activities’code labels
* subject_test <- subject_test.txt : 2947 rows, 1 column
* features <- features.txt : 561 rows, 2 columns \
  The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* activitieLabels <- activity_labels.txt : 6 rows, 2 columns \
  List of activities performed when the corresponding measurements were taken and its codes (labels)

#### 3. Label the data set with descriptive variable names
* colnames(x_train) <- features[, 2]
* colnames(y_train) <- "activityId"
* colnames(subject_train) <- "subjectId"
* colnames(x_test) <- features[, 2]
* colnames(y_test) <- "activityId"
* colnames(subject_test) <- "subjectId"
* colnames(activityLabels) <- c('activityId','activityType')

#### 4. Merge the training and the test sets to create one data set
* merge_train (7352 rows, 563 columns) is created by merging subject_train, x_train, y_train using cbind() function.
* merge_test (2947 rows, 563 columns) is created by merging subject_test, x_test, y_test using cbind() function.
* tidy_set (10299 rows, 563 column) is created by merging merge_train and merge_test using rbind() function.

#### 5. Extract only the measurements on the mean and standard deviation for each measurement
* mean_and_std_set (10299 rows, 81 columns) is created by subsetting tidy_set, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement using grepl().

#### 6. Use descriptive activity names to name the activities in the data set
* Activity names (activityLables) is merged with mean_and_std_set by "activityId". A new column called activityType is added in the end of mean_and_std_set. The new data set is called with_activityNames_set.

#### 7. Create a second, independent tidy data set with the average of each variable for each activity and each subject
* tidy_set2 (180 rows, 82 columns) is created by sumarizing with_activityNames_set taking the means of each variable for each activity and each subject, after groupped by subjectId and activityId using aggregate().
* Export tidy_set2 into tidy_set2.txt file.
