
# Dowload and unzip dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./dataset.zip")

# unzip dataset
unzip(zipfile = "./dataset.zip", exdir = "./")

# read training set
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test set
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read feature vector and activity labels
features <- read.table('./UCI HAR Dataset/features.txt')
activityLabels = read.table('./UCI HAR Dataset/activity_labels.txt')

# appropriately labels the data set with descriptive variable names
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[, 2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

# merge training set and test set in one dataset
merge_train <- cbind(subject_train, x_train, y_train)
#dim(merge_train)
merge_test <- cbind(subject_test, x_test, y_test)
#dim(merge_test)
tidy_set <- rbind(merge_train, merge_test)
#dim(tidy_set)

# extract only the measurements on the mean and standard deviation for each measurement.
colNames <- colnames(tidy_set)
mean_and_std <- (grepl("activityId", colNames) | 
                   grepl("subjectId", colNames) | 
                   grepl("mean..", colNames) | 
                   grepl("std..", colNames) 
)
mean_and_std_set <- tidy_set[, mean_and_std == TRUE]
#dim(mean_and_std_set)

# use descriptive activity names to name the activities in the data set
with_activityNames_set <- merge(mean_and_std_set, activityLabels,
                            by = "activityId",
                            all.x = TRUE)
head(with_activityNames_set)

# from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
with_activityNames_set$activityType <- as.factor(with_activityNames$activityType)
head(with_activityNames_set$activityType)
tidy_set2 <- aggregate(. ~ subjectId + activityId, with_activityNames_set, mean)
# many ~ subjectId + activityId
tidy_set2 <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# write second tidy data set in txt file
write.table(tidy_set2, "tidy_set2.txt", row.name = FALSE)
