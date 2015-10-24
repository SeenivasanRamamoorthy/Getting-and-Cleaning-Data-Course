Getting and Cleaning Data Course Project
This project contains one R script, run_analysis.R, which will calculate means per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset Version 1.0.

Once executed, the resulting dataset maybe found at tidy_data.txt

run_analysis.R will:

Download and process the required data.
Label the columns of data sets accordingly.
Combine train and test datasets into one complete data set.
Create a second, independent tidy data set with average of each variable for each activity and each subject.
Write the tidy_data.txt to a space separated text file.
Required R Packages

The R package reshape2 is required to run this script.