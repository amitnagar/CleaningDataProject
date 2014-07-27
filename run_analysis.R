##Step 1: Read training data into a single data.frame: (subject, activity performed on subject and values for the 561 parameters)
##Step 2: Add column names
##Step 3: merge into 1 training data.frame using cbind()
##Step 4: Repeat step 1-3 for test data
##Step 5: Merge the 2 data sets using rbind() to create 1 data set 

#read training subject information
train.subject<-read.table("./train/subject_train.txt")
colnames(train.subject)<-c("Subject")

#read training activity data
train.activity<-read.table("./train/y_train.txt")
colnames(train.activity)<-c("Activity")

#read training data (561 features)
train.feature.measurements<-read.table("./train/X_train.txt")
features<-read.table("./features.txt")
cf<-features[,2]
colnames(train.feature.measurements)<-cf

#vertical bind [subjects,activity, feature.measurements]
train.data.set<-cbind(train.subject,train.activity, train.feature.measurements)

##read test subject information
test.subject<-read.table("./test/subject_test.txt")
test.activity<-read.table("./test/y_test.txt")
test.feature.measurements<-read.table("./test/X_test.txt")
test.data.set<-cbind(test.subject,test.activity, test.feature.measurements)
#make test data.frame inherit the colnames from train data.frame.  Else merge will give error
#"rbind error: "names do not match previous names"
names(test.data.set)<-names(train.data.set)

##final merged data frame
merged.data.1<-rbind(train.data.set,test.data.set)
##copy of the merged data set for computing averages
merged.data.2<-merged.data.1

#copy for part 5 of the project
merged.data.5 <-merged.data.1

allnames<-vector()
##now drop all but mean and std columns
for(i in 3:length(names(merged.data.1))){
        selected<-names(merged.data.1)[i]
        if ( ( grepl("mean",selected)) || ( grepl("Mean",selected)) || ( grepl("std",selected)) ) 
             {
        }else{
                allnames<-append(allnames,(names(merged.data.1)[i]))
        }
}

allnames[sapply(allnames, is.null)] <- NULL          # Remove NULL element from list

for (i in 1:length(allnames)){
        dropColumn<-allnames[i]
        merged.data.2<-merged.data.1[dropColumn]<-list(NULL)
}        

#replace activity #s by their labels
for(i in 1:dim(merged.data.1)[1]){
        if ( merged.data.1[i,2] == 1 ) 
                merged.data.1[i,2] <-'WALKING'
        if ( merged.data.1[i,2] == 2 ) 
                merged.data.1[i,2] <-'WALKING_UPSTAIRS'
        if ( merged.data.1[i,2] == 3 ) 
                merged.data.1[i,2] <-'WALKING_DOWNSTAIRS'
        if ( merged.data.1[i,2] == 4 ) 
                merged.data.1[i,2] <-'SITTING'
        if ( merged.data.1[i,2] == 5 )  
                merged.data.1[i,2] <-'STAINDING'
        if ( merged.data.1[i,2] == 6 ) 
                merged.data.1[i,2] <-'LAYING'
}

##Last part of project - 
##5. Create a second, independent tidy data set with the average of each 
#variable for each activity and each subject. 

#get unique subjects
subjects<-unique(merged.data.1[,"Subject"])

allactivities<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
allmeans<-vector()
row.set<-vector()

#for each subject
 for (ii in 1:length(subjects)){
         #get rows for each of the 6 activities
         for (j in allactivities){
                  sub<-merged.data.5[(merged.data.5$Subject == ii & merged.data.1$Activity  == j),]
                  #calculate means of ALL variables
                  row.set<-rbind(row.set, apply(sub,2,mean, na.rm=TRUE))
}
         
}

print(row.set)