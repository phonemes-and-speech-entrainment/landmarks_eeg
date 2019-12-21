clearvars;
load('itc_and_pow_for_stats_16subj.mat');

n=9500;
Fs=1000;
freq=0:Fs/n:Fs/2;
fin=find(freq==20);
freq=freq(3:fin);

a=find(freq==4);
b=find(freq==8);
c=find(freq==12);
d=find(freq==16);

Itc4=squeeze(itc(:,:,a,:));
Itc8=squeeze(itc(:,:,b,:));
Itc12=squeeze(itc(:,:,c,:));
Itc16=squeeze(itc(:,:,d,:));

Itc4=squeeze(mean(Itc4,2));
Itc4=Itc4';
Itc8=squeeze(mean(Itc8,2));
Itc8=Itc8';
Itc12=squeeze(mean(Itc12,2));
Itc12=Itc12';
Itc16=squeeze(mean(Itc16,2));
Itc16=Itc16';

%bins
Itc4_comp=itc(:,:,[(a-19):(a-1),(a+1):(a+19)],:);
Itc4_comp=squeeze(mean(Itc4_comp,2));
Itc4_comp=mean(Itc4_comp,3);

Itc8_comp=itc(:,:,[(b-19):(b-1),(b+1):(b+19)],:);
Itc8_comp=squeeze(mean(Itc8_comp,2));
Itc8_comp=mean(Itc8_comp,3);

Itc12_comp=itc(:,:,[(c-19):(c-1),(c+1):(c+19)],:);
Itc12_comp=squeeze(mean(Itc12_comp,2));
Itc12_comp=mean(Itc12_comp,3);

Itc16_comp=itc(:,:,[(d-19):(d-1),(d+1):(d+19)],:);
Itc16_comp=squeeze(mean(Itc16_comp,2));
Itc16_comp=mean(Itc16_comp,3);

%power

pow4=squeeze(evoked_without_noise(:,:,a,:));
pow8=squeeze(evoked_without_noise(:,:,b,:));
pow12=squeeze(evoked_without_noise(:,:,c,:));
pow16=squeeze(evoked_without_noise(:,:,d,:));

pow4=squeeze(mean(pow4,2));
pow4=pow4';
pow8=squeeze(mean(pow8,2));
pow8=pow8';
pow12=squeeze(mean(pow12,2));
pow12=pow12';
pow16=squeeze(mean(pow16,2));
pow16=pow16';

%bins
pow4_comp=evoked_without_noise(:,:,[(a-19):(a-1),(a+1):(a+19)],:);
pow4_comp=squeeze(mean(pow4_comp,2));
pow4_comp=mean(pow4_comp,3);

pow8_comp=evoked_without_noise(:,:,[(b-19):(b-1),(b+1):(b+19)],:);
pow8_comp=squeeze(mean(pow8_comp,2));
pow8_comp=mean(pow8_comp,3);

pow12_comp=evoked_without_noise(:,:,[(c-19):(c-1),(c+1):(c+19)],:);
pow12_comp=squeeze(mean(pow12_comp,2));
pow12_comp=mean(pow12_comp,3);

pow16_comp=evoked_without_noise(:,:,[(d-19):(d-1),(d+1):(d+19)],:);
pow16_comp=squeeze(mean(pow16_comp,2));
pow16_comp=mean(pow16_comp,3);

save('Itc_for_comp_bins.mat','Itc4','Itc8','Itc12','Itc16',...
    'Itc4_comp','Itc8_comp','Itc12_comp','Itc16_comp');

save('Pow_for_comp_bins.mat','pow4','pow8','pow12','pow16',...
    'pow4_comp','pow8_comp','pow12_comp','pow16_comp');


meanitc=squeeze(mean(mean(mean(itc,4),2)));

plot(meanitc);
