[num,tex,raw]=xlsread('Excel Files/Supplemental Table 3','Truncated ZF');
CRs=(tex(3:106,1));
FC1=(num(1:104,5));
FC2=(num(1:104,6));
FC3=(num(1:104,7));
MI=(num(1:104,1));
[CRs,I]=sort(CRs);
FC1=FC1(I);
FC2=FC2(I);
FC3=FC3(I);
t=table(CRs,FC1,FC2,FC3,MI,'VariableNames',{'CR','Fold_change_1','Fold_change_2','Fold_change_3','MI'});
t(strcmp(t.CR,'JY145'),:)=[];
t(strcmp(t.CR,'JY28'),:)=[];
t(strcmp(t.CR,'swd3'),:)=[];
statistics=grpstats(t,{'CR'},{'nanmean','nanstd','meanci','sem'});
statistics=sortrows(statistics,'CR','Ascend');
%statistics=sortrows(statistics,'nanmean_MI','Ascend');
 figure
 hold on
 set(gcf,'position',[440,225,1000,450]);
 bar((1:21:(21*height(statistics)))-7, statistics.nanmean_Fold_change_1,'facecolor',[1,.85,.9],'barwidth',.3)
 bar((3:21:(21*height(statistics)))-3, statistics.nanmean_Fold_change_2,'facecolor',[.7,.7,.7],'barwidth',.3)
 bar((3:21:(21*height(statistics)))+3, statistics.nanmean_Fold_change_3,'facecolor',[.8,.8,.99],'barwidth',.3)
 j=0:21:(21*height(statistics));
 for i=1:height(statistics)
     plot(j(i)-6,FC1(strcmp(CRs,statistics.CR(i))),'.','color',[0.3,.3,.3],'Markersize',5)
     plot(j(i),FC2(strcmp(CRs,statistics.CR(i))),'.','color',[.3,.3,.3],'Markersize',5)
     plot(j(i)+6,FC3(strcmp(CRs,statistics.CR(i))),'.','color',[.3,.3,.3],'Markersize',5)
    % boxplot(MI(strcmp(CR,Stats_MI.Gene(i))),'positions',i,'plotstyle','compact')
 end
 %errorbar(1:length(Stats_MI.Gene),Stats_MI.mean_MI,Stats_MI.meanci_MI(:,2)-Stats_MI.mean_MI,'linestyle','none','color',[.5,.5,.5],'Capsize',0)
   errorbar(j(1:19)-6,statistics.nanmean_Fold_change_1,statistics.sem_Fold_change_1,'linestyle','none','color',[.75,.75,.75],'Capsize',0)
   errorbar(j(1:19),statistics.nanmean_Fold_change_2,statistics.sem_Fold_change_2,'linestyle','none','color',[.75,.75,.75],'Capsize',0)
   errorbar(j(1:19)+6,statistics.nanmean_Fold_change_3,statistics.sem_Fold_change_3,'linestyle','none','color',[.75,.75,.75],'Capsize',0)
 set(gca,'XTick',j(1:20))
    set(gca,'XTickLabel',statistics.CR)
    set(gca,'XTickLabelRotation',90)
    ylabel('Fold change')
    set(gca,'YScale','log')
    ylim([.0005,1e5])
    CR_truncated=CRs;
    %% not truncated
   
    
 [num,tex,raw]=xlsread('Excel Files/Supplemental Table 3','FM');
CRs=string(tex(3:end,1));
CRs(strcmp(CRs,'VP16 (JY30)'))='JY30';
CRs(strcmp(CRs,'VP16 (JY145)'))='JY145';
FC1=(num(1:end,5));
FC2=(num(1:end,6));
FC3=(num(1:end,7));
[CRs,I]=sort(CRs);
FC1=FC1(I);
FC2=FC2(I);
FC3=FC3(I);
ind=zeros(length(CRs),1);
for i=1:length(CR_truncated)
ind=logical(strcmp(CRs,CR_truncated(i))+ind);
end
CRs=CRs(ind);
FC1=FC1(ind);
FC2=FC2(ind);
FC3=FC3(ind);
t=table(CRs,FC1,FC2,FC3,'VariableNames',{'CR','Fold_change_1','Fold_change_2','Fold_change_3'});
t(strcmp(t.CR,'JY145'),:)=[];
t(strcmp(t.CR,'JY28'),:)=[];
t(strcmp(t.CR,'swd3'),:)=[];
statistics=grpstats(t,{'CR'},{'mean','std','meanci','sem'});

 figure
 hold on
 set(gcf,'position',[440,225,1000,450]);
 bar((1:21:(21*height(statistics)))-7, statistics.mean_Fold_change_1,'facecolor',[1,.85,.9],'barwidth',.3)
 bar((3:21:(21*height(statistics)))-3, statistics.mean_Fold_change_2,'facecolor',[.7,.7,.7],'barwidth',.3)
 bar((3:21:(21*height(statistics)))+3, statistics.mean_Fold_change_3,'facecolor',[.8,.8,.99],'barwidth',.3)
 j=0:21:(21*height(statistics));
 for i=1:height(statistics)
     plot(j(i)-6,FC1(strcmp(CRs,statistics.CR(i))),'.','color',[0.3,.3,.3],'Markersize',5)
     plot(j(i),FC2(strcmp(CRs,statistics.CR(i))),'.','color',[.3,.3,.3],'Markersize',5)
     plot(j(i)+6,FC3(strcmp(CRs,statistics.CR(i))),'.','color',[.3,.3,.3],'Markersize',5)
    % boxplot(MI(strcmp(CR,Stats_MI.Gene(i))),'positions',i,'plotstyle','compact')
 end
 %errorbar(1:length(Stats_MI.Gene),Stats_MI.mean_MI,Stats_MI.meanci_MI(:,2)-Stats_MI.mean_MI,'linestyle','none','color',[.5,.5,.5],'Capsize',0)
   errorbar(j(1:19)-6,statistics.mean_Fold_change_1,statistics.sem_Fold_change_1,'linestyle','none','color',[.75,.75,.75],'Capsize',0)
   errorbar(j(1:19),statistics.mean_Fold_change_2,statistics.sem_Fold_change_2,'linestyle','none','color',[.75,.75,.75],'Capsize',0)
   errorbar(j(1:19)+6,statistics.mean_Fold_change_3,statistics.sem_Fold_change_3,'linestyle','none','color',[.75,.75,.75],'Capsize',0)
 set(gca,'XTick',j(1:20))
    set(gca,'XTickLabel',statistics.CR)
    set(gca,'XTickLabelRotation',90)
    ylabel('Fold change')
    set(gca,'YScale','log')
    ylim([.0005,1e5])