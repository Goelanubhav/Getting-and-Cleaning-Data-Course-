Explanation of each file

features.txt: Names of the 561 features.

activity_labels.txt: Names and IDs for each of the 6 activities.

X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.

subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt

Data files that were not used

This analysis was performed using only the files above, and did not use the raw signal data

Processing steps

- All of the relevant data files were read into data frames
- appropriate column headers were added
- training and test sets were combined into a single data set
- All feature columns were removed that did not contain the exact string "mean()" or "std()". This left 66 feature columns, plus the subjectID and activity columns
- The activity column was converted from a integer to a factor, using labels describing the activities
- A tidy data set was created containing the mean of each feature for each subject and each activity. 
- The tidy data set was output to a CSV file.