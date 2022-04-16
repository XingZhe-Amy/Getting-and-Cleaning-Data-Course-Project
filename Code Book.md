## Step 1: download and unzip the file 

```R
download.file()
unzip()
```

the problem I meet is "exdir" argument in function zip, which is the directory to extract files to.




## Step 2:  figure out the structure of the data

the data set we need in this project is not all the files in the data file. so I need to figure out the structure of the required data set.

![无标题](https://user-images.githubusercontent.com/59439258/163657928-7655dbe9-8a27-4b6a-89ae-171a04ea95f6.png)





## Step 3: import and merge the data we need

```R
# txt file use read.table function with default arguments
read.table()

# like the structure in step 2, firstly, use cbind to get the training set and test set
# then use rbind to get the whole data set
cbind()
rbind()
```




## Step 4: extract the measurements we need

```R
# to make sure the measurements we need, I need to know all the features and name the data set with it.
name()

# use grep function to find the feature that match the pattern we want
grep()
```




## Step 5:  use descriptive activity names to name the activities in the data set

```R
# we need to know the activity column is factor. we just need the factor function to match the labels in activity file correspondingly.
factor()
# the triky is argument in factor, like levels and labels
```




## Step 6: labels the data set with descriptive variable names

```R
# the descriptive variable name I already named in step 4.
# but the subjuct number in column 1 must be factor.
factor()
```




## Step 7: create a new data set required

```R
# the average of each variable for each activity and each subject.
# I have two way to solve this question
# one way: use split and lapply, or tapply
split()
lapply()
tapply()

# another way: use summarize_all and group_by function in dplyr package.
library(dplyr)
group_by()
summarize_all()
```

