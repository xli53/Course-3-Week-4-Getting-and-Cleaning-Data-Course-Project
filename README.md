# Course-3-Week-4-Getting-and-Cleaning-Data-Course-Project

This repository is a submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset.

### Dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Descriotion of dataset
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Objective
The goal of this project is to prepare tidy data that can be used for later analysis. 

### Files
* run_analysis.R: Performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* CodeBook.md: A code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

* tidy_set2.txt is the exported final tidy data awr after going through all the sequences described above.

How to run:
To make this script run just download the dataset and the run_analysis.R in your R working directory. One time ran, the script automates all tasks.

Authors
Xiao Li





