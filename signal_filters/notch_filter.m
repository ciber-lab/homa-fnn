clc; 
clear all;
close all;
ecg= load('D:\CIBER Lab\HOMA\Data Collection_Fall 2019\Analysis_V3\OD\Filtered Signals\ECG\HOMA_P001_OD_ECG_Task1.csv');
f_s=1024;
N=length(ecg);
t=[0:N-1]/f_s; %time period(total sample/Fs )

w=50/(1024/2);
bw=w;
[num,den]=iirnotch(w,bw); % notch filter implementation 
ecg_notch=filter(num,den,ecg);

N1=length(ecg_notch);

t1=[0:N1-1]/f_s;

% (2-a) Use Subplot to show both signals together(original signal on the.
% Top(blue colour) and  bottom is filtered Signal after notch implementation(red colour).

figure, plot(t,ecg); title('Notch Filtering (Fpass=50 Hz)')% study useage of subplot under help section              
xlabel('Time (sec.)')
ylabel('Amplitude')
hold on
plot(t1,ecg_notch,'color', [0.9100    0.4100    0.1700]);             
legend('Original', 'Flitered')
hold off

% Plot both signals one over other with Original signal in red and.
% Filtered outupt in green and display only 0 to 201 samples or time frame of 0 to 0.804
figure, plot(t(1:10240),ecg(1:10240),'b'); title('ECG Signal Data plotting for 0 to 10 sec. time frame')             
xlabel('Time (sec.)')
ylabel('Amplitude')
hold on
plot(t1(1:10240),ecg_notch(1:10240),'color', [0.9100    0.4100    0.1700]);             
legend('Original','Notch Flitered')
hold off