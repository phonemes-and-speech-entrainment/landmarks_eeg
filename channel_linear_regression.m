clearvars;
load('Data_fft_16subj.mat');
load('channel_labels.mat');

pow2=Data_fft./abs(Data_fft);

itc=sum(pow2,5);
itc=(abs(itc)/10).^2;

Fs=1000;
n=9500;
freq = 0:Fs/n:Fs/2;
a=find(freq==4);

itc4=itc(:,:,a,:);
itc4_chan=squeeze(mean(itc4,4));
coeff=pca(itc4_chan);

itc4_chan=squeeze(mean(itc4_chan));
channels=horzcat(labels,num2cell(itc4_chan'));


