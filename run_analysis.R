# 1. Downloading all data files:
if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip")

## Unzipping dataset to /data directory
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")


# 2. Merging test and training data to create one data set:
## 2.1 Reading all files
### Reading training tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

### Reading test tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

### Reading feature vectors:
features <- read.table('./data/UCI HAR Dataset/features.txt')

### Reading activity labels:
activityLabels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

## 2.2 Assigning column names
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[, 2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(features) <- "features"
colnames(activityLabels) <- c('activityId','activityType')

## 2.3. Merging ALL datasets
mergetrain <- cbind(y_train, subject_train, x_train)
mergetest <- cbind(y_test, subject_test, x_test)
completedata <- rbind(mergetrain, mergetest)


# 3. Extracting only the measurements on the mean and standard deviation for each measurement
colNames <- colnames(completedata)

mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

subset_MeanAndStd <- completedata[ , mean_and_std == TRUE]


# 4. Using descriptive activity names to name the activities in the data set:
descriptiveActivityNames <- merge(subset_MeanAndStd, activityLabels,
                                  by='activityId',
                                  all.x=TRUE)


# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:
## 5.1 Creating second tidy data set
TidySet <- aggregate(. ~subjectId + activityId, descriptiveActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

## 5.2 Writing second tidy data set in txt file
write.table(TidySet, "TidySet.txt", row.name=FALSE)

