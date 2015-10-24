Input Data 
The script assumes the UCI dataset is extracted in the local directory. If it is not found, it will try to download and extract it.

Input data meaning

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Input data files

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

Output data
The resulting tidy_data.txt data set includes mean and standard deviation variables for the following original variables,

tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag. All three X, Y, Z directions are included.

The above variables where choosen as they included either mean or std in their original names.

Transformations
The script, run_analysis.R, does the following:

Load the various sparse data files from the UCI dataset;
Merges the three test and three train files into a single data table;
Creates a smaller second dataset, containing only mean and std variables;
Computes the means of this secondary dataset, group by subject/activity;
Saves this last dataset to tidy_data.txt.