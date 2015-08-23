---
title: "Getting and cleaning Data Project Assignment Codebook"
author: "Simon West"
date: "23rd August 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
From the Project Assignment instructions "The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis."

##Study design and data processing
The original study at UCI looked at gathering activity data using smartphones. From the project assignment instructions: "One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:"

The website for the original study is:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Collection of the raw data
The run_analysis.R script downloads the zipped raw data files from the original study website;

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



###Notes on the original (raw) data 
THe downloaded UCI HAR Dataset zip file contains 2 folders (test and train) and 4 text files (activity_labels, features, features_info and README). The 2 folders contain 3 text files and a sub folder each (subject_test, X_test, y_test and sub folder Inertial Signals) and (subject_train, X_train, y_train).

For the purposes of this assigment the Inertial Signals sub folders were ingnored.

##Creating the tidy datafile

###Guide to create the tidy data file
To create the tidy data file the user only has to run the run_analysis.R script. The script will automatically download the datafiles from the UCI HAR web site and process them to create the tidy data file.

###Cleaning of the data
The script (run_analysis.R) performs the following steps:

1. Creates a directory to download the zipped data file to
2. Downloads the zipped data file from the UCI HAR website
3. Extracts the data files from the zipped datafile
4. Reads the datafiles into objects
5. Combines the data files together into a single object
6. Extracts the mean and standard deviation variables
7. Adds descriptive activity names
8. Labels the data set with descriptive variable names
9. Groups and summarises the data by subject and activity
10. outputs the tidy data to the tidydata.txt file

The readme provides full details of the processing steps. 
[link to the readme document that describes the code in greater detail]()

##Description of the variables in the tidy_data.txt file
The tidy data output file (tidydata.txt) contains the following dataset;
 - a 88 column dataframe containing 180 rows of summarised data
 
 - the data is the extracted means and standard deviation measures from the original dataset that have been averaged and grouped by subject and activity
 
 - Variables present in the dataset
 
Variable	                            Type	Description

subject	                              int	  individual test subject
activity	                            chr	  activity undertaken for measure
tBodyAcc-mean()-X	                    num	  Mean of time domain body accelerometer mean X axis  
tBodyAcc-mean()-Y	                    num	  Mean of time domain body accelerometer mean Y axis  
tBodyAcc-mean()-Z	                    num	  Mean of time domain body accelerometer mean Z axis  
tBodyAcc-std()-X	                    num	  Mean of time domain body accelerometer standard deviation X axis  
tBodyAcc-std()-Y	                    num	  Mean of time domain body accelerometer standard deviation Y axis  
tBodyAcc-std()-Z	                    num	  Mean of time domain body accelerometer standard deviation Z axis  
tGravityAcc-mean()-X	                num	  Mean of time domain gravity accelerometer mean X axis  
tGravityAcc-mean()-Y	                num	  Mean of time domain gravity accelerometer mean Y axis  
tGravityAcc-mean()-Z	                num	  Mean of time domain gravity accelerometer mean Z axis  
tGravityAcc-std()-X	                  num	  Mean of time domain gravity accelerometer standard deviation X axis  
tGravityAcc-std()-Y	                  num	  Mean of time domain gravity accelerometer standard deviation Y axis  
tGravityAcc-std()-Z	                  num	  Mean of time domain gravity accelerometer standard deviation Z axis  
tBodyAccJerk-mean()-X	                num	  Mean of time domain body accelerometer Jerk mean X axis 
tBodyAccJerk-mean()-Y	                num	  Mean of time domain body accelerometer Jerk mean Y axis 
tBodyAccJerk-mean()-Z	                num	  Mean of time domain body accelerometer Jerk mean Z axis 
tBodyAccJerk-std()-X	                num	  Mean of time domain body accelerometer Jerk standard deviation X axis 
tBodyAccJerk-std()-Y	                num	  Mean of time domain body accelerometer Jerk standard deviation Y axis 
tBodyAccJerk-std()-Z	                num	  Mean of time domain body accelerometer Jerk standard deviation Z axis 
tBodyGyro-mean()-X	                  num	  Mean of time domain body gyroscope mean X axis  
tBodyGyro-mean()-Y	                  num	  Mean of time domain body gyroscope mean Y axis  
tBodyGyro-mean()-Z	                  num	  Mean of time domain body gyroscope mean Z axis  
tBodyGyro-std()-X	                    num	  Mean of time domain body gyroscope standard deviation X axis  
tBodyGyro-std()-Y	                    num	  Mean of time domain body gyroscope standard deviation Y axis  
tBodyGyro-std()-Z	                    num	  Mean of time domain body gyroscope standard deviation Z axis  
tBodyGyroJerk-mean()-X	              num	Mean of time domain body gyroscope Jerk mean X axis 
tBodyGyroJerk-mean()-Y	              num	Mean of time domain body gyroscope Jerk mean Y axis 
tBodyGyroJerk-mean()-Z	              num	Mean of time domain body gyroscope Jerk mean Z axis 
tBodyGyroJerk-std()-X	                num	Mean of time domain body gyroscope Jerk standard deviation X axis 
tBodyGyroJerk-std()-Y	                num	Mean of time domain body gyroscope Jerk standard deviation Y axis 
tBodyGyroJerk-std()-Z	                num	Mean of time domain body gyroscope Jerk standard deviation Z axis 
tBodyAccMag-mean()	                  num	Mean of time domain body accelerometer magnitude mean  
tBodyAccMag-std()	                    num	Mean of time domain body accelerometer magnitude standard deviation  
tGravityAccMag-mean()	                num	Mean of time domain gravity accelerometer magnitude mean  
tGravityAccMag-std()	                num	Mean of time domain gravity accelerometer magnitude standard deviation  
tBodyAccJerkMag-mean()	              num	Mean of time domain body accelerometer jerk magnitude mean 
tBodyAccJerkMag-std()	                num	Mean of time domain body accelerometer jerk magnitude standard deviation 
tBodyGyroMag-mean()	                  num	Mean of time domain body gyroscope magnitude mean  
tBodyGyroMag-std()	                  num	Mean of time domain body gyroscope magnitude standard deviation  
tBodyGyroJerkMag-mean()	              num	Mean of time domain body gyroscope Jerk magnitude mean 
tBodyGyroJerkMag-std()	              num	Mean of time domain body gyroscope Jerk magnitude standard deviation 
fBodyAcc-mean()-X	                    num	Mean of frequency domain body accelerometer mean X axis  
fBodyAcc-mean()-Y	                    num	Mean of frequency domain body accelerometer mean Y axis  
fBodyAcc-mean()-Z	                    num	Mean of frequency domain body accelerometer mean Z axis  
fBodyAcc-std()-X	                    num	Mean of frequency domain body accelerometer standard deviation X axis  
fBodyAcc-std()-Y	                    num	Mean of frequency domain body accelerometer standard deviation Y axis  
fBodyAcc-std()-Z	                    num	Mean of frequency domain body accelerometer standard deviation Z axis  
fBodyAcc-meanFreq()-X	                num	Mean of frequency domain body accelerometer mean frequency X axis 
fBodyAcc-meanFreq()-Y	                num	Mean of frequency domain body accelerometer mean frequency Y axis 
fBodyAcc-meanFreq()-Z	                num	Mean of frequency domain body accelerometer mean frequency Z axis 
fBodyAccJerk-mean()-X	                num	Mean of frequency domain body accelerometer Jerk mean X axis 
fBodyAccJerk-mean()-Y	                num	Mean of frequency domain body accelerometer Jerk mean Y axis 
fBodyAccJerk-mean()-Z	                num	Mean of frequency domain body accelerometer Jerk mean Z axis 
fBodyAccJerk-std()-X	                num	Mean of frequency domain body accelerometer Jerk standard deviation X axis 
fBodyAccJerk-std()-Y	                num	Mean of frequency domain body accelerometer Jerk standard deviation Y axis 
fBodyAccJerk-std()-Z	                num	Mean of frequency domain body accelerometer Jerk standard deviation Z axis 
fBodyAccJerk-meanFreq()-X	            num	Mean of frequency domain body accelerometer Jerk mean frequency X axis
fBodyAccJerk-meanFreq()-Y	            num	Mean of frequency domain body accelerometer Jerk mean frequency Y axis
fBodyAccJerk-meanFreq()-Z	            num	Mean of frequency domain body accelerometer Jerk mean frequency Z axis
fBodyGyro-mean()-X	                  num	Mean of frequency domain body gyroscope mean X axis  
fBodyGyro-mean()-Y	                  num	Mean of frequency domain body gyroscope mean Y axis  
fBodyGyro-mean()-Z	                  num	Mean of frequency domain body gyroscope mean Z axis  
fBodyGyro-std()-X	                    num	Mean of frequency domain body gyroscope standard deviation X axis  
fBodyGyro-std()-Y	                    num	Mean of frequency domain body gyroscope standard deviation Y axis  
fBodyGyro-std()-Z	                    num	Mean of frequency domain body gyroscope standard deviation Z axis  
fBodyGyro-meanFreq()-X	              num	Mean of frequency domain body gyroscope mean frequency X axis 
fBodyGyro-meanFreq()-Y	              num	Mean of frequency domain body gyroscope mean frequency Y axis 
fBodyGyro-meanFreq()-Z	              num	Mean of frequency domain body gyroscope mean frequency Z axis 
fBodyAccMag-mean()	                  num	Mean of frequency domain body accelerometer magnitude mean  
fBodyAccMag-std()	                    num	Mean of frequency domain body accelerometer magnitude standard deviation  
fBodyAccMag-meanFreq()	              num	Mean of frequency domain body accelerometer magnitude mean frequency 
fBodyBodyAccJerkMag-mean()	          num	Mean of frequency domain body accelerometer Jerk magnitude mean 
fBodyBodyAccJerkMag-std()	            num	Mean of frequency domain body accelerometer Jerk magnitude standard deviation 
fBodyBodyAccJerkMag-meanFreq()	      num	Mean of frequency domain body accelerometer Jerk magnitude mean frequency
fBodyBodyGyroMag-mean()	              num	Mean of frequency domain body gyroscope magnitude mean  
  fBodyBodyGyroMag-std()	            num	Mean of frequency domain body gyroscope magnitude standard deviation  
fBodyBodyGyroMag-meanFreq()	          num	Mean of frequency domain body gyroscope magnitude mean  frequency
fBodyBodyGyroJerkMag-mean()	          num	Mean of frequency domain body gyroscope Jerk magnitude mean 
fBodyBodyGyroJerkMag-std()	          num	Mean of frequency domain body gyroscope Jerk magnitude standard deviation 
fBodyBodyGyroJerkMag-meanFreq()	      num	Mean of frequency domain body gyroscope Jerk magnitude mean frequency
angle(tBodyAccMean,gravity)	          num	Mean of angle     
angle(tBodyAccJerkMean),gravityMean)	num	Mean of angle time domain body accelerometer Jerk mean gravity mean   
angle(tBodyGyroMean,gravityMean)	    num	Mean of angle time domain body gyroscope mean gravity mean    
angle(tBodyGyroJerkMean,gravityMean)	num	Mean of angle time domain body gyroscope Jerk mean gravity mean   
angle(X,gravityMean)	                num	Mean of angle gravity mean X axis     
angle(Y,gravityMean)	                num	Mean of angle gravity mean Y axis    
angle(Z,gravityMean)	                num	Mean of angle gravity mean Z axis    


####Notes :
Readers are reminded that the values in the tidy dataset are the means of the means and standard deviations for each of the subjects for each activity.
