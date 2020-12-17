%%CV_med_Caluclation requires flow cytometry data
%Written by Jessica Lee 20200718
%Updated 20200919 to change input to condition number and use a single
%spreadsheet.
%Make sure directory is set to folder "Data and codes". Add file to
%directory.Output is mCherry median',Robust CV of
%mCherry as percent,FSC-A,cell/event count, robust CV of FSC-A as percent,
%CV of mCherry as percent

function [G]=CV_med_Calculation
VP16_CR=input('VP16 screen? (1-yes, 2-no) ');
if VP16_CR==1
    
    [allData,names]=xlsread('Excel Files/VP16Analysis.xlsx');
    names=names(:,10);

inverseFrequency=allData(:,3);
PW=allData(:,4);
amplitude=allData(:,5);
AUC=allData(:,6);
plateNumber=allData(:,7);
date=allData(:,9);
Condition=allData(:,11);

list_of_PWs=sort(unique(PW));
list_of_amp=sort(unique(amplitude));
cd('Flow cytometry data')
CV=NaN.*ones(1,length(names));
Fluor=NaN.*ones(1,length(names));
hypot=NaN.*ones(1,length(names));
CV_FSC=NaN.*ones(1,length(names));
FSC=NaN.*ones(1,length(names));

for i=1:length(names)
   i
    if amplitude(i)==0
        S='/dark';
    else
        S=strcat('/P',string(plateNumber(i)),' light');
    end

Cond_file_name=strcat(string(date(i)),S,'/',names(i));
if strcmp(names(i),'')==1
    CV(i)=NaN;
    Fluor(i)=NaN;
else
Y=csvread(Cond_file_name,1,0);
mCherry=Y(:,6);
FSC_A=Y(:,1);
FSC_H=Y(:,2);
SSC_A=Y(:,3);
%mCherry=mCherry./FSC_A; %size correction used for Figures 3, 5,6
log_FSC=log10(FSC_A);
log_FSC_H=log10(FSC_H);
log_SSC=log10(SSC_A);
radius=.7;
%med_FSC=median(FSC_A);
%med_SSC=median(SSC_A);
med_FSC=median(log_FSC);
med_SSC=median(log_SSC);
k=log_SSC./log_FSC;
med_k=median(k);
%Gate=FSC_A>med_FSC-radius & FSC_A<med_FSC+radius;%Gate for FSC-A<=radius au
Gate=(log_FSC-med_FSC).^2+(k-med_k).^2<=radius^2;
Gate2=(log_FSC_H)./log_FSC>median(log_FSC_H./log_FSC)-.1 & (log_FSC_H)./log_FSC<median(log_FSC_H./log_FSC)+.1;
Both_Gates=(Gate);
% figure
% subplot(2,2,1)
% scatter(FSC_A,SSC_A,1,'filled')
% xlim([0,200])
% ylim([0,200])
% set(gca,'Xscale','log')
% set(gca,'Yscale','log')
% subplot(2,2,2)
% scatter(FSC_A(Gate),SSC_A(Gate),1,'filled')
% xlim([0,200])
% ylim([0,200])
% set(gca,'Xscale','log')
% set(gca,'Yscale','log')
% subplot(2,2,3)
% scatter(FSC_A(Gate),FSC_H(Gate),1,'filled')
% xlim([0,200])
% ylim([0,200])
% set(gca,'Xscale','log')
% set(gca,'Yscale','log')
% subplot(2,2,4)
% scatter(FSC_A(Both_Gates),FSC_H(Both_Gates),1,'filled')
% xlim([0,200])
% ylim([0,200])
% set(gca,'Xscale','log')
% set(gca,'Yscale','log')

ln_mCherry=log(mCherry);
std_ln=std(ln_mCherry);
%CV(i)=sqrt(exp(std_ln.^2)-1);% logarithmic approx
%CV(i)=std_ln/mean(ln_mCherry);
CV(i)=std(mCherry(Both_Gates))./mean(mCherry(Both_Gates));
CV_robust(i)=.5*(prctile(mCherry(Both_Gates),84.13)-prctile(mCherry(Both_Gates),15.87))/median(mCherry(Both_Gates));%Robust CV
Fluor(i)=median(mCherry(Both_Gates));
hypot(i)=chi2gof(mCherry(Both_Gates));
count(i)=sum(Both_Gates);
CV_FSC(i)=.5*(prctile(Y(Both_Gates,1),84.13)-prctile(Y(Both_Gates,1),15.87))/median(Y(Both_Gates,1));%Robust CV
FSC(i)=median(FSC_A);
end
end

G=table(Fluor',CV_robust'.*100,FSC',count',CV_FSC'.*100,CV'.*100);
writetable(G,'test.xlsx')

else
    Cond=input('Frequency condition number? (1,2,3) ');


if Cond==1
    [allData,text]=xlsread('Excel Files/CRAnalysis','Cond1');
    condition='Cond1';
elseif Cond==2
    [allData,text]=xlsread('Excel Files/CRAnalysis','Cond2');
    condition='Cond2';
elseif Cond==3
    [allData,text]=xlsread('Excel Files/CRAnalysis','Cond3');
    condition='Cond3';
else
    fprintf('Error with condition number')
    
end
plateNumber=allData(:,10);
count=allData(:,4);
Date=allData(:,11);
mCherryMedian=allData(:,1);
names=text(:,5);
lightcond=text(:,2);


CV=NaN.*ones(1,length(names));
Fluor=NaN.*ones(1,length(names));
hypot=NaN.*ones(1,length(names));
CV_FSC=NaN.*ones(1,length(names));
FSC=NaN.*ones(1,length(names));
cd('Flow cytometry data')
for i=1:length(names)

S=strcat(condition,'/',string(Date(i)),'/P',string(plateNumber(i)));
S=strjoin([S,lightcond(i)]);
   

Cond_file_name=strcat(S,'/',names(i));
i
if strcmp(lightcond(i),'na')==1 
    CV(i)=NaN;
    Fluor(i)=NaN;
elseif strcmp(text(i,1),'na')==1
    CV(i)=NaN;
    Fluor(i)=NaN;
elseif strcmp(text(i,1),'')==1
    CV(i)=NaN;
    Fluor(i)=NaN;
else
Y=csvread(Cond_file_name,1,0);
if isempty(Y)==1
    CV(i)=NaN;
    Fluor(i)=NaN;
else
mCherry=Y(:,6);
FSC_A=Y(:,1);
FSC_H=Y(:,2);
SSC_A=Y(:,3);
log_FSC=log10(FSC_A);
log_FSC_H=log10(FSC_H);
log_SSC=log10(SSC_A);
radius=.7;

med_FSC=median(log_FSC);
med_SSC=median(log_SSC);
k=log_SSC./log_FSC;
med_k=median(k);

Gate=(log_FSC-med_FSC).^2+(k-med_k).^2<=radius^2;
Gate2=(log_FSC_H)./log_FSC>median(log_FSC_H./log_FSC)-.1 & (log_FSC_H)./log_FSC<median(log_FSC_H./log_FSC)+.1;
Both_Gates=(Gate+Gate2==2);
% figure
% subplot(2,2,1)
% scatter(FSC_A,SSC_A,1,'filled')
% xlim([0,200])
% ylim([0,200])
% set(gca,'Xscale','log')
% set(gca,'Yscale','log')
% subplot(2,2,2)
% scatter(FSC_A(Gate),SSC_A(Gate),1,'filled')
% xlim([0,200])
% ylim([0,200])
% set(gca,'Xscale','log')
% set(gca,'Yscale','log')
% subplot(2,2,3)
% scatter(FSC_A(Gate),FSC_H(Gate),1,'filled')
% xlim([0,200])
% ylim([0,200])
% set(gca,'Xscale','log')
% set(gca,'Yscale','log')
% subplot(2,2,4)
% scatter(FSC_A(Both_Gates),FSC_H(Both_Gates),1,'filled')
% xlim([0,200])
% ylim([0,200])
% set(gca,'Xscale','log')
% set(gca,'Yscale','log')

ln_mCherry=log(mCherry);
std_ln=std(ln_mCherry);

CV(i)=std(mCherry(Both_Gates))./mean(mCherry(Both_Gates));
CV_robust(i)=.5*(prctile(mCherry(Both_Gates),84.13)-prctile(mCherry(Both_Gates),15.87))/median(mCherry(Both_Gates));%Robust CV
Fluor(i)=median(mCherry(Both_Gates));
hypot(i)=chi2gof(mCherry(Both_Gates));
count(i)=sum(Both_Gates);
CV_FSC(i)=.5*(prctile(Y(Both_Gates,1),84.13)-prctile(Y(Both_Gates,1),15.87))/median(Y(Both_Gates,1));%Robust CV
FSC(i)=median(FSC_A);
end
end

end
[Corr,Corr_p]=corrcoef(FSC(~isnan(Fluor)),Fluor(~isnan(Fluor)))

G=table(Fluor',CV_robust'.*100,FSC',count,CV_FSC'.*100,CV'.*100);
writetable(G,'test.xlsx')
end