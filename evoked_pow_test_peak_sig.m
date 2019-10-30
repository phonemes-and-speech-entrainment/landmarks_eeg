clearvars;
load('Pow_for_comp_bins.mat');

%compare pow at each frequency with neighbouring bins

n=size(pow4_comp,2);

p4=zeros(18,1);
p8=zeros(18,1);
p12=zeros(18,1);
p16=zeros(18,1);


for i=1:n
    [~,p]=ttest(mean(pow4),pow4_comp(:,i)');
    p4(i)=p;
    [~,p]=ttest(mean(pow8),pow8_comp(:,i)');
    p8(i)=p;
    [~,p]=ttest(mean(pow12),pow12_comp(:,i)');
    p12(i)=p;
    [~,p]=ttest(mean(pow16),pow16_comp(:,i)');
    p16(i)=p;
end

pow4_subj=mean(pow4)';
pow8_subj=mean(pow8)';
pow12_subj=mean(pow12)';
pow16_subj=mean(pow16)';
meanpow4=mean(mean(pow4));
meanpow4_comp=mean(pow4_comp);
meanpow8_comp=mean(pow8_comp);
meanpow12_comp=mean(pow12_comp);
meanpow16_comp=mean(pow16_comp);
meanpow8=mean(mean(pow8,2));
meanpow12=mean(mean(pow12,2));
meanpow16=mean(mean(pow16,2));
meanpow=[meanpow4_comp(1:19),meanpow4,meanpow4_comp(20:38),meanpow8_comp(2:19),meanpow8,meanpow8_comp(20:38),meanpow12_comp(2:19),meanpow12,meanpow12_comp(20:38),meanpow16_comp(2:19),meanpow16,meanpow16_comp(20:38)];

pow_all=[pow4_comp(:,1:19),pow4_subj,pow4_comp(:,20:38),pow8_comp(:,2:19),pow8_subj,pow8_comp(:,20:38),pow12_comp(:,2:19),pow12_subj,pow12_comp(:,20:38),pow16_comp(:,2:19),pow16_subj,pow16_comp(:,20:38)];

n=9500;
Fs=1000;
freq=0:Fs/n:Fs/2;
fin=find(freq==18);
start=find(freq==2);
freq=freq(start:fin);

h=zeros(1,17);
figure;
hold on;
for i=1:size(pow_all,1)
    h(i)=plot(freq,pow_all(i,:),'Color','b','DisplayName','individual subjects');
end
hold on;
h(17)=plot(freq,meanpow,'k','LineWidth',3,'DisplayName','subject average');
xlabel('Frequency (Hz)');
ylabel('Mean evoked power');
title('Evoked power avearged over channels, subjects and conditions');
legend(h(1,[1,17]));
saveas(gcf,'mean_pow_subj.png');