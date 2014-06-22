### Introduction

This is a course project for class "Getting and Cleaning Data", www.cousera.org, June 2014
The assignment is given data set to prepare tidy data that can be used for later analysis. 
The given data set is described below.

### Input data set

The script run_analysis.R takes the "input data set" described in the CodeBook.md file.

### Processing

The script run_analysis.R follows the steps below:

## store the current directory
## change to the new directory
 
## Point 1: Merge the training and the test sets to create one data set.
  ## Create new directory for merged sets
  ## Combine subject_test and subject_train into “subject”
	## Combine y_test and y_train into “y”
	## Combine body* and total* files
	## Read test files from dirs “Inertial Signals” and cat
	## Combine X_train and X_test

## Points 2,4. 
## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
## 4. Label the data set with descriptive variable names.

	## Identify mean and standard deviation in features.txt; meanstd vector has indices of mean and std
	## Create new feaures.txt corresponding to mean and std only
	## Write new feature.txt in data set directory
	##Read all measurements and extract mean and std mesurements in X_meanstd
	## Intialize X_meanstd mean and std mesurements dataframe  
	## Label the X_meanstd dataset with descriptive variable names...
	##... and populate with measurements of mean and std
	## Set the label in X-meanstd without the number
	## Transfer from X to X_meanstd all 561 observations for each column corresponding to a mean or std
	## Write X_meanstd in merged directory

## Point 3. Use descriptive activity names to name the activities in the data set

	## Read vector of activities from y.txt
	## Read labels
	## Remove number from label
	## Write labels file in data set directory
	## Create wide complete data

## Point 5. Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 
	## Use melt to create tall structure
	## Use cast to reshape the melted data as follows: subjmeans means by subject (30 x 86), and actmeans means by  activity (6 x 86)

## unload the libraries
## change back to the original directory


### Results

The output of run_analysis.R is a second, independent tidy data set with the average of each variable for each activity and each subject. 
For a full description of the output files see the CodeBook.md file.

### Reference

"Getting and Cleaning Data", www.cousera.org
