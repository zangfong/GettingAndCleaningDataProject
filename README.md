GettingAndCleaningDataProject
=============================

This is a repo of Getting And Cleaning Data, Course Project

This repo contains 3 files: 
README.md
run_analysis.R
codebook.md
cleandata.txt


How to run this R script
Firstly, we should install the package reshape2;

Secondly, we should set working directory to wherever this folder "UCI HAR Dataset" is, then we can access the following files while running this R script.

Thirdly, the clean data set "cleandata.txt" shall be created in the same path where this R script is placed.


Here is the treelist on my computer based on OS Win 7 

G:\R\DATA\GETTING_DATA_PROJECT
│ cleandata.txt
│ run_analysis.R
│
└─UCI HAR Dataset
    │  activity_labels.txt
    │  features.txt
    │  features_info.txt
    │  README.txt
    │
    ├─test
    │  │  subject_test.txt
    │  │  X_test.txt
    │  │  y_test.txt
    │  │
    │  └─Inertial Signals
    │          body_acc_x_test.txt
    │          body_acc_y_test.txt
    │          body_acc_z_test.txt
    │          body_gyro_x_test.txt
    │          body_gyro_y_test.txt
    │          body_gyro_z_test.txt
    │          total_acc_x_test.txt
    │          total_acc_y_test.txt
    │          total_acc_z_test.txt
    │
    └─train
        │  subject_train.txt
        │  X_train.txt
        │  y_train.txt
        │
        └─Inertial Signals
                body_acc_x_train.txt
                body_acc_y_train.txt
                body_acc_z_train.txt
                body_gyro_x_train.txt
                body_gyro_y_train.txt
                body_gyro_z_train.txt
                total_acc_x_train.txt
                total_acc_y_train.txt
                total_acc_z_train.txt
