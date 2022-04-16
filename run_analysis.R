# download the data from net
if(!file.exists("./data")){dir.create("./data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileurl, "./data/UCI_HAR_dataset.zip")
unzip("./data/UCI_HAR_dataset.zip",exdir =  "./data")

# Step 1

# import the dataset in R
# merge labels, subject and set for training and test data set.
trainset <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainlabels <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
settrain <- cbind(trainsubject, trainlabels, trainset)

testset <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testlables <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
settest <- cbind(testsubject, testlables, testset)

# then merge the training data set and test data set as the whole data set.
datset <- rbind(settrain, settest)



# Step 2

# to make sure the measurements I extracted are mean and standard.
# name the data set first, then extracted.
features <- read.table("./data/UCI HAR Dataset/features.txt")
names(datset) <- c("subject number", "activity labels", features[, 2])
index <- grep("mean[^a-zA-Z]|std", features[, 2]) + 2
datset <- datset[, c(1, 2, index)]



# Step 3

# use "activity_labels.txt" in file to match.
labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
datset$`activity labels` <- factor(datset$`activity labels`, levels = labels[, 1], labels = labels[, 2])



# Step 4
# I have named the data set in Step 2.
# for subject column, I think it's better be a factor.
datset$`subject number` <- factor(datset$`subject number`)



# Step 5
library(reshape2)
datamelt <- melt(datset, id = c("subject number", "activity labels"))
crossmean <- ftable(acast(datamelt, `subject number` ~ `activity labels` ~ variable, mean))