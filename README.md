getdata007_proj
===============
This README provides a description of the script created to satisfy the 5 steps of data cleaning and wrangling needed for the class project. This is for the class project for the Getting and Cleaning Data 007 course on Coursera.

It is a single script call run_analysis.R.  This is the name specified in the instructions.  The script reads in data from a motion capture study, which was obtained here:[1].  This data is broken up into various components that make it difficult to work with, i.e. it is not "tidy".

The script reads in all the original data components, with the exception of the “Inertial Signals”. See [2] for an explanation by a class TA in the project FAQ as to why this component of the data set can be ignored. 

The script reads in the “train” and “test” data, and tidies them up separately, the merges them into a single data frame, and assigns descriptive column names to each of the data columns.  This is out of order from the steps in the problem description, but the descriptive names were added to make selection and sorting for part 2 easier.

The columns containing mean and standard deviation are funneled into a new data frame. The name of this dataframe with the workspace is “part2_data.”   Selection was done based on the column names containing “std” and “mean”, for both time and frequency variables.  These should means and standard deviations of the original data, according to the information accompanying that data.  The variables “subject” and “activity number” are included in this new dataframe, as well as a factor column that identifies the activity with a descriptive name.  These name assignments are based on “activity numbers.”  The name of this dataframe with the workspace is “part2_data.”  

The script then creates another dataframe, “all_avgs”, which is the mean of each activity per subject for all the variables in “part2_data.” “all_avgs” contains 81 variables and 180 lines.  The descriptive names for the column are prepended with “avg-“ to indicate they are the averages indicated in step 5 of the problem description.
  
“all_avgs” is then written out as “project_upload.txt.”  This output file is written to the working directory.  It is plain text, and the entries are separated with commas.  The first line is a header contain the variable names.

NOTE TO PEER EVALUATORS:
The exact contents of final dataset in project_upload.txt is open to interpretation. This is based on indications by class TA's [2][3], and extensive discussion in the forums.  It may not be exactly what you have, but that does not make it wrong. Summaries of the output from R are below.

To execute the script:
1) Place run_analysis.R in a working directory and unzip the data set available here in to the working directory. 'dataset' name of the directory that should contain the extracted zip files.
2) Source run_analysis.R to produce “project_upload.txt.”  

Please see the codebook.txt file for specific info on the descriptive column names for the variables and info on the origins of the data.

[1] https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
[2] https://class.coursera.org/getdata-007/forum/thread?thread_id=49#post-114
[3] https://class.coursera.org/getdata-007/forum/thread?thread_id=42#post-97

Summaries of script output dataframe
====================================
 str(all_avgs)
'data.frame':	180 obs. of  81 variables:
 $ activity                           : Factor w/ 6 levels "walking","walking_upstairs",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ subject                            : int  1 1 1 1 1 1 2 2 2 2 ...
 $ avg-tBodyAcc-std()-X               : num  -0.284 -0.355 0.03 -0.977 -0.996 ...
 $ avg-tBodyAcc-std()-Y               : num  0.11446 -0.00232 -0.03194 -0.92262 -0.97319 ...
 $ avg-tBodyAcc-std()-Z               : num  -0.26 -0.0195 -0.2304 -0.9396 -0.9798 ...
 $ avg-tGravityAcc-std()-X            : num  -0.977 -0.956 -0.951 -0.968 -0.994 ...
 $ avg-tGravityAcc-std()-Y            : num  -0.971 -0.953 -0.937 -0.936 -0.981 ...
 $ avg-tGravityAcc-std()-Z            : num  -0.948 -0.912 -0.896 -0.949 -0.976 ...
 $ avg-tBodyAccJerk-std()-X           : num  -0.1136 -0.4468 -0.0123 -0.9864 -0.9946 ...
 $ avg-tBodyAccJerk-std()-Y           : num  0.067 -0.378 -0.102 -0.981 -0.986 ...
 $ avg-tBodyAccJerk-std()-Z           : num  -0.503 -0.707 -0.346 -0.988 -0.992 ...
 $ avg-tBodyGyro-std()-X              : num  -0.474 -0.545 -0.458 -0.977 -0.987 ...
 $ avg-tBodyGyro-std()-Y              : num  -0.05461 0.00411 -0.12635 -0.96647 -0.98773 ...
 $ avg-tBodyGyro-std()-Z              : num  -0.344 -0.507 -0.125 -0.941 -0.981 ...
 $ avg-tBodyGyroJerk-std()-X          : num  -0.207 -0.615 -0.487 -0.992 -0.993 ...
 $ avg-tBodyGyroJerk-std()-Y          : num  -0.304 -0.602 -0.239 -0.99 -0.995 ...
 $ avg-tBodyGyroJerk-std()-Z          : num  -0.404 -0.606 -0.269 -0.988 -0.992 ...
 $ avg-tBodyAccMag-std()              : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
 $ avg-tGravityAccMag-std()           : num  -0.2197 -0.325 0.0199 -0.9271 -0.9819 ...
 $ avg-tBodyAccJerkMag-std()          : num  -0.0745 -0.479 -0.0258 -0.9841 -0.9931 ...
 $ avg-tBodyGyroMag-std()             : num  -0.187 -0.149 -0.226 -0.935 -0.979 ...
 $ avg-tBodyGyroJerkMag-std()         : num  -0.325 -0.649 -0.307 -0.988 -0.995 ...
 $ avg-fBodyAcc-std()-X               : num  -0.3191 -0.3374 0.0243 -0.9764 -0.996 ...
 $ avg-fBodyAcc-std()-Y               : num  0.056 0.0218 -0.113 -0.9173 -0.9723 ...
 $ avg-fBodyAcc-std()-Z               : num  -0.28 0.086 -0.298 -0.934 -0.978 ...
 $ avg-fBodyAccJerk-std()-X           : num  -0.1336 -0.4619 -0.0863 -0.9875 -0.9951 ...
 $ avg-fBodyAccJerk-std()-Y           : num  0.107 -0.382 -0.135 -0.983 -0.987 ...
 $ avg-fBodyAccJerk-std()-Z           : num  -0.535 -0.726 -0.402 -0.988 -0.992 ...
 $ avg-fBodyGyro-std()-X              : num  -0.517 -0.566 -0.495 -0.978 -0.987 ...
 $ avg-fBodyGyro-std()-Y              : num  -0.0335 0.1515 -0.1814 -0.9623 -0.9871 ...
 $ avg-fBodyGyro-std()-Z              : num  -0.437 -0.572 -0.238 -0.944 -0.982 ...
 $ avg-fBodyAccMag-std()              : num  -0.398 -0.416 -0.187 -0.928 -0.982 ...
 $ avg-fBodyBodyAccJerkMag-std()      : num  -0.103 -0.533 -0.104 -0.982 -0.993 ...
 $ avg-fBodyBodyGyroMag-std()         : num  -0.321 -0.183 -0.398 -0.932 -0.978 ...
 $ avg-fBodyBodyGyroJerkMag-std()     : num  -0.382 -0.694 -0.392 -0.987 -0.995 ...
 $ avg-tBodyAcc-mean()-X              : num  0.277 0.255 0.289 0.261 0.279 ...
 $ avg-tBodyAcc-mean()-Y              : num  -0.01738 -0.02395 -0.00992 -0.00131 -0.01614 ...
 $ avg-tBodyAcc-mean()-Z              : num  -0.1111 -0.0973 -0.1076 -0.1045 -0.1106 ...
 $ avg-tGravityAcc-mean()-X           : num  0.935 0.893 0.932 0.832 0.943 ...
 $ avg-tGravityAcc-mean()-Y           : num  -0.282 -0.362 -0.267 0.204 -0.273 ...
 $ avg-tGravityAcc-mean()-Z           : num  -0.0681 -0.0754 -0.0621 0.332 0.0135 ...
 $ avg-tBodyAccJerk-mean()-X          : num  0.074 0.1014 0.0542 0.0775 0.0754 ...
 $ avg-tBodyAccJerk-mean()-Y          : num  0.028272 0.019486 0.02965 -0.000619 0.007976 ...
 $ avg-tBodyAccJerk-mean()-Z          : num  -0.00417 -0.04556 -0.01097 -0.00337 -0.00369 ...
 $ avg-tBodyGyro-mean()-X             : num  -0.0418 0.0505 -0.0351 -0.0454 -0.024 ...
 $ avg-tBodyGyro-mean()-Y             : num  -0.0695 -0.1662 -0.0909 -0.0919 -0.0594 ...
 $ avg-tBodyGyro-mean()-Z             : num  0.0849 0.0584 0.0901 0.0629 0.0748 ...
 $ avg-tBodyGyroJerk-mean()-X         : num  -0.09 -0.1222 -0.074 -0.0937 -0.0996 ...
 $ avg-tBodyGyroJerk-mean()-Y         : num  -0.0398 -0.0421 -0.044 -0.0402 -0.0441 ...
 $ avg-tBodyGyroJerk-mean()-Z         : num  -0.0461 -0.0407 -0.027 -0.0467 -0.049 ...
 $ avg-tBodyAccMag-mean()             : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
 $ avg-tGravityAccMag-mean()          : num  -0.137 -0.1299 0.0272 -0.9485 -0.9843 ...
 $ avg-tBodyAccJerkMag-mean()         : num  -0.1414 -0.4665 -0.0894 -0.9874 -0.9924 ...
 $ avg-tBodyGyroMag-mean()            : num  -0.161 -0.1267 -0.0757 -0.9309 -0.9765 ...
 $ avg-tBodyGyroJerkMag-mean()        : num  -0.299 -0.595 -0.295 -0.992 -0.995 ...
 $ avg-fBodyAcc-mean()-X              : num  -0.2028 -0.4043 0.0382 -0.9796 -0.9952 ...
 $ avg-fBodyAcc-mean()-Y              : num  0.08971 -0.19098 0.00155 -0.94408 -0.97707 ...
 $ avg-fBodyAcc-mean()-Z              : num  -0.332 -0.433 -0.226 -0.959 -0.985 ...
 $ avg-fBodyAcc-meanFreq()-X          : num  -0.2075 -0.4187 -0.3074 -0.0495 0.0865 ...
 $ avg-fBodyAcc-meanFreq()-Y          : num  0.1131 -0.1607 0.0632 0.0759 0.1175 ...
 $ avg-fBodyAcc-meanFreq()-Z          : num  0.0497 -0.5201 0.2943 0.2388 0.2449 ...
 $ avg-fBodyAccJerk-mean()-X          : num  -0.1705 -0.4799 -0.0277 -0.9866 -0.9946 ...
 $ avg-fBodyAccJerk-mean()-Y          : num  -0.0352 -0.4134 -0.1287 -0.9816 -0.9854 ...
 $ avg-fBodyAccJerk-mean()-Z          : num  -0.469 -0.685 -0.288 -0.986 -0.991 ...
 $ avg-fBodyAccJerk-meanFreq()-X      : num  -0.209 -0.377 -0.253 0.257 0.314 ...
 $ avg-fBodyAccJerk-meanFreq()-Y      : num  -0.3862 -0.5095 -0.3376 0.0475 0.0392 ...
 $ avg-fBodyAccJerk-meanFreq()-Z      : num  -0.18553 -0.5511 0.00937 0.09239 0.13858 ...
 $ avg-fBodyGyro-mean()-X             : num  -0.339 -0.493 -0.352 -0.976 -0.986 ...
 $ avg-fBodyGyro-mean()-Y             : num  -0.1031 -0.3195 -0.0557 -0.9758 -0.989 ...
 $ avg-fBodyGyro-mean()-Z             : num  -0.2559 -0.4536 -0.0319 -0.9513 -0.9808 ...
 $ avg-fBodyGyro-meanFreq()-X         : num  0.0148 -0.1875 -0.1005 0.1892 -0.1203 ...
 $ avg-fBodyGyro-meanFreq()-Y         : num  -0.0658 -0.4736 0.0826 0.0631 -0.0447 ...
 $ avg-fBodyGyro-meanFreq()-Z         : num  0.000773 -0.133374 -0.075676 -0.029784 0.100608 ...
 $ avg-fBodyAccMag-mean()             : num  -0.1286 -0.3524 0.0966 -0.9478 -0.9854 ...
 $ avg-fBodyAccMag-meanFreq()         : num  0.1906 -0.0977 0.1192 0.2367 0.2846 ...
 $ avg-fBodyBodyAccJerkMag-mean()     : num  -0.0571 -0.4427 0.0262 -0.9853 -0.9925 ...
 $ avg-fBodyBodyAccJerkMag-meanFreq() : num  0.0938 0.0854 0.0765 0.3519 0.4222 ...
 $ avg-fBodyBodyGyroMag-mean()        : num  -0.199 -0.326 -0.186 -0.958 -0.985 ...
 $ avg-fBodyBodyGyroMag-meanFreq()    : num  0.268844 -0.219303 0.349614 -0.000262 -0.028606 ...
 $ avg-fBodyBodyGyroJerkMag-mean()    : num  -0.319 -0.635 -0.282 -0.99 -0.995 ...
 $ avg-fBodyBodyGyroJerkMag-meanFreq(): num  0.191 0.114 0.19 0.185 0.334 ...
—————————————————————————————
head(all_avgs)
            activity subject avg-tBodyAcc-std()-X avg-tBodyAcc-std()-Y avg-tBodyAcc-std()-Z avg-tGravityAcc-std()-X
1            walking       1          -0.28374026          0.114461337          -0.26002790              -0.9766096
2   walking_upstairs       1          -0.35470803         -0.002320265          -0.01947924              -0.9563670
3 walking_downstairs       1           0.03003534         -0.031935943          -0.23043421              -0.9505598
4            sitting       1          -0.97722901         -0.922618642          -0.93958629              -0.9684571
5           standing       1          -0.99575990         -0.973190056          -0.97977588              -0.9937630
6             laying       1          -0.92805647         -0.836827406          -0.82606140              -0.8968300
  avg-tGravityAcc-std()-Y avg-tGravityAcc-std()-Z avg-tBodyAccJerk-std()-X avg-tBodyAccJerk-std()-Y avg-tBodyAccJerk-std()-Z
1              -0.9713060              -0.9477172              -0.11361560                0.0670025               -0.5026998
2              -0.9528492              -0.9123794              -0.44684389               -0.3782744               -0.7065935
3              -0.9370187              -0.8959397              -0.01228386               -0.1016014               -0.3457350
4              -0.9355171              -0.9490409              -0.98643071               -0.9813720               -0.9879108
5              -0.9812260              -0.9763241              -0.99460454               -0.9856487               -0.9922512
6              -0.9077200              -0.8523663              -0.95848211               -0.9241493               -0.9548551
  avg-tBodyGyro-std()-X avg-tBodyGyro-std()-Y avg-tBodyGyro-std()-Z avg-tBodyGyroJerk-std()-X avg-tBodyGyroJerk-std()-Y
1            -0.4735355          -0.054607769            -0.3442666                -0.2074219                -0.3044685
2            -0.5448711           0.004105184            -0.5071687                -0.6147865                -0.6016967
3            -0.4580305          -0.126349195            -0.1247025                -0.4870273                -0.2388248
4            -0.9772113          -0.966473895            -0.9414259                -0.9917316                -0.9895181
5            -0.9871919          -0.987734440            -0.9806456                -0.9929451                -0.9951379
6            -0.8735439          -0.951090440            -0.9082847                -0.9186085                -0.9679072
  avg-tBodyGyroJerk-std()-Z avg-tBodyAccMag-std() avg-tGravityAccMag-std() avg-tBodyAccJerkMag-std() avg-tBodyGyroMag-std()
1                -0.4042555           -0.21968865              -0.21968865               -0.07447175             -0.1869784
2                -0.6063320           -0.32497093              -0.32497093               -0.47899162             -0.1486193
3                -0.2687615            0.01988435               0.01988435               -0.02578772             -0.2257244
4                -0.9879358           -0.92707842              -0.92707842               -0.98412002             -0.9345318
5                -0.9921085           -0.98194293              -0.98194293               -0.99309621             -0.9786900
6                -0.9577902           -0.79514486              -0.79514486               -0.92824563             -0.8190102
  avg-tBodyGyroJerkMag-std() avg-fBodyAcc-std()-X avg-fBodyAcc-std()-Y avg-fBodyAcc-std()-Z avg-fBodyAccJerk-std()-X
1                 -0.3253249          -0.31913472           0.05604001          -0.27968675               -0.1335866
2                 -0.6485530          -0.33742819           0.02176951           0.08595655               -0.4619070
3                 -0.3065106           0.02433084          -0.11296374          -0.29792789               -0.0863279
4                 -0.9883087          -0.97641231          -0.91727501          -0.93446956               -0.9874930
5                 -0.9947332          -0.99602835          -0.97229310          -0.97793726               -0.9950738
6                 -0.9358410          -0.92443743          -0.83362556          -0.81289156               -0.9641607
  avg-fBodyAccJerk-std()-Y avg-fBodyAccJerk-std()-Z avg-fBodyGyro-std()-X avg-fBodyGyro-std()-Y avg-fBodyGyro-std()-Z
1                0.1067399               -0.5347134            -0.5166919           -0.03350816            -0.4365622
2               -0.3817771               -0.7260402            -0.5658925            0.15153891            -0.5717078
3               -0.1345800               -0.4017215            -0.4954225           -0.18141473            -0.2384436
4               -0.9825139               -0.9883392            -0.9779042           -0.96234504            -0.9439178
5               -0.9870182               -0.9923498            -0.9874971           -0.98710773            -0.9823453
6               -0.9322179               -0.9605870            -0.8822965           -0.95123205            -0.9165825
  avg-fBodyAccMag-std() avg-fBodyBodyAccJerkMag-std() avg-fBodyBodyGyroMag-std() avg-fBodyBodyGyroJerkMag-std() avg-tBodyAcc-mean()-X
1            -0.3980326                    -0.1034924                 -0.3210180                     -0.3816019             0.2773308
2            -0.4162601                    -0.5330599                 -0.1829855                     -0.6939305             0.2554617
3            -0.1865303                    -0.1040523                 -0.3983504                     -0.3919199             0.2891883
4            -0.9284448                    -0.9816062                 -0.9321984                     -0.9870496             0.2612376
5            -0.9823138                    -0.9925360                 -0.9784661                     -0.9946711             0.2789176
6            -0.7983009                    -0.9218040                 -0.8243194                     -0.9326607             0.2215982
  avg-tBodyAcc-mean()-Y avg-tBodyAcc-mean()-Z avg-tGravityAcc-mean()-X avg-tGravityAcc-mean()-Y avg-tGravityAcc-mean()-Z
1          -0.017383819            -0.1111481                0.9352232               -0.2821650              -0.06810286
2          -0.023953149            -0.0973020                0.8933511               -0.3621534              -0.07540294
3          -0.009918505            -0.1075662                0.9318744               -0.2666103              -0.06211996
4          -0.001308288            -0.1045442                0.8315099                0.2044116               0.33204370
5          -0.016137590            -0.1106018                0.9429520               -0.2729838               0.01349058
6          -0.040513953            -0.1132036               -0.2488818                0.7055498               0.44581772
  avg-tBodyAccJerk-mean()-X avg-tBodyAccJerk-mean()-Y avg-tBodyAccJerk-mean()-Z avg-tBodyGyro-mean()-X avg-tBodyGyro-mean()-Y
1                0.07404163              0.0282721096              -0.004168406            -0.04183096            -0.06953005
2                0.10137273              0.0194863076              -0.045562545             0.05054938            -0.16617002
3                0.05415532              0.0296504490              -0.010971973            -0.03507819            -0.09093713
4                0.07748252             -0.0006191028              -0.003367792            -0.04535006            -0.09192415
5                0.07537665              0.0079757309              -0.003685250            -0.02398773            -0.05939722
6                0.08108653              0.0038382040               0.010834236            -0.01655309            -0.06448612
  avg-tBodyGyro-mean()-Z avg-tBodyGyroJerk-mean()-X avg-tBodyGyroJerk-mean()-Y avg-tBodyGyroJerk-mean()-Z avg-tBodyAccMag-mean()
1             0.08494482                -0.08999754                -0.03984287                -0.04613093            -0.13697118
2             0.05835955                -0.12223277                -0.04214859                -0.04071255            -0.12992763
3             0.09008501                -0.07395920                -0.04399028                -0.02704611             0.02718829
4             0.06293138                -0.09367938                -0.04021181                -0.04670263            -0.94853679
5             0.07480075                -0.09960921                -0.04406279                -0.04895055            -0.98427821
6             0.14868944                -0.10727095                -0.04151729                -0.07405012            -0.84192915
  avg-tGravityAccMag-mean() avg-tBodyAccJerkMag-mean() avg-tBodyGyroMag-mean() avg-tBodyGyroJerkMag-mean() avg-fBodyAcc-mean()-X
1               -0.13697118                -0.14142881             -0.16097955                  -0.2987037           -0.20279431
2               -0.12992763                -0.46650345             -0.12673559                  -0.5948829           -0.40432178
3                0.02718829                -0.08944748             -0.07574125                  -0.2954638            0.03822918
4               -0.94853679                -0.98736420             -0.93089249                  -0.9919763           -0.97964124
5               -0.98427821                -0.99236779             -0.97649379                  -0.9949668           -0.99524993
6               -0.84192915                -0.95439626             -0.87475955                  -0.9634610           -0.93909905
  avg-fBodyAcc-mean()-Y avg-fBodyAcc-mean()-Z avg-fBodyAcc-meanFreq()-X avg-fBodyAcc-meanFreq()-Y avg-fBodyAcc-meanFreq()-Z
1           0.089712726            -0.3315601               -0.20754837                0.11309365                0.04972652
2          -0.190976721            -0.4333497               -0.41873500               -0.16069721               -0.52011479
3           0.001549908            -0.2255745               -0.30739520                0.06322008                0.29432270
4          -0.944084550            -0.9591849               -0.04951360                0.07594608                0.23882987
5          -0.977070848            -0.9852971                0.08651536                0.11747895                0.24485859
6          -0.867065205            -0.8826669               -0.15879267                0.09753484                0.08943766
  avg-fBodyAccJerk-mean()-X avg-fBodyAccJerk-mean()-Y avg-fBodyAccJerk-mean()-Z avg-fBodyAccJerk-meanFreq()-X
1               -0.17054696               -0.03522552                -0.4689992                    -0.2092620
2               -0.47987525               -0.41344459                -0.6854744                    -0.3770231
3               -0.02766387               -0.12866716                -0.2883347                    -0.2531643
4               -0.98659702               -0.98157947                -0.9860531                     0.2566108
5               -0.99463080               -0.98541870                -0.9907522                     0.3141829
6               -0.95707388               -0.92246261                -0.9480609                     0.1324191
  avg-fBodyAccJerk-meanFreq()-Y avg-fBodyAccJerk-meanFreq()-Z avg-fBodyGyro-mean()-X avg-fBodyGyro-mean()-Y avg-fBodyGyro-mean()-Z
1                   -0.38623714                  -0.185530281             -0.3390322            -0.10305942            -0.25594094
2                   -0.50949553                  -0.551104284             -0.4926117            -0.31947461            -0.45359721
3                   -0.33758970                   0.009372239             -0.3524496            -0.05570225            -0.03186943
4                    0.04754378                   0.092392003             -0.9761615            -0.97583859            -0.95131554
5                    0.03916190                   0.138581479             -0.9863868            -0.98898446            -0.98077312
6                    0.02451362                   0.024387945             -0.8502492            -0.95219149            -0.90930272
  avg-fBodyGyro-meanFreq()-X avg-fBodyGyro-meanFreq()-Y avg-fBodyGyro-meanFreq()-Z avg-fBodyAccMag-mean() avg-fBodyAccMag-meanFreq()
1                0.014784499                -0.06577462               0.0007733216            -0.12862345                 0.19064372
2               -0.187450248                -0.47357479              -0.1333739043            -0.35239594                -0.09774335
3               -0.100453729                 0.08255115              -0.0756762068             0.09658453                 0.11918714
4                0.189153021                 0.06312707              -0.0297839207            -0.94778292                 0.23665501
5               -0.120293021                -0.04471920               0.1006076351            -0.98535636                 0.28455529
6               -0.003546796                -0.09152913               0.0104581257            -0.86176765                 0.08640856
  avg-fBodyBodyAccJerkMag-mean() avg-fBodyBodyAccJerkMag-meanFreq() avg-fBodyBodyGyroMag-mean() avg-fBodyBodyGyroMag-meanFreq()
1                    -0.05711940                         0.09382218                  -0.1992526                    0.2688443675
2                    -0.44265216                         0.08535241                  -0.3259615                   -0.2193033761
3                     0.02621849                         0.07649155                  -0.1857203                    0.3496138955
4                    -0.98526213                         0.35185220                  -0.9584356                   -0.0002621867
5                    -0.99254248                         0.42222010                  -0.9846176                   -0.0286057725
6                    -0.93330036                         0.26639115                  -0.8621902                   -0.1397750127
  avg-fBodyBodyGyroJerkMag-mean() avg-fBodyBodyGyroJerkMag-meanFreq()
1                      -0.3193086                           0.1906634
2                      -0.6346651                           0.1142773
3                      -0.2819634                           0.1900007
4                      -0.9897975                           0.1847759
5                      -0.9948154                           0.3344987
6                      -0.9423669                           0.1764859
——————————————————————————————
summary(all_avgs)
               activity     subject     avg-tBodyAcc-std()-X avg-tBodyAcc-std()-Y avg-tBodyAcc-std()-Z avg-tGravityAcc-std()-X
 walking           :30   Min.   : 1.0   Min.   :-0.9961      Min.   :-0.99024     Min.   :-0.9877      Min.   :-0.9968        
 walking_upstairs  :30   1st Qu.: 8.0   1st Qu.:-0.9799      1st Qu.:-0.94205     1st Qu.:-0.9498      1st Qu.:-0.9825        
 walking_downstairs:30   Median :15.5   Median :-0.7526      Median :-0.50897     Median :-0.6518      Median :-0.9695        
 sitting           :30   Mean   :15.5   Mean   :-0.5577      Mean   :-0.46046     Mean   :-0.5756      Mean   :-0.9638        
 standing          :30   3rd Qu.:23.0   3rd Qu.:-0.1984      3rd Qu.:-0.03077     3rd Qu.:-0.2306      3rd Qu.:-0.9509        
 laying            :30   Max.   :30.0   Max.   : 0.6269      Max.   : 0.61694     Max.   : 0.6090      Max.   :-0.8296        
 avg-tGravityAcc-std()-Y avg-tGravityAcc-std()-Z avg-tBodyAccJerk-std()-X avg-tBodyAccJerk-std()-Y avg-tBodyAccJerk-std()-Z
 Min.   :-0.9942         Min.   :-0.9910         Min.   :-0.9946          Min.   :-0.9895          Min.   :-0.99329        
 1st Qu.:-0.9711         1st Qu.:-0.9605         1st Qu.:-0.9832          1st Qu.:-0.9724          1st Qu.:-0.98266        
 Median :-0.9590         Median :-0.9450         Median :-0.8104          Median :-0.7756          Median :-0.88366        
 Mean   :-0.9524         Mean   :-0.9364         Mean   :-0.5949          Mean   :-0.5654          Mean   :-0.73596        
 3rd Qu.:-0.9370         3rd Qu.:-0.9180         3rd Qu.:-0.2233          3rd Qu.:-0.1483          3rd Qu.:-0.51212        
 Max.   :-0.6436         Max.   :-0.6102         Max.   : 0.5443          Max.   : 0.3553          Max.   : 0.03102        
 avg-tBodyGyro-std()-X avg-tBodyGyro-std()-Y avg-tBodyGyro-std()-Z avg-tBodyGyroJerk-std()-X avg-tBodyGyroJerk-std()-Y
 Min.   :-0.9943       Min.   :-0.9942       Min.   :-0.9855       Min.   :-0.9965           Min.   :-0.9971          
 1st Qu.:-0.9735       1st Qu.:-0.9629       1st Qu.:-0.9609       1st Qu.:-0.9800           1st Qu.:-0.9832          
 Median :-0.7890       Median :-0.8017       Median :-0.8010       Median :-0.8396           Median :-0.8942          
 Mean   :-0.6916       Mean   :-0.6533       Mean   :-0.6164       Mean   :-0.7036           Mean   :-0.7636          
 3rd Qu.:-0.4414       3rd Qu.:-0.4196       3rd Qu.:-0.3106       3rd Qu.:-0.4629           3rd Qu.:-0.5861          
 Max.   : 0.2677       Max.   : 0.4765       Max.   : 0.5649       Max.   : 0.1791           Max.   : 0.2959          
 avg-tBodyGyroJerk-std()-Z avg-tBodyAccMag-std() avg-tGravityAccMag-std() avg-tBodyAccJerkMag-std() avg-tBodyGyroMag-std()
 Min.   :-0.9954           Min.   :-0.9865       Min.   :-0.9865          Min.   :-0.9946           Min.   :-0.9814       
 1st Qu.:-0.9848           1st Qu.:-0.9430       1st Qu.:-0.9430          1st Qu.:-0.9765           1st Qu.:-0.9476       
 Median :-0.8610           Median :-0.6074       Median :-0.6074          Median :-0.8014           Median :-0.7420       
 Mean   :-0.7096           Mean   :-0.5439       Mean   :-0.5439          Mean   :-0.5842           Mean   :-0.6304       
 3rd Qu.:-0.4741           3rd Qu.:-0.2090       3rd Qu.:-0.2090          3rd Qu.:-0.2173           3rd Qu.:-0.3602       
 Max.   : 0.1932           Max.   : 0.4284       Max.   : 0.4284          Max.   : 0.4506           Max.   : 0.3000       
 avg-tBodyGyroJerkMag-std() avg-fBodyAcc-std()-X avg-fBodyAcc-std()-Y avg-fBodyAcc-std()-Z avg-fBodyAccJerk-std()-X
 Min.   :-0.9977            Min.   :-0.9966      Min.   :-0.99068     Min.   :-0.9872      Min.   :-0.9951         
 1st Qu.:-0.9805            1st Qu.:-0.9820      1st Qu.:-0.94042     1st Qu.:-0.9459      1st Qu.:-0.9847         
 Median :-0.8809            Median :-0.7470      Median :-0.51338     Median :-0.6441      Median :-0.8254         
 Mean   :-0.7550            Mean   :-0.5522      Mean   :-0.48148     Mean   :-0.5824      Mean   :-0.6121         
 3rd Qu.:-0.5767            3rd Qu.:-0.1966      3rd Qu.:-0.07913     3rd Qu.:-0.2655      3rd Qu.:-0.2475         
 Max.   : 0.2502            Max.   : 0.6585      Max.   : 0.56019     Max.   : 0.6871      Max.   : 0.4768         
 avg-fBodyAccJerk-std()-Y avg-fBodyAccJerk-std()-Z avg-fBodyGyro-std()-X avg-fBodyGyro-std()-Y avg-fBodyGyro-std()-Z
 Min.   :-0.9905          Min.   :-0.993108        Min.   :-0.9947       Min.   :-0.9944       Min.   :-0.9867      
 1st Qu.:-0.9737          1st Qu.:-0.983747        1st Qu.:-0.9750       1st Qu.:-0.9602       1st Qu.:-0.9643      
 Median :-0.7852          Median :-0.895121        Median :-0.8086       Median :-0.7964       Median :-0.8224      
 Mean   :-0.5707          Mean   :-0.756489        Mean   :-0.7110       Mean   :-0.6454       Mean   :-0.6577      
 3rd Qu.:-0.1685          3rd Qu.:-0.543787        3rd Qu.:-0.4813       3rd Qu.:-0.4154       3rd Qu.:-0.3916      
 Max.   : 0.3498          Max.   :-0.006236        Max.   : 0.1966       Max.   : 0.6462       Max.   : 0.5225      
 avg-fBodyAccMag-std() avg-fBodyBodyAccJerkMag-std() avg-fBodyBodyGyroMag-std() avg-fBodyBodyGyroJerkMag-std() avg-tBodyAcc-mean()-X
 Min.   :-0.9876       Min.   :-0.9944               Min.   :-0.9815            Min.   :-0.9976                Min.   :0.2216       
 1st Qu.:-0.9452       1st Qu.:-0.9752               1st Qu.:-0.9488            1st Qu.:-0.9802                1st Qu.:0.2712       
 Median :-0.6513       Median :-0.8126               Median :-0.7727            Median :-0.8941                Median :0.2770       
 Mean   :-0.6210       Mean   :-0.5992               Mean   :-0.6723            Mean   :-0.7715                Mean   :0.2743       
 3rd Qu.:-0.3654       3rd Qu.:-0.2668               3rd Qu.:-0.4277            3rd Qu.:-0.6081                3rd Qu.:0.2800       
 Max.   : 0.1787       Max.   : 0.3163               Max.   : 0.2367            Max.   : 0.2878                Max.   :0.3015       
 avg-tBodyAcc-mean()-Y avg-tBodyAcc-mean()-Z avg-tGravityAcc-mean()-X avg-tGravityAcc-mean()-Y avg-tGravityAcc-mean()-Z
 Min.   :-0.040514     Min.   :-0.15251      Min.   :-0.6800          Min.   :-0.47989         Min.   :-0.49509        
 1st Qu.:-0.020022     1st Qu.:-0.11207      1st Qu.: 0.8376          1st Qu.:-0.23319         1st Qu.:-0.11726        
 Median :-0.017262     Median :-0.10819      Median : 0.9208          Median :-0.12782         Median : 0.02384        
 Mean   :-0.017876     Mean   :-0.10916      Mean   : 0.6975          Mean   :-0.01621         Mean   : 0.07413        
 3rd Qu.:-0.014936     3rd Qu.:-0.10443      3rd Qu.: 0.9425          3rd Qu.: 0.08773         3rd Qu.: 0.14946        
 Max.   :-0.001308     Max.   :-0.07538      Max.   : 0.9745          Max.   : 0.95659         Max.   : 0.95787        
 avg-tBodyAccJerk-mean()-X avg-tBodyAccJerk-mean()-Y avg-tBodyAccJerk-mean()-Z avg-tBodyGyro-mean()-X avg-tBodyGyro-mean()-Y
 Min.   :0.04269           Min.   :-0.0386872        Min.   :-0.067458         Min.   :-0.20578       Min.   :-0.20421      
 1st Qu.:0.07396           1st Qu.: 0.0004664        1st Qu.:-0.010601         1st Qu.:-0.04712       1st Qu.:-0.08955      
 Median :0.07640           Median : 0.0094698        Median :-0.003861         Median :-0.02871       Median :-0.07318      
 Mean   :0.07947           Mean   : 0.0075652        Mean   :-0.004953         Mean   :-0.03244       Mean   :-0.07426      
 3rd Qu.:0.08330           3rd Qu.: 0.0134008        3rd Qu.: 0.001958         3rd Qu.:-0.01676       3rd Qu.:-0.06113      
 Max.   :0.13019           Max.   : 0.0568186        Max.   : 0.038053         Max.   : 0.19270       Max.   : 0.02747      
 avg-tBodyGyro-mean()-Z avg-tBodyGyroJerk-mean()-X avg-tBodyGyroJerk-mean()-Y avg-tBodyGyroJerk-mean()-Z avg-tBodyAccMag-mean()
 Min.   :-0.07245       Min.   :-0.15721           Min.   :-0.07681           Min.   :-0.092500          Min.   :-0.9865       
 1st Qu.: 0.07475       1st Qu.:-0.10322           1st Qu.:-0.04552           1st Qu.:-0.061725          1st Qu.:-0.9573       
 Median : 0.08512       Median :-0.09868           Median :-0.04112           Median :-0.053430          Median :-0.4829       
 Mean   : 0.08744       Mean   :-0.09606           Mean   :-0.04269           Mean   :-0.054802          Mean   :-0.4973       
 3rd Qu.: 0.10177       3rd Qu.:-0.09110           3rd Qu.:-0.03842           3rd Qu.:-0.048985          3rd Qu.:-0.0919       
 Max.   : 0.17910       Max.   :-0.02209           Max.   :-0.01320           Max.   :-0.006941          Max.   : 0.6446       
 avg-tGravityAccMag-mean() avg-tBodyAccJerkMag-mean() avg-tBodyGyroMag-mean() avg-tBodyGyroJerkMag-mean() avg-fBodyAcc-mean()-X
 Min.   :-0.9865           Min.   :-0.9928            Min.   :-0.9807         Min.   :-0.99732            Min.   :-0.9952      
 1st Qu.:-0.9573           1st Qu.:-0.9807            1st Qu.:-0.9461         1st Qu.:-0.98515            1st Qu.:-0.9787      
 Median :-0.4829           Median :-0.8168            Median :-0.6551         Median :-0.86479            Median :-0.7691      
 Mean   :-0.4973           Mean   :-0.6079            Mean   :-0.5652         Mean   :-0.73637            Mean   :-0.5758      
 3rd Qu.:-0.0919           3rd Qu.:-0.2456            3rd Qu.:-0.2159         3rd Qu.:-0.51186            3rd Qu.:-0.2174      
 Max.   : 0.6446           Max.   : 0.4345            Max.   : 0.4180         Max.   : 0.08758            Max.   : 0.5370      
 avg-fBodyAcc-mean()-Y avg-fBodyAcc-mean()-Z avg-fBodyAcc-meanFreq()-X avg-fBodyAcc-meanFreq()-Y avg-fBodyAcc-meanFreq()-Z
 Min.   :-0.98903      Min.   :-0.9895       Min.   :-0.63591          Min.   :-0.379518         Min.   :-0.52011         
 1st Qu.:-0.95361      1st Qu.:-0.9619       1st Qu.:-0.39165          1st Qu.:-0.081314         1st Qu.:-0.03629         
 Median :-0.59498      Median :-0.7236       Median :-0.25731          Median : 0.007855         Median : 0.06582         
 Mean   :-0.48873      Mean   :-0.6297       Mean   :-0.23227          Mean   : 0.011529         Mean   : 0.04372         
 3rd Qu.:-0.06341      3rd Qu.:-0.3183       3rd Qu.:-0.06105          3rd Qu.: 0.086281         3rd Qu.: 0.17542         
 Max.   : 0.52419      Max.   : 0.2807       Max.   : 0.15912          Max.   : 0.466528         Max.   : 0.40253         
 avg-fBodyAccJerk-mean()-X avg-fBodyAccJerk-mean()-Y avg-fBodyAccJerk-mean()-Z avg-fBodyAccJerk-meanFreq()-X
 Min.   :-0.9946           Min.   :-0.9894           Min.   :-0.9920           Min.   :-0.57604             
 1st Qu.:-0.9828           1st Qu.:-0.9725           1st Qu.:-0.9796           1st Qu.:-0.28966             
 Median :-0.8126           Median :-0.7817           Median :-0.8707           Median :-0.06091             
 Mean   :-0.6139           Mean   :-0.5882           Mean   :-0.7144           Mean   :-0.06910             
 3rd Qu.:-0.2820           3rd Qu.:-0.1963           3rd Qu.:-0.4697           3rd Qu.: 0.17660             
 Max.   : 0.4743           Max.   : 0.2767           Max.   : 0.1578           Max.   : 0.33145             
 avg-fBodyAccJerk-meanFreq()-Y avg-fBodyAccJerk-meanFreq()-Z avg-fBodyGyro-mean()-X avg-fBodyGyro-mean()-Y avg-fBodyGyro-mean()-Z
 Min.   :-0.60197              Min.   :-0.62756              Min.   :-0.9931        Min.   :-0.9940        Min.   :-0.9860       
 1st Qu.:-0.39751              1st Qu.:-0.30867              1st Qu.:-0.9697        1st Qu.:-0.9700        1st Qu.:-0.9624       
 Median :-0.23209              Median :-0.09187              Median :-0.7300        Median :-0.8141        Median :-0.7909       
 Mean   :-0.22810              Mean   :-0.13760              Mean   :-0.6367        Mean   :-0.6767        Mean   :-0.6044       
 3rd Qu.:-0.04721              3rd Qu.: 0.03858              3rd Qu.:-0.3387        3rd Qu.:-0.4458        3rd Qu.:-0.2635       
 Max.   : 0.19568              Max.   : 0.23011              Max.   : 0.4750        Max.   : 0.3288        Max.   : 0.4924       
 avg-fBodyGyro-meanFreq()-X avg-fBodyGyro-meanFreq()-Y avg-fBodyGyro-meanFreq()-Z avg-fBodyAccMag-mean() avg-fBodyAccMag-meanFreq()
 Min.   :-0.395770          Min.   :-0.66681           Min.   :-0.50749           Min.   :-0.9868        Min.   :-0.31234          
 1st Qu.:-0.213363          1st Qu.:-0.29433           1st Qu.:-0.15481           1st Qu.:-0.9560        1st Qu.:-0.01475          
 Median :-0.115527          Median :-0.15794           Median :-0.05081           Median :-0.6703        Median : 0.08132          
 Mean   :-0.104551          Mean   :-0.16741           Mean   :-0.05718           Mean   :-0.5365        Mean   : 0.07613          
 3rd Qu.: 0.002655          3rd Qu.:-0.04269           3rd Qu.: 0.04152           3rd Qu.:-0.1622        3rd Qu.: 0.17436          
 Max.   : 0.249209          Max.   : 0.27314           Max.   : 0.37707           Max.   : 0.5866        Max.   : 0.43585          
 avg-fBodyBodyAccJerkMag-mean() avg-fBodyBodyAccJerkMag-meanFreq() avg-fBodyBodyGyroMag-mean() avg-fBodyBodyGyroMag-meanFreq()
 Min.   :-0.9940                Min.   :-0.12521                   Min.   :-0.9865             Min.   :-0.45664               
 1st Qu.:-0.9770                1st Qu.: 0.04527                   1st Qu.:-0.9616             1st Qu.:-0.16951               
 Median :-0.7940                Median : 0.17198                   Median :-0.7657             Median :-0.05352               
 Mean   :-0.5756                Mean   : 0.16255                   Mean   :-0.6671             Mean   :-0.03603               
 3rd Qu.:-0.1872                3rd Qu.: 0.27593                   3rd Qu.:-0.4087             3rd Qu.: 0.08228               
 Max.   : 0.5384                Max.   : 0.48809                   Max.   : 0.2040             Max.   : 0.40952               
 avg-fBodyBodyGyroJerkMag-mean() avg-fBodyBodyGyroJerkMag-meanFreq()
 Min.   :-0.9976                 Min.   :-0.18292                   
 1st Qu.:-0.9813                 1st Qu.: 0.05423                   
 Median :-0.8779                 Median : 0.11156                   
 Mean   :-0.7564                 Mean   : 0.12592                   
 3rd Qu.:-0.5831                 3rd Qu.: 0.20805                   
 Max.   : 0.1466                 Max.   : 0.42630    