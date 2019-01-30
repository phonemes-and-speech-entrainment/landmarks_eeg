load('itc_comb3_for_stats.mat');
newitc=itc_comb3(:,1:12);
itc=reshape(newitc,192,1);


g1 = {'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'click';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise';'noise'};
g2 = {'onset';'onset';'onset';'onset';'cv';'cv';'cv';'cv';'maxamp';'maxamp';'maxamp';'maxamp';'onset';'onset';'onset';'onset';'cv';'cv';'cv';'cv';'maxamp';'maxamp';'maxamp';'maxamp';'onset';'onset';'onset';'onset';'cv';'cv';'cv';'cv';'maxamp';'maxamp';'maxamp';'maxamp';'onset';'onset';'onset';'onset';'cv';'cv';'cv';'cv';'maxamp';'maxamp';'maxamp';'maxamp'};
g3 = {'da';'da';'da';'da';'da';'da';'da';'da';'da';'da';'da';'da';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'da';'da';'da';'da';'da';'da';'da';'da';'da';'da';'da';'da';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta';'ta'};


g1_long={};
g2_long={};
g3_long={};

for r =1:48
    for s=1:4
        g1_long{end+1}=g1{r};
        g2_long{end+1}=g2{r};
        g3_long{end+1}=g3{r};
    end
end




p = anovan(itc,{g1_long g2_long g3_long},'model','interaction','varnames',{'noise type','location','consonant'})



