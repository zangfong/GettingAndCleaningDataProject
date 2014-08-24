## run_analysis.R
library(reshape2)
##Step 1, Merges the training and the test sets to create one data set.
##read and combine the train data
XTrain<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
SubjuectTrain<-read.csv("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
YTrain<-read.csv("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
Trainfile <-cbind(XTrain,cbind(SubjuectTrain,YTrain))

##read and combine the test data
XTest<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
SubjectTest<-read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
YTest<-read.csv("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
Testfile <-cbind(XTest,cbind(SubjectTest,YTest))

##combine train and test data
OneSet <- rbind(Trainfile,Testfile)

##Step 2, Extracts only the measurements on the mean and standard deviation for each measurement. 
##read the feature file
FeatureFile<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
##grep the mean and standard deviation from this file seperately
MeanMeasure<-grep("mean()",FeatureFile$V2)
StdMeasure<-grep("std()",FeatureFile$V2)

##merge them and sort, then we get the list stored in MeanAndStd, which tells us which columns are the mean and standard deviation measurements
MeanMeasure <- append(MeanMeasure,StdMeasure)
MeanAndStd <-MeanMeasure[order(MeanMeasure)]


##Step 3 & 4 , Appropriately labels the data set with descriptive variable names.  Uses descriptive activity names to name the activities in the data set
FeatureName<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
dcname <-as.character(FeatureName[,2])
dcname <-append(dcname, "Subject")
dcname <-append(dcname, "Activity")
names(OneSet)<- dcname

##Step 5, Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
idvect <- as.character(c("Subject","Activity"))
SetMelt <-melt(OneSet,id = idvect ,measure.vars=MeanAndStd)

cleanData <- dcast(SetMelt,Subject+Activity~variable,mean)
write.table(cleanData,file="./cleandata.txt")
