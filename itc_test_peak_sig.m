%{
This script compares the ITC at 4, 8, 12 and 16 Hz with each of their 18 
neighbouring bins, using the Wilcoxon signed rank test.

(c) Oana Cucu, October 2019. oana.cucu@bristol.ac.uk
%}

clearvars;
load('Itc_for_comp_bins.mat');

n=size(Itc4_comp,2);

p4=zeros(18,1);
p8=zeros(18,1);
p12=zeros(18,1);
p16=zeros(18,1);


for i=1:n
    p=signrank(mean(Itc4),Itc4_comp(:,i)');
    p4(i)=p;
    p=signrank(mean(Itc8),Itc8_comp(:,i)');
    p8(i)=p;
    p=signrank(mean(Itc12),Itc12_comp(:,i)');
    p12(i)=p;
    p=signrank(mean(Itc16),Itc16_comp(:,i)');
    p16(i)=p;
end

itc4_subj=mean(Itc4)';
itc8_subj=mean(Itc8)';
itc12_subj=mean(Itc12)';
itc16_subj=mean(Itc16)';
meanitc4=mean(mean(Itc4));
meanitc4_comp=mean(Itc4_comp);
meanitc8_comp=mean(Itc8_comp);
meanitc12_comp=mean(Itc12_comp);
meanitc16_comp=mean(Itc16_comp);
meanitc8=mean(mean(Itc8,2));
meanitc12=mean(mean(Itc12,2));
meanitc16=mean(mean(Itc16,2));
meanitc=[meanitc4_comp(1:19),meanitc4,meanitc4_comp(20:38),meanitc8_comp(2:19),meanitc8,meanitc8_comp(20:38),meanitc12_comp(2:19),meanitc12,meanitc12_comp(20:38),meanitc16_comp(2:19),meanitc16,meanitc16_comp(20:38)];

itc_all=[Itc4_comp(:,1:19),itc4_subj,Itc4_comp(:,20:38),Itc8_comp(:,2:19),itc8_subj,Itc8_comp(:,20:38),Itc12_comp(:,2:19),itc12_subj,Itc12_comp(:,20:38),Itc16_comp(:,2:19),itc16_subj,Itc16_comp(:,20:38)];
%}

n=9500;
Fs=1000;
freq=0:Fs/n:Fs/2;
fin=find(freq==18);
start=find(freq==2);
freq=freq(start:fin);

h=zeros(1,17);
figure;
hold on;
for i=1:size(itc_all,1)
    h(i)=plot(freq,itc_all(i,:),'Color','b','DisplayName','individual subjects');
end
hold on;
h(17)=plot(freq,meanitc,'k','LineWidth',3,'DisplayName','subject average');
xlabel('Frequency (Hz)');
ylabel('Mean ITC');
title('ITC avearge over channels, subjects and conditions');
legend(h(1,[1,17]));
saveas(gcf,'mean_itc_subj.png');