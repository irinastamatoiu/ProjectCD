### Introduction

This is a course project for class "Getting and Cleaning Data", www.cousera.org, June 2014
The assignment is given data set to prepare tidy data that can be used for later analysis. 
The given data set is described below.

### Input data set

The set refers to the following experiment: 
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The input dataset includes the following files:
==============================================

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Results

The following describes the output dataset:
-- All output files are grouped under the dir '/merged'

-- activities.txt: Activity names cleaned of the activity labels. (Processed from the 'activity_labels.txt' in the input data set.)

-- features.txt: Mean and stddev features from the list of all features in the input data set. (Processed from the 'features.txt' in the input data set.)

-- Inertial Signals: Includes the merged training and test measurements files from the input data (merges file by file 'train/Inertial Signals/' and 'test/Inertial Signals/')

-- means_by_activity.txt: Mean of measurements by activity 

-- means_by_subject.txt: Mean of measurements by subject

-- subject.txt: Merged set from original sets identifier of the subject, 'train/subject_train.txt' and 'test/subject_test.txt.

-- X_meanstd.txt: All mean and std measurements for all subjects and all activities

-- X.txt: Merged set from original sets, test set ('test/X_test.txt') and training set ('train/X_train.txt').

-- y.txt: Merged set from original labels, test labels ('test/y_test.txt') and training labels ('train/y_train.txt).

## License:
===========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

### Reference
"Getting and Cleaning Data", www.cousera.org
