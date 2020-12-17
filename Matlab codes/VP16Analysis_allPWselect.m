%Analysis for VP16 matrix experiment. 
%Written on 20200101 by Jessica Lee

%Import data. The Excel file should have the setup of columns as follows:
%1-mCherry median, 2-mCherry CV (as percent), 3-1/frequency(inverseFrequency), 4-PW, 5-light intensity/amplitude,
%6-AUC, 7-plate number,8-light or dark, 9-date, 10-flow cytometry data file name, 11-condition number. Make sure the
%conditions are sorted.

%Updated on 20200720 to take an updated input file that is generated using
%CVCalculation_20200720.m copied into Book1_20200720.xlsx

%Updated on 20200917 to simplify code and add comments
close all 
clear all

excelFileName='Excel Files/VP16Analysis.xlsx';
[allData,names]=xlsread(excelFileName);

%name all the data
mCherryMedian=allData(:,1);
mCherryCV=allData(:,2)./100;
inverseFrequency=allData(:,3);
PW=allData(:,4);
amplitude=allData(:,5);
AUC=allData(:,6);
plateNumber=allData(:,7);
date=allData(:,9);
conditionNumber=allData(:,11);
names=names(:,5);
Selection=conditionNumber==[0,1,3,8,9,15,17,19,22,23,25,27,32,34,37,39,41,43,46,48,54,56,61,63,65,68,70,71,75,76,78,80,85,88,89,93,96,100,103,105,110,112,113,118,120,124];%select point with AUC similar to Same AUC experiment (for Fig 2S.)
Selection=logical(sum(Selection,2));
mCherryMedian=allData(Selection,1);
mCherryCV=allData(Selection,2)./100;
inverseFrequency=allData(Selection,3);
PW=allData(Selection,4);
amplitude=allData(Selection,5);
AUC=allData(Selection,6);
plateNumber=allData(Selection,7);
date=allData(Selection,9);
conditionNumber=allData(Selection,11);
names=names(Selection,1);
%Calculate fold change and correct for autofluorescence (Y11)
foldChange=NaN.*ones(length(mCherryMedian),1);
    listOfDates=unique(date);
    for i=1:length(listOfDates) %use Y11 and dark JY145 for each experiment 
        indices=date==listOfDates(i);
        averageY11=nanmean(mCherryMedian(indices & plateNumber==0));
        averagedarkJY145=nanmean(mCherryMedian(indices & plateNumber==1));
        foldChange(indices)=(mCherryMedian(indices)-averageY11)./(averagedarkJY145-averageY11);
    end

darkness_time=inverseFrequency-PW;

%remove always on condition
foldChange(inverseFrequency==1)=NaN;
mCherryCV(inverseFrequency==1)=NaN;
PW(inverseFrequency==1)=NaN;
Size_FSCA(inverseFrequency==1)=NaN;
AUC(inverseFrequency==1)=NaN;
amplitude(inverseFrequency==1)=NaN;
inverseFrequency(inverseFrequency==1)=NaN;

%Outlier analysis. Determine which samples are outliers for their
%conditions
foldChangeNew=foldChange;
i=1;
k=1;
while i<=length(conditionNumber)
   indices=find(conditionNumber==conditionNumber(i));
   outliers(indices)=isoutlier(foldChange(indices));
   foldChangeNew(outliers)=NaN;
   outliers(indices)=isoutlier(mCherryCV(indices));
   mCherryCV(outliers)=NaN;
   %Find the mean for each set of replicates
   averageFoldChange(k)=nanmean(foldChangeNew(indices));
   standDevFoldChange(k)=nanstd(foldChangeNew(indices));
   averageNoise(k)=nanmean(mCherryCV(indices));
   standDevNoise(k)=nanstd(mCherryCV(indices));
%   averageFSA(k)=nanstd(Size_FSCA(indices));
   averageAmp(k)=amplitude(i);
   averageAUC(k)=AUC(i);
   averagePW(k)=PW(i);
   averageDate(k)=date(i);
   averageCond(k)=conditionNumber(i);
   averageInverseFreq(k)=inverseFrequency(i);
   averageDarknessTime(k)=darkness_time(i);
   
    i=max(indices)+1;
    k=k+1;
end
numberOutliers=sum(outliers);
foldChangeNew=averageFoldChange;
mCherryCV=averageNoise;
amplitude=averageAmp;
AUC=averageAUC;
PW=averagePW;
inverseFrequency=averageInverseFreq;
Frequency=1./inverseFrequency;
darkness_time=averageDarknessTime;

%set up colors for plots
color=[0,0,0.29;
    0.13,.25,.6;
    .3,.56,.35;
    .99,0.68,.38;
    .74,.12,.18;
    .61,.4,.65;
    0,0,0;
    0,.8,1;
    0,1,0;];
%set up marker size for plots
size_marker=NaN*ones(length(Frequency),1);
size_marker(amplitude==6e9)=100;
size_marker(amplitude==1.2e10)=100;
size_marker(amplitude==4e10)=100;
size_marker(amplitude==6e10)=100;

%shape_marker=[];
shape_marker(1)='o';
shape_marker(2)='o';
shape_marker(3)='o';
shape_marker(4)='o';
shape_marker(5)='o';

%Figure: 3D plot of amplitude, 1/freq, and fold change
figure 
hold on
scatter3(amplitude,inverseFrequency,foldChangeNew,50,'b')
xlabel('Light intensity (au)'), ylabel('Inverse Frequency (sec)'), zlabel('Fold Change')
title('All AUCs');
view(40,35)
xticks(1.2e9:10e9:6e10)
yticks(0:5000:20000)
grid on
set(gca,'fontsize',13)
hold off


%Figure 2: FC vs intensity
figure
hold on
unique_PW=[5,120,600,1800,3600];
for i=1:5
scatter(amplitude(PW==unique_PW(i)),foldChangeNew(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
xlabel('Light intensity (au)','fontweight','bold'), ylabel('Fold change')
grid on
set(gca,'fontsize',13)
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.2,200])
xlim([5e9,1e11])
hold off

%Figure 3: CV vs intensity
figure
hold on
for i=1:5
scatter(amplitude(PW==unique_PW(i)),mCherryCV(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
xlabel('Light intensity (au)','fontweight','bold'), ylabel('CV','fontweight','bold')
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.5,2])
xlim([5e9,1e11])
grid on
hold off

% Figure 2: Fold change vs AUC 
figure 
hold on
log_AUC=log10(AUC);
log_foldChange=log10(foldChangeNew);
for i=1:5
scatter(AUC(PW==unique_PW(i)),foldChangeNew(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
set(gca,'XScale','log')
set(gca,'YScale','log')
xlabel('AUC','fontweight','bold'), ylabel('Fold Change','fontweight','bold')
ylim([.2,200])
xlim([1e8,1e13])
grid on
set(gca,'fontsize',13)
hold off

% Figure 3: CV vs AUC
figure 
hold on
for i=1:5
scatter(AUC(PW==unique_PW(i)),mCherryCV(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
xlabel('AUC','fontweight','bold'), ylabel('Coeffiecient of Variation','fontweight','bold')
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.5,2])
xlim([1e8,1e13])
grid on
set(gca,'fontsize',13)
%saveas(gcf,'all_CVvsAUC.png')
hold off


%Figure 2: fold change vs frequency
figure
hold on
for i=1:5
scatter(Frequency(PW==unique_PW(i)),foldChangeNew(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
xlabel('Frequency (sec^-^1)','fontweight','bold'), ylabel('Fold change','fontweight','bold')
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.2,200])
xlim([.5e-5,1])
grid on
set(gca,'fontsize',13)
%saveas(gcf,'all_FCvsFreq.png')
hold off

%Figure 3: CV vs frequency
figure
hold on
for i=1:5
scatter(Frequency(PW==unique_PW(i)),mCherryCV(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
xlabel('Frequency (sec^-^1)','fontweight','bold'), ylabel('Coefficient of Variation','fontweight','bold')
set(gca,'XScale','log');
set(gca,'YScale','log');
ylim([.5,2])
xlim([.5e-5,1])
grid on
set(gca,'fontsize',13)
%saveas(gcf,'all_CVvsFreq.png')
hold off
%% 

%Figure noise vs FC
figure
hold on
plot(foldChangeNew(PW==5),mCherryCV(PW==5).^2,'.b','MarkerSize',30)
plot(foldChangeNew(PW==120),mCherryCV(PW==120).^2,'.k','MarkerSize',30)
plot(foldChangeNew(PW==600),mCherryCV(PW==600).^2,'.g','MarkerSize',30)
plot(foldChangeNew(PW==1800),mCherryCV(PW==1800).^2,'.r','MarkerSize',30)
plot(foldChangeNew(PW==3600),mCherryCV(PW==3600).^2,'.c','MarkerSize',30)
regime2_foldChange=foldChangeNew(foldChangeNew>40);
regime2_CV=mCherryCV(foldChangeNew>40);
P=polyfit(log10(regime2_foldChange),log10(regime2_CV.^2),1);
xlabel('Fold change','fontweight','bold'), ylabel('Noise (sigma^2/FC^2)','fontweight','bold')
xfit=0:.01:2.5;
yfit=P(1)*xfit+P(2);
plot(10.^xfit,10.^yfit,'r-');
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.1,10]);
distance=abs(P(2)+P(1).*foldChangeNew-mCherryCV)./sqrt(1+P(1)^2);
ind=find(distance>=1.5*nanmean(distance));
T=table(distance(ind)',PW(ind)',inverseFrequency(ind)',amplitude(ind)',foldChangeNew(ind)',mCherryCV(ind)');
T.Properties.VariableNames={'Distance','PW','inverseFreq','amp','FC','CV'};
lgd=legend('PW=5','PW=120','PW=600','PW=1800','PW=3600');
lgd.Location='northeastoutside';
grid on
set(gca,'fontsize',13)
%saveas(gcf,'all_CVvsFC.png')
hold off



%Figure Supp: FC vs darkness interval duration
figure
hold on
plot(darkness_time(PW==5),foldChangeNew(PW==5),'.b','MarkerSize',30)
plot(darkness_time(PW==120),foldChangeNew(PW==120),'.k','MarkerSize',30)
plot(darkness_time(PW==600),foldChangeNew(PW==600),'.g','MarkerSize',30)
plot(darkness_time(PW==1800),foldChangeNew(PW==1800),'.r','MarkerSize',30)
plot(darkness_time(PW==3600),foldChangeNew(PW==3600),'.c','MarkerSize',30)
xlabel('Darkness interval duration (sec)','fontweight','bold'), ylabel('Fold change','fontweight','bold')
set(gca,'XScale','log');
set(gca,'YScale','log');
lgd=legend('PW=5','PW=120','PW=600','PW=1800','PW=3600');
lgd.Location='northeastoutside';
ylim([-.05,150])
grid on
set(gca,'fontsize',13)
%Figure 10: CV vs darkness interval duration
figure
hold on
plot(darkness_time(PW==5),mCherryCV(PW==5),'.b','MarkerSize',30)
plot(darkness_time(PW==120),mCherryCV(PW==120),'.k','MarkerSize',30)
plot(darkness_time(PW==600),mCherryCV(PW==600),'.g','MarkerSize',30)
plot(darkness_time(PW==1800),mCherryCV(PW==1800),'.r','MarkerSize',30)
plot(darkness_time(PW==3600),mCherryCV(PW==3600),'.c','MarkerSize',30)
xlabel('Darkness interval duration (sec)','fontweight','bold'), ylabel('CV','fontweight','bold')
set(gca,'XScale','log');
set(gca,'YScale','log');
grid on
set(gca,'fontsize',13)
lgd=legend('PW=5','PW=120','PW=600','PW=1800','PW=3600');
lgd.Location='northeastoutside';

%Figure supp: FC vs PW
figure 
hold on
plot(PW(inverseFrequency==7200),foldChangeNew(inverseFrequency==7200),'.b','MarkerSize',30)
plot(PW(inverseFrequency==16800),foldChangeNew(inverseFrequency==16800),'.r','MarkerSize',30)
%plot(PW(AUC>1e10),foldChangeNew(AUC>1e10),'.g','MarkerSize',30)
%plot(PW(amplitude==4e10),foldChangeNew(amplitude==4e10),'.g','MarkerSize',30)
%plot(PW(amplitude==6e10),foldChangeNew(amplitude==6e10),'.r','MarkerSize',30)
xlabel('PW (sec)')
ylabel('FC')
set(gca,'XScale','log');
set(gca,'YScale','log');
grid on
set(gca,'fontsize',13)
lgd=legend('Frequency=1.39x10^-^4 sec^-^1','Frequency=5.95x10^-^5 sec^-^1');
lgd.Location='northeastoutside';

%Figure 12: CV vs PW
figure 
hold on
plot(PW(inverseFrequency==7200),mCherryCV(inverseFrequency==7200),'.b','MarkerSize',30)
plot(PW(inverseFrequency==16800),mCherryCV(inverseFrequency==16800),'.k','MarkerSize',30)
%plot(PW(AUC>1e10),mCherryCV(AUC>1e10),'.g','MarkerSize',30)
%plot(PW(amplitude==4e10),foldChangeNew(amplitude==4e10),'.g','MarkerSize',30)
%plot(PW(amplitude==6e10),foldChangeNew(amplitude==6e10),'.r','MarkerSize',30)
xlabel('PW (sec)')
ylabel('CV')

%Figure 13
figure
hold on
plot(amplitude(PW==5),foldChangeNew(PW==5),'.b','MarkerSize',30)
plot(amplitude(PW==120),foldChangeNew(PW==120),'.k','MarkerSize',30)
plot(amplitude(PW==600),foldChangeNew(PW==600),'.g','MarkerSize',30)
plot(amplitude(PW==1800),foldChangeNew(PW==1800),'.r','MarkerSize',30)
plot(amplitude(PW==3600),foldChangeNew(PW==3600),'.c','MarkerSize',30)
%plot(amplitude(inverseFrequency==16800),foldChangeNew(inverseFrequency==16800),'.c','MarkerSize',30)
%plot(amplitude(inverseFrequency==50400),foldChangeNew(inverseFrequency==50400),'.m','MarkerSize',30)
xlabel('Light intensity (au)'), ylabel('Fold change')
grid on
set(gca,'fontsize',13)
lgd=legend('PW=5','PW=120','PW=600','PW=1800','PW=3600');
lgd.Location='northeastoutside';

%% ANCOVA

log_Freq=log(1./inverseFrequency);
log_FC=log(foldChangeNew);
log_PW=log(PW);
log_amp=log(amplitude);

nan_indices=isnan(log_Freq);
log_Freq(nan_indices)=[];
log_FC(nan_indices)=[];
log_PW(nan_indices)=[];
log_amp(nan_indices)=[];
PW(nan_indices)=[];
AUC(nan_indices)=[];
amplitude(nan_indices)=[];

nan_indices=isnan(log_FC);
log_Freq(nan_indices)=[];
log_FC(nan_indices)=[];
log_PW(nan_indices)=[];
log_amp(nan_indices)=[];
PW(nan_indices)=[];
AUC(nan_indices)=[];
amplitude(nan_indices)=[];

log_FC(log_Freq==inf)=[];
log_PW(log_Freq==inf)=[];
log_amp(log_Freq==inf)=[];
PW(log_Freq==inf)=[];
amplitude(log_Freq==inf)=[];
AUC(log_Freq==inf)=[];
log_Freq(log_Freq==inf)=[];


 [h,atab,ctab,stats]=aoctool(log_Freq,log_FC,PW);
multcompare(stats)
lm_5sec=fitlm(log_Freq(PW==5),log_FC(PW==5));
lm_120sec=fitlm(log_Freq(PW==120),log_FC(PW==120));
lm_600sec=fitlm(log_Freq(PW==600),log_FC(PW==600));
lm_1800sec=fitlm(log_Freq(PW==1800),log_FC(PW==1800));
lm_3600sec=fitlm(log_Freq(PW==3600),log_FC(PW==3600));
PW_unique=sort(unique(PW));
amp_unique=sort(unique(amplitude));

Frequency=1./10.^log_Freq;
unique_Freq=sort(unique(Frequency));
%find range for FM and AM
range_AM=zeros(5,length(unique_Freq));
range_FM=zeros(5,4);
range_PW=zeros(4,length(unique_Freq));
for i=1:5
    for j=1:4
    range_FM(i,j)=range(foldChangeNew(PW==PW_unique(i) & amplitude==amp_unique(j)));
    end
    for k=1:length(unique_Freq)
       temp=range(foldChangeNew(PW==PW_unique(i) & Frequency==unique_Freq(k)));
       if isempty(temp)==1
           range_AM(i,k)=NaN;
       else
           range_AM(i,k)=temp;
       end
    end
end
%Range of PWM
for i=1:4
    for j=1:length(unique_Freq)
        temp=range(foldChangeNew(amplitude==amp_unique(i) & Frequency==unique_Freq(j)));
        if isempty(temp)==1
            range_PW(i,j)=NaN;
        else
            range_PW(i,j)=temp;
        end
    end
end
range_FM=reshape(range_FM',1,[]);
range_AM=reshape(range_AM',1,[]);
range_PW=reshape(range_PW',1,[]);
range_FM(isnan(range_FM))=[];
range_AM(isnan(range_AM))=[];
range_PW(isnan(range_PW))=[];
ranges=[range_FM range_AM range_PW];
a1=ones(length(range_FM),1);
a2=2.*ones(length(range_AM),1);
a3=3.*ones(length(range_PW),1);
cate=[a1' a2' a3'];
[p,tbl,stats_range]=anova1(ranges,cate,'varnames',{'FM','AM','PWM'});
figure
multcompare(stats_range)
%Regression coefficient
zAmplitude=zscore(log_amp);
zPW=zscore(log_PW);
zFrequency=zscore(log_Freq);
zAUC=zscore(AUC);
X=[ones(length(zPW),1),zAmplitude',zPW',zFrequency',zFrequency'.*zAmplitude',zFrequency'.*zPW'];
X2=[ones(length(log_PW),1),log_amp',log_PW',log_Freq'];
[b,bint,r,~,stat]=regress(log_FC',X);
[b2,bint2,r2,~,stat2]=regress(log_FC',X2)
%VIP score
[XL,YL,XS,YS,beta,pctvar,mse,stats] = plsregress(X2,log_FC',1);
W0 = bsxfun(@rdivide,stats.W,sqrt(sum(stats.W.^2,1)));% Calculate normalized PLS weights
sumSq = sum(XS.^2,1).*sum(YL.^2,1);% Calculate the product of summed squares of XS and YL
vipScores = sqrt(size(XL,1) * sum(bsxfun(@times,sumSq,W0.^2),2) ./ sum(sumSq,2));% Calculate VIP scores for NCOMP components
%PW=5, XXis (amp) YY is (freq)
[XX,YY]=meshgrid(6e9:1e9:6e10,2e-5:2e-5:.1);
Z=XX.^b2(2).*5.^b2(3).*YY.^b2(4).*exp(b2(1));
figure
scatter3(amplitude(PW==5),Frequency(PW==5),foldChange(PW==5))
hold on
surf(XX,YY,Z)
xlabel('Amplitude'),ylabel('Frequency'),zlabel('Fold Change')
hold off
[~,~,stats]=anovan(log_FC,{log_Freq,amplitude,PW},'continuous',1,'model','full','varnames',{'log(F)','log(A)','log(PW)'});
figure
results=multcompare(stats);
%% Maximizing MI/influence on number of inputs for Figure 4b
range_of_inputs=119;
cd('Flow cytometry data')
Cond0_file_name=names(25:28);
P=string(['/P';'/P';'/P';'/P']);
S=string([' light/';' light/';' light/';' light/' ]);
Cond0_file_name=strcat(string(date(25:28)),'/dark','/',Cond0_file_name);
Conditions=[];
for j=1:length(range_of_inputs)
Number_of_outputs=range_of_inputs(j);%includes no signal/dark condition and last one
Cond_file_names=strings(4,Number_of_outputs-1);
[~,Indices]=sort(foldChangeNew);
int=round((length(foldChangeNew)-1)./(Number_of_outputs-1));
Conditions=zeros(Number_of_outputs-1,1);
if Number_of_outputs<=59
for i=1:Number_of_outputs-2
    Conditions(i)=averageCond(Indices((i)*int));
  
end
else
    for i=1:60-2
        Conditions(i)=averageCond(Indices((i)*2));
    end
    for i=59:Number_of_outputs-2
        temp_conditions=averageCond(~ismember(averageCond,Conditions));
        r=round((random('uniform',1,length(temp_conditions))));
        Conditions(i)=temp_conditions(r);
    end
end
Conditions(Number_of_outputs-1)=Indices(119);
for i=1:Number_of_outputs-1
    temp=names(conditionNumber==Conditions(i));
        temp1=date(conditionNumber==Conditions(i));
        temp2=plateNumber(conditionNumber==Conditions(i));
Cond_file_names(:,i)=strcat(string(temp1(1:4)),P,string(temp2(1:4)),S,temp(1:4));
end

for l=1:4
   [Imax(l,j),Imax_range(l,j)]=MIfunction(Cond0_file_name(l),Cond_file_names(l,:));
end
end

%% Imax of all conditions for all four replicates plot 
Imax_all=[1.347274334	1.361798327	1.462319823	1.416147635	1.565576562	1.656174108	1.656174108	1.687627996	1.680238153	1.671035697	1.696118076	1.692920716
1.455673356	1.259930832	1.454493269	1.458941472	1.58890556	1.671260256	1.671429641	1.694932894	1.72039312	1.69813451	1.701036742	1.708930465
1.536501741	1.472827571	1.538377251	1.568235752	1.581833694	1.66586968	1.666916592	1.689905788	1.699995031	1.691144733	1.694927881	1.6936303
1.430906588	1.360902791	1.459580273	1.489925037	1.608963582	1.701206138	1.701206139	1.732247089	1.744179986	1.726764036	1.736835216	1.720146774]; %Imax results from spreadsheet, were calculated using above section. Will be slightly different each time because it randomly selects conditions to add. 
n_list=10:10:110;
Imax_all2=[];
for i=1:11
    n(i*4-3:i*4)=n_list(i)*ones(4,1);
    Imax_all2=[Imax_all2; Imax_all(:,i)];
end
Imax_all=[Imax_all2; Imax_all(:,12)];
n(45:48)=119*ones(4,1); %makes number of signal inputs
[p,t,stats]=anova1(Imax_all,n);
[c,mh]=multcompare(stats);
figure
boxplot(Imax_all,n,'PlotStyle','compact','Positions',n)
 xlabel('Number of signal inputs'),ylabel('Imax')   
figure
hold on
table2=table(n',Imax_all,'VariableNames',{'number','MI'});
stats_MI=grpstats(table2,{'number'},{'mean','std','meanci','sem'});
errorbar(stats_MI.number,stats_MI.mean_MI,stats_MI.sem_MI,'Linewidth',1,'color','k','linestyle','none','capsize',2)

plot(stats_MI.number,stats_MI.mean_MI,'.','color',[0.13,.25,.6],'Markersize',20)
plot(n,Imax_all,'.','color',[.5,.5,.5],'Markersize',10)
  