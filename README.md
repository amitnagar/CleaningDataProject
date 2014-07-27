Study Design
The data was collected through text files provided as part of the project.  2 sets of data were provided – training and test data sets.  Each data set had following associated files: Subject_train/test.txt; Y_train/test.txt and X_train/test.txt where train train is used when depicting training data and test is used when depicting test data.

Exclusions: Files under directory test/inertialsignals and train/inertialsignals were hnot used.

Code Book
Pl refer to codebook.md

Instruction List
Run_analysis.R takes the txt files provided for this project and treats the training data set and test data sets separately.
The steps for treating each of these files are as shown below:
Step 1: Read the subject data.  Add “Subject” as column name to the data frame column.
Step 2 Read data for activity performed on subject.  Add “Activity” as column name to the data frame column. 
Step 3: Read values for the 561 parameters for which data was collected per activity of a subject in a data frame and also the column names as specified in the features.txt.  Add the column names to the data frame.
Step 4: Now combine the 3 data frames created in above steps into one data frame using cbind().
The above steps are repeated for training and test data sets giving us 2 data frames – one for test and another for training data.
Step 5: Row bind the training and test data frames to come up with a merged data frame.   
Step 6: Next we remove ALL columns that do not pertain to either mean or standard deviation.  In other words, we create a subset of the data set created in Step 4 that contain only mean and standard deviation columns.  
Step 6: Also, replace the numeric activity labels to descriptive labels in the final merged data frame. 
This is the tidy data set that is required by this exercise. An example of the same is shown in tidydatasnapshots.jpg.
