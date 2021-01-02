# CodeBook:
Describes the variables and any transformations which are made to clean and tidy our dataset.

# Initial Variables:
Reading files and assign them to the following variables:
1. X_test/X_train: dataframe, no header - 2947 rows and 561 columns: data of X_train.txt and X_test.txt files.
2. y_test/y_train: dataframe, no header - 2947 rows and 1 columns: data of y_train.txt and y_test.txt files.
3. subject_test/ subject_train: dataframe, no header - 2947 rows and 1 columns: data of y_train.txt and y_test.txt files.
4. features.org: dataframe, no header - 561 rows and 2 columns, the first column is the id, and second is the names of variables: data from from features.txt file
5. activity_labels: dataframe: 6 rows and 2 columns: the first column is the label of each activities in the second column: data from the activity_labels.txt

# Other Variables:
1. df: the full dataset: dataframe - 10299 rows and 563 columns.
2. features: names columns of df.
3. dx: dataframe - 10299 rows and 81 columns: the subseted dataset, contain the only the measurements on the mean and standard deviation for each measurement, and the activity and the subject.
4. tidy: 180 rows and 83 columns: data set with the average of each variable for each activity and each subject
