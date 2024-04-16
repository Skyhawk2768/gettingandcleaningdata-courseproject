## Introduction

The code in the **run_analysis.R** assumes that all the data is present in the same folder in uncompressed form and without names altered. It then performs the following functions.

First, it combines the training and the test data using the **rbind()** function.

Second, the columns containing the **mean** and the **standard deviation** measures are extracted from the combined dataset and given correct names (from **features.txt**).

Third, the activity names and IDs are taken from the **activity_labels.txt** file and are substituted in the dataset, and the columns with vague column names are renamed.

Finally, a new dataset is generated with all average activity measures for each subject and activity type.

## Variables

**xTrain**, **yTrain**, **zTrain** contain data from the training dataset. **xTest**, **yTest**, **zTest** contain data from the test dataset. **xData**, **yData**, **zData** contain the merged data. 

**featuresData** contains the correct names for the **xData** dataset, which are applied to the column names stored in **meanAndStdFeatures**, a numeric vector used to extract the desired data.

A similar approach is taken with activity names through the **activitiesData** variable.

**allData** merges **xData**, **yData**, and **subjectData** in a big dataset.

Finally, **averageData** contains the relevant averages, which are later stored in a *.txt* file. The **ddply()** method from the *plyr* package is used to apply the **colMeans()** function.
