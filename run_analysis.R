library(dplyr)
library(data.table)

# read the train and test files:
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)


X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# features:
features.org <- read.table("UCI HAR Dataset/features.txt", header = FALSE, colClasses = "character") 


# drop the first columns:
features <- features.org$V2

# add name for prediction column:
features <- append(features, "subject", after = length(features))
features <- append(features, "activity", after = length(features))


# Q1: merge the X_train and X_test to get one dataframe:
df_X <- rbind(X_train, X_test)
df_y <- rbind(y_train, y_test)
df_subject <- rbind(subject_train, subject_test)
df <- cbind(df_X, df_subject, df_y)
names(df) <- features

# Q2: extract the data for mean and std:
col <- grep("mean|std|activity|subject", names(df), value = TRUE)

# extract measurements for mean and std:
dx <- df[col]
features.dx <- names(dx)

# Q3: descriptive name for the activities:
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
dx[,"activity"] <- as.character(dx[,"activity"]) %>%
            factor(labels = activity_labels$V2 )

# Q4:dataset with descriptive variable names:
features.dx <- gsub("^t", "time", features.dx)
features.dx <- gsub("Acc", "Accelerometer", features.dx)
features.dx <- gsub("Gyro", "Gyroscope", features.dx)
features.dx <- gsub("^f", "frequency", features.dx)
features.dx <- gsub("Mag", "Magnitude", features.dx)
features.dx <- gsub("\\(\\)", "", features.dx)
features.dx <- gsub("-", "_", features.dx)

names(dx) <- features.dx
# sum(duplicated(features))
            
# Q5:
tidy <- group_by(dx, dx$activity, dx$subject) %>% summarise_all(mean)
write.table(tidy, "TidyData.txt", row.name=FALSE)
