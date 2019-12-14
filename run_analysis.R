#variables names drawn
vardata <- read.csv("./UCI HAR Dataset/features.txt", header = FALSE, sep = "\t")
vardata <- levels(vardata$V1)
variables <- strsplit(vardata, " ")
var_name <- function(x) { x[2] }
variables <- sapply(variables, var_name)

#reading activity_labels
act_label <- read.csv("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep = "\t")
act_label <- levels(act_label[,1])
actlabels <- strsplit(act_label, " ")
actlabels <- sapply(actlabels, var_name)

#reading test data
xtest1 <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.csv("./UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "\t")
subjecttest <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "\t")
testdata <- cbind(ytest, subjecttest, xtest1)

#reading training data
xtraining <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.csv("./UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "\t")
subjecttrain <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "\t")
traindata <- cbind(ytrain, subjecttrain, xtraining)

#merging data as per requirement 1 of Project
fulldata <- rbind(testdata, traindata)

#finding the standard deviation and mean variables
mean_index <- grep("mean", variables)
mean_data <- fulldata[, mean_index + 2]
std_index <- grep("std", variables)
std_data <- fulldata[, std_index + 2]
fulldata2 <- cbind(mean_data, std_data)
fulldata2 <- cbind(as.factor(fulldata[,1]), as.factor(fulldata[,2]), fulldata2)

#descriptive activity names
levels(fulldata2[,1]) <- actlabels

#appropriate labels to the dataset + Variable names are kept same, for carrying most information already
names(fulldata2) <- c("activity_name", "participant_number", variables[mean_index], variables[std_index])

#STep 5
ans <- fulldata2 %>% group_by(activity_name, participant_number) %>% summarise_each(mean)
ans
