#Installing and loading all necessary packages

install.packages("car")

library(car)


#Reading the files

train <- read.table("./UCI HAR Dataset/train/X_train.txt")

test <- read.table("./UCI HAR Dataset/test/X_test.txt")

trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

trainAct <- read.table("./UCI HAR Dataset/train/y_train.txt")

testAct <- read.table("./UCI HAR Dataset/test/y_test.txt")


#Merging the files

trainFull <- cbind(trainSub, trainAct, train) #binds the subject and activity data to the values in train

testFull <- cbind(testSub, testAct, test) #binds the subject and activity data to the values in test

combinedData <- rbind(trainFull, testFull) #binds the full test and train data together


#Obtaining the column names

featurenames <- read.table("./UCI HAR Dataset/features.txt")

featurenames$V2 <- as.character(featurenames$V2)


#Binding the column names to the columns in combinedData

names(combinedData) <- c("SubjectNumber", "Activity", featurenames$V2)


#Recoding the activity names

combinedData$Activity <- recode(combinedData$Activity, '1 = "WALKING"; 2="WALKING_UPSTAIRS"; 3="WALKING_DOWNSTAIRS"; 4="SITTING"; 5="STANDING"; 6="LAYING"')


#Extracting only the mean and std columns

MeanStdColumns <- grep("[Mm]ean|std|Activity|SubjectNumber", names(combinedData), ignore.case=TRUE)

combinedDataMeanStd <- combinedData[,MeanStdColumns]


#Producing the tidy data set using aggregate

tidydata <-aggregate(combinedDataMeanStd,by=list(combinedDataMeanStd$SubjectNumber, combinedDataMeanStd$Activity), FUN=mean)


#Cleaning up duplicate columns

tidydata[,3] <- NULL
tidydata[,3] <- NULL


#Renaming Group.1 and Group.2 columns

names(tidydata)[1:2] <- c("SubjectNumber", "Activity")


#Writing to a text file

write.table(tidydata, file="./tidydata.txt")