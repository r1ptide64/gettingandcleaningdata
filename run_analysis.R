X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./uCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./uCI HAR Dataset/test/subject_test.txt")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./uCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./uCI HAR Dataset/train/subject_train.txt")
data<-rbind(cbind(X_train,subject_train,y_train),cbind(X_test,subject_test,y_test))
features<-read.table("./UCI HAR Dataset/features.txt",colClasses="character")
names(data)<-c(features$V2,"subjectid","activity")
keep<-grepl("mean()",names(data),fixed=TRUE)
keep<-keep | grepl("std()",names(data),fixed=TRUE)
keep[562:563]<-TRUE
data<-data[,keep]
activities<-read.table("./UCI HAR Dataset/activity_labels.txt",colClasses="character")
data$activity<-factor(data$activity,labels=activities$V2)
averages<-data.frame(data[1,])
names(averages)<-names(data)
list<-split(data,interaction(data$subjectid,data$activity))
for(i in 1:length(list))
{
        averages[i,1:66]<-colMeans(list[[i]][,1:66])
        averages[i,67:68]=list[[i]][1,67:68]
}
write.table(averages,file="tidy.txt",row.names=FALSE)