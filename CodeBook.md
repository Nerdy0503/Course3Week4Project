Information about the tidy dataset



The output data set contains a summary of average mean and standard deviation values,
by activity and subject ID on temporal and frequential measurements. 



Temporal measurements are enclosed in the folders "UCI HAR Dataset/train/Inertial Signals" 
and "UCI HAR Dataset/test/Inertial Signals".

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone 
  accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. 
  The same description applies for the 'total_acc_y_train.txt' and 'total_acc_z_train.txt' 
  files for the Y and Z axes. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by 
  subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by 
  the gyroscope for each window sample. The units are radians/second. 


The mean, standard deviation, jerk and magnitude have been calculated for these sugnals. 
Then the Fast Fourier Transform (FFT) was applied on some of these signals. 
More information about the original data sets can be found in the features_info.txt 
and README.txt files in the "UCI HAR Dataset" folder.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Only the average values of the mean and standard deviation, by activity and subjected ID 
have been reported in the tidy dataset whose columns are as follows:

%%%%%%%%%%%%%%%%%

01. activity

    LAYING    
    SITTING   
    STANDING    
    WALKING   
    WALKING_DOWNSTAIRS    
    WALKING_UPSTAIRS    
    
02. subject_id

    1 through 30

03. average_temporal_body_acceleration_mean_X
04. average_temporal_body_acceleration_mean_Y                    
05. average_temporal_body_acceleration_mean_Z
06. average_temporal_body_acceleration_std_X                     
07. average_temporal_body_acceleration_std_Y
08. average_temporal_body_acceleration_std_Z 

09. average_temporal_gravity_acceleration_mean_X
10. average_temporal_gravity_acceleration_mean_Y                 
11. average_temporal_gravity_acceleration_mean_Z
12. average_temporal_gravity_acceleration_std_X                  
13. average_temporal_gravity_acceleration_std_Y
14. average_temporal_gravity_acceleration_std_Z

15. average_temporal_body_acceleration_jerk_mean_X
16. average_temporal_body_acceleration_jerk_mean_Y               
17. average_temporal_body_acceleration_jerk_mean_Z
18. average_temporal_body_acceleration_jerk_std_X                
19. average_temporal_body_acceleration_jerk_std_Y
20. average_temporal_body_acceleration_jerk_std_Z 

21. average_temporal_body_angular_velocity_mean_X
22. average_temporal_body_angular_velocity_mean_Y                
23. average_temporal_body_angular_velocity_mean_Z
24. average_temporal_body_angular_velocity_std_X                 
25. average_temporal_body_angular_velocity_std_Y
26. average_temporal_body_angular_velocity_std_Z 

27. average_temporal_body_angular_velocity_jerk_mean_X
28. average_temporal_body_angular_velocity_jerk_mean_Y           
29. average_temporal_body_angular_velocity_jerk_mean_Z
30. average_temporal_body_angular_velocity_jerk_std_X            
31. average_temporal_body_angular_velocity_jerk_std_Y
32. average_temporal_body_angular_velocity_jerk_std_Z 

33. average_temporal_body_acceleration_magnitude_mean
34. average_temporal_body_acceleration_magnitude_std

35. average_temporal_gravity_acceleration_magnitude_mean
36. average_temporal_gravity_acceleration_magnitude_std

37. average_temporal_body_acceleration_jerk_magnitude_mean
38. average_temporal_body_acceleration_jerk_magnitude_std 

39. average_temporal_body_angular_velocity_magnitude_mean
40. average_temporal_body_angular_velocity_magnitude_std

41. average_temporal_body_angular_velocity_jerk_magnitude_mean
42. average_temporal_body_angular_velocity_jerk_magnitude_std


43. average_frequential_body_acceleration_mean_X
44. average_frequential_body_acceleration_mean_Y                 
45. average_frequential_body_acceleration_mean_Z
46. average_frequential_body_acceleration_std_X                  
47. average_frequential_body_acceleration_std_Y
48. average_frequential_body_acceleration_std_Z

49. average_frequential_body_acceleration_jerk_mean_X
50. average_frequential_body_acceleration_jerk_mean_Y            
51. average_frequential_body_acceleration_jerk_mean_Z
52. average_frequential_body_acceleration_jerk_std_X             
53. average_frequential_body_acceleration_jerk_std_Y
54. average_frequential_body_acceleration_jerk_std_Z 

55. average_frequential_body_angular_velocity_mean_X
56. average_frequential_body_angular_velocity_mean_Y             
57. average_frequential_body_angular_velocity_mean_Z
58. average_frequential_body_angular_velocity_std_X              
59. average_frequential_body_angular_velocity_std_Y
60. average_frequential_body_angular_velocity_std_Z

61. average_frequential_body_acceleration_magnitude_mean
62. average_frequential_body_acceleration_magnitude_std 

63. average_frequential_body_acceleration_jerk_magnitude_mean
64. average_frequential_body_acceleration_jerk_magnitude_std

65. average_frequential_body_angular_velocity_magnitude_mean
66. average_frequential_body_angular_velocity_magnitude_std 

67. average_frequential_body_angular_velocity_jerk_magnitude_mean
68. average_frequential_body_angular_velocity_jerk_magnitude_std 


