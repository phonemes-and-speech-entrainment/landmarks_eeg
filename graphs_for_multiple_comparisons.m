clearvars;
load('pow_comb3_for_stats.mat');
%pow=reshape(pow_comb3,224,1);

%pow at 'click' vs control, showing differences between 'da' and 'ta'

%pow_click=pow([1:96,193:224]);

da_click_onset=pow_comb3(:,1);
da_click_cv=pow_comb3(:,2);
da_click_max=pow_comb3(:,3);
ta_click_onset=pow_comb3(:,4);
ta_click_cv=pow_comb3(:,5);
ta_click_max=pow_comb3(:,6);
da_white_onset=pow_comb3(:,7);
da_white_cv=pow_comb3(:,8);
da_white_max=pow_comb3(:,9);
ta_white_onset=pow_comb3(:,10);
ta_white_cv=pow_comb3(:,11);
ta_white_max=pow_comb3(:,12);
da_control=pow_comb3(:,13);
ta_control=pow_comb3(:,14);

pow_click=[da_click_onset,da_click_cv,da_click_max,ta_click_onset,ta_click_cv,ta_click_max,da_control,ta_control];
means=[mean(da_click_onset),mean(da_click_cv),mean(da_click_max),mean(ta_click_onset),mean(ta_click_cv),mean(ta_click_max),mean(da_control),mean(ta_control)];

group=[ones(1,16),repmat(2,1,16),repmat(3,1,16),repmat(4,1,16),repmat(5,1,16),repmat(6,1,16),repmat(7,1,16),repmat(8,1,16)];
positions = [1 1.25 1.5 2 2.25 2.5 3 3.25];
figure;
boxplot(pow_click, group, 'positions', positions);
hold on;
plot(positions,means,'k*');
xlabel('Conditions', 'FontSize',15);
ylabel('Mean power','FontSize',15);
title('Power 4 + 8 + 12 + 16 Hz at ''Click'' vs ''Control'' ', 'FontSize',15);


set(gca,'xtick',[mean(positions(1:3)) mean(positions(4:6)) positions(7) positions(8)]);
set(gca,'xticklabel',{'Da Click','Ta Click','Da','Ta'});


%color = ['b','m','g', 'b', 'm','g','b','m'];
h2=findobj(gca,'Tag','Median');

h = findobj(gca,'Tag','Box');

patch(get(h(1),'XData'),get(h(1),'YData'),'k','FaceAlpha',.5);
patch(get(h(2),'XData'),get(h(2),'YData'),'k','FaceAlpha',.5);
patch(get(h(3),'XData'),get(h(3),'YData'),'b','FaceAlpha',.5);
patch(get(h(4),'XData'),get(h(4),'YData'),'m','FaceAlpha',.5);
patch(get(h(5),'XData'),get(h(5),'YData'),'g','FaceAlpha',.5);
patch(get(h(6),'XData'),get(h(6),'YData'),'b','FaceAlpha',.5);
patch(get(h(7),'XData'),get(h(7),'YData'),'m','FaceAlpha',.5);
patch(get(h(8),'XData'),get(h(8),'YData'),'g','FaceAlpha',.5);

c = get(gca, 'Children');


hleg1 = legend([c([1:3,8,9]);h2(1)],'Onset', 'CV', 'Maximum Amplitude','Control','Mean','Median' );
legend('Location','northeastoutside')
%print('-fillpage','FillPageFigure','-dpdf');
saveas(gcf,'Graphs/pow_comb3_click.png');


%pow at 'white noise' vs control, showing differences between 'da' and 'ta'

pow_white=[da_white_onset,da_white_cv,da_white_max,ta_white_onset,ta_white_cv,ta_white_max,da_control,ta_control];
means=[mean(da_white_onset),mean(da_white_cv),mean(da_white_max),mean(ta_white_onset),mean(ta_white_cv),mean(ta_white_max),mean(da_control),mean(ta_control)];

group=[ones(1,16),repmat(2,1,16),repmat(3,1,16),repmat(4,1,16),repmat(5,1,16),repmat(6,1,16),repmat(7,1,16),repmat(8,1,16)];
positions = [1 1.25 1.5 2 2.25 2.5 3 3.25];
figure;
boxplot(pow_white,group, 'positions', positions);
hold on;
plot(positions,means,'k*');
xlabel('Conditions', 'FontSize',15);
ylabel('Mean power','FontSize',15);
title('Power 4 + 8 + 12 + 16 Hz at ''White'' vs ''Control'' ', 'FontSize',15);


set(gca,'xtick',[mean(positions(1:3)) mean(positions(4:6)) positions(7) positions(8)]);
set(gca,'xticklabel',{'Da White','Ta White','Da','Ta'});


%color = ['b','m','g', 'b', 'm','g','b','m'];
h2=findobj(gca,'Tag','Median');

h = findobj(gca,'Tag','Box');

patch(get(h(1),'XData'),get(h(1),'YData'),'k','FaceAlpha',.5);
patch(get(h(2),'XData'),get(h(2),'YData'),'k','FaceAlpha',.5);
patch(get(h(3),'XData'),get(h(3),'YData'),'b','FaceAlpha',.5);
patch(get(h(4),'XData'),get(h(4),'YData'),'m','FaceAlpha',.5);
patch(get(h(5),'XData'),get(h(5),'YData'),'g','FaceAlpha',.5);
patch(get(h(6),'XData'),get(h(6),'YData'),'b','FaceAlpha',.5);
patch(get(h(7),'XData'),get(h(7),'YData'),'m','FaceAlpha',.5);
patch(get(h(8),'XData'),get(h(8),'YData'),'g','FaceAlpha',.5);

c = get(gca, 'Children');


hleg2 = legend([c([1:3,8,9]);h2(1)],'Onset', 'CV', 'Maximum Amplitude','Control','Mean','Median' );
legend('Location','northeastoutside')
%print('-fillpage','FillPageFigure','-dpdf');
saveas(gcf,'Graphs/pow_comb3_white.png');

%pow at 'da', showing differences between 'click', 'white noise' and
%control

pow_da=[da_click_onset,da_click_cv,da_click_max,da_white_onset,da_white_cv,da_white_max,da_control];
means=[mean(da_click_onset),mean(da_click_cv),mean(da_click_max),mean(da_white_onset),mean(da_white_cv),mean(da_white_max),mean(da_control)];

group=[ones(1,16),repmat(2,1,16),repmat(3,1,16),repmat(4,1,16),repmat(5,1,16),repmat(6,1,16),repmat(7,1,16)];
positions = [1 1.25 1.5 2 2.25 2.5 3];
figure;
boxplot(pow_da,group, 'positions', positions);
hold on;
plot(positions,means,'k*');
xlabel('Conditions', 'FontSize',15);
ylabel('Mean power','FontSize',15);
title('Power 4 + 8 + 12 + 16 Hz at ''Da''', 'FontSize',15);


set(gca,'xtick',[mean(positions(1:3)) mean(positions(4:6)) positions(7)]);
set(gca,'xticklabel',{'Da Click','Da White','Da'});


%color = ['b','m','g', 'b', 'm','g','b','m'];
h2=findobj(gca,'Tag','Median');

h = findobj(gca,'Tag','Box');

patch(get(h(1),'XData'),get(h(1),'YData'),'k','FaceAlpha',.5);
patch(get(h(2),'XData'),get(h(2),'YData'),'b','FaceAlpha',.5);
patch(get(h(3),'XData'),get(h(3),'YData'),'m','FaceAlpha',.5);
patch(get(h(4),'XData'),get(h(4),'YData'),'g','FaceAlpha',.5);
patch(get(h(5),'XData'),get(h(5),'YData'),'b','FaceAlpha',.5);
patch(get(h(6),'XData'),get(h(6),'YData'),'m','FaceAlpha',.5);
patch(get(h(7),'XData'),get(h(7),'YData'),'g','FaceAlpha',.5);


c = get(gca, 'Children');


hleg3 = legend([c([1:3,7,8]);h2(1)],'Onset', 'CV', 'Maximum Amplitude','Control','Mean','Median' );
legend('Location','northeastoutside')
%print('-fillpage','FillPageFigure','-dpdf');
saveas(gcf,'Graphs/pow_comb3_da.png');

%pow at 'ta', showing differences between 'click', 'white noise' and
%control

pow_da=[ta_click_onset,ta_click_cv,ta_click_max,ta_white_onset,ta_white_cv,ta_white_max,ta_control];
means=[mean(ta_click_onset),mean(ta_click_cv),mean(ta_click_max),mean(ta_white_onset),mean(ta_white_cv),mean(ta_white_max),mean(ta_control)];

group=[ones(1,16),repmat(2,1,16),repmat(3,1,16),repmat(4,1,16),repmat(5,1,16),repmat(6,1,16),repmat(7,1,16)];
positions = [1 1.25 1.5 2 2.25 2.5 3];
figure;
boxplot(pow_da,group, 'positions', positions);
hold on;
plot(positions,means,'k*');
xlabel('Conditions', 'FontSize',15);
ylabel('Mean power','FontSize',15);
title('Power 4 + 8 + 12 + 16 Hz at ''Ta''', 'FontSize',15);


set(gca,'xtick',[mean(positions(1:3)) mean(positions(4:6)) positions(7)]);
set(gca,'xticklabel',{'Ta Click','Ta White','Ta'});


%color = ['b','m','g', 'b', 'm','g','b','m'];
h2=findobj(gca,'Tag','Median');

h = findobj(gca,'Tag','Box');

patch(get(h(1),'XData'),get(h(1),'YData'),'k','FaceAlpha',.5);
patch(get(h(2),'XData'),get(h(2),'YData'),'b','FaceAlpha',.5);
patch(get(h(3),'XData'),get(h(3),'YData'),'m','FaceAlpha',.5);
patch(get(h(4),'XData'),get(h(4),'YData'),'g','FaceAlpha',.5);
patch(get(h(5),'XData'),get(h(5),'YData'),'b','FaceAlpha',.5);
patch(get(h(6),'XData'),get(h(6),'YData'),'m','FaceAlpha',.5);
patch(get(h(7),'XData'),get(h(7),'YData'),'g','FaceAlpha',.5);


c = get(gca, 'Children');


hleg4 = legend([c([1:3,7,8]);h2(1)],'Onset', 'CV', 'Maximum Amplitude','Control','Mean','Median' );
legend('Location','northeastoutside')
%print('-fillpage','FillPageFigure','-dpdf');
saveas(gcf,'Graphs/pow_comb3_ta.png');