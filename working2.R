
#Read in the training data
#The approprate number of rows are set by looking at the lenght of the file 
#using the `wc` command line tool in Linux/OS X
#Note all input dataset start up one level in directory structure.  
traind<-read.table("../dataset/train/X_train.txt",strip.white=TRUE,nrows=7352,sep="")
trainsub<-read.delim("../dataset/train/subject_train.txt",header=FALSE,sep="", nrows=7352)
trainact<-read.table("../dataset/train/y_train.txt",strip.white=TRUE,nrows=7352,sep="")
#Read in the test data
testd<-read.table("../dataset/test/X_test.txt",nrow=2947,strip.white=TRUE,sep="")
testsub<-read.delim("../dataset/test/subject_test.txt",header=FALSE,sep="", nrows=2947)
testact<-read.table("../dataset/test/y_test.txt",nrow=2947,strip.white=TRUE,sep="")

#The training data and test data is handled in seperate dataframes until 
#all additional columns are created, then all are combined into a single 
#frame

#Add Names to the subject and activity columns
names(testsub)<-"subject"
names(trainsub)<-"subject"
names(testact)<-"activityNumber"
names(trainact)<-"activityNumber"

#The next 2 code blocks accomplish 3 and 4 of the problem statement
#Read in "features.txt" file for naming of data columns and apply to dataframes
features<-read.table("../dataset/features.txt",nrows=561)
colnames<-as.vector(features$V2, mode="character")
names(testd)<-colnames
names(traind)<-colnames

#Create activity lables.  Could have been read in from file, but I prefer this syntax
actlable=c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
#Apply activity names as factors per activity number
trainf<-factor(trainact$activityNumber,labels=actlable)
trainf<-data.frame(trainf)
names(trainf)<-"activity"
testf<-factor(testact$activityNumber,labels=actlable)   
testf<-data.frame(testf)
names(testf)<-"activity"

#Combine dataframes into single frame called "data"
test<-cbind(testf, testact, testsub, testd)
training<-cbind(trainf, trainact, trainsub, traind)
data<-rbind(test,training)

#Determine what columns have "mean" and "std" data
meancol<-grep(c("mean"),c(names(data)))
stdcol<-grep(c("std"),c(names(data)))
measurecol<-append(stdcol,meancol)

#Create a dataframe contain only "mean" and "std" data columns, 
#while being sure to retain the activity, activityNumber, and subject columns.
#This satisfies Part 2 of the problem description
part2_data<-data[,c(1:3,measurecol)]

#sub1<-subset(part2_data,activity=="standing" & subject=="2")

#Append "avg-" to all the remaining data columns
#avg_colnames<-sapply(colnames, function(x) paste("avg-", x,sep=""),USE.NAMES=FALSE)

#Average (take the mean) of all the data on an activity and subject basis
#The first 3 columns are not results, so these are excluded, 
#while only activity and subject are retained, 
#and the non-descriptive activityNumber is discarded
all_avgs<-aggregate(part2_data[,-(1:3)],
        c(data["activity"],data["subject"]),function(x) mean(x))

#Append "avg" to the column names of the now averaged columns, 
#excluding the first 2 columns which are activity and subject 
names(all_avgs)<-c(names(all_avgs[1:2]),sapply(names(all_avgs[-(1:2)]),  
        function(x) paste("avg-", x,sep=""),USE.NAMES=FALSE))

#Write out the data for part 5 of the problem statement
write.table(all_avgs,file="project_upload.txt",row.names=FALSE,sep=",")
