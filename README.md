Cleaning Data Project
====================

## Project Description

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data used for this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The raw data can be seen in the UCI HAR Dataset folder. A full description of the data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  


The uploaded script run_analysis.R performs the following operations:

- Reads the train and test datasets into R.  
- Selects the measurements on the mean and standard deviation for each variable.  
- Adds subject and activity indices to the raw data, as well as column names.  
- Combines the two edited datasets into a single dataset in the narrow format.  
- Substitues numerical labels for activity with word descriptions.  
- Renames columns to a more descriptive format with complete words, to allow for easier subsetting.  
- From the data set created in previous steps, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
- Writes this new tidy dataset to a .txt file in the working directory.  

  The file run_analysis.R includes comments providing a step-by-step outline of the operations being performed in the code, in order to make the code more readable.
  
  A description of the variable names and formatting can be found in the CodeBook.md file.
