# Getting-And-Cleaning-Data
Getting And Cleaning Data Project Assignment

#Purpose

From the project assignment instructions "The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."

#Introduction

The original study at UCI looked at gathering activity data using smartphones. From the project assignment instructions: "One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:"

The website for the original study is:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Instructions

The assignment called for the following actions:
"You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

The script (run_analysis.R) performs the following steps to fulfill the requirements:

1. Creates a directory to download the zipped data file to
2. Downloads the zipped data file from the UCI website
3. Extracts the data files from the zipped datafile
4. Reads the datafiles into objects
5. Combines the data files together into a single object
6. Extracts the mean and standard deviation variables
7. Adds descriptive activity names
8. Labels the data set with descriptive variable names
9. Groups and summarises the data by subject and activity
10. outputs the tidy data to the tidydata.txt file

Step 1: Getting the data and merging the training and the test sets to create one data set:

The run_analysis.R script starts by creating a relative location ("./data") to download the zip archive to, then downloads it from the UCI website (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) using download file(). The date  of the download is captured with date() and outputed to the console. The zipped fileset is then extracted to a sub directory (./data/unzipped) using unzip().

The individual files subject_test.txt, subject_train.txt, X_test.txt, X_train.txt, y_test.txt, y_train.txt, features.txt and activity_labels.txt are read into individual dataframes using read.table(). Each of the test and train dataframes are combined using rbind.data.frame() and then the appropriate column headings are added to each of the activity, subject and sensor dataframes using names(). The three dataframes are then combined into a single dataframe called rawData using cbind.data.frame() to create the merged dataset.

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement:

The run_analysis.R script takes the rawData dataframe and uses colnames() and grep() to extract the columns with Mean or mean or Std or std in the variable name. [see line 48 of the script] and writes them to a new dataframe called procData.

Step 3: Uses descriptive activity names to name the activities in the data set:

The run_analysis.R script takes the activity_names dataframe, extracts the activity names, converts them to lower case using tolower() and removes underscores using sub(). It then inserts this into the prodData dataframe in the activity column to convert the activity from an number (e.g. 1) to the description of the activity (e.g. walking).


#Output

#Codebook link
https://github.com/slarty101/Getting-And-Cleaning-Data-Project-Assignment/blob/master/codebook.md
