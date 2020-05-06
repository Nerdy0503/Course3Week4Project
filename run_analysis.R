# 0. loading libraries
library(dplyr)

# reading activity and feature files

        activity <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
        colnames(activity) <- c("id", "name")
        feature <-  read.csv("UCI HAR Dataset/features.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
        colnames(feature) <- c("id", "name")

        

# 1. Merging the training and test data sets

    # a. reading in & contsructing the training data set

        train_subject_col <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
        train_activity_labels_col <- read.csv("UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
        trainSet0 <- read.csv("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
        trainSet <- cbind(train_subject_col, train_activity_labels_col, trainSet0)



    # b. reading in & contsructing the test data set

        test_subject_col <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
        test_activity_labels_col <- read.csv("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
        testSet0 <- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
        testSet <- cbind(test_subject_col, test_activity_labels_col, testSet0)


    # c. merging the two data sets and ordering respectively to ascending subject ID

        dataSet0 <- rbind(trainSet, testSet)
        colum_names <- c("subject_id", "activity", feature$name)
        colnames(dataSet0) <- colum_names
        dataSet0 <- dataSet0[order(dataSet0$subject_id),]



# 2. extracting the mean and standard deviation for each measurement

        x <- grep("mean\\(\\)", colum_names)
        y <- grep("std\\(\\)", colum_names)
        col_indices <- sort(c(1, 2, x, y))

        dataSet <- tbl_df(dataSet0[,col_indices])



# 3. naming descrptively the activities

      for(i in 1:length(dataSet$activity)){
        for(j in 1: length(activity$name)){
          if(dataSet$activity[i] == activity$id[j]){
            dataSet$activity[i] <- activity$name[j]
          }
        }
      }
        
        

# 4. naming descreptively the variables

        vect <- colnames(dataSet)
        vect <- gsub("tBodyAcc", "temporal_body_acceleration", vect)
        vect <- gsub("Mag", "_magnitude", vect)
        vect <- gsub("Jerk", "_jerk", vect)
        vect <- gsub("tBodyGyro", "temporal_body_angular_velocity", vect)
        vect <- gsub("tGravityAcc", "temporal_gravity_acceleration", vect)
        vect <- gsub("fBodyAcc", "frequential_body_acceleration", vect)
        vect <- gsub("fBodyGyro", "frequential_body_angular_velocity", vect)
        vect <- gsub("fBodyBodyAcc", "frequential_body_acceleration", vect)
        vect <- gsub("fBodyBodyGyro", "frequential_body_angular_velocity", vect)
        vect <- gsub("-", "_", vect)
        vect <- gsub("\\(\\)", "", vect)

        colnames(dataSet) <- vect

        
        
        
# 5. creating a second data set with the average of each variable for each activity and each subject

        tidyDataSet <- dataSet %>% group_by(activity,subject_id) %>%
                     summarise(average_temporal_body_acceleration_mean_X = mean(temporal_body_acceleration_mean_X),
                               average_temporal_body_acceleration_mean_Y = mean(temporal_body_acceleration_mean_Y),
                               average_temporal_body_acceleration_mean_Z = mean(temporal_body_acceleration_mean_Z),
                               average_temporal_body_acceleration_std_X = mean(temporal_body_acceleration_std_X),                                          
                               average_temporal_body_acceleration_std_Y = mean(temporal_body_acceleration_std_Y),                                          
                               average_temporal_body_acceleration_std_Z = mean(temporal_body_acceleration_std_Z),                                          
                               average_temporal_gravity_acceleration_mean_X = mean(temporal_gravity_acceleration_mean_X),                                  
                               average_temporal_gravity_acceleration_mean_Y = mean(temporal_gravity_acceleration_mean_Y),                                  
                               average_temporal_gravity_acceleration_mean_Z = mean(temporal_gravity_acceleration_mean_Z),                                  
                               average_temporal_gravity_acceleration_std_X = mean(temporal_gravity_acceleration_std_X),                                    
                               average_temporal_gravity_acceleration_std_Y = mean(temporal_gravity_acceleration_std_Y),                                    
                               average_temporal_gravity_acceleration_std_Z = mean(temporal_gravity_acceleration_std_Z),                                   
                               average_temporal_body_acceleration_jerk_mean_X = mean(temporal_body_acceleration_jerk_mean_X),                              
                               average_temporal_body_acceleration_jerk_mean_Y = mean(temporal_body_acceleration_jerk_mean_Y),                              
                               average_temporal_body_acceleration_jerk_mean_Z = mean(temporal_body_acceleration_jerk_mean_Z),                             
                               average_temporal_body_acceleration_jerk_std_X = mean(temporal_body_acceleration_jerk_std_X),                                
                               average_temporal_body_acceleration_jerk_std_Y = mean(temporal_body_acceleration_jerk_std_Y),                                
                               average_temporal_body_acceleration_jerk_std_Z = mean(temporal_body_acceleration_jerk_std_Z),                                
                               average_temporal_body_angular_velocity_mean_X = mean(temporal_body_angular_velocity_mean_X),                                
                               average_temporal_body_angular_velocity_mean_Y = mean(temporal_body_angular_velocity_mean_Y),                                
                               average_temporal_body_angular_velocity_mean_Z = mean(temporal_body_angular_velocity_mean_Z),                               
                               average_temporal_body_angular_velocity_std_X = mean(temporal_body_angular_velocity_std_X),                                  
                               average_temporal_body_angular_velocity_std_Y = mean(temporal_body_angular_velocity_std_Y),                                  
                               average_temporal_body_angular_velocity_std_Z = mean(temporal_body_angular_velocity_std_Z),                                 
                               average_temporal_body_angular_velocity_jerk_mean_X = mean(temporal_body_angular_velocity_jerk_mean_X),                      
                               average_temporal_body_angular_velocity_jerk_mean_Y = mean(temporal_body_angular_velocity_jerk_mean_Y),                      
                               average_temporal_body_angular_velocity_jerk_mean_Z = mean(temporal_body_angular_velocity_jerk_mean_Z),                      
                               average_temporal_body_angular_velocity_jerk_std_X = mean(temporal_body_angular_velocity_jerk_std_X),                        
                               average_temporal_body_angular_velocity_jerk_std_Y = mean(temporal_body_angular_velocity_jerk_std_Y),                        
                               average_temporal_body_angular_velocity_jerk_std_Z = mean(temporal_body_angular_velocity_jerk_std_Z),                        
                               average_temporal_body_acceleration_magnitude_mean = mean(temporal_body_acceleration_magnitude_mean),                        
                               average_temporal_body_acceleration_magnitude_std = mean(temporal_body_acceleration_magnitude_std),                          
                               average_temporal_gravity_acceleration_magnitude_mean = mean(temporal_gravity_acceleration_magnitude_mean),                  
                               average_temporal_gravity_acceleration_magnitude_std = mean(temporal_gravity_acceleration_magnitude_std),                    
                               average_temporal_body_acceleration_jerk_magnitude_mean = mean(temporal_body_acceleration_jerk_magnitude_mean),              
                               average_temporal_body_acceleration_jerk_magnitude_std = mean(temporal_body_acceleration_jerk_magnitude_std),                
                               average_temporal_body_angular_velocity_magnitude_mean = mean(temporal_body_angular_velocity_magnitude_mean),                
                               average_temporal_body_angular_velocity_magnitude_std = mean(temporal_body_angular_velocity_magnitude_std),                  
                               average_temporal_body_angular_velocity_jerk_magnitude_mean = mean(temporal_body_angular_velocity_jerk_magnitude_mean),      
                               average_temporal_body_angular_velocity_jerk_magnitude_std = mean(temporal_body_angular_velocity_jerk_magnitude_std),        
                               average_frequential_body_acceleration_mean_X = mean(frequential_body_acceleration_mean_X),                                  
                               average_frequential_body_acceleration_mean_Y = mean(frequential_body_acceleration_mean_Y),                                  
                               average_frequential_body_acceleration_mean_Z = mean(frequential_body_acceleration_mean_Z),                                  
                               average_frequential_body_acceleration_std_X = mean(frequential_body_acceleration_std_X),                                    
                               average_frequential_body_acceleration_std_Y = mean(frequential_body_acceleration_std_Y),                                    
                               average_frequential_body_acceleration_std_Z = mean(frequential_body_acceleration_std_Z),                                    
                               average_frequential_body_acceleration_jerk_mean_X = mean(frequential_body_acceleration_jerk_mean_X),                        
                               average_frequential_body_acceleration_jerk_mean_Y = mean(frequential_body_acceleration_jerk_mean_Y),                        
                               average_frequential_body_acceleration_jerk_mean_Z = mean(frequential_body_acceleration_jerk_mean_Z),                        
                               average_frequential_body_acceleration_jerk_std_X = mean(frequential_body_acceleration_jerk_std_X),                          
                               average_frequential_body_acceleration_jerk_std_Y = mean(frequential_body_acceleration_jerk_std_Y),                          
                               average_frequential_body_acceleration_jerk_std_Z = mean(frequential_body_acceleration_jerk_std_Z),                          
                               average_frequential_body_angular_velocity_mean_X = mean(frequential_body_angular_velocity_mean_X),                          
                               average_frequential_body_angular_velocity_mean_Y = mean(frequential_body_angular_velocity_mean_Y),                          
                               average_frequential_body_angular_velocity_mean_Z = mean(frequential_body_angular_velocity_mean_Z),                          
                               average_frequential_body_angular_velocity_std_X = mean(frequential_body_angular_velocity_std_X),                            
                               average_frequential_body_angular_velocity_std_Y = mean(frequential_body_angular_velocity_std_Y),                            
                               average_frequential_body_angular_velocity_std_Z = mean(frequential_body_angular_velocity_std_Z),                            
                               average_frequential_body_acceleration_magnitude_mean = mean(frequential_body_acceleration_magnitude_mean),                  
                               average_frequential_body_acceleration_magnitude_std = mean(frequential_body_acceleration_magnitude_std),                    
                               average_frequential_body_acceleration_jerk_magnitude_mean = mean(frequential_body_acceleration_jerk_magnitude_mean),        
                               average_frequential_body_acceleration_jerk_magnitude_std = mean(frequential_body_acceleration_jerk_magnitude_std),          
                               average_frequential_body_angular_velocity_magnitude_mean = mean(frequential_body_angular_velocity_magnitude_mean),          
                               average_frequential_body_angular_velocity_magnitude_std = mean(frequential_body_angular_velocity_magnitude_std),            
                               average_frequential_body_angular_velocity_jerk_magnitude_mean = mean(frequential_body_angular_velocity_jerk_magnitude_mean),
                               average_frequential_body_angular_velocity_jerk_magnitude_std = mean(frequential_body_angular_velocity_jerk_magnitude_std)

                      )
        
        # x <- colnames(dataSet)
        # 
        # for(i in 3: length(x)){
        #   x[i] <- paste("average_",x[i], " = mean(", x[i], "),", sep = "")
        # }
        # print(x)
        
        
        
        
# 6. output and writing the data set into a text file
        
        print(tidyDataSet)
        write.table(tidyDataSet, "tidy_data_set.txt", row.names = FALSE)
        
        
