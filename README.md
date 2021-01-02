# geting_cleaning_data
This is the assignment for the course Getting and Cleaning data provided by JOHNS HOPKINS UNIVERSITY.
Information about the R scripts used for the data cleaning project. The project is based on data collected from the accelerometers from the samsung galaxy smarphone. Full description of the dataset is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones




# File 1: run_analysis.R:
This file will contain the all the excution for the following:
1. Merges the training and the test sets to create one data set.
- Load the 6 files from the two folders: train and test
- Merge all test files by columns
- Merge all train files by colums
- Merge the two data frame to get one
- Load the features file to have names of variables
- Append the name, to get the 2 last columns for activity (y) and subject (subject)
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
- Find the columns which contain "mean" or "std" or "activity" or "subject"
- Subset using the found columns
3. Uses descriptive activity names to name the activities in the data set
- Load the activity files, to see which activity corresponded to number from 1:6
- Change the value in "activity" columns and get the result.
4. Appropriately labels the data set with descriptive variable names. 
- Features names contains the short code of descriptive names, utilize this point, we can change the short code into fullly description.
5. rom the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Group dataset according to "activity" and "subject", and then take the mean.
