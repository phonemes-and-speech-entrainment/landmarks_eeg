clc;clear;close all;
load('itc4_for_stats.mat');

%itc with control groups

%difference between all da and all ta groups

fprintf('\nDifference between all da and all ta groups\n');

itc4_da=mean(itc4(:,[1 2 3 7 8 9 13]),2);
itc4_ta=mean(itc4(:,[4 5 6 10 11 12 14]),2);

[p1,h]=signrank(itc4_da,itc4_ta);

fprintf('The p-value of the t-test between all da and all ta groups is %f\n',p1);

%difference between all da_white and ta_white groups
fprintf('\nDifference between all da_white and ta_white groups\n');

itc4_da_white=mean(itc4(:,7:9),2);
itc4_ta_white=mean(itc4(:,10:12),2);

[p2,h]=signrank(itc4_da_white,itc4_ta_white);

fprintf('The p-value of the t-test between da_white and ta_white groups is %f\n',p2);

%difference between all da_disc and ta_disc groups
fprintf('\nDifference between all da_disc and ta_disc groups\n');

itc4_da_disc=mean(itc4(:,1:3),2);
itc4_ta_disc=mean(itc4(:,4:6),2);

[p3,h]=signrank(itc4_da_disc,itc4_ta_disc);

fprintf('The p-value of the t-test between da_disc and ta_disc groups is %f\n',p3);

%difference between all da_onset and ta_onset groups
fprintf('\nDifference between all da_onset and ta_onset groups\n');

itc4_da_onset=mean(itc4(:,[1,7]),2);
itc4_ta_onset=mean(itc4(:,[4 10]),2);

[p4,h]=signrank(itc4_da_onset,itc4_ta_onset);

fprintf('The p-value of the t-test between da_onset and ta_onset groups is %f\n',p4);

%difference between all da_cv and ta_cv groups
fprintf('\nDifference between all da_cv and ta_cv groups\n');

itc4_da_cv=mean(itc4(:,[2,8]),2);
itc4_ta_cv=mean(itc4(:,[5 11]),2);

[p5,h]=signrank(itc4_da_cv,itc4_ta_cv);  %marginally significant, da>ta
fprintf('The p-value of the t-test between da_cv and ta_cv groups is %f\n',p5);

%difference between all da_maxamp and ta_maxamp groups
fprintf('\nDifference between all da_maxamp and ta_maxamp groups\n');

itc4_da_max=mean(itc4(:,[3,9]),2);
itc4_ta_max=mean(itc4(:,[6 12]),2);

[p6,h]=signrank(itc4_da_max,itc4_ta_max);
fprintf('The p-value of the t-test between da_maxamp and ta_maxamp groups is %f\n',p6);


%effect of the type of noise vs control

fprintf('\nEffect of the type of noise vs control\n');

groups_1={'disc','white','control'};

itc4_disc=mean(itc4(:,1:6),2);
itc4_white=mean(itc4(:,7:12),2);
itc4_cont=mean(itc4(:,[13 14]),2);

itc4_1=[itc4_disc,itc4_white,itc4_cont];

p7=anova1(itc4_1,groups_1);

fprintf('The p-value of the one-way anova between disc, white noise and control groups is %f\n',p7);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwise comparisons of disc, white and control groups is %f\n',expected_p);

[p,h]=signrank(itc4_disc,itc4_white);

fprintf('The p-value of the t-test between disc and white noise groups is %f\n',p);

[p,h]=signrank(itc4_disc,itc4_cont);

fprintf('The p-value of the t-test between disc and control groups is %f\n',p);

[p,h]=signrank(itc4_white,itc4_cont);

fprintf('The p-value of the t-test between white and control groups is %f\n',p);

%difference between all onset, cv, maxamp and control groups

fprintf('\nDifference between onset, cv, maxamp and control groups\n');

itc4_0=mean(itc4(:,[1 4 7 10]),2);
itc4_cv=mean(itc4(:,[2 5 8 11]),2);
itc4_maxmp=mean(itc4(:,[3 6 9 12]),2);

itc4_loc=[itc4_0,itc4_cv,itc4_maxmp,itc4_cont];

groups2={'onset','cv','maxamp','control'};

p8=anova1(itc4_loc,groups2);

fprintf('The p-value of the one-way anova between onset, cv, maxamp and control groups is %f\n',p8);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwise comparisons of onset, cv, maxamp and control groups is %f\n',expected_p);

[p,h]=signrank(itc4_0,itc4_cv);

fprintf('The p-value of the t-test between onset and cv groups is %f\n',p);

[p,h]=signrank(itc4_0,itc4_maxmp);  %this is sig, onset>maxamp

fprintf('The p-value of the t-test between onset and maxamp groups is %f\n',p);

[p,h]=signrank(itc4_0,itc4_cont);

fprintf('The p-value of the t-test between onset and control groups is %f\n',p);

[p,h]=signrank(itc4_cv,itc4_maxmp);

fprintf('The p-value of the t-test between cv and maxamp groups is %f\n',p);

[p,h]=signrank(itc4_cv,itc4_cont);

fprintf('The p-value of the t-test between cv and control groups is %f\n',p);

[p,h]=signrank(itc4_maxmp,itc4_cont);

fprintf('The p-value of the t-test between maxamp and control groups is %f\n',p);

%Effect of noise at onset
fprintf('\nEffect of noise at onset\n');

itc_disc_onset=mean(itc4(:,[1,4]),2);
itc_white_onset=mean(itc4(:,[7,10]),2);
itc_control=mean(itc4(:,13:14),2);

groups_onset={'disc onset','white onset', 'control'};

p9=anova1([itc_disc_onset,itc_white_onset,itc_control],groups_onset);

fprintf('The p-value of the one-way anova between disc onset, white onset and control groups is %f\n',p9);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwise comparisons of disc onset, white onset and control groups is %f\n',expected_p);

[p,h]=signrank(itc_disc_onset,itc_white_onset);

fprintf('The p-value of the t-test between disc_onset and white_onset groups is %f\n',p);

[p,h]=signrank(itc_disc_onset,itc_control);

fprintf('The p-value of the t-test between disc_onset and control groups is %f\n',p);

[p,h]=signrank(itc_white_onset,itc_control);

fprintf('The p-value of the t-test between white_onset and control groups is %f\n',p);

%Effect of noise at cv
fprintf('\nEffect of noise at cv\n');

itc_disc_cv=mean(itc4(:,[2,5]),2);
itc_white_cv=mean(itc4(:,[8,11]),2);

groups_cv={'disc cv','white cv', 'control'};

p10=anova1([itc_disc_cv,itc_white_cv,itc_control],groups_cv);

fprintf('The p-value of the one-way anova between disc cv, white cv and control groups is %f\n',p10);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwise comparisons of disc cv, white cv and control groups is %f\n',expected_p);

[p,h]=signrank(itc_disc_cv,itc_white_cv);   %marginally significant, disc_cv>white_cv (would be significant without control group, p=.02)

fprintf('The p-value of the t-test between disc_cv and white_cv groups is %f\n',p);

[p,h]=signrank(itc_disc_cv,itc_control);    %marginally significant, disc_cv>control

fprintf('The p-value of the t-test between disc_cv and control groups is %f\n',p);

[p,h]=signrank(itc_white_cv,itc_control);  

fprintf('The p-value of the t-test between white_cv and control groups is %f\n',p);

%Effect of noise at maxamp
fprintf('\nEffect of noise at maxamp\n');

itc_disc_max=mean(itc4(:,[3,6]),2);
itc_white_max=mean(itc4(:,[9,12]),2);

groups_max={'disc maxamp','white maxamp', 'control'};

p11=anova1([itc_disc_max,itc_white_max,itc_control],groups_max);

fprintf('The p-value of the one-way anova between disc maxamp, white maxamp and control groups is %f\n',p11);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwise comparisons of disc maxamp, white maxamp and control groups is %f\n',expected_p);

[p,h]=signrank(itc_disc_max,itc_white_max);

fprintf('The p-value of the t-test between disc_maxamp and white_maxamp groups is %f\n',p);

[p,h]=signrank(itc_disc_max,itc_control);

fprintf('The p-value of the t-test between disc_maxamp and control groups is %f\n',p);

[p,h]=signrank(itc_white_max,itc_control);

fprintf('The p-value of the t-test between white_maxamp and control groups is %f\n',p);

%effect of noise at da
fprintf('\nEffect of noise at da\n');

itc_da_disc=mean(itc4(:,1:3),2);
itc_da_white=mean(itc4(:,7:9),2);

groups_da_noise={'da disc', 'da white', 'da control'};

p12=anova1([itc_da_disc,itc_da_white,itc4(:,13)], groups_da_noise);

fprintf('The p-value of the one-way anova between da_disc, da_white and da control groups is %f\n',p12);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwise comparisons of da_disc, da_white and da control groups is %f\n',expected_p);

[p,h]=signrank(itc_da_disc,itc_da_white);

fprintf('The p-value of the t-test between da_disc and da_white groups is %f\n',p);

[p,h]=signrank(itc_da_disc,itc4(:,13));

fprintf('The p-value of the t-test between da_disc and da_control groups is %f\n',p);

[p,h]=signrank(itc_da_white,itc4(:,13));

fprintf('The p-value of the t-test between da_white and da_control groups is %f\n',p);

%effect of noise at ta
fprintf('\nEffect of noise at ta\n');

itc_ta_disc=mean(itc4(:,4:6),2);
itc_ta_white=mean(itc4(:,10:12),2);

groups_ta_noise={'da disc', 'da white', 'da control'};

p13=anova1([itc_ta_disc,itc_ta_white,itc4(:,13)], groups_ta_noise);

fprintf('The p-value of the one-way anova between ta_disc, ta_white and ta control groups is %f\n',p13);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwise comparisons of ta_disc, ta_white and ta control groups is %f\n',expected_p);

[p,h]=signrank(itc_ta_disc,itc_ta_white);

fprintf('The p-value of the t-test between ta_disc and ta_white groups is %f\n',p);

[p,h]=signrank(itc_ta_disc,itc4(:,13));

fprintf('The p-value of the t-test between ta_disc and ta_control groups is %f\n',p);

[p,h]=signrank(itc_ta_white,itc4(:,13));

fprintf('The p-value of the t-test between ta_white and ta_control groups is %f\n',p);

%effect of location manipulation at da
fprintf('\nEffect of location manipulation at da\n');

itc_da_onset=mean(itc4(:,[1 7]),2);
itc_da_cv=mean(itc4(:,[2 8]),2);
itc_da_maxamp=mean(itc4(:,[3 9]),2);

groups_da_location={'da onset', 'da cv', 'da maxamp', 'da control'};

p14=anova1([itc_da_onset,itc_da_cv,itc_da_maxamp,itc4(:,13)], groups_da_location);

fprintf('The p-value of the one-way anova between da_onset, da_cv, da_maxamp and da control groups is %f\n',p14);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwise comparisons of da_onset, da_cv, da_maxamp and da control groups is %f\n',expected_p);

[p,h]=signrank(itc_da_onset,itc_da_cv);

fprintf('The p-value of the t-test between da_onset and da_cv groups is %f\n',p);

[p,h]=signrank(itc_da_onset,itc_da_maxamp); %significant, onset>maxamp

fprintf('The p-value of the t-test between da_onset and da_maxamp groups is %f\n',p);

[p,h]=signrank(itc_da_onset,itc4(:,13));    

fprintf('The p-value of the t-test between da_onset and da control groups is %f\n',p);

[p,h]=signrank(itc_da_cv,itc_da_maxamp);    %marginally significant, cv>maxamp (would be significant without control)

fprintf('The p-value of the t-test between da_cv and da_maxamp groups is %f\n',p);

[p,h]=signrank(itc_da_cv,itc4(:,13));

fprintf('The p-value of the t-test between da_cv and da control groups is %f\n',p);

[p,h]=signrank(itc_da_maxamp,itc4(:,13));

fprintf('The p-value of the t-test between da_maxamp and da control groups is %f\n',p);

%effect of location manipulation at ta
fprintf('\nEffect of location manipulation at ta\n');

itc_ta_onset=mean(itc4(:,[4 10]),2);
itc_ta_cv=mean(itc4(:,[5 11]),2);
itc_ta_maxamp=mean(itc4(:,[6 12]),2);

groups_ta_location={'ta onset', 'ta cv', 'ta maxamp', 'ta control'};

p15=anova1([itc_ta_onset,itc_ta_cv,itc_ta_maxamp,itc4(:,13)], groups_ta_location);

fprintf('The p-value of the one-way anova between ta_onset, ta_cv, ta_maxamp and ta control groups is %f\n',p14);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwise comparisons of ta_onset, ta_cv, da_maxamp and ta control groups is %f\n',expected_p);

[p,h]=signrank(itc_ta_onset,itc_ta_cv);

fprintf('The p-value of the t-test between ta_onset and ta_cv groups is %f\n',p);

[p,h]=signrank(itc_ta_onset,itc_ta_maxamp);

fprintf('The p-value of the t-test between ta_onset and ta_maxamp groups is %f\n',p);

[p,h]=signrank(itc_ta_onset,itc4(:,13));

fprintf('The p-value of the t-test between ta_onset and ta control groups is %f\n',p);

[p,h]=signrank(itc_ta_cv,itc_ta_maxamp);

fprintf('The p-value of the t-test between ta_cv and ta_maxamp groups is %f\n',p);

[p,h]=signrank(itc_ta_cv,itc4(:,13));

fprintf('The p-value of the t-test between ta_cv and ta control groups is %f\n',p);

[p,h]=signrank(itc_ta_maxamp,itc4(:,13));

fprintf('The p-value of the t-test between ta_maxamp and ta control groups is %f\n',p);

%effect of location manipulation for disc (& control)

fprintf('\nEffect of location manipulation for disc (& control)\n');

itc_disc_0=mean(itc4(:,[1,4]),2);
itc_disc_cv=mean(itc4(:,[2,5]),2);
itc_disc_maxamp=mean(itc4(:,[3,6]),2);

groups_disc={'disc onset', 'disc cv', 'disc maxamp', 'control'};

p16=anova1([itc_disc_0,itc_disc_cv,itc_disc_maxamp,itc_control], groups_disc);

fprintf('The p-value of the one-way anova between disc onset, disc cv, disc maxamp and control groups is %f\n',p16);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwise comparisons of disc onset, disc cv, disc maxamp and control groups is %f\n',expected_p);

[p,h]=signrank(itc_disc_0,itc_disc_cv);

fprintf('The p-value of the t-test between disc_onset and disc_cv groups is %f\n',p);

[p,h]=signrank(itc_disc_0,itc_disc_maxamp);

fprintf('The p-value of the t-test between disc_onset and disc_maxamp groups is %f\n',p);

[p,h]=signrank(itc_disc_0,itc_control);

fprintf('The p-value of the t-test between disc_onset and control groups is %f\n',p);

[p,h]=signrank(itc_disc_cv,itc_disc_maxamp);

fprintf('The p-value of the t-test between disc_onset and disc_maxamp groups is %f\n',p);

[p,h]=signrank(itc_disc_cv,itc_control);

fprintf('The p-value of the t-test between disc_cv and control groups is %f\n',p);

[p,h]=signrank(itc_disc_maxamp,itc_control);

fprintf('The p-value of the t-test between disc_maxamp and control groups is %f\n',p);


%effect of location manipulation for white (& control)

fprintf('\nEffect of location manipulation for white (& control)\n');

itc_white_0=mean(itc4(:,[7,10]),2);
itc_white_cv=mean(itc4(:,[8,11]),2);
itc_white_maxamp=mean(itc4(:,[9,12]),2);

groups_white={'white onset', 'white cv', 'white maxamp', 'control'};

p17=anova1([itc_white_0,itc_white_cv,itc_white_maxamp,itc_control], groups_white);

fprintf('The p-value of the one-way anova between white onset, white cv, white maxamp and control groups is %f\n',p17);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwise comparisons of white onset, white cv, white maxamp and control groups is %f\n',expected_p);

[p,h]=signrank(itc_white_0,itc_white_cv);

fprintf('The p-value of the t-test between white_onset and white_cv groups is %f\n',p);

[p,h]=signrank(itc_white_0,itc_white_maxamp);

fprintf('The p-value of the t-test between white_onset and white_maxamp groups is %f\n',p);

[p,h]=signrank(itc_white_0,itc_control);

fprintf('The p-value of the t-test between white_onset and control groups is %f\n',p);

[p,h]=signrank(itc_white_cv,itc_white_maxamp);

fprintf('The p-value of the t-test between white_onset and white_maxamp groups is %f\n',p);

[p,h]=signrank(itc_white_cv,itc_control);

fprintf('The p-value of the t-test between white_cv and control groups is %f\n',p);

[p,h]=signrank(itc_white_maxamp,itc_control);

fprintf('The p-value of the t-test between white_maxamp and control groups is %f\n',p);

%Effect of location at da_disc groups

fprintf('\nEffect of location at da_disc groups\n');

groups_da_disc={'disc da 0','disc da cv','disc da max amp', 'da'};

p18=anova1(itc4(:,[1 2 3 13]), groups_da_disc);

fprintf('The p-value of the one-way anova between da control and each of the da_disc groups is %f\n',p18);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwaise comparisons of da_disc/da_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,1),itc4(:,2));

fprintf('The p-value of the t-test between da_disc_0 and da _disc_cv is %f\n',p);

[p,h]=signrank(itc4(:,1),itc4(:,3)); %this is marginally sig, da_disc_0>da_disc_maxamp

fprintf('The p-value of the t-test between da_disc_0 and da _disc_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,1),itc4(:,13));

fprintf('The p-value of the t-test between da_disc_0 and da _control is %f\n',p);

[p,h]=signrank(itc4(:,2),itc4(:,3)); %this is sig, da_disc_cv>da_disc_maxamp

fprintf('The p-value of the t-test between da_disc_cv and da _disc_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,2),itc4(:,13));

fprintf('The p-value of the t-test between da_disc_cv and da _control is %f\n',p);

[p,h]=signrank(itc4(:,3),itc4(:,13));

fprintf('The p-value of the t-test between da_disc_maxamp and da _control is %f\n',p);


%Effect of location at ta_disc groups

fprintf('\nEffect of location at ta_disc groups\n');

groups_ta_disc={'disc ta 0','disc ta cv','disc ta max amp', 'ta'};

p19=anova1(itc4(:,[4 5 6 14]), groups_ta_disc);

fprintf('The p-value of the one-way anova between ta control and each of the ta_disc groups is %f\n',p19);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwaise comparisons of ta_disc/ta_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,4),itc4(:,5));

fprintf('The p-value of the t-test between ta_disc_0 and ta _disc_cv is %f\n',p);

[p,h]=signrank(itc4(:,4),itc4(:,6));

fprintf('The p-value of the t-test between ta_disc_0 and ta _disc_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,4),itc4(:,14));

fprintf('The p-value of the t-test between ta_disc_0 and ta _control is %f\n',p);

[p,h]=signrank(itc4(:,5),itc4(:,6));

fprintf('The p-value of the t-test between ta_disc_cv and ta _disc_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,5),itc4(:,14));

fprintf('The p-value of the t-test between ta_disc_cv and ta _control is %f\n',p);

[p,h]=signrank(itc4(:,6),itc4(:,14));

%Effect of location at da_white groups

fprintf('\nEffect of location at da_white groups\n');

groups_da_white={'white da 0','white da cv','white da max amp', 'da'};

p20=anova1(itc4(:,[7 8 9 13]), groups_da_white);

fprintf('The p-value of the one-way anova between da control and each of the da_white groups is %f\n',p20);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwaise comparisons of da_white/da_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,7),itc4(:,8));

fprintf('The p-value of the t-test between da_white_0 and da _white_cv is %f\n',p);

[p,h]=signrank(itc4(:,7),itc4(:,9));

fprintf('The p-value of the t-test between da_white_cv and da _white_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,7),itc4(:,13));

fprintf('The p-value of the t-test between da_white_0 and da _control is %f\n',p);

[p,h]=signrank(itc4(:,8),itc4(:,9));

fprintf('The p-value of the t-test between da_white_cv and da _white_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,8),itc4(:,13));

fprintf('The p-value of the t-test between da_white_cv and da_control is %f\n',p);

[p,h]=signrank(itc4(:,9),itc4(:,13));

fprintf('The p-value of the t-test between da_white_maxamp and da_control is %f\n',p);

%Effect of location at ta_white groups

fprintf('\nEffect of location at ta_white groups\n');

groups_ta_white={'white ta 0','white ta cv','white ta max amp', 'ta'};

p21=anova1(itc4(:,[10 11 12 14]), groups_ta_white);

fprintf('The p-value of the one-way anova between ta control and each of the ta_white groups is %f\n',p21);

expected_p=0.05/6;

fprintf('The corrected p-value for pairwaise comparisons of ta_white/ta_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,10),itc4(:,11));

fprintf('The p-value of the t-test between ta_white_0 and ta_white_cv is %f\n',p);

[p,h]=signrank(itc4(:,10),itc4(:,12));

fprintf('The p-value of the t-test between ta_white_0 and ta_white_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,10),itc4(:,14));

fprintf('The p-value of the t-test between ta_white_0 and ta_control is %f\n',p);

[p,h]=signrank(itc4(:,11),itc4(:,12));

fprintf('The p-value of the t-test between ta_white_cv and ta_white_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,11),itc4(:,14));

fprintf('The p-value of the t-test between ta_white_cv and ta_control is %f\n',p);

[p,h]=signrank(itc4(:,12),itc4(:,14));

fprintf('The p-value of the t-test between ta_white_maxamp and ta_control is %f\n',p);


%effect of noise at da_0 + da control

fprintf('\nEffect of noise at da_0 vs da_control\n');

groups_da_0 = {'disc da 0','white da 0','da'};

p22=anova1(itc4(:,[1 7 13]), groups_da_0);

fprintf('The p-value of the one-way anova between da control, da_disc_0 and da_white_0 groups is %f\n',p22);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwaise comparisons of da_0/da_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,1),itc4(:,7));

fprintf('The p-value of the t-test between da_disc_0 and da _white_0 is %f\n',p);

[p,h]=signrank(itc4(:,1),itc4(:,13));

fprintf('The p-value of the t-test between da_disc_0 and da_control is %f\n',p);

[p,h]=signrank(itc4(:,7),itc4(:,13));

fprintf('The p-value of the t-test between da_white_0 and da_control is %f\n',p);

%effect of noise at da_cv + da control

fprintf('\nEffect of noise at da_cv vs da_control\n');

groups_da_cv = {'disc da cv', 'white da cv','da'};

p23=anova1(itc4(:,[2 8 13]), groups_da_cv);

fprintf('The p-value of the one-way anova between da control, da_disc_cv and da_white_cv groups is %f\n',p23);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwaise comparisons of da_cv/da_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,2),itc4(:,8));

fprintf('The p-value of the t-test between da_disc_cv and da _white_cv is %f\n',p);

[p,h]=signrank(itc4(:,2),itc4(:,13));

fprintf('The p-value of the t-test between da_disc_cv and da_control is %f\n',p);

[p,h]=signrank(itc4(:,8),itc4(:,13));

fprintf('The p-value of the t-test between da_white_cv and da_control is %f\n',p);

%effect of noise at da_maxamp + da control
 
fprintf('\nEffect of noise at da_maxamp vs da_control\n');

groups_da_max_amp = {'disc da max amp', 'white da max amp', 'da'};

p24=anova1(itc4(:,[3 9 13]), groups_da_max_amp);

fprintf('The p-value of the one-way anova between da control, da_disc_maxamp and da_white_maxamp groups is %f\n',p24);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwaise comparisons of da_maxamp/da_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,3),itc4(:,9));

fprintf('The p-value of the t-test between da_disc_maxamp and da _white_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,3),itc4(:,13));

fprintf('The p-value of the t-test between da_disc_maxamp and da_control is %f\n',p);

[p,h]=signrank(itc4(:,9),itc4(:,13));

fprintf('The p-value of the t-test between da_white_maxamp and da_control is %f\n',p);

%effect of noise at ta_0 + ta control

fprintf('\nEffect of noise at ta_0 vs ta_control\n');

groups_ta_0 = {'disc ta 0','white ta 0','ta'};

p25=anova1(itc4(:,[4 10 14]), groups_ta_0);

fprintf('The p-value of the one-way anova between ta control, ta_disc_0 and ta_white_0 groups is %f\n',p25);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwaise comparisons of ta_0/ta_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,4),itc4(:,10));

fprintf('The p-value of the t-test between ta_disc_0 and ta _white_0 is %f\n',p);

[p,h]=signrank(itc4(:,4),itc4(:,14));

fprintf('The p-value of the t-test between ta_disc_0 and ta_control is %f\n',p);

[p,h]=signrank(itc4(:,10),itc4(:,14));

fprintf('The p-value of the t-test between ta_white_0 and ta_control is %f\n',p);

%effect of noise at ta_cv + ta control

fprintf('\nEffect of noise at ta_cv vs ta_control\n');

groups_ta_cv = {'disc ta cv', 'white ta cv','ta'};

p26=anova1(itc4(:,[5 11 14]), groups_ta_cv);

fprintf('The p-value of the one-way anova between ta control, ta_disc_cv and ta_white_cv groups is %f\n',p26);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwaise comparisons of ta_cv/ta_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,5),itc4(:,11));

fprintf('The p-value of the t-test between ta_disc_cv and ta_white_cv is %f\n',p);

[p,h]=signrank(itc4(:,5),itc4(:,14));

fprintf('The p-value of the t-test between ta_disc_cv and ta_control is %f\n',p);

[p,h]=signrank(itc4(:,11),itc4(:,14));

fprintf('The p-value of the t-test between ta_white_cv and ta_control is %f\n',p);

%effect of noise at ta_maxamp + ta control

fprintf('\nEffect of noise at ta_maxamp vs ta_control\n');

groups_ta_max_amp = {'disc ta max amp', 'white ta max amp', 'ta'};

p27=anova1(itc4(:,[6 12 14]), groups_ta_max_amp);

fprintf('The p-value of the one-way anova between ta control, ta_disc_maxamp and ta_white_maxamp groups is %f\n',p27);

expected_p=0.05/3;

fprintf('The corrected p-value for pairwaise comparisons of ta_maxamp/ta_control groups is %f\n',expected_p);

[p,h]=signrank(itc4(:,6),itc4(:,12));

fprintf('The p-value of the t-test between ta_disc_maxamp and ta_white_maxamp is %f\n',p);

[p,h]=signrank(itc4(:,6),itc4(:,14));

fprintf('The p-value of the t-test between ta_disc_maxamp and ta_control is %f\n',p);

[p,h]=signrank(itc4(:,12),itc4(:,14));

fprintf('The p-value of the t-test between ta_white_maxamp and ta_control is %f\n',p);

%without control groups
