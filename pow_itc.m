%{
This script computes evoked and induced power, as well as the  Inter-trial 
phase coherence of EEG data which were pre-processed (low-pass filtered
50 Hz, re-referenced to average) in EEGLAB. The data were also sorted and
ordered by condition using the 'sort_by_events' script.

(c) Oana Cucu, October 2019. oana.cucu@bristol.ac.uk
%}

clearvars;
addpath('/Users/gigel/Documents/Speech EEG/Code /Entrainment_analysis/Experiment 2'); %add path of remove_noise.m function

%load data
load('Data_16_subjects.mat');

%remove first 500 ms
Data=Datanew(:,:,501:end,:,:);
%Data = Datanew;

%apply hanning taper and compute FFT of each 
h=waitbar(0,'Please wait...');

Data_fft=zeros(size(Data));
for i=1:size(Data,1)                 %for each subject
    for j=1:size(Data,2)             %channel
        for k=1:size(Data,4)         %stimulus stream
            for l=1:size(Data,5)     %repetition of each stream
            waitbar(i/size(Data,1))
            temp=hann(size(Data,3)).*squeeze(Data(i,j,:,k,l));
            Data_fft(i,j,:,k,l)=fft(temp);
            end
        end
    end
end
close(h);  

Data_fft=Data_fft.*sqrt(2 ./n);
Data_fft=Data_fft(:,:,3:a,:,:);


%load('Data_fft_16subj.mat');

%create frequency vector from 1 Hz to 20 Hz
Fs=1000;
n=9500;
freq = 0:Fs/n:Fs/2;
a=find(freq==20);
freq=freq(3:a);

%compute ITC
pow2=Data_fft./abs(Data_fft);

phase=angle(pow2);

itc=sum(pow2,5);
itc=(abs(itc)/10).^2;

meanitc=squeeze(nanmean(nanmean(itc,2)));

%compute evoked power
Data_mean=nanmean(Data_fft,5);
evoked_pow=abs(Data_mean).^2;
mean_evoked=squeeze(nanmean(nanmean(evoked_pow,2)));

%compute induced power
total_pow = abs(Data_fft).^2;
total_pow = mean(total_pow,5);
mean_total = squeeze(nanmean(nanmean(total_pow,2)));

evoked_without_noise=zeros(size(evoked_pow));
total_without_noise=zeros(size(total_pow));

l=size(evoked_pow,1);
m=size(evoked_pow,2);
p=size(evoked_pow,4);

%remove 1/f noise from induced and evoked power
for i=1:l
    for j=1:m
        for k=1:p
            temp1=squeeze(evoked_pow(i,j,:,k));
            temp2=remove_noise(temp1,freq');
            temp3=squeeze(total_pow(i,j,:,k));
            temp4=remove_noise(temp3,freq');
            evoked_without_noise(i,j,:,k)=temp2;
            total_without_noise(i,j,:,k)=temp4;
        end
    end
end


meanevoked=squeeze(nanmean(nanmean(evoked_without_noise,2)));


%{
figure;
plot(freq,meanitc(:,1));
hold on;
plot(freq,meanitc(:,4));
hold on;
plot(freq,meanitc(:,7));
hold on;
plot(freq,meanitc(:,10));
hold on;
plot(freq,meanitc(:,13));
hold on;
plot(freq,meanitc(:,14));
legend('disc-da-0','disc-ta-0','white-da-0','white-ta-0','da','ta');
title('ITC 0 ms');
xlabel('Frequency (Hz)')
ylabel('ITC');
%saveas(gcf,'ITC_0_ms.jpg');



figure;
plot(freq,meanitc(:,2));
hold on;
plot(freq,meanitc(:,5));
hold on;
plot(freq,meanitc(:,8));
hold on;
plot(freq,meanitc(:,11));
hold on;
plot(freq,meanitc(:,13));
hold on;
plot(freq,meanitc(:,14));
legend('disc-da-cv','disc-ta-cv','white-da-cv','white-ta-cv','da','ta');
title('ITC CV');
xlabel('Frequency (Hz)')
ylabel('ITC');
%saveas(gcf,'ITC_CV.jpg');

figure;
plot(freq,meanitc(:,3));
hold on;
plot(freq,meanitc(:,6));
hold on;
plot(freq,meanitc(:,9));
hold on;
plot(freq,meanitc(:,12));
hold on;
plot(freq,meanitc(:,13));
hold on;
plot(freq,meanitc(:,14));
legend('disc-da-maxamp','disc-ta-maxamp','white-da-maxamp','white-ta-maxamp','da','ta');
title('ITC Max Amp');
xlabel('Frequency (Hz)')
ylabel('ITC');
%saveas(gcf,'ITC_max_amp.jpg');

figure;
plot(freq,meanevoked(:,1));
hold on;
plot(freq,meanevoked(:,4));
hold on;
plot(freq,meanevoked(:,7));
hold on;
plot(freq,meanevoked(:,10));
hold on;
plot(freq,meanevoked(:,13));
hold on;
plot(freq,meanevoked(:,14));
legend('disc-da-0','disc-ta-0','white-da-0','white-ta-0','da','ta');
title('Evoked power 0 ms');
xlabel('Frequency (Hz)')
ylabel('ITC');
%saveas(gcf,'Power_0_ms.jpg');

figure;
plot(freq(2:end),meanevoked(2:end,2));
hold on;
plot(freq(2:end),meanevoked(2:end,5));
hold on;
plot(freq(2:end),meanevoked(2:end,8));
hold on;
plot(freq(2:end),meanevoked(2:end,11));
hold on;
plot(freq(2:end),meanevoked(2:end,13));
hold on;
plot(freq(2:end),meanevoked(2:end,14));
legend('disc-da-cv','disc-ta-cv','white-da-cv','white-ta-cv','da','ta');
title('Evoked power CV');
xlabel('Frequency (Hz)')
ylabel('ITC');
%saveas(gcf,'Power_CV.jpg');

figure;
plot(freq,meanevoked(:,3));
hold on;
plot(freq,meanevoked(:,6));
hold on;
plot(freq,meanevoked(:,9));
hold on;
plot(freq,meanevoked(:,12));
hold on;
plot(freq,meanevoked(:,13));
hold on;
plot(freq,meanevoked(:,14));
legend('disc-da-maxamp','disc-ta-maxamp','white-da-maxamp','white-ta-maxamp','da','ta');
title('Evoked power Max Amp');
xlabel('Frequency (Hz)')
ylabel('ITC');
%saveas(gcf,'Power_max_amp.jpg');

%%
meanchanitc=squeeze(mean(itc,2));

%{
figure;
plot(freq,meanchanitc(4,:,13));
hold on;
plot(freq,meanchanitc(4,:,14));
legend('da','ta');
%}

meanchanpow=squeeze(mean(evoked_without_noise,2));
%}

%% plot average ITC and Evoked Power but also for individual subjects

itc_all=squeeze(mean(mean(itc,4),2));
evoked_all=squeeze(mean(mean(evoked_without_noise,4),2));

mean_itc_all=mean(itc_all);
mean_evoked_all=mean(evoked_all);

f=find(freq==18);

figure('Renderer', 'painters', 'Position', [10 10 600 450]);

subplot(2,1,1);

h1=zeros(1,16);
%figure('Renderer', 'painters', 'Position', [10 10 450 300]);
hold on;
for i=1:size(itc_all,1)
    h1(i)=plot(freq(1:f),itc_all(i,1:f),'Color','b','DisplayName','individual subjects');
end
hold on;
h1(26)=plot(freq(1:f),mean_itc_all(1:f),'k','LineWidth',3,'DisplayName','subject average');
xlabel('Frequency (Hz)','FontWeight','bold');
ylabel('Mean ITC','FontWeight','bold');
%title('ITC averaged over channels and conditions','FontSize',14);
title('ITC','FontSize',14);
legend(h1(1,[1,26]),'Position',[0.77 0.96 0.01 0.02]);
xlim([1 18])
set(gca,'Units','normalized')
titleHandle = get( gca ,'Title' );
pos  = get( titleHandle , 'position' );
pos1 = pos + [-8 0 0];
set( titleHandle , 'position' , pos1 );
set(gca,'linewidth',1);
box on

subplot(2,1,2);

h2=zeros(1,16);
hold on;
for i=1:size(evoked_all,1)
    h2(i)=plot(freq(1:f),evoked_all(i,1:f),'Color','b','DisplayName','individual subjects');
end
hold on;
h2(26)=plot(freq(1:f),mean_evoked_all(1:f),'k','LineWidth',3,'DisplayName','subject average');
xlabel('Frequency (Hz)','FontWeight','bold');
ylabel('Mean Evoked Power','FontWeight','bold');
title('Evoked Power','FontSize',14);
xlim([1 18])
set(gca,'Units','normalized')
titleHandle = get( gca ,'Title' );
pos  = get( titleHandle , 'position' );
pos2 = pos + [-6.7 0. 0];
set( titleHandle , 'position' , pos2 );
set(gca,'linewidth',1);
box on
