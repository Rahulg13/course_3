**INTRODUCTION**
================

The code in run\_analysis.R tries to accomplish the project objectives
in following steps :

**Reading variable names**
--------------------------

It reads the variable names from feature.txt file. These variable names
are utilized later to name the columns. \#\# **Reading activity labels**
It reads the activity label names to perform the task 3 in the project
requirements.

**Reading the data**
--------------------

It is accomplished in following steps

1.  Reading the txt file through readLines() function
2.  Using strsplit() function to separate values
3.  Using unlist() to transform list values into a data frame()
4.  Names are assigned to columns
5.  Data for activity and participants are read
6.  Cbind is used to collate the test data

Similar procedure is used to collate training data.
---------------------------------------------------

**Mean and standard deviations**
--------------------------------

Grep() function is used to identify mean variables within the variables
and their values are found out

**Descriptive names**
---------------------

Descriptive activity names are assigned using the labels created earlier

**Tidy data creation**
----------------------

Finally, tapply is used to find mean values grouped by activity and
subject. The factors used in tapply are activity and subjects in column
1 and 2 respectively.
