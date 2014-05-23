<<<<<<< HEAD
# Explanation of script

The purpose of this script is to take the raw data of the Human Activity Recognition Using Smartphones dataset and generate a file with the mean values of a variety of factors from several trials by each of six activities from each of thirty participants.

To successfully run the script, you must first download the data from (<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>) and move the folder "UCI HAR Dataset" to your working directory.

## How it works
* Reading and merging the data
	- First, the script reads in all of the files related to results, subject number, and activity label from both the "test" and "train" datasets.
	- Next, the columns are bound in the following order for both datasets: Subject Number, Activity Label, Results
	- Finally, the rows are bound with the training dataset and testing dataset combined into one.
* Renaming
	- The feature names are read from the file "features.txt" and stored a table object.
	- These names are then assigned to the names of the columns in the previous combined dataset, so now each column has a heading describing what its values are reporting.
	- The numeric data in the "Activity" column are also recoded so that they now list the activity being performed for that trial.
* Selecting columns for the final dataset
	- Using regular expressions, a new dataset is created with only the columns containing "mean" or "std" along with the SubjectNumber and Activity columns
* Producing the final dataset
	- The new dataset containing only mean and std data is run through the aggregate function, which returns an average value for each combination of Subject Number and Activity
	- As the previous step produced new columns called Group.1 and Group.2 that are identical to previously existing columns, the previously exisitng columns are deleted and the new columns are renamed, so that the Subject Number and Activity columns look the same as they did before aggregation.
	- The data is saved in the working directory as "tidydata.txt"

## Results

The result of running the script will be a file called "tidydata.txt" in your working directory with the new dataset.  You can also use the dataset "tidydata" created by the script in the R console.
=======
SamsungActivityData
===================

Course Project for Getting and Cleaning Data on Coursera
>>>>>>> 713405720dc3285578ee36115841ca06e0ffcfb4
