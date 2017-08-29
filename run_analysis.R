
## Setting System Parameters
library(reshape2)
root <- getwd()
options(max.print=1000000)

## load Test data

testsubject <- read.table("./test/subject_test.txt")
testx <- read.table("./test/X_test.txt")
testy <- read.table("./test/y_test.txt")

## load Train data

trainsubject <- read.table("./train/subject_train.txt")
trainx <- read.table("./train/X_train.txt")
trainy <- read.table("./train/y_train.txt")

## Load Other Data

activity_lables<-read.table("activity_labels.txt")
features<-read.table("features.txt")

# add column name for subject files
names(trainsubject) <- "subjectID"
names(testsubject) <- "subjectID"


# add column names for measurement files
names(trainx) <- features$V2
names(testx) <- features$V2


# add column name for label files
names(trainy) <- "activity"
names(testy) <- "activity"

## Merge Test and Train Data Frames

train <- cbind(trainsubject, trainy, trainx)
test <- cbind(testsubject, testy, testx)

combined <<- rbind(train, test)


## Extracts mean and standard deviation element for each measurement

meanstdcols <- grepl("mean\\(\\)", names(combined)) |  grepl("std\\(\\)", names(combined))

meanstdcols[1:2] <- TRUE

meanstdcols

combined <- combined[, meanstdcols]


# convert the activity column
combined$activity <- factor(combined$activity, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


# create the tidy data set
melted <- melt(combined, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)


# write csv
write.csv(tidy, "tidy.csv", row.names=FALSE)
