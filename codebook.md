# Codebook
This is the codebook for the Tidy Data Set
## Variables
features        - features.txt file

train.x         - train/X_train.txt

train.y         - train/Y_train.txt

train.subject   - subject_train.txt

test.x          - X_test.txt

test.y          - Y_test.txt

test.subject    - subject_test.txt file

activityLabels  - activity_labels.txt file

## Processing variables
train.merge     - column-binds train.y, train subject and train.x

test.merge      - column-binds test.y, test.subject and test.x

data.merge      - row-binds train.merge and test.merge

colNames        - colnames of data.merge

mean_and_std    - changes the names of the columns with names largely from features.txt

mean_and_std2   - the changes from mean_and_std is put in the new data set

Data1           - adds descriptive activity names to names of activities in the dataset

Data2           - the tidy second data set containing the avergae of each variable for each activity and each subject.
