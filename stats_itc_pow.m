clear;
load('itc_and_pow_for_stats_16subj.mat');

N=size(meanchanitc,1);
s=size(meanchanpow,3);

Fs=1000;
n=9500;
freq = 0:Fs/n:Fs/2;
a=find(freq==20);
freq=freq(3:a); 

b=find(freq==4);
c=find(freq==8);
d=find(freq==12);
e=find(freq==16);


meanitc4=meanitc(b,:);
meanitc8=meanitc(c,:);
meanitc12=meanitc(d,:);
meanitc16=meanitc(e,:);

meanpow4=meanevoked(b,:);
meanpow8=meanevoked(c,:);
meanpow12=meanevoked(d,:);
meanpow16=meanevoked(e,:);

itc4=squeeze(meanchanitc(:,b,:));
itc8=squeeze(meanchanitc(:,c,:));
itc12=squeeze(meanchanitc(:,d,:));
itc16=squeeze(meanchanitc(:,e,:));

pow4=squeeze(meanchanpow(:,b,:));
pow8=squeeze(meanchanpow(:,c,:));
pow12=squeeze(meanchanpow(:,d,:));
pow16=squeeze(meanchanpow(:,e,:));



itc_comb1=itc4+itc8;
itc_comb2=itc4+itc8+itc12;
itc_comb3=itc4+itc8+itc12+itc16;


pow_comb1=pow4+pow8;
pow_comb2=pow4+pow8+pow12;
pow_comb3=pow4+pow8+pow12+pow16;


%save('itc_comb1_for_stats','itc_comb1');
%save('pow_comb1_for_stats','pow_comb1');


%save('itc_comb2_for_stats','itc_comb2');
%save('pow_comb2_for_stats','pow_comb2');

%save('itc_comb3_for_stats','itc_comb3');
%save('pow_comb3_for_stats','pow_comb3');

itc4_2=itc4(:,1:12);
itc_comb1_2=itc_comb1(:,1:12);
itc_comb2_2=itc_comb2(:,1:12);
itc_comb3_2=itc_comb3(:,1:12);

pow4_2=pow4(:,1:12);
pow_comb1_2=pow_comb1(:,1:12);
pow_comb2_2=pow_comb2(:,1:12);
pow_comb3_2=pow_comb3(:,1:12);





















             

             













