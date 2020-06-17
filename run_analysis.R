#start with test
library(tidyr)
library(dplyr)
setwd("C:/Users/Lisa Liu/Desktop/Data Science Course/Course 3 Getting and Cleaning Data/UCI HAR Dataset/test/Inertial Signals")
body_acc_x_test<- read.table("body_acc_x_test.txt", header=FALSE, sep = "")
body_acc_x_test_ls <-gather(body_acc_x_test, variable, body_acc_x_test)
body_acc_y_test<- read.table("body_acc_y_test.txt", header=FALSE, sep = "")
body_acc_y_test_ls <-gather(body_acc_y_test, variable, body_acc_y_test)
body_acc_z_test<- read.table("body_acc_z_test.txt", header=FALSE, sep = "")
body_acc_z_test_ls <-gather(body_acc_z_test, variable, body_acc_z_test)
body_gyro_x_test<- read.table("body_gyro_x_test.txt", header=FALSE, sep = "")
body_gyro_x_test_ls <-gather(body_gyro_x_test, variable, body_gyro_x_test)
body_gyro_y_test<- read.table("body_gyro_y_test.txt", header=FALSE, sep = "")
body_gyro_y_test_ls <-gather(body_gyro_y_test, variable, body_gyro_y_test)
body_gyro_z_test<- read.table("body_gyro_z_test.txt", header=FALSE, sep = "")
body_gyro_z_test_ls <-gather(body_gyro_z_test, variable, body_gyro_z_test)
total_acc_x_test<- read.table("total_acc_x_test.txt", header=FALSE, sep = "")
total_acc_x_test_ls <-gather(total_acc_x_test, variable, total_acc_x_test)
total_acc_y_test<- read.table("total_acc_y_test.txt", header=FALSE, sep = "")
total_acc_y_test_ls <-gather(total_acc_y_test, variable, total_acc_y_test)
total_acc_z_test<- read.table("total_acc_z_test.txt", header=FALSE, sep = "")
total_acc_z_test_ls <-gather(total_acc_z_test, variable, total_acc_z_test)

#remove extra data frames from the environment
rm(body_acc_x_test)
rm(body_acc_y_test)
rm(body_acc_z_test)
rm(body_gyro_x_test)
rm(body_gyro_y_test)
rm(body_gyro_z_test)
rm(total_acc_x_test)
rm(total_acc_y_test)
rm(total_acc_z_test)

#combine test data into one table
test_data<- bind_cols(body_acc_x_test_ls, body_acc_y_test_ls, body_acc_z_test_ls, body_gyro_x_test_ls, body_gyro_y_test_ls, body_gyro_z_test_ls, total_acc_x_test_ls, total_acc_y_test_ls, total_acc_z_test_ls)

#get rid of extra variable columns
test_data<- select(test_data, -variable1, -variable2, -variable3, -variable4, -variable5, -variable6, -variable7, -variable8)

#get training data now
setwd("C:/Users/Lisa Liu/Desktop/Data Science Course/Course 3 Getting and Cleaning Data/UCI HAR Dataset/train/Inertial Signals")
body_acc_x_train<- read.table("body_acc_x_train.txt", header=FALSE, sep = "")
body_acc_x_train_ls <-gather(body_acc_x_train, variable, body_acc_x_train)
body_acc_y_train<- read.table("body_acc_y_train.txt", header=FALSE, sep = "")
body_acc_y_train_ls <-gather(body_acc_y_train, variable, body_acc_y_train)
body_acc_z_train<- read.table("body_acc_z_train.txt", header=FALSE, sep = "")
body_acc_z_train_ls <-gather(body_acc_z_train, variable, body_acc_z_train)
body_gyro_x_train<- read.table("body_gyro_x_train.txt", header=FALSE, sep = "")
body_gyro_x_train_ls <-gather(body_gyro_x_train, variable, body_gyro_x_train)
body_gyro_y_train<- read.table("body_gyro_y_train.txt", header=FALSE, sep = "")
body_gyro_y_train_ls <-gather(body_gyro_y_train, variable, body_gyro_y_train)
body_gyro_z_train<- read.table("body_gyro_z_train.txt", header=FALSE, sep = "")
body_gyro_z_train_ls <-gather(body_gyro_z_train, variable, body_gyro_z_train)
total_acc_x_train<- read.table("total_acc_x_train.txt", header=FALSE, sep = "")
total_acc_x_train_ls <-gather(total_acc_x_train, variable, total_acc_x_train)
total_acc_y_train<- read.table("total_acc_y_train.txt", header=FALSE, sep = "")
total_acc_y_train_ls <-gather(total_acc_y_train, variable, total_acc_y_train)
total_acc_z_train<- read.table("total_acc_z_train.txt", header=FALSE, sep = "")
total_acc_z_train_ls <-gather(total_acc_z_train, variable, total_acc_z_train)

#remove extra data frames from the environment
rm(body_acc_x_train)
rm(body_acc_y_train)
rm(body_acc_z_train)
rm(body_gyro_x_train)
rm(body_gyro_y_train)
rm(body_gyro_z_train)
rm(total_acc_x_train)
rm(total_acc_y_train)
rm(total_acc_z_train)

#combine train data into one table
train_data<- bind_cols(body_acc_x_train_ls, body_acc_y_train_ls, body_acc_z_train_ls, body_gyro_x_train_ls, body_gyro_y_train_ls, body_gyro_z_train_ls, total_acc_x_train_ls, total_acc_y_train_ls, total_acc_z_train_ls)

#get rid of extra variable columns
train_data<- select(train_data, -variable1, -variable2, -variable3, -variable4, -variable5, -variable6, -variable7, -variable8)

#use mutate to add column type: "train" or "test"
test_data <- mutate(test_data, type = "test")
train_data <- mutate(train_data, type = "train")

#get rid of the extra variable
test_data<- select(test_data, -variable)
train_data<- select(train_data, -variable) 

#rename the columns so the names are the same
test_data <- rename(test_data, 
    body_acc_x = body_acc_x_test,
    body_acc_y = body_acc_y_test,
    body_acc_z = body_acc_z_test,
    body_gyro_x = body_gyro_x_test,
    body_gyro_y = body_gyro_y_test,
    body_gyro_z = body_gyro_z_test,
    total_acc_x = total_acc_x_test,
    total_acc_y = total_acc_y_test,
    total_acc_z = total_acc_z_test,
  )
train_data <- rename(train_data,
    body_acc_x = body_acc_x_train,
    body_acc_y = body_acc_y_train,
    body_acc_z = body_acc_z_train,
    body_gyro_x = body_gyro_x_train,
    body_gyro_y = body_gyro_y_train,
    body_gyro_z = body_gyro_z_train,
    total_acc_x = total_acc_x_train,
    total_acc_y = total_acc_y_train,
    total_acc_z = total_acc_z_train,
  )

#combine data sets
combined_data<-bind_rows(test_data, train_data)

#get means for each variable in combined data set
mean(combined_data$body_acc_x)
mean(combined_data$body_acc_y)
mean(combined_data$body_acc_z)
mean(combined_data$body_gyro_x)
mean(combined_data$body_gyro_y)
mean(combined_data$body_gyro_z)
mean(combined_data$total_acc_x)
mean(combined_data$total_acc_y)
mean(combined_data$total_acc_z)

#get sds
sd(combined_data$body_acc_x)
sd(combined_data$body_acc_y)
sd(combined_data$body_acc_z)
sd(combined_data$body_gyro_x)
sd(combined_data$body_gyro_y)
sd(combined_data$body_gyro_z)
sd(combined_data$total_acc_x)
sd(combined_data$total_acc_y)
sd(combined_data$total_acc_z)

#make the names more descriptive
combined_data <- rename(combined_data,
  body_acceleration_x = body_acc_x,
  body_acceleration_y = body_acc_y,
  body_acceleration_z = body_acc_z,
  body_angular_velocity_x = body_gyro_x,
  body_angular_velocity_y = body_gyro_y,
  body_angular_velocity_z = body_gyro_z, 
  total_acceleration_x = total_acc_x,
  total_acceleration_y = total_acc_y,
  total_acceleration_z = total_acc_z, 
  )

#make a table with the averages
averages = data.frame(
  names = c("body_acceleration_x","body_acceleration_y", "body_acceleration_z", "body_angular_velocity_x", "body_angular_velocity_y", "body_angular_velocity_z", "total_acceleration_x", "total_acceleration_y", "total_acceleration_z"),
  averages = c(mean(combined_data$body_acceleration_x),mean(combined_data$body_acceleration_y), mean(combined_data$body_acceleration_z), mean(combined_data$body_angular_velocity_x), mean(combined_data$body_angular_velocity_y),mean(combined_data$body_angular_velocity_z),mean(combined_data$total_acceleration_x),
mean(combined_data$total_acceleration_y),mean(combined_data$total_acceleration_z))
)

#create csv files
setwd("C:/Users/Lisa Liu/Desktop/Data Science Course/Course 3 Getting and Cleaning Data/")
write.csv(combined_data, file= "combined_data.csv")
write.csv(averages, file= "averages.csv")
