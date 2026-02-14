CodeBook: UCI HAR Tidy Dataset

​1. The Dataset
​The data used in this project represents measurements collected from the accelerometers of the Samsung Galaxy S smartphone. 
30 subjects performed six activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying).

​2. Transformations (The Cleaning Process)
​The following steps were applied to the raw data via run_analysis.R:
​Merged the training and test sets to create one data set.
​Extracted only the measurements on the mean and standard deviation for each measurement.
​Renamed the activity codes (1–6) with descriptive activity names (e.g., "WALKING").
​Labeled the variables with descriptive names:
​Acc became Accelerometer
​Gyro became Gyroscope
​Mag became Magnitude
​t at the start became Time
​f at the start became Frequency
​Summarized the data by taking the average of each variable for each activity and each subject.

​3. Variable Descriptions
​Identifiers
​subject: The ID of the participant (1 to 30).
​activity: The type of activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
​Measurements (Averages)
​All measurements are floating-point numbers, normalized and bounded within [-1, 1]. 
Since the final data is a tidy set of averages, each variable below represents the mean of that measurement for the specific subject and activity.
​Time Domain Signals:
​TimeBodyAccelerometerMeanX/Y/Z
​TimeBodyAccelerometerSTDX/Y/Z
​TimeGravityAccelerometerMeanX/Y/Z
​TimeBodyGyroscopeMeanX/Y/Z
​Frequency Domain Signals:
​FrequencyBodyAccelerometerMeanX/Y/Z
​FrequencyBodyAccelerometerSTDX/Y/Z
​FrequencyBodyAccelerometerMagnitudeMean

​4. Technical Note on Units
​Acceleration signals (Accelerometer) are in standard gravity units 'g'.
​The angular velocity vector (Gyroscope) measured by the gyroscope are in units of radians/second.
