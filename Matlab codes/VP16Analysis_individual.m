%Analysis for VP16 matrix experiment. Written on 20200101 by Jessica Lee
%Calculates fold change (for mCherry) and makes plots for Figures 2-4.
%Written by Jessica Lee 20200919

%Import data. The Excel file should have the setup of columns as follows:
%1-mCherry median, 2-mCherry CV, 3-1/frequency(inverseFrequency), 4-PW, 5-light intensity/amplitude,
%6-AUC, 7-plate number, 8-date, 9-fold change, 10-condition number, 11-FSC-A median. Make sure the
%conditions are sorted.
close all 
clear all
PWinput=input('What is PW (sec)? Select 5, 120, 600, 1800, 3600 ');
allData=xlsread('Excel Files/VP16Analysis.xlsx');
mCherryMedian=allData(:,1);
mCherryCV=allData(:,2)./100;
%[mCherryMedian,mCherryCV,hypo,CV_FSC]=CVCalculation;
inverseFrequency=allData(:,3);
PW=allData(:,4);
amplitude=allData(:,5);
AUC=allData(:,6);
plateNumber=allData(:,7);
date=allData(:,9);
conditionNumber=allData(:,11);
if PWinput==5
    excelFileName=20200121;
elseif PWinput==120
    excelFileName=20200130;
elseif PWinput==600
    excelFileName=20200131;
elseif PWinput==1800
    excelFileName=20200227;
elseif PWinput==3600
    excelFileName=20200228;
end

%only for current condition
Indices=date==excelFileName;
mCherryMedian=mCherryMedian(Indices);
mCherryCV=mCherryCV(Indices);
inverseFrequency=inverseFrequency(Indices);
PW=PW(Indices);
amplitude=amplitude(Indices);
AUC=AUC(Indices);
plateNumber=plateNumber(Indices);
date=date(Indices);
conditionNumber=conditionNumber(Indices);


mCherryMedian(inverseFrequency==1)=[];%remove always on condition
mCherryCV(inverseFrequency==1)=[];
PW(inverseFrequency==1)=[];
amplitude(inverseFrequency==1)=[];

conditionNumber(inverseFrequency==1)=[];
AUC(inverseFrequency==1)=[];
inverseFrequency(inverseFrequency==1)=[];

mCherryMedian(inverseFrequency==1)=[];%remove always on condition
mCherryCV(inverseFrequency==1)=[];
PW(inverseFrequency==1)=[];
conditionNumber(inverseFrequency==1)=[];
AUC(inverseFrequency==1)=[];
inverseFrequency(inverseFrequency==1)=[];

%Calculate fold change
averageY11=nanmean(mCherryMedian(plateNumber==0));
averagedarkJY145=nanmean(mCherryMedian(plateNumber==1));
foldChange=(mCherryMedian-averageY11)./(averagedarkJY145-averageY11);

Save_file_name=sprintf('%d%s',PW(37),'sec_');
WhichPW=PW(37);


%Outlier analysis. Determine which samples are outliers for their
%conditions
foldChangeNew=foldChange;
i=1;
k=1;
[unique_cond_number,ia,~]=unique(conditionNumber);
while i<=length(unique_cond_number)
   indices=find(conditionNumber==unique_cond_number(i));
   outliers(indices)=isoutlier(foldChange(indices));
   foldChangeNew(outliers)=NaN;
   outliers(indices)=isoutlier(mCherryCV(indices));
   mCherryCV(outliers)=NaN;
   %Find the mean for each set of replicates
   averageFoldChange(i)=nanmean(foldChangeNew(indices));
   standDevFoldChange(i)=nanstd(foldChangeNew(indices));
   averageNoise(i)=nanmean(mCherryCV(indices));
   standDevNoise(i)=nanstd(mCherryCV(indices));
   averageAmp(i)=amplitude(ia(i));
   averageAUC(i)=AUC(ia(i));
   averagePW(i)=PW(ia(i));
   averageDate(i)=date(ia(i));
   averageInverseFreq(i)=inverseFrequency(ia(i));
  
    i=i+1;
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

%Figure. 3D fold change
fig1=figure ;
hold on
h1=scatter3(amplitude,inverseFrequency,foldChangeNew,50,'b');
xlabel('Light intensity (au)'), ylabel('Inverse Frequency (sec)'), zlabel('Fold Change')
title('All AUCs');
view(40,35)
xticks(1.2e9:10e9:6e10)
yticks(0:5000:20000)
grid off
hold off

color_5sec=[linspace(1,0,20)',linspace(1,0,20)',linspace(1,.29,20)'];
color_120sec=[linspace(1,.13,20)',linspace(1,.25,20)',linspace(1,.6,20)'];
color_600sec=[linspace(1,.3,20)',linspace(1,.56,20)',linspace(1,.35,20)'];
color_1800sec=[linspace(1,.99,20)',linspace(1,0.68,20)',linspace(1,.38,20)'];
color_3600sec=[linspace(1,.74,20)',linspace(1,.12,20)',linspace(1,0.18,20)'];
if PWinput==5
    color=color_5sec;
elseif PWinput==120
    color=color_120sec;
elseif PWinput==600
    color=color_600sec;
elseif PWinput==1800
    color=color_1800sec;
elseif PWinput==3600
    color=color_3600sec;
end
%color=log(Frequency);
size_marker=NaN*ones(length(Frequency),1);
size_marker(amplitude==6e9)=80;
size_marker(amplitude==1.2e10)=200;
size_marker(amplitude==4e10)=320;
size_marker(amplitude==6e10)=480;

%Figure 2 FC vs intensity
fig2=figure;
frequency_sorted=sort(unique(Frequency));
frequency_sorted(frequency_sorted==inf)=[];
frequency_sorted(frequency_sorted==1)=[];
hold on
for i=1:length(frequency_sorted)
frequency_color=round(i*2+i^3/343*8+3);
h6=scatter(amplitude(Frequency==frequency_sorted(i)),foldChangeNew(Frequency==frequency_sorted(i)),size_marker(Frequency==frequency_sorted(i)),color(frequency_color,:),'filled');

end
xlabel('Light intensity (au)','fontweight','bold'), ylabel('Fold change','fontweight','bold')
%lgd=legend('1/Freq=30','1/Freq=60','1/Freq=180','1/Freq=420','1/Freq=660','1/Freq=10');
%lgd.Location='northeastoutside';
set(gca,'XScale','log')
set(gca,'YScale','log')
set(gca,'Clim',[-4.7,-1])

ylim([.2,200])
xlim([5e9,1e11])
grid off
set(gca,'Fontsize',13)
hold off
fig_name=[Save_file_name,'FCvsIntensity.png'];
fig_name=['/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/',fig_name];
set(gca,'linewidth',2.5,'ticklength',[0.015 0.015])
saveas(gcf,fig_name)

%Figure 3: CV vs intensity
figure
hold on
for i=1:length(frequency_sorted)
    frequency_color=round(i*2+i^3/343*8+3);
scatter(amplitude(Frequency==frequency_sorted(i)),mCherryCV(Frequency==frequency_sorted(i)),size_marker(Frequency==frequency_sorted(i)),color(frequency_color,:),'filled');
end
xlabel('Light intensity (au)','fontweight','bold'), ylabel('CV','fontweight','bold')
%lgd=legend('1/Freq=3877','1/Freq=5600','1/Freq=7200','1/Freq=16800','1/Freq=25200','1/Freq=50400');
%lgd.Location='northeastoutside';
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.3,1.6])
xlim([5e9,1e11])
set(gca,'Clim',[-11,-3])
grid off
set(gca,'Fontsize',13)

fig_name=[Save_file_name,'CVvsIntensity.png'];
fig_name=['/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/',fig_name];
set(gca,'linewidth',2.5,'ticklength',[0.015 0.015])
saveas(gcf,fig_name)
hold off

% Figure 2: Fold change vs AUC 
figure 
unique_amplitudes=unique(amplitude);
foldChangeNew(PW==50400)=NaN;
mCherryCV(PW==50400)=NaN;
hold on
for i=1:length(frequency_sorted)
frequency_color=round(i*2+i^3/343*8+3);
scatter(AUC(Frequency==frequency_sorted(i)),foldChangeNew(Frequency==frequency_sorted(i)),size_marker(Frequency==frequency_sorted(i)),color(frequency_color,:),'filled')
end
%lgd=legend('A=6.0e9','A=1.2e10','A=4.0e10', 'A=6.0e10');
xlabel('AUC','fontweight','bold'), ylabel('Fold Change','fontweight','bold')
set(gca,'XScale','log')
set(gca,'YScale','log')
set(gca,'Clim',[-11,-3])
ylim([.2,200])
xlim([1e8,1e13])
grid off
set(gca,'Fontsize',13)
hold off
fig_name=[Save_file_name,'FCvsAUC.png'];
fig_name=['/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/',fig_name];
set(gca,'linewidth',2.5,'ticklength',[0.015 0.015])
saveas(gcf,fig_name)

% Figure 3: CV vs AUC
figure 
hold on
for i=1:length(frequency_sorted)
    frequency_color=round(i*2+i^3/343*8+3);
scatter(AUC(Frequency==frequency_sorted(i)),mCherryCV(Frequency==frequency_sorted(i)),size_marker(Frequency==frequency_sorted(i)),color(frequency_color,:),'filled')
end
%lgd=legend('A=6.0e9','A=1.2e10','A=4.0e10', 'A=6.0e10');
xlabel('AUC','fontweight','bold'), ylabel('Coeffiecient of Variation','fontweight','bold')
set(gca,'XScale','log')
set(gca,'YScale','log')
set(gca,'Clim',[-11,-3])
%lgd.Location='northeastoutside';
ylim([.3,1.6])
xlim([1e8,1e13])
grid off
set(gca,'Fontsize',13)
hold off
fig_name=[Save_file_name,'CVvsAUC.png'];
fig_name=['/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/',fig_name];
set(gca,'linewidth',2.5,'ticklength',[0.015 0.015])

saveas(gcf,fig_name)

% Figure 2: FC vs Freq
figure
hold on
for i=1:length(frequency_sorted)
    frequency_color=round(i*2+i^3/343*8+3);
scatter(Frequency(Frequency==frequency_sorted(i)),foldChangeNew(Frequency==frequency_sorted(i)),size_marker(Frequency==frequency_sorted(i)),color(frequency_color,:),'filled')
end
xlabel('Frequency','fontweight','bold'), ylabel('Fold Change','fontweight','bold')
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.2,200])
xlim([.5e-5,1])
set(gca,'Clim',[-11,-3])
grid off
set(gca,'Fontsize',13)
fig_name=[Save_file_name,'FCvsFreq.png'];
fig_name=['/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/',fig_name];
set(gca,'linewidth',2.5,'ticklength',[0.015 0.015])
saveas(gcf,fig_name);
hold off

%Figure 3: CV vs Freq
figure
hold on
for i=1:length(frequency_sorted)
   frequency_color=round(i*2+i^3/343*8+3);
scatter(Frequency(Frequency==frequency_sorted(i)), mCherryCV(Frequency==frequency_sorted(i)),size_marker(Frequency==frequency_sorted(i)),color(frequency_color,:),'filled')
end
xlabel('Frequency','fontweight','bold'), ylabel('Coefficient of variation','fontweight','bold')
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.3,1.6])
xlim([.5e-5,1])
set(gca,'Clim',[-11,-3])
grid off
set(gca,'Fontsize',13)
hold off
fig_name=['/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/',Save_file_name,'CVvsFreq.png'];
set(gca,'linewidth',2.5,'ticklength',[0.015 0.015])


saveas(gcf,fig_name)

% %Regression coefficient
zAmplitude=zscore(amplitude);
zPW=zscore(PW);
zInverseFrequency=zscore(inverseFrequency);
zAUC=zscore(AUC);
X=[zAmplitude',zInverseFrequency'];
[b,bint,r]=regress(foldChangeNew',X);
[b2,bint2,r2]=regress(mCherryCV',X);
