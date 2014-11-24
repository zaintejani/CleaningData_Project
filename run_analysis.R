### READING DATA INTO R ###

test<-read.table("UCI HAR Dataset/test/X_test.txt")
train<-read.table("UCI HAR Dataset/train/X_train.txt")

## Reading Column Names into R

labels<-read.table("UCI HAR Dataset/features.txt")

## Assigning column names to the data frames
colnames(train)<-labels[[2]]
colnames(test)<-labels[[2]]

## Using the grep function to index the columns that are either "mean" or "std"
meanInd<-grep("mean",labels[[2]])
stdInd<-grep("std",labels[[2]])

## Reading activity labels into R ##
testLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
trainLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")

## Reading Subject labels into R ##
testSubject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
trainSubject<-read.table("./UCI HAR Dataset/train/subject_train.txt")

## Indexing the original data frames for the mean and std columns ##
test2<-test[,c(meanInd,stdInd)]
train2<-train[,c(meanInd,stdInd)]

## Labelling the rows by subject and activity ##
test2<-cbind(testSubject,testLabels,test2)
train2<-cbind(trainSubject,trainLabels,train2)

colnames(test2)[1:2]<-c("Subject","Activity")
colnames(train2)[1:2]<-c("Subject","Activity")

## Combining the two datasets into a single data frame.
## Since subjects do not overlap between test and train,
## a narrow dataset can be created using rbind(...).

activityDF<-rbind(test2,train2)

## Setting up a for loop to substitute numeric activity labels with names.

actLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")

i<-1
for (i in 1:length(actLabels[[1]])){
  activityDF[activityDF$Activity==i,2]<-as.character(actLabels[i,2])
  i<-i+1
}

### RENAMING COLUMNS to DESCRIPTIVE LABELS ###
stupid_vector<-c("Subject","Activity","Time Domain, Body Acceleration, mean, x-direction",
                 "Time Domain, Body Acceleration, mean, y-direction",
                 "Time Domain, Body Acceleration, mean, z-direction",
                 "Time Domain, Gravity Acceleration, mean, x-direction",
                 "Time Domain, Gravity Acceleration, mean, y-direction",
                 "Time Domain, Gravity Acceleration, mean, z-direction",
                 "Time Domain, Body Acceleration Jerk, mean, x-direction",
                 "Time Domain, Body Acceleration Jerk, mean, y-direction",
                 "Time Domain, Body Acceleration Jerk, mean, z-direction",
                 "Time Domain, Body Gyroscope, mean, x-direction",
                 "Time Domain, Body Gyroscope, mean, y-direction",
                 "Time Domain, Body Gyroscope, mean, z-direction",
                 "Time Domain, Body Gyroscope, Jerk mean, x-direction",
                 "Time Domain, Body Gyroscope, Jerk mean, y-direction",
                 "Time Domain, Body Gyroscope, Jerk mean, z-direction",
                 "Time Domain, Body Acceleration, mean, magnitude",
                 "Time Domain, Gravity Acceleration, mean, magnitude",
                 "Time Domain, Body Acceleration Jerk, mean, magnitude",
                 "Time Domain, Body Gyroscope, mean, magnitude",
                 "Time Domain, Body Gyroscope, Jerk mean, magnitude",
                 "Frequency Domain, Body Acceleration, mean, x-direction",
                 "Frequency Domain, Body Acceleration, mean, y-direction",
                 "Frequency Domain, Body Acceleration, mean, z-direction",
                 "Frequency Domain, Body Acceleration, mean frequency, x-direction",
                 "Frequency Domain, Body Acceleration, mean frequency, y-direction",
                 "Frequency Domain, Body Acceleration, mean frequency, z-direction",
                 "Frequency Domain, Body Acceleration, Jerk mean, x-direction",
                 "Frequency Domain, Body Acceleration, Jerk mean, y-direction",
                 "Frequency Domain, Body Acceleration, Jerk mean, z-direction",
                 "Frequency Domain, Body Acceleration, Jerk mean frequency, x-direction",
                 "Frequency Domain, Body Acceleration, Jerk mean frequency, y-direction",
                 "Frequency Domain, Body Acceleration, Jerk mean frequency, z-direction",
                 "Frequency Domain, Body Gyroscope, mean, x-direction",
                 "Frequency Domain, Body Gyroscope, mean, y-direction",
                 "Frequency Domain, Body Gyroscope, mean, z-direction",
                 "Frequency Domain, Body Gyroscope, mean frequency, x-direction",
                 "Frequency Domain, Body Gyroscope, mean frequency, y-direction",
                 "Frequency Domain, Body Gyroscope, mean frequency, z-direction",
                 "Frequency Domain, Body Acceleration, mean, magnitude",
                 "Frequency Domain, Body Acceleration, mean frequency, magnitude",
                 "Frequency Domain, Body Acceleration Jerk, mean, magnitude",
                 "Frequency Domain, Body Acceleration Jerk, mean frequency, magnitude",
                 "Frequency Domain, Body Gyroscope, mean, magnitude",
                 "Frequency Domain, Body Gyroscope, mean frequency, magnitude",
                 "Frequency Domain, Body Gyroscope Jerk, mean, magnitude",
                 "Frequency Domain, Body Gyroscope Jerk, mean frequency, magnitude",
                 "Time Domain, Body Acceleration, std. dev., x-direction",
                 "Time Domain, Body Acceleration, std. dev., y-direction",
                 "Time Domain, Body Acceleration, std. dev., z-direction",
                 "Time Domain, Gravity Acceleration, std. dev., x-direction",
                 "Time Domain, Gravity Acceleration, std. dev., y-direction",
                 "Time Domain, Gravity Acceleration, std. dev., z-direction",
                 "Time Domain, Body Acceleration Jerk, std. dev., x-direction",
                 "Time Domain, Body Acceleration Jerk, std. dev., y-direction",
                 "Time Domain, Body Acceleration Jerk, std. dev., z-direction",
                 "Time Domain, Body Gyroscope, std. dev., x-direction",
                 "Time Domain, Body Gyroscope, std. dev., y-direction",
                 "Time Domain, Body Gyroscope, std. dev., z-direction",
                 "Time Domain, Body Gyroscope Jerk, std. dev., x-direction",
                 "Time Domain, Body Gyroscope Jerk, std. dev., y-direction",
                 "Time Domain, Body Gyroscope Jerk, std. dev., z-direction",
                 "Time Domain, Body Acceleration, std. dev., magnitude",
                 "Time Domain, Gravity Acceleration, std. dev., magnitude",
                 "Time Domain, Body Acceleration Jerk, std. dev., magnitude",
                 "Time Domain, Body Gyroscope, std. dev., magnitude",
                 "Time Domain, Body Gyroscope Jerk, std. dev., magnitude",
                 "Frequency Domain, Body Acceleration, std. dev., x-direction",
                 "Frequency Domain, Body Acceleration, std. dev., y-direction",
                 "Frequency Domain, Body Acceleration, std. dev., z-direction",
                 "Frequency Domain, Body Acceleration Jerk, std. dev., x-direction",
                 "Frequency Domain, Body Acceleration Jerk, std. dev., y-direction",
                 "Frequency Domain, Body Acceleration Jerk, std. dev., z-direction",
                 "Frequency Domain, Body Gyroscope, std. dev., x-direction",
                 "Frequency Domain, Body Gyroscope, std. dev., y-direction",
                 "Frequency Domain, Body Gyroscope, std. dev., z-direction",
                 "Frequency Domain, Body Acceleration, std. dev., magnitude",
                 "Frequency Domain, Body Acceleration Jerk, std. dev., magnitude",
                 "Frequency Domain, Body Gyroscope, std. dev., magnitude",
                 "Frequency Domain, Body Gyroscope Jerk, std. dev., magnitude")

colnames(activityDF)<-stupid_vector

### FOR LOOP to SUBSET TIDY DATA FRAME, with ONE OBSERVATION per SUBJECT per ACTIVITY ###

##Setting up empty variables to use in a for loop
actAvg<-data.frame()
subj<-vector("numeric")
Act<-vector("character")

##Setting up indices to use in for loop
step<-levels(as.factor(activityDF$Subject))
step2<-levels(as.factor(activityDF$Activity))

i<-1

## 3 nested FOR loops used to subset data first by Subject, then Activity, then Column index.
for (i in 1:length(step)){
  z<-activityDF[activityDF$Subject==as.numeric(step[i]),]
  
  j<-1
  
  temp<-vector("numeric")
  for (j in 1:length(step2)){
    x<-z[z$Activity==step2[j],]
    
    k<-3
    for (k in (3:length(colnames(activityDF)))){
      tmean<-mean(x[,k], na.rm=TRUE)
      
      temp<-c(temp,tmean)
      
      k<-k+1
    }
    
    ## Assembling the collected/processed data into a dataframe
    actAvg<-rbind(actAvg,temp)
    subj<-c(subj,x[1,1])
    Act<-c(Act,x[1,2])
    
    j<-j+1
  }
  
  i<-i+1
}

## finishing touches on the dataframe, i.e. column names and subject/activity indices.
actAvg<-cbind(subj,Act,actAvg)

colnames(actAvg)<-colnames(activityDF)

## Writing the output to a text file.
write.table(actAvg,file="Activity_Averages.txt",row.names=FALSE)