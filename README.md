## About data source: 
A full description of the data is available at - (http://archive.ics.uci.edu/ml/datasets).
Information about how the experiment was conducted and how the original data was collected is available at - (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


## About course project and R script:
This is the course project for Getting and Cleaning Data course on Coursera. The source file for the code is 'run_analysis.R'. This script performs the following steps:
1. Downloads the dataset after checking it does not already exist in the working directory.
2. Reads both the training and test datasets.
3. Reads the activity and subject data.
4. Merges test and training datasets to create one dataset
5. Extracts only columns containing mean and standard deviation.
6. Uses descriptive activity names to name the activities in the data set. Appropriately labels dataset with descriptive variable names.
7. Creates a second, independent tidy dataset with the average of each variable for each activity and each subject


CodeBook.md contains information about how the variables and data have been used and modified. It also reports the transformations or work performed to clean up the data.

The output of the final step is called TidySet.txt, and uploaded in the course project's repo.


