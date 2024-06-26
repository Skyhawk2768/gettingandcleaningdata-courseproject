library(plyr)

# Read training files

xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt")
subjectTrain <- read.table("./train/subject_train.txt")

# Read test files

xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")

# Merge to create one dataset

xData <- rbind(xTrain,xTest)
yData <- rbind(yTrain,yTest)
subjectData <- rbind(subjectTrain,subjectTest)

# Extract mean and standard deviation measurements

featuresData <- read.table("features.txt")
meanAndStdFeatures <- grep("-(mean|std)\\(\\)", featuresData[,2])
reqdXData <- xData[,meanAndStdFeatures]
names(xData) <- featuresData[meanAndStdFeatures,2]

# Change column names to descriptive names

activitiesData <- read.table("activity_labels.txt")
yData[, 1] <- activitiesData[yData[, 1], 2]
names(yData) <- "activity"
names(subjectData) <- "subject"
allData <- cbind(xData, yData, subjectData)

averageData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averageData, "averageData.txt", row.name=FALSE)