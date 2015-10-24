library(reshape2)
zipFile <- "DataSet.zip"
dataDir <- "UCI HAR Dataset"

if (!file.exists(dataDir)) {
  if (!file.exists(zipFile)) {
    fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, zipFile)
  }
  
  if (!file.exists(dataDir)) {
    unzip(zipFile)
  }
}

testDir  <- paste0(dataDir, "/test")
trainDir <- paste0(dataDir, "/train")

# Load all datasets
test.subject    <- read.table(paste0(testDir, "/subject_test.txt"))
test.x          <- read.table(paste0(testDir, "/X_test.txt"))
test.y          <- read.table(paste0(testDir, "/y_test.txt"))

train.subject   <- read.table(paste0(trainDir, "/subject_train.txt"))
train.x         <- read.table(paste0(trainDir, "/X_train.txt"))
train.y         <- read.table(paste0(trainDir, "/y_train.txt"))

features        <- read.table(paste0(dataDir, "/features.txt"))
activity.labels <- read.table(paste0(dataDir, "/activity_labels.txt"))

# 1. Merges the training and the test sets to create one data set.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.

subject <- rbind(test.subject, train.subject)
names(subject) <- "subject"

x <- rbind(test.x, train.x)
names(x) <- features[, 2]

y <- rbind(test.y, train.y)
y <- merge(y, activity.labels, by = 1)[, 2]

data <- cbind(subject, y, x)
names(data)[2] <- "label"

# 2. Extracts only the measurements on the mean and standard deviation
#    for each measurement.

# FIXME: some matches are meanFreq, should grep not
#        be using "-mean\\(|-std\\(" for text maybe???
matched <- grep("-mean|-std", names(data))
data.mean_std <- data[, c(1, 2, matched)]

# 5. Creates a second, independent tidy data set with the average of each
#    variable for each activity and each subject.

melted = melt(data.mean_std, id.var = c("subject", "label"))
means = dcast(melted , subject + label ~ variable, mean)
write.table(means, file="tidy_data.txt",row.name = FALSE)