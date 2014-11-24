---
title: "CodeBook"
author: "Zain Tejani"
date: "Sunday, November 23, 2014"
output: html_document
---

## Description of Variable Naming Format
  The variable naming system adopted by the original creators of this dataset was a 4-part one, that provided a great deal of information about the data contained within the column. However, the original variable naming system was written in a shorthand form that is difficult to interpret. Hence, the columns are renamed with complete words in a comma separated format that makes it easier to subset desired columns.
  
  The first two columns are "Subject" and "Activity", and are described as such:
  
  - Subject: Subject (i.e. participant) index from 1 to 30.
  - Activity: One of 6 character outcomes, "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", and "WALKING_UPSTAIRS"
  
  From the third column onward, the naming is based on a 4-level nomenclature in the structure of "Level 1, Level 2, Level 3, Level 4". Columns are present in this data set for almost all combinations of these levels, with the exceptions discussed below:
  
### Level 1: Variable Domain
  
  In this dataset, data was collected in the time domain, then some of it was processed into the frequency domain. As such, there are mean and standard deviation values for values in both domains. This level distinguishes the two:
  
  - Time Domain: Measurements in the time domain.
  - Frequency Domain: Measurements in the frequency domain.
  
### Level 2: Input Signal Type
  
  Data from various types of movement have been collected in this datset. They can be classified as such:
  
  - Body Acceleration: Signals collected from the accelerometer signifying bodily motion.
  - Gravity Acceleration: Signals collected from the accelerometer signifying gravitational pull.
  - Body Acceleration Jerk: Signals collected from the accelerometer signifying jerk signals from bodily motion.
  - Body Gyroscope: Signals collected from the gyroscope signifying bodily motion.
  - Body Gyroscope Jerk: Signals collected from the gyroscope signifying jerk signals from bodily motion.
  
  It is worth noting that there are no Gravity Acceleration values in the Frequency Domain.
  
### Level 3: Measurement Type
  
  There are three kinds of measurements taken in this dataset. They are as follows:  
  
  - mean: The mean value of the input signal
  - std. dev.: The standard deviation of the input signal
  - mean frequency: The mean of the frequency-transformed signal. Note that this level is only present for Frequency Domain variables. Time Domain variables have only the "mean" and "std. dev." levels, while Frequency Domain variables have all three.
  
### Level 4: Measurement Direction

  There are three directions (x, y, z), as well as the magnitude (directionless) measured in this dataset. They can be seen in the column names as such:
  
  - x-direction: Measurement in the x-direction.
  - y-direction: Measurement in the y-direction.
  - z-direction: Measurement in the z-direction.
  - magnitude: Measurement of the overall magnitude (directionless).
  
  It is worth noting that not all the direction measurements will be present for every Input Signal type. For instance, in the Frequency Domain, only the magnitude measurement for Body Gyroscope Jerk is available.
  
### Subsetting tips

  Each column after the first two is a variant of the format "level 1, level 2, level 3, level 4"
  
  For example, the third column of this dataframe has the name "Time Domain, Body Acceleration, mean, x-direction"
  
  The renamed columns can be subset using the grep() function for partial matching, i.e. if you want all the measurements from a single level, or two. If you need to pull multiple entries with specific parameters, the paste() function can be used with sep=", " to index out multiple specific entries.