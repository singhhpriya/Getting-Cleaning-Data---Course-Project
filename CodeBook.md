## About source data:
The Human Activity Recognition Using Smartphones Data Set was used as a source data. A full description of the data used in this project can be found at - (http://archive.ics.uci.edu/ml/datasets)


## About course project and R script:
This is the course project for Getting and Cleaning Data course on Coursera. The source file for the code is 'run_analysis.R'. This script performs the following steps:
1. Merges the training and test sets to create one dataset - reads all data files: test tables, training tables, activity tables; assigns column names to all tables; merges all data into one dataset.
2. Extracts only the measurements for identifying ID, mean and standard deviation - reads column names; creates vector for identifying ID, mean and standard deviation; sub sets to extract the desired data.
3. Uses descriptive names to name activities in the dataset. Appropriately labels the dataset with descriptive variable names.
4. Creates a second, independent tidy dataset with the average of each variable for each activity and each subject - makes second dataset; writes second tidy dataset in text file.


## About variables:
* Variables containing data from the downloaded files:
x_train, y_train, x_test, y_test, subject_train and subject_test
* Variables used for merging the previous datasets for further analysis:
x_train, y_train, x_test, y_test (^called *here* x_data, y_data, and subject_data, respectively)
* Variables containing correct names for the ^x_data dataset, which are applied to the column names stored in the features.




