# store the current directory
initial.dir<-getwd()
# change to the new directory
setwd("ProjectCD")
library(reshape)
## Point 1: Merge the training and the test sets to create one data set.
## Create new directory for merged sets
if(!file.exists(".merged")){dir.create("./merged")}
if(!file.exists(".merged/Inertial Signals")){dir.create("./merged/Inertial Signals")}
## Combine subject_test and subject_train into “subject”
subjecttrain<-scan("train/subject_train.txt", numeric(0), sep = "\n")
subjecttest<-scan("test/subject_test.txt", numeric(0), sep = "\n")
subject<-c(subjecttest,subjecttrain)
write.table(subject, "merged/subject.txt", row.names=F, col.names=F) 

## Combine y_test and y_train into “y”
ytrain<-scan("train/y_train.txt", numeric(0), sep = "\n")
ytest<-scan("test/y_test.txt", numeric(0), sep = "\n")
y<-c(ytest,ytrain)
write.table(y, "merged/y.txt", row.names=F, col.names=F) 

## Combine body* and total* files
## Read test files from dirs “Inertial Signals” and cat
newfilenames<-c("body_acc_x.txt","body_acc_y.txt","body_acc_z.txt","body_gyro_x.txt","body_gyro_y.txt","body_gyro_z.txt","total_acc_x.txt","total_acc_y.txt","total_acc_z.txt")
testfilenames <- list.files(path="test/Inertial Signals", pattern="*.txt")
print(testfilenames)
trainfilenames<-list.files(path="train/Inertial Signals", pattern="*.txt")
print(trainfilenames)
for (i in 1:length(newfilenames)) {
    testfile<-matrix(scan(paste("test/Inertial Signals/",testfilenames[i], sep=""), n = 2947*128), 2947, 128, byrow = TRUE)
    trainfile<-matrix(scan(paste("train/Inertial Signals/",trainfilenames[i],sep="") , n = 7352*128), 7352, 128, byrow = TRUE)    
cat(testfile,trainfile,file=paste("merged/Inertial Signals/",newfilenames[i],sep=""))           
}

## Combine X_train and X_test
xtest<-matrix(scan("test/X_test.txt", n = 2947*561), 2947, 561, byrow = TRUE)
xtrain<-matrix(scan("train/X_train.txt", n = 7352*561), 7352, 561, byrow = TRUE)
cat(xtest,xtrain,file="merged/X.txt") 

## Points 2,4. 
## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
## 4. Label the data set with descriptive variable names.

## Identify mean and standard deviation in features.txt; meanstd vector has indices of mean and std
features<-scan("features.txt", character(0), sep = "\n")
meanstd<-grep("mean|std",features,ignore.case=TRUE)

## Create new feaures.txt corresponding to mean and std only
meanstdfeatures<-character(length = 0)
for (i in 1:length(meanstd)) {
  meanstdfeatures[i]<-features[meanstd[i]]
}
## Write new feature.txt in data set directory
write.table(meanstdfeatures, "merged/features.txt", row.names=F, col.names=F) 

##Read all measurements and extract mean and std mesurements in X_meanstd
X<-matrix(scan("merged/X.txt", n = 10299*561), 10299, 561, byrow = TRUE)
## Intialize X_meanstd mean and std mesurements dataframe  
rows=dim(X)[1]
cols=length(meanstd)
X_meanstd<-as.data.frame(matrix(ncol=cols,nrow=rows))

## Label the X_meanstd dataset with descriptive variable names...
##... and populate with measurements of mean and std
for (i in 1:length(meanstd)) {
    ## Set the label in X-meanstd without the number
    colnames(X_meanstd)[i]<-strsplit(features[meanstd[i]]," ")[[1]][2]
    ## Transfer from X to X_meanstd all 561 observations for each column corresponding to a mean or std
    X_meanstd[,colnames(X_meanstd)[i]]<-X[,meanstd[i]]
}
## Write X_meanstd in merged directory
write.table(X_meanstd, "merged/X_meanstd.txt", row.names=T, col.names=T) 

## Point 3. Use descriptive activity names to name the activities in the data set

## Read vector of activities from y.txt
activities<-scan("merged/y.txt", numeric(0), sep = "\n")
## Read labels
labels<-scan("activity_labels.txt", character(0), sep = "\n")
activity_desc<-character(length = 0)
## Remove number from label
for (i in 1:length(labels)) {
    labels[i]<-strsplit(labels[i]," ")[[1]][2]
}
for (i in 1:length(activities)) {
  activity_desc[i]<-labels[activities[i]]
}
## Write labels file in data set directory
write.table(labels, "merged/activities.txt", row.names=F, col.names=F) 

## Create wide complete data
X_meanstd_all<-cbind(as.data.frame(subject),as.data.frame(activity_desc),X_meanstd)

## Point 5. Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 

tidydata<-as.data.frame(matrix(nrow=0,ncol=0))
tidydata<-melt(X_meanstd_all,id=c("subject","activity_desc"))
subjmeans<-cast(tidydata, subject~variable, mean)
actmeans<-cast(tidydata, activity_desc~variable, mean)
write.table(subjmeans, "merged/means_by_subject.txt", row.names=T, col.names=T) 
write.table(actmeans, "merged/means_by_activity.txt", row.names=T, col.names=T) 

# unload the libraries
detach("package:reshape")
# change back to the original directory
setwd(initial.dir)
##