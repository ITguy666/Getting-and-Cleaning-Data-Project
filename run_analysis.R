library(dplyr)

filename <- "UCI_HAR_Dataset.zip"
if(!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL,filename,method="curl")
}
if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

## Step 1: Merge Training and Test Datasets
features <- read.table("UCI HAR Dataset/features.txt",col.names=c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("code","activity"))
                      

# Read Test dataset
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",col.names = "code")

# Read Train dataset
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",col.names = "code")

# Merge by binding rows (rbind) first and then combine columns (cbind)
X_binded <- rbind(x_train,x_test)
Y_binded <- rbind(y_train,y_test)
Subject_binded <- rbind(subject_train,subject_test)
Merged <- cbind(Subject_binded,Y_binded,X_binded)

## Step 2: Compute Mean and Standard Deviation
Tidydata <- Merged %>% 
  select(subject, code, contains("mean"), contains("std"))

## Step 3: Descriptive Activity Names
Tidydata$code <- activities[Tidydata$code,2]
names(Tidydata)[2]="activity"

## Step 4: Label with Descriptive Names
names(Tidydata) <- gsub("^t","Time",names(Tidydata))
names(Tidydata) <- gsub("^f","Frequency",names(Tidydata))
names(Tidydata) <- gsub("Acc","Acccelerometer",names(Tidydata))
names(Tidydata) <- gsub("Gyro","Gyroscope",names(Tidydata))
names(Tidydata) <- gsub("Mag","Magnitude",names(Tidydata))
names(Tidydata) <- gsub("BodyBody","Body",names(Tidydata))

## Step 5: Create Final Independent Tidy Dataset
#Group by subject and activity and then compute mean for other columns
Tidydata_final <- Tidydata %>% 
  group_by(subject, activity) %>%
  summarise_all(list(mean=mean))

# Export data to a text file
write.table(Tidydata_final,"Tidydata_final.txt",row.name=FALSE)

