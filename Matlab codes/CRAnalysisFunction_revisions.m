%Analysis for VP16 matrix experiment. Written on 20200121 by Jessica Lee
%Revised on 20210524 to work for revisions experiments that include:
%truncated ZF, AM, and PWM.

%Had small adjustments for the JY145 controls.

%Import data. The Excel file should have the setup of columns as follows:
%mCherry median, robust mCherry CV (in percent), FSC-A median, count, FSC-A CV,
%mCherry CV, FSC-A robust CV. 

%Outputs 
%names: names of CRs 
%Table1=[foldChange1_average',fluorescence_dark_average',fluorescence_light_average',foldChange3',averageDarkCV',averageLightCV'];
%foldChange1:fold change by dividing each strain individually and normalizing to the
%strain incubated in the dark. foldChange1=lightMedianNew./(darkMedianNew);
%fluorescence: normalized to reporter only (JY28)
%foldChange3: fold change by dividing then averaging to the strain incubated in
%the dark. foldChange3_notaveraged=(lightMedianNew)./(averageDarkMedian);

function [names,Table1,foldChange1,fluorescence_light,foldChange3_notaveraged,lightCVNew,darkCVNew,fluorescence_dark,fileNew]=CRAnalysisFunction(excelFileName,sheetName)

%excelFileName=input('What is data file name? (make sure to include .xlsx) ','s');
[allData,tex,raw]=xlsread(excelFileName,sheetName);
mCherryMedian=allData(:,1);
mCherryCV=allData(:,2)./100;%CV is 6. Robust CV is column 2
file=tex(2:end,11);

plateNumber=raw(2:end,9);
Strain=tex(2:end,7);
%Remove samples with less than 250 cells
count=allData(:,4);
mCherryMedian(count<=500)=NaN;
mCherryCV(count<=500)=NaN;
file(count<=500)={NaN};
Date=allData(:,10);

%Only analyze 1 plate
%mCherryMedian(Date~=20200318 | plateNumber~=3.1)=NaN;
%mCherryCV(Date~=20200117)=NaN;
% mCherryMedian(Date~=20200117)=NaN;r
% Strain(Date~=20200117)={'NaN'};
% mCherryMedian(plateNumber~=2)=NaN;
% mCherryCV(plateNumber~=2)=NaN;
% % Y11_average=1.1425;

Light_dark=tex(2:end,8); % use strcmp(text,'dark') to search
darkIndices=strcmp(Light_dark,'dark');
lightIndices=strcmp(Light_dark,'light');
listOfStrains=unique(Strain);

lightStrain=Strain(lightIndices);
darkStrain=Strain(darkIndices);
[~,names]=xlsread('Excel Files/CRAnalysis','List of CRs');
TransName=Strain;
CRName=Strain;

%Normalize plates to JY145

listOfDates=unique(Date);
JY145_ind=strcmp(Strain,'JY145');
Y11_ind=strcmp(Strain,'Y11');
%    
    JY145_light_overall_average=mCherryMedian(JY145_ind==1 & strcmp(tex(2:end,8),'control')==1);
    outliers=isoutlier(JY145_light_overall_average);%remove outliers
    JY145_light_overall_average(outliers)=NaN;
    JY145_light_overall_average=nanmean(JY145_light_overall_average);
    JY145_dark_overall_average=mCherryMedian(JY145_ind==1 & darkIndices==1);
    outliers=isoutlier(JY145_dark_overall_average);
    JY145_dark_overall_average(outliers)=NaN;
    JY145_dark_overall_average=nanmean(JY145_dark_overall_average);

for k=1:length(listOfDates)
    ind_Date_Y11=find(Date==listOfDates(k) & Y11_ind==1);
    Y11_Date_average=nanmean(mCherryMedian(ind_Date_Y11)); %Doesn't matter
    
    ind_Date_p2_light=find(Date==listOfDates(k) & strcmp(string(plateNumber),'2')==1 & lightIndices==1);
    mCherryMedian(ind_Date_p2_light)=mCherryMedian(ind_Date_p2_light)-Y11_Date_average;
    JY145_Date_p2_light=mCherryMedian(Date==listOfDates(k) & strcmp(string(plateNumber),'2')==1 & strcmp(tex(2:end,8),'control')==1 & JY145_ind==1);
    JY145_Date_p2_light(isoutlier(JY145_Date_p2_light))=NaN;
    JY145_Date_p2_light=nanmean(JY145_Date_p2_light);
    mCherryMedian(ind_Date_p2_light)=mCherryMedian(ind_Date_p2_light)./JY145_Date_p2_light.*JY145_light_overall_average;
    
    ind_Date_p2_dark=find(Date==listOfDates(k) & strcmp(string(plateNumber),'2')==1 & darkIndices==1);
    mCherryMedian(ind_Date_p2_dark)=mCherryMedian(ind_Date_p2_dark)-Y11_Date_average;
    JY145_Date_p2_dark=mCherryMedian(Date==listOfDates(k) & strcmp(string(plateNumber),'2')==1 & darkIndices==1 & JY145_ind==1);
    JY145_Date_p2_dark(isoutlier(JY145_Date_p2_dark))=NaN;
    JY145_Date_p2_dark=nanmean(JY145_Date_p2_dark);
    mCherryMedian(ind_Date_p2_dark)=(mCherryMedian(ind_Date_p2_dark))./JY145_Date_p2_dark.*JY145_dark_overall_average;
    
    ind_Date_p3_light=find(Date==listOfDates(k) & strcmp(string(plateNumber),'neo')==1 & lightIndices==1);
    mCherryMedian(ind_Date_p3_light)=(mCherryMedian(ind_Date_p3_light)-Y11_Date_average);
    JY145_Date_p3_light=mCherryMedian(Date==listOfDates(k) & strcmp(string(plateNumber),'neo')==1 & strcmp(tex(2:end,8),'control')==1 & JY145_ind==1);
    JY145_Date_p3_light(isoutlier(JY145_Date_p3_light))=NaN;
    JY145_Date_p3_light=nanmean(JY145_Date_p3_light);
    mCherryMedian(ind_Date_p3_light)=(mCherryMedian(ind_Date_p3_light))./JY145_Date_p3_light.*JY145_light_overall_average;
    
    ind_Date_p3_dark=find(Date==listOfDates(k) & strcmp(string(plateNumber),'neo')==1 & darkIndices==1);
    mCherryMedian(ind_Date_p3_dark)=(mCherryMedian(ind_Date_p3_dark)-Y11_Date_average);
    JY145_Date_p3_dark=mCherryMedian(Date==listOfDates(k) & strcmp(string(plateNumber),'neo')==1 & darkIndices==1 & JY145_ind==1);
    JY145_Date_p3_dark(isoutlier(JY145_Date_p3_dark))=NaN;
    JY145_Date_p3_dark=nanmean(JY145_Date_p3_dark);
    mCherryMedian(ind_Date_p3_dark)=(mCherryMedian(ind_Date_p3_dark))./JY145_Date_p3_dark.*JY145_dark_overall_average; 
    
    
end

lightMedian=mCherryMedian(lightIndices);
darkMedian=mCherryMedian(darkIndices);
lightCV=mCherryCV(lightIndices);
darkCV=mCherryCV(darkIndices);      
lightFiles=file(lightIndices);
darkFiles=file(darkIndices);

%Outlier analysis. Determine which samples are outliers for their
%conditions

i=1;
lightMedianNew=zeros(80,length(listOfStrains));
darkMedianNew=zeros(80,length(listOfStrains));
fileNew=num2cell(NaN(80,length(listOfStrains)));
lightOutliers=0;
names=num2cell(NaN(length(listOfStrains),1));
while i<=length(listOfStrains)
  Light_indices1=strcmp(lightStrain,listOfStrains(i));
  Dark_indices1=strcmp(darkStrain,listOfStrains(i));
  names_index=(strcmp(TransName,listOfStrains(i)));
  names(i)=listOfStrains(i);
  
  tempLightMedian=zeros(80,1);
  tempDarkMedian=zeros(80,1);
  tempLightCV=zeros(80,1);
  tempDarkCV=zeros(80,1);
  tempLightFiles=num2cell(zeros(80,1));

  tempLightMedian(1:sum(Light_indices1))=lightMedian(Light_indices1);
  tempDarkMedian(1:sum(Dark_indices1))=darkMedian(Dark_indices1);
  tempLightFiles(1:sum(Dark_indices1))=darkFiles(Dark_indices1);
  tempLightCV(1:sum(Light_indices1))=lightCV(Light_indices1);
  tempDarkCV(1:sum(Dark_indices1))=darkCV(Dark_indices1);
  
   lightOutliers=isoutlier(lightMedian(Light_indices1));
   lightOutliersCV=isoutlier(lightCV(Light_indices1));
   darkOutliers=isoutlier(darkMedian(Dark_indices1));
   darkOutliersCV=isoutlier(darkCV(Dark_indices1));
   
   %tempLightMedian(lightOutliers)=NaN;
   %tempDarkMedian(darkOutliers)=NaN;
   
%    tempLightCV(lightOutliersCV)=NaN;
%    tempDarkCV(darkOutliersCV)=NaN;
%    tempLightFiles(lightOutliers)={NaN};
%    tempLightMedian(tempLightMedian==0)=NaN;
%    tempDarkMedian(tempDarkMedian==0)=NaN;
%    tempLightCV(tempLightCV==0)=NaN;
%    tempDarkCV(tempDarkCV==0)=NaN;
   
   lightMedianNew(:,i)=tempLightMedian;
   darkMedianNew(:,i)=tempDarkMedian;
   fileNew(:,i)=tempLightFiles;
   lightCVNew(:,i)=tempLightCV;
   darkCVNew(:,i)=tempDarkCV;
   
   %Find the mean for each set of replicates
   averageLightMedian(i)=nanmean(tempLightMedian);
   averageDarkMedian(i)=nanmean(tempDarkMedian);
   averageLightCV(i)=nanmean(tempLightCV);
   averageDarkCV(i)=nanmean(tempDarkCV);
    i=i+1;
end

%find Y11 average
Y11_average=averageDarkMedian(strcmp(listOfStrains,'Y11'));


LightCVstd=nanstd(lightCVNew);



%foldChange1: fold change by dividing each strain individually and normalizing to the
%strain incubated in the dark
foldChange1=lightMedianNew./(darkMedianNew);
X=categorical(listOfStrains);
foldChange1_average=nanmean(foldChange1);
[foldChange1_sorted,ind]=sort(foldChange1_average);
names_sorted=names(ind);
foldChange1Std=nanstd(foldChange1);

%fluorescence: fold change by dividing each strain individually and normalizing to the
%reporter (JY28)
Reporter_average=averageDarkMedian(strcmp(listOfStrains,'JY28'));
fluorescence_light=(lightMedianNew)./(Reporter_average);
fluorescence_dark=(darkMedianNew)./(Reporter_average);
fluorescence_light_average=nanmean(fluorescence_light);
fluorescence_dark_average=nanmean(fluorescence_dark);
fluorescence_Std=[nanstd(fluorescence_light); nanstd(fluorescence_dark)];
fluorescence_Std=fluorescence_Std';

%foldChange3: fold change by dividing then averaging to the strain incubated in
%the dark
foldChange3_notaveraged=(lightMedianNew)./(averageDarkMedian);
foldChange3=nanmean(foldChange3_notaveraged);
foldChange3_stdev=nanstd(foldChange3_notaveraged);




Table1=[foldChange1_average',fluorescence_dark_average',fluorescence_light_average',foldChange3',averageDarkCV',averageLightCV'];
% %Table1.Properties.VariableNames={'CR','Fold_Change_1','Dark_FC_2', 'Light_FC_2','Fold_Change_3', 'Dark_CV','Light_CV'};



end
