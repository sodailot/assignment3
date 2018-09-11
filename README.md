# Assignment4
For Coursera Data Science Course. 
This repo contains (1) this README.md, (2) a tidy data set secTidySet.txt, (3) a codebook codebook.md and (4) the run_analysis.R.
## Data
The data for this project was obtained from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] with full details available from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]. They represent data collected from accelerometers of Samsung Galaxy S Smartphone.
## Content
The files contained in this repo include the run_analysis.R which creates a folder "Assignment4", then 3 folders within ("Code", "Data" and "Results") that place the appropriate files for the analysis and results in an organised fashion.

The function of the analysis is to read all the test and train data and create a merged data set. The names of the variables are based on the features.txt but modified to allow for an easier reading. This is further shown in the codebook (codebook.md).

A second dataset (tidydataset.txt) is then created from the merged data set. It is a tidy data set that contains the average of each variable for each activity and each subject.
