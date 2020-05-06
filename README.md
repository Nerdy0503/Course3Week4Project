this file explains the analysis files
#####################################

I)    Clone or download the repo to your computer and use it as your working directory.

II)   Download the "getdata_projectfiles_UCI HAR Dataset.zip" file, from the URL given 
      given in the instructions section of the project, which is:
      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

III)  Unzipp it in the working directory to a "UCI HAR Dataset" folder

IV)   Run the file called "run_analysis.R"

V)    Description of the output dataset variables is given in the CodeBook.md file 



the file run_analysis.R does the following:

    0. reads in the files activity_labels.txt and features.txt from  
      the "UCI HAR Dataset" folder, into 2 dataframes called "activity" and "feature"
    
    
    1. reads in the train and test data sets contained in the files named respectively
      X_train.txt and X_test.txt from, respectively, the "UCI HAR Dataset/train" and 
      "UCI HAR Dataset/test" folders
      
      reads in the files y_train.txt and subject_train.txt as two columns 
      (activity labels and subject ID) for the train set, from "UCI HAR Dataset/train"
      and binds them to the "trainSet"
      
      reads in the files y_test.txt and subject_test.txt as two columns 
      (activity labels and subject ID) for the test set, from "UCI HAR Dataset/test"
      and binds them to the "testSet" 
      
      merges the two datasets into one called "dataSet0", whose columns are named 
      according to the feature names retrieved in step 0. This dataset is then ordered 
      with respect to ascending subject ID
      
    2. from this dataset, it extracts the mean and standard deviation on each measurement
    
    3. it descriptively names the activity column with full names rather than just 
      numeric labels

    4. it descriptively renames all the features (i.e. column names)
    
    5. it creates a second data set, called "tidyDataSet", with the average of each 
      variable for each activity and each subject

    6. it prints out the obtained tidy dataset and writes into a text file called
      tidy_data_set.txt
