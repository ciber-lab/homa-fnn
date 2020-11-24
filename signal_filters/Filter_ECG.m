%Find percentage of missing values, Replace missing values
clear;
clc;

base_folder =  "D:\CIBER Lab\HOMA\Data Collection_Fall 2019\Analysis_V3\OD\Filtered Signals\ECG"
n = 25;

for count=1:n
    disp(count)
              
%Task01    
    if(count<10)
        task1_file_path = sprintf("%s/HOMA_P00%d_OD_ECG_Task1.csv", base_folder, count);
    else
        task1_file_path = sprintf("%s/HOMA_P0%d_OD_ECG_Task1.csv", base_folder, count);
    end
        disp(task1_file_path)
        TASK1 = csvread(task1_file_path,0,0);
        TASK1_f = bandpass(TASK1, [0.5 100],1024);
        
        %Notch
        f_s=1024;
        N=length(TASK1_f);
        t=[0:N-1]/f_s; %time period(total sample/Fs )

        w=50/(1024/2);
        bw=w;
        [num,den]=iirnotch(w,bw); % notch filter implementation 
        ecg_notch1=filter(num,den,TASK1_f);
%         N1=length(ecg_notch);
%         t1=[0:N1-1]/f_s;

     csvwrite(task1_file_path,ecg_notch1) %Replace main file
     
% Task02
    if(count<10)
        task2_file_path = sprintf("%s/HOMA_P00%d_OD_ECG_Task2.csv", base_folder, count);
    else
        task2_file_path = sprintf("%s/HOMA_P0%d_OD_ECG_Task2.csv", base_folder, count);
    end
        disp(task2_file_path)
        TASK2 = csvread(task2_file_path,0,0);
        TASK2_f = bandpass(TASK2, [0.5 100],1024);
        
        %Notch
        f_s=1024;
        N=length(TASK2_f);
        t=[0:N-1]/f_s; %time period(total sample/Fs )

        w=50/(1024/2);
        bw=w;
        [num,den]=iirnotch(w,bw); % notch filter implementation 
        ecg_notch2=filter(num,den,TASK2_f);
%         N1=length(ecg_notch);
%         t1=[0:N1-1]/f_s;
        
%         %Figure before and after all filters.
%         figure, plot(t,TASK2); title('Notch Filtering (Fpass=50 Hz)')% study useage of subplot under help section              
%         xlabel('Time (sec.)')
%         ylabel('Amplitude')
%         hold on
%         plot(t1,ecg_notch,'color', [0.9100    0.4100    0.1700]);             
%         legend('Original', 'Flitered')
%         hold off
%         %Figure before and after all filters for 1-10s window.
%         figure, plot(t(1:10240),TASK2(1:10240),'b'); title('ECG Signal Data plotting for 0 to 10 sec. time frame')             
%         xlabel('Time (sec.)')
%         ylabel('Amplitude')
%         hold on
%         plot(t1(1:10240),ecg_notch(1:10240),'color', [0.9100    0.4100    0.1700]);             
%         legend('Original','Notch Flitered')
%         hold off

     csvwrite(task2_file_path,ecg_notch2) %Replace main file
end
