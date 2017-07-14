# getting-and-cleaning-data
Coursera assignment
This code, when run in the working directory containing the files, combines the raw data from the accelerometer and gyroscope signals from all subjects in both groups and produces a tidy set containing only the mean and standard deviation for each subject across each level of measurement.
First, the code loads and assigns data from all files and combines the data into a single file using the cbind and rbind functions. Names for each column are defined from separate files and attributed to the source using the colnames function.
Next, the activities are labeled and the mean and standard deviation for each measured outcome for each individual subject is computed and stored.
