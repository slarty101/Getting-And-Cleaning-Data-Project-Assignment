#Step 1: get the data and create the raw data set

#setup a new directoy in the working directory to import the zip data file into
if(!file.exists("./data")){dir.create("./data")}

#download the zip file from url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile ="./data/dataSet.zip")

#capture date of download
dateDownloaded <- date()

#printout date of download for user
cat("Data downloaded on:",(dateDownloaded))

#extract files from zip archive into data table objects
unzip("./data/dataSet.zip", exdir="./data/unzipped")

#read data files into objects
subjectTest <- read.table("./data/unzipped/UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./data/unzipped/UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("./data/unzipped/UCI HAR Dataset/test/X_test.txt")
subjectTrain <- read.table("./data/unzipped/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./data/unzipped/UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("./data/unzipped/UCI HAR Dataset/train/X_train.txt")
cLabels <- read.table("./data/unzipped/UCI HAR Dataset/features.txt")
activityLabels <- read.table("./data/unzipped/UCI HAR Dataset/activity_labels.txt")

#start sticking files sets together

#first stick the test and train subject file sets together
subjectData <- rbind.data.frame(subjectTest, subjectTrain)
#next stick the test and train activity file sets together
activity <- rbind.data.frame(y_test, y_train)
#then stick the test and train accelerometer file sets together 
x_join <- rbind.data.frame(X_test, X_train)

#now add the column headings to the data
names(subjectData) <- "subject"
names(activity) <- "activity"
names(x_join) <- cLabels[,2]

#now combine the columns into a single data frame
rawData <- cbind.data.frame(subjectData, activity, x_join)


#Step 2: extract the mean and SD data columns
procData <- (rawData[,c("subject","activity",colnames(rawData)[grep("Mean|mean|Std|std",colnames(rawData))])])


#Step 3: Add the descriptive activity names
activity.names <- activityLabels[,2]

activity <- procData[,2]

activity.names[activity]

#set to activity names to lower case
activity <- tolower(activity.names[activity])

#remove the underscores from the descriptive activity names
activity <- sub("_", " ", activity)

#insert the descriptive activity names back into the dataframe
procData[,"activity"] <- activity


#Step 4: Label the dataset with descriptive variable names

#make column names unique and remove underscores 
make.names(names(procData), unique = TRUE, allow_ = FALSE)

#...

#Step 5: Create the tidy data set with average of each variable for each activity and each subject
#uses the dplyr package for group_by and summarise_each

library(dplyr)

finalData <- procData %>% group_by(subject, activity) %>% summarise_each(funs(mean))

#output tidy dataset for upload with write table()
write.table(finalData, file = "./data/tidydata.txt", row.names = FALSE)
