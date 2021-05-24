%
%% CRCodeForMI
%Written by Jessica Lee on 03/18/2020
%Updated on 05/24/2021 to be used for revision experiments (Truncated FM,
%AM, and PWM). Have to change the file names manually

% The following uses the data files from CR screen. It calculates the max 
% mutual information as seen in Hansen, A S and E K O'Shea, 2015. Found <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4468373/. 
% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4468373/.> It also uses the code 
% (BlahutArimoto.m derived from <https://gist.github.com/Piyush3dB/01df75af9889414de1b6. 
% 
% 
%
% Updated on 08/22/2020 to fix range of Imax calculation and utilize new
% spreadsheet
% 

clear all
global p m n
%Get names of files from MIsamples.xlsx
[~,~,Cond1_import]=xlsread('Excel Files/Truncated_FM','Cond1');
[~,~,Cond2_import]=xlsread('Excel Files/Truncated_FM','Cond2');
[~,~,Cond3_import]=xlsread('Excel Files/Truncated_FM','Cond3');
plate_cond1=Cond1_import(2:end,9);
plate_cond2=Cond2_import(2:end,9);
plate_cond3=Cond3_import(2:end,9);

CRs_cond1=Cond1_import(2:end,7);
CRs_cond2=Cond2_import(2:end,7);
CRs_cond3=Cond3_import(2:end,7);


date_cond1=Cond1_import(2:end,10);
date_cond2=Cond2_import(2:end,10);
date_cond3=Cond3_import(2:end,10);

files_cond1=Cond1_import(2:end,11);
files_cond2=Cond2_import(2:end,11);
files_cond3=Cond3_import(2:end,11);




list_CRs=unique([CRs_cond1;CRs_cond2;CRs_cond3]);
l=3;
    temp_cond0_ind=[];
    temp_cond1_ind=[];
    temp_cond2_ind=[];
    temp_cond3_ind=[];
cd('/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/Revision figures/Flow cytometry files')
for r=16
    
    if strcmp(list_CRs(r),'JY145')==1
            temp_cond0_ind=find(strcmp(CRs_cond1,list_CRs(r))==1 & strcmp(plate_cond1,'dark')==1 & strcmp(Cond1_import(2:end,8),'Control')~=1);
    temp_cond1_ind=find(strcmp(CRs_cond1,list_CRs(r))==1 & strcmp(plate_cond1,'dark')~=1  & strcmp(Cond1_import(2:end,8),'Control')~=1);
    temp_cond2_ind=find(strcmp(CRs_cond2,list_CRs(r))==1 & strcmp(plate_cond2,'dark')~=1  & strcmp(Cond2_import(2:end,8),'Control')~=1);
    temp_cond3_ind=find(strcmp(CRs_cond3,list_CRs(r))==1 & strcmp(plate_cond3,'dark')~=1  & strcmp(Cond3_import(2:end,8),'Control')~=1);
    elseif strcmp(list_CRs,'Y11')==1
    elseif strcmp(list_CRs,'JY28')==1
    else
    temp_cond0_ind=find(strcmp(CRs_cond1,list_CRs(r))==1 & strcmp(plate_cond1,'dark')==1);
    temp_cond1_ind=find(strcmp(CRs_cond1,list_CRs(r))==1 & strcmp(plate_cond1,'dark')~=1);
    temp_cond2_ind=find(strcmp(CRs_cond2,list_CRs(r))==1 & strcmp(plate_cond2,'dark')~=1);
    temp_cond3_ind=find(strcmp(CRs_cond3,list_CRs(r))==1 & strcmp(plate_cond3,'dark')~=1);
    end
    %Order the samples/replicates so they are the same for all conditions
    [~,I]=sort(files_cond1(temp_cond0_ind));
    temp_cond0_ind=temp_cond0_ind(I);
    [~,I]=sort(files_cond1(temp_cond1_ind));
    temp_cond1_ind=temp_cond1_ind(I);
    [~,I]=sort(files_cond2(temp_cond2_ind));
    temp_cond2_ind=temp_cond2_ind(I);
    [~,I]=sort(files_cond3(temp_cond3_ind));
    temp_cond3_ind=temp_cond3_ind(I);
    for j=1:length(temp_cond0_ind)
        Y=NaN*ones(4,20000);
        Cond0_folder=strcat(string(date_cond1(temp_cond0_ind(j))),'/',plate_cond1(temp_cond0_ind(j)));
        Cond0_file=files_cond1(temp_cond0_ind(j));
        name=char(strcat(Cond0_folder,'/',Cond0_file));
Y1=csvread(name,1,0);
Order_files(l)=Cond0_file;
mCherry=Y1(:,6);
FSC_A=Y1(:,1);
FSC_H=Y1(:,2);
SSC_A=Y1(:,3);
radius=.7;
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
Both_Gates=(Gate+Gate2==2);
%mCherry=mCherry(Both_Gates)./FSC_A(Both_Gates).*10;%correct for size
mCherry=mCherry(Both_Gates).*100;
if length(mCherry)>20000
Y(1,1:20000)=mCherry(1:20000);
numb_of_cells(1,l)=20000;
else
    Y(1,1:length(mCherry))=mCherry;
    numb_of_cells(1,l)=length(mCherry);
end

Cond1_folder=strcat(string(date_cond1(temp_cond1_ind(j))),'/',string(plate_cond1(temp_cond1_ind(j))));
        Cond1_file=files_cond1(temp_cond1_ind(j));
        name=char(strcat(Cond1_folder,'/',Cond1_file));     
       Y2=csvread(name,1,0);
mCherry=Y2(:,6);
FSC_A=Y2(:,1);
FSC_H=Y2(:,2);
SSC_A=Y2(:,3);
log_FSC=log10(FSC_A);
log_FSC_H=log10(FSC_H);
log_SSC=log10(SSC_A);
%med_FSC=median(FSC_A);
%med_SSC=median(SSC_A);
med_FSC=median(log_FSC);
med_SSC=median(log_SSC);
k=log_SSC./log_FSC;
med_k=median(k);
%Gate=FSC_A>med_FSC-radius & FSC_A<med_FSC+radius;%Gate for FSC-A<=radius au
Gate=(log_FSC-med_FSC).^2+(k-med_k).^2<=radius^2;
Gate2=(log_FSC_H)./log_FSC>median(log_FSC_H./log_FSC)-.1 & (log_FSC_H)./log_FSC<median(log_FSC_H./log_FSC)+.1;
Both_Gates=(Gate+Gate2==2);
%mCherry=mCherry(Both_Gates)./FSC_A(Both_Gates).*10;%correct for size
mCherry=mCherry(Both_Gates).*100;
if length(mCherry)>20000
Y(2,1:20000)=mCherry(1:20000);

numb_of_cells(2,l)=20000;
else
    Y(2,1:length(mCherry))=mCherry;
    numb_of_cells(2,l)=length(mCherry);
end
        
   
Cond2_folder=strcat(string(date_cond2(temp_cond2_ind(j))),'/',string(plate_cond2(temp_cond2_ind(j))));
        Cond2_file=files_cond2(temp_cond2_ind(j));
        name=char(strcat(Cond2_folder,'/',Cond2_file));   
        Y3=csvread(name,1,0);
mCherry=Y3(:,6);
FSC_A=Y3(:,1);
FSC_H=Y3(:,2);
SSC_A=Y3(:,3);
log_FSC=log10(FSC_A);
log_FSC_H=log10(FSC_H);
log_SSC=log10(SSC_A);
%med_FSC=median(FSC_A);
%med_SSC=median(SSC_A);
med_FSC=median(log_FSC);
med_SSC=median(log_SSC);
k=log_SSC./log_FSC;
med_k=median(k);
%Gate=FSC_A>med_FSC-radius & FSC_A<med_FSC+radius;%Gate for FSC-A<=radius au
Gate=(log_FSC-med_FSC).^2+(k-med_k).^2<=radius^2;
Gate2=(log_FSC_H)./log_FSC>median(log_FSC_H./log_FSC)-.1 & (log_FSC_H)./log_FSC<median(log_FSC_H./log_FSC)+.1;
Both_Gates=(Gate+Gate2==2);
%mCherry=mCherry(Both_Gates)./FSC_A(Both_Gates).*10;%correct for size
mCherry=mCherry(Both_Gates).*100; %not size corrected
if length(mCherry)>20000
Y(3,1:20000)=mCherry(1:20000);

numb_of_cells(3,l)=20000;
else
    Y(3,1:length(mCherry))=mCherry;
    numb_of_cells(3,l)=length(mCherry);
end

Cond3_folder=strcat(string(date_cond3(temp_cond3_ind(j))),'/',string(plate_cond3(temp_cond3_ind(j))));
        Cond3_file=files_cond3(temp_cond3_ind(j));
        name=char(strcat(Cond3_folder,'/',Cond3_file));   
        Y4=csvread(name,1,0);
mCherry=Y4(:,6);
FSC_A=Y4(:,1);
FSC_H=Y4(:,2);
SSC_A=Y4(:,3);
log_FSC=log10(FSC_A);
log_FSC_H=log10(FSC_H);
log_SSC=log10(SSC_A);
%med_FSC=median(FSC_A);
%med_SSC=median(SSC_A);
med_FSC=median(log_FSC);
med_SSC=median(log_SSC);
k=log_SSC./log_FSC;
med_k=median(k);
%Gate=FSC_A>med_FSC-radius & FSC_A<med_FSC+radius;%Gate for FSC-A<=radius au
Gate=(log_FSC-med_FSC).^2+(k-med_k).^2<=radius^2;
Gate2=(log_FSC_H)./log_FSC>median(log_FSC_H./log_FSC)-.1 & (log_FSC_H)./log_FSC<median(log_FSC_H./log_FSC)+.1;
Both_Gates=(Gate+Gate2==2);
%mCherry=mCherry(Both_Gates)./FSC_A(Both_Gates).*10;%correct for size
mCherry=mCherry(Both_Gates).*100;
if length(mCherry)>20000
Y(4,1:20000)=mCherry(1:20000);

numb_of_cells(4,l)=20000;
else
    Y(4,1:length(mCherry))=mCherry;
    numb_of_cells(4,l)=length(mCherry);
end




%Y=log(Y);
%Discretized data, save as y1
m=4;%number of conditions/inputs
%n=[30:10:100];%number of bins
index2=1;
n1=10:10:800;%not size corrected
%n1=5:1:50;%size corrected
for n=n1
    index1=1;
    rangeofcells=5000:2000:20000;
    for k=rangeofcells
        y1=Y(:,1:k);
        edges=logspace(.1,4,n);
[y1,E]=discretize(y1,edges);
%Find probability
p=zeros(m,n);
for i=1:m
    numberOfCells=sum(~isnan(y1(i,:)));
    for j=1:n
        numberOfCellsInBin=sum(length(find(y1(i,:)==j)));
        p(i,j)=numberOfCellsInBin/numberOfCells;
    end
end
%%
%Remove bins with 0 probability
binProbability=sum(p);
p(:,binProbability==0)=[];
%Run Blahut Arimoto from GitHub%
[C(index1),~]=BlahutArimoto(p);
%Run minimization
%[C(index1)]=MaxMutualInfo
index1=index1+1;
    end
    
    plot(1./rangeofcells,C,'ok');
    b=polyfit(1./rangeofcells,C,1);
    C_hat=polyval(b,[0 1./rangeofcells]);
    
     hold on
     plot([0 1./rangeofcells],C_hat)
     hold off
    
%%
%Find channel capacity,C
index=n/5;
C_unbiased(index2)=b(2);
index2=index2+1;
end
%plot C vs number of bins

plot(n1,C_unbiased)
xlabel('number of bins'), ylabel('Mutual information (bits)')
C2=C_unbiased(21:41);
Imax(l)=mean(C2)
Imaxrange(l)=std(C2)

        l=l+1;
        
    end
%Find max fluorescence and put into single matrix, Y











end
Imax=Imax';
Imaxrange=Imaxrange';