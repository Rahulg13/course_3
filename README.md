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

1.  Reading the txt file through read.table() function
2.  Data for activity and participants are read
3.  Cbind is used to collate the test data

Similar procedure is used to collate training data.
---------------------------------------------------

**Mean and standard deviations**
--------------------------------

Grep() function is used to identify mean variables within the variables
and their values are found out. The two are combined to form a full data
set to work on.

**Descriptive names**
---------------------

Descriptive activity names are assigned using the labels created
earlier. The variable names are found to be descriptive and long enough,
so not changed.

**Tidy data creation**
----------------------

Finally, dplyr functions - group\_by and summarise\_each are used to
create a new tidy data set.
