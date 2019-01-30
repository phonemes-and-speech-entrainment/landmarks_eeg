clearvars;
addpath('/Users/gigel/Documents/Speech EEG/Code /Entrainment_analysis/Experiment 2');
load('Data_16_subjects.mat');

Data=Datanew(:,:,501:end,:,:);
%Data = Datanew;

h=waitbar(0,'Please wait...');

Data_fft=zeros(size(Data));
for i=1:size(Data,1)
    for j=1:size(Data,2)
        for k=1:size(Data,4)
            for l=1:size(Data,5)
            waitbar(i/size(Data,1))
            temp=hann(size(Data,3)).*squeeze(Data(i,j,:,k,l));
            Data_fft(i,j,:,k,l)=fft(temp);
            end
        end
    end
end
close(h);

Fs=1000;
n=9500;
freq = 0:Fs/n:Fs/2;
a=find(freq==20);
freq=freq(3:a);  

Data_fft=Data_fft.*sqrt(2 ./n);
Data_fft=Data_fft(:,:,3:a,:,:);

pow2=Data_fft./abs(Data_fft);

itc=sum(pow2,5);
itc=(abs(itc)/10).^2;

meanitc=squeeze(nanmean(nanmean(itc,2)));

Data_mean=nanmean(Data_fft,5);
evoked_pow=abs(Data_mean).^2;
mean_evoked=squeeze(nanmean(nanmean(evoked_pow,2)));


total_pow = abs(Data_fft).^2;
total_pow = mean(total_pow,5);
mean_total = squeeze(nanmean(nanmean(total_pow,2)));

evoked_without_noise=zeros(size(evoked_pow));
total_without_noise=zeros(size(total_pow));

l=size(evoked_pow,1);
m=size(evoked_pow,2);
p=size(evoked_pow,4);

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
saveas(gcf,'ITC_0_ms.jpg');

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
saveas(gcf,'ITC_CV.jpg');

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
saveas(gcf,'ITC_max_amp.jpg');

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
saveas(gcf,'Power_0_ms.jpg');

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
saveas(gcf,'Power_CV.jpg');

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
saveas(gcf,'Power_max_amp.jpg');

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
