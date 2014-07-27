CodeBook
The data was collected through text files provided as part of the project.  2 sets of data were provided – training and test data sets.  Each data set had following associated files: Subject_train/test.txt; Y_train/test.txt and X_train/test.txt where train train is used when depicting training data and test is used when depicting test data.
The content of each file is as described below using set of “train” files as an example. 
Subject_train.txt – provided information about subjects on whom the experiment was conducted.  Subjects are numeric numbers only.  
Y_train.txt – Activities performed by subjects for which data was collected.
Activities are described using numbers 1 through 6.  Activity labels are provided in activity_labels.txt file in the root folder of provided data set.  Mapping is as shown below:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
X_train.txt – the actual data collected for 561 features per subject/activity.  This is simply a set of numbers both positive and negative indicating the values for the various parameters for which data is collected when the subject performs a certain activity.
Similar to activity_labels.txt above, features.txt is also stored in root of the folder and provides labels for the feature for which data is collected in X_train.txt.
