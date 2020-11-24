%Find percentage of missing values, Replace missing values
clear;
clc;

base_folder =  "D:\CIBER Lab\HOMA\Data Collection_Fall 2019\Analysis_V3\OD\Filtered Signals\EDA"
n = 25;


for count= 1%1:n
    disp(count)
              
%Task01    
    if(count<10)
        task1_file_path = sprintf("%s/HOMA_P00%d_OD_EDA_Task1.csv", base_folder, count);
    else
        task1_file_path = sprintf("%s/HOMA_P0%d_OD_EDA_Task1.csv", base_folder, count);
    end
        disp(task1_file_path)
        TASK1 = csvread(task1_file_path,0,0);
        TASK1_f=highpass(TASK1, 0.05, 4);

     csvwrite(task1_file_path,TASK1_f) %Replace main file
     
% Task02    
    if(count<10)
        task2_file_path = sprintf("%s/HOMA_P00%d_OD_EDA_Task2.csv", base_folder, count);
    else
        task2_file_path = sprintf("%s/HOMA_P0%d_OD_EDA_Task2.csv", base_folder, count);
    end
        disp(task2_file_path)
        TASK2 = csvread(task2_file_path,0,0);
        TASK2_f=highpass(TASK2, 0.05, 4);

     csvwrite(task2_file_path,TASK2_f) %Replace main file
end
