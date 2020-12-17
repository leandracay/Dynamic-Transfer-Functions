%%CodeForMI.m calculate the maximal mutual information, Imax, for VP16 only
%%data. Calculates Imax for different modes of modulation: frequency,
%%amplitue, and pulse width.
%Requires the additional codes of BlahutArimoto.m and MIfunction_revised.m
%Input is VP16Analysis.xlsx
%Also requires MIfunction.m and flowcytometry data
%Written by Jessica Lee on 20200731
%close all
clear all
global p m n
%Find max fluorescence and put into single matrix, Y
[allData,names]=xlsread('Excel Files/VP16Analysis.xlsx');
names=names(:,5);
mCherryMedian=allData(:,1);
mCherryCV=allData(:,2)./100;
inverseFrequency=allData(:,3);
PW=allData(:,4);
amplitude=allData(:,5);
AUC=allData(:,6);
plateNumber=allData(:,7);
date=allData(:,9);
Condition=allData(:,11);
%remove always on
indices=find(PW~=50400);
PW=PW(indices);
inverseFrequency=inverseFrequency(indices);
amplitude=amplitude(indices);
plateNumber=plateNumber(indices);
date=date(indices);
names=names(indices);
Condition=Condition(indices);

list_of_PWs=sort(unique(PW));
list_of_amp=sort(unique(amplitude));
Cond0_file_name=names(25:28);
P=string(['/P';'/P';'/P';'/P']);
S=string([' light/';' light/';' light/';' light/' ]);
Cond0_file_name=strcat(string(date(25:28)),'/dark','/',Cond0_file_name);
cd('Flow cytometry data')
%% 

%FM
PW_FM=[];
Amp_FM=[];

for i=2:6 %keep PW constant
for j=2:5 %skip over A=0
    
    list_of_infreq=sort(unique(inverseFrequency(PW==list_of_PWs(i) & amplitude==list_of_amp(j))));
    %Cond_file_names=cell(4,length(list_of_infreq));
    Cond_file_names=strings(4,2);
    
 
    for k=1:length(list_of_infreq)
        temp=names(PW==list_of_PWs(i) & amplitude==list_of_amp(j) & inverseFrequency==list_of_infreq(k));
        temp1=date(PW==list_of_PWs(i) & amplitude==list_of_amp(j) & inverseFrequency==list_of_infreq(k));
        temp2=plateNumber(PW==list_of_PWs(i) & amplitude==list_of_amp(j) & inverseFrequency==list_of_infreq(k));
        Cond_file_names(:,k)=strcat(string(temp1(1:4)),P,string(temp2(1:4)),S,temp(1:4));
    end

    for l=1:4
    [Imax_FM(l).r(i-1,j-1),Imax_range_FM(l).r(i-1,j-1)]=MIfunction(Cond0_file_name(l),Cond_file_names(l,:));
     end
    Imax_FM_re((i-2)*4+j-1,:)=([Imax_FM(1).r(i-1,j-1); Imax_FM(2).r(i-1,j-1);Imax_FM(3).r(i-1,j-1);Imax_FM(4).r(i-1,j-1)]);
    PW_FM((i-2)*4+j-1)=list_of_PWs(i);
    Amp_FM((i-2)*4+j-1)=list_of_amp(j);
end
Imax_FM_re1=Imax_FM(1).r';
Imax_FM_re1=Imax_FM_re1(:);
Imax_FM_re2=Imax_FM(2).r';
Imax_FM_re2=Imax_FM_re2(:);
Imax_FM_re3=Imax_FM(3).r';
Imax_FM_re3=Imax_FM_re3(:);
Imax_FM_re4=Imax_FM(4).r';
Imax_FM_re4=Imax_FM_re4(:);
Imax_FM_re1=[Imax_FM_re1' Imax_FM_re2' Imax_FM_re3' Imax_FM_re4'];

    
end
PW_FM=[PW_FM PW_FM PW_FM PW_FM];
Amp_FM=[Amp_FM Amp_FM Amp_FM Amp_FM];
%% 


%AM
for i=2:6
    list_of_infreq=sort(unique(inverseFrequency(PW==list_of_PWs(i))));
for j=1:length(list_of_infreq)
    
    Cond_file_names=strings(4,4);
    for k=2:5 %skip over A=0
        temp=names(PW==list_of_PWs(i) & inverseFrequency==list_of_infreq(j) & amplitude==list_of_amp(k));
        if isempty(temp)==1
            Cond_file_names(:,k-1)='';
        else
        temp1=date(PW==list_of_PWs(i) & amplitude==list_of_amp(k) & inverseFrequency==list_of_infreq(j));
        temp2=plateNumber(PW==list_of_PWs(i) & amplitude==list_of_amp(k) & inverseFrequency==list_of_infreq(j));
        Cond_file_names(:,k-1)=strcat(string(temp1(1:4)),P,string(temp2(1:4)),S,temp(1:4));
        end
    end
    if sum(strcmp(Cond_file_names,''),'all')>0
       for l=1:4 
        Imax_AM(l).p(i-1,j)=NaN;
        Imax_range_AM(l).p(i-1,j)=NaN;
       end
    else
    for l=1:4
        [Imax_AM(l).p(i-1,j),Imax_range_AM(l).p(i-1,j)]=MIfunction(Cond0_file_name(l),Cond_file_names(l,:));
    end
    end
    
     PW_AM((i-2)*6+j)=list_of_PWs(i);
    infreq_AM((i-2)*6+j)=list_of_infreq(j);
end

end
Imax_AM_re1=Imax_AM(1).p';
Imax_AM_re1=Imax_AM_re1(:);
Imax_AM_re2=Imax_AM(2).p';
Imax_AM_re2=Imax_AM_re2(:);
Imax_AM_re3=Imax_AM(3).p';
Imax_AM_re3=Imax_AM_re3(:);
Imax_AM_re4=Imax_AM(4).p';
Imax_AM_re4=Imax_AM_re4(:);
Imax_AM_re=[Imax_AM_re1' Imax_AM_re2' Imax_AM_re3' Imax_AM_re4'];

PW_AM=[PW_AM PW_AM PW_AM PW_AM];
infreq_AM=[infreq_AM infreq_AM infreq_AM infreq_AM];

%% 
%PWM
for i=2:5%keep A constant
    list_of_infreq=[7200 16800 50400];
for j=1:length(list_of_infreq)% go through frequencies
    
    Cond_file_names=strings(4,3);
    for k=4:6 
        temp=names(PW==list_of_PWs(k) & inverseFrequency==list_of_infreq(j) & amplitude==list_of_amp(i));
        if isempty(temp)==1
            Cond_file_names(:,k-1)='';
        else
        temp1=date(PW==list_of_PWs(k) & amplitude==list_of_amp(i) & inverseFrequency==list_of_infreq(j));
        temp2=plateNumber(PW==list_of_PWs(k) & amplitude==list_of_amp(i) & inverseFrequency==list_of_infreq(j));
        Cond_file_names(:,k-3)=strcat(string(temp1(1:4)),P,string(temp2(1:4)),S,temp(1:4));
        end
    end
    if sum(strcmp(Cond_file_names,''),'all')>0
       for l=1:4 
        Imax_PWM(l).s(i-1,j)=NaN;
        Imax_range_PWM(l).s(i-1,j)=NaN;
       end
    else
    for l=1:4
        [Imax_PWM(l).s(i-1,j),Imax_range_PWM(l).s(i-1,j)]=MIfunction(Cond0_file_name(l),Cond_file_names(l,:));
    end
    end
    
     amp_PWM((i-2)*3+j)=list_of_amp(i);
    infreq_PWM((i-2)*3+j)=list_of_infreq(j);
end

end
Imax_PWM_re1=Imax_PWM(1).s';
Imax_PWM_re1=Imax_PWM_re1(:);
Imax_PWM_re2=Imax_PWM(2).s';
Imax_PWM_re2=Imax_PWM_re2(:);
Imax_PWM_re3=Imax_PWM(3).s';
Imax_PWM_re3=Imax_PWM_re3(:);
Imax_PWM_re4=Imax_PWM(4).s';
Imax_PWM_re4=Imax_PWM_re4(:);
Imax_PWM_re=[Imax_PWM_re1' Imax_PWM_re2' Imax_PWM_re3' Imax_PWM_re4'];

amp_PWM=[amp_PWM amp_PWM amp_PWM amp_PWM];
infreq_PWM=[infreq_PWM infreq_PWM infreq_PWM infreq_PWM];
%% All modulations

list_of_conditions=unique(Condition(Condition~=0));
Cond_file_names=strings(4,length(list_of_conditions));
for i=1:length(list_of_conditions)
    temp=names(Condition==list_of_conditions(i));
        if isempty(temp)==1
            Cond_file_names(:,i)='';
        else
        temp1=date(Condition==list_of_conditions(i));
        temp2=plateNumber(Condition==list_of_conditions(i));
        Cond_file_names(:,i)=strcat(string(temp1(1:4)),P,string(temp2(1:4)),S,temp(1:4));
        end
end  

if sum(strcmp(Cond_file_names,''),'all')>0
       for l=1:4 
        Imax_PWM(l)=NaN;
        Imax_range_PWM(l)=NaN;
       end
else
    for l=1:4
        [Imax_all(l),Imax_range_all(l)]=MIfunction(Cond0_file_name(l),Cond_file_names(l,:));
    end
end

%% 
size_marker=[50, 70, 100, 140]; %[6e9, 1.2e10, 4e10, 6e10]
size_marker_1e10=70;
size_marker_4e10=100;
size_marker_6e10=140;
color_PWM=[linspace(1,0,20)', linspace(1,0,20)',linspace(1,0,20)'];
color(1).h=[linspace(1,0,20)',linspace(1,0,20)',linspace(1,.2,20)'];
color(2).h=[linspace(1,0,20)',linspace(1,.2,20)',linspace(1,.7,20)'];
color(3).h=[linspace(1,.05,20)',linspace(1,.5,20)',linspace(1,.4,20)'];
color(4).h=[linspace(1,.9,20)',linspace(1,0,20)',linspace(1,1,20)'];
color(5).h=[linspace(1,1,20)',linspace(1,.7,20)',linspace(1,0,20)'];
anovan(Imax_AM_re,{PW_AM,infreq_AM});

%Imax_AM vs Frequency
figure
hold on
colors=['y','m','c','r','g'];
for i=2:6
    list_of_infreq=sort(unique(1./inverseFrequency(PW==list_of_PWs(i))));
    for j=1:length(list_of_infreq)
        frequency_color=round(j*2+j^3/343*8+3);
        dot_color=color_PWM(frequency_color,:);
scatter(mean(1./infreq_AM(infreq_AM==1./list_of_infreq(j) & PW_AM==list_of_PWs(i))),mean(Imax_AM_re(infreq_AM==1./list_of_infreq(j) & PW_AM==list_of_PWs(i))),140,dot_color,'filled')
    end
end
xlim([.5e-6,1])
ylim([0,1.6])
%legend('PW=5 sec','PW=120 sec','PW=600 sec','PW=1800 sec','PW=3600 sec')
xlabel('Frequency (sec^-^1)'),ylabel('I_m_a_x_A_M (bits)')
set(gca,'linewidth',1.5,'ticklength',[0.015 0.015])
grid off
set(gca,'XScale','log')
hold off
saveas(gcf,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/Imax_AMvsFreq.png')
%anovan(Imax_FM_re1,{PW_FM,Amp_FM})

%Imax_AM vs PW
figure
hold on
colors=['y','m','c','r','g'];
for i=2:6
    list_of_infreq=sort(unique(1./inverseFrequency(PW==list_of_PWs(i))));
    for j=1:length(list_of_infreq)
        frequency_color=round(j*2+j^3/343*8+3);
        dot_color=color_PWM(frequency_color,:);
scatter(mean(PW_AM(infreq_AM==1./list_of_infreq(j) & PW_AM==list_of_PWs(i))),mean(Imax_AM_re(infreq_AM==1./list_of_infreq(j) & PW_AM==list_of_PWs(i))),140,dot_color,'filled')
    end
end
xlim([4.5,3600])
ylim([0,1.6])
%legend('PW=5 sec','PW=120 sec','PW=600 sec','PW=1800 sec','PW=3600 sec')
xlabel('PW (sec)'),ylabel('I_m_a_x_A_M (bits)')

grid off
set(gca,'XScale','log')
set(gca,'linewidth',1.5,'ticklength',[0.015 0.015])
hold off
saveas(gcf,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/Imax_AMvsPW.png')
%Imax FM vs amplitude

figure
hold on
for i=2:6
    frequency_color=round(i*3+i^3/343*8-3);
    for j=2:5
        dot_size=size_marker(j-1);
        dot_color=color_PWM(frequency_color,:);
scatter(mean(Amp_FM(PW_FM==list_of_PWs(i) & Amp_FM==list_of_amp(j))),mean(Imax_FM_re1(PW_FM==list_of_PWs(i) & Amp_FM==list_of_amp(j))),140,dot_color,'filled')
    end
end

%legend('PW=5 sec','PW=120 sec','PW=600 sec','PW=1800 sec','PW=3600 sec')
xlabel('Amplitude (au)'),ylabel('I_m_a_x_F_M (bits)')
xlim([5e9,1e11])
ylim([0,1.6])
set(gca,'XScale','log')
grid off
set(gca,'linewidth',1.5,'ticklength',[0.015 0.015])
saveas(gcf,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/Imax_FMvsAmp.png')

%Imax FM vs PW
figure
hold on
for i=2:6
    for j=2:5
        dot_size=size_marker(j-1);
         frequency_color=round(j*3+j^3/343*8+2);
         dot_color=color_PWM(frequency_color,:);
scatter(mean(PW_FM(PW_FM==list_of_PWs(i) & Amp_FM==list_of_amp(j))),mean(Imax_FM_re1(PW_FM==list_of_PWs(i) & Amp_FM==list_of_amp(j))),140,dot_color,'filled')
    end
end
xlim([.5e-6,1])
ylim([5e9,10e11])
%legend('PW=5 sec','PW=120 sec','PW=600 sec','PW=1800 sec','PW=3600 sec')
xlabel('PW (sec)'),ylabel('I_m_a_x_F_M (bits)')
xlim([4.5,3600])
ylim([0,1.6])
set(gca,'XScale','log')
grid off
set(gca,'linewidth',1.5,'ticklength',[0.015 0.015])
saveas(gcf,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/Imax_FMvsPW.png')


%Imax PWM vs amplitude
figure
hold on
list_of_infreq=[50400 16800 7200];
color_PWM=[linspace(1,0,20)', linspace(1,0,20)',linspace(1,0,20)'];
for i=2:5
    for j=1:3
        frequency_color=round(j*3+j^3/343*8+5);
         dot_color=color_PWM(frequency_color,:);
         dot_size=size_marker(i-1);
%boxplot(Imax_FM_re1(PW_FM==list_of_PWs(i)),Amp_FM(PW_FM==list_of_PWs(i)),'positions',Amp_FM(PW_FM==list_of_PWs(i)),'plotstyle','compact','colors',colors(i-1))
scatter(mean(amp_PWM(infreq_PWM==list_of_infreq(j) & amp_PWM==list_of_amp(i))),mean(Imax_PWM_re(infreq_PWM==list_of_infreq(j) & amp_PWM==list_of_amp(i))),140,dot_color,'filled')
    end
end

%legend('PW=5 sec','PW=120 sec','PW=600 sec','PW=1800 sec','PW=3600 sec')
xlabel('Amplitude (au)'),ylabel('I_m_a_x_P_W_M (bits)')
xlim([5e9,1e11])
ylim([0,1.6])
set(gca,'XScale','log')
set(gca,'linewidth',1.5,'ticklength',[0.015 0.015])
grid off
saveas(gcf,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/Imax_PWMvsAmp.png')
%Imax PW vs Freq
figure
hold on
list_of_infreq=[50400 16800 7200];
for i=2:5
    frequency_color=round(i*3+i^3/343*8+2);
    for j=1:3
         
         dot_color=color_PWM(frequency_color,:);
         dot_size=size_marker(i-1);
%boxplot(Imax_FM_re1(PW_FM==list_of_PWs(i)),Amp_FM(PW_FM==list_of_PWs(i)),'positions',Amp_FM(PW_FM==list_of_PWs(i)),'plotstyle','compact','colors',colors(i-1))
scatter(mean(1./infreq_PWM(infreq_PWM==list_of_infreq(j) & amp_PWM==list_of_amp(i))),mean(Imax_PWM_re(infreq_PWM==list_of_infreq(j) & amp_PWM==list_of_amp(i))),140,dot_color,'filled')
    end
end
ylim([0,1.6])
xlim([.5e-6,1])
set(gca,'linewidth',1.5,'ticklength',[0.015 0.015])
%legend('PW=5 sec','PW=120 sec','PW=600 sec','PW=1800 sec','PW=3600 sec')
xlabel('Frequency (sec^-^1)'),ylabel('I_m_a_x_P_W_M (bits)')
set(gca,'XScale','log')
grid off
saveas(gcf,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/Imax_PWvsFreq.png')
%% histograms
color(1).h=[linspace(1,0,20)',linspace(1,0,20)',linspace(1,.29,20)'];
color(2).h=[linspace(1,.13,20)',linspace(1,.25,20)',linspace(1,.6,20)'];
color(3).h=[linspace(1,.3,20)',linspace(1,.56,20)',linspace(1,.35,20)'];
color(4).h=[linspace(1,.99,20)',linspace(1,.68,20)',linspace(1,.38,20)'];
color(5).h=[linspace(1,.74,20)',linspace(1,.12,20)',linspace(1,.18,20)'];
color(6).h=[linspace(1,.61,20)',linspace(1,.4,20)',linspace(1,.65,20)'];
%for PWM
data_0_1=csvread(Cond0_file_name(1),1,0);
data_0_2=csvread(Cond0_file_name(2),1,0);
data_0_3=csvread(Cond0_file_name(3),1,0);
data_0_4=csvread(Cond0_file_name(4),1,0);
data_0=[data_0_1;data_0_2;data_0_3;data_0_4];
edges=logspace(.1,4,50);


PWs=[600 1800 3600];
PWM_all=figure;

hold on
histogram(data_0(:,6)./data_0(:,1).*10,edges,'FaceColor','k','normalization','probability');
PWM_subplot=figure;

subplot(4,1,1);
histogram(data_0(:,6)./data_0(:,1).*10,edges,'FaceColor','k','normalization','probability');
set(gca,'XScale','log') 
set(gca,'box','off')
set(gca,'linewidth',1.5,'ticklength',[0.01 0.01])
xlim([-1,3000])   
ylim([0,.2]) 
for i=1:3
temp=names(PW==PWs(i) & amplitude==6e10 & inverseFrequency==7200);
        temp1=date(PW==PWs(i) & amplitude==6e10 & inverseFrequency==7200);
        temp2=plateNumber(PW==PWs(i) & amplitude==6e10 & inverseFrequency==7200);
Cond_file_names=strcat(string(temp1(1:4)),P,string(temp2(1:4)),S,temp(1:4));
data1=csvread(Cond_file_names(1),1,0);
data2=csvread(Cond_file_names(2),1,0);
data3=csvread(Cond_file_names(3),1,0);
data4=csvread(Cond_file_names(4),1,0);
data=[data1;data2;data3;data4];
data=data(:,6)./data(:,1).*10;

figure(PWM_all)
histogram(data,edges,'FaceColor',color(i).h(20,:),'normalization','probability','FaceAlpha',1);
set(gca,'XScale','log')
xlim([-1,3000])   
ylim([0,.2])
set(gca,'linewidth',1.5,'ticklength',[0.01 0.01])

figure(PWM_subplot)
subplot(4,1,i+1)
histogram(data,edges,'FaceColor',color(i).h(20,:),'normalization','probability','FaceAlpha',1);
set(gca,'XScale','log')
set(gca,'box','off')
%set(gca,'color','none')
xlim([-1,3000])   
ylim([0,.2])
set(gca,'linewidth',1.5,'ticklength',[0.01 0.01])
end
hold off
%saveas(PWM_subplot,'Histograms/PWM_subplot.png')
saveas(PWM_all,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/PWM_all.png')
%for FM
inFreq=[50400 25200 16800 7200 5600 3877];
FM_all=figure;
hold on

histogram(data_0(:,6)./data_0(:,1).*10,edges,'FaceColor','k','normalization','probability');
xlim([-1,3000])
ylim([0,0.2])
set(gca,'linewidth',1.5,'ticklength',[0.01 0.01])
FM_subplot=figure;
subplot(7,1,1)
histogram(data_0(:,6)./data_0(:,1),edges,'FaceColor','k','normalization','probability');
xlim([-1,3000])
ylim([0,0.2])
set(gca,'XScale','log') 
set(gca,'box','off')
set(gca,'linewidth',1.5,'ticklength',[0.01 0.01])
for i=1:6
   temp=names(PW==3600 & amplitude==6e10 & inverseFrequency==inFreq(i));
        temp1=date(PW==3600 & amplitude==6e10 & inverseFrequency==inFreq(i));
        temp2=plateNumber(PW==3600 & amplitude==6e10 & inverseFrequency==inFreq(i));
        Cond_file_names=strcat(string(temp1(1:4)),P,string(temp2(1:4)),S,temp(1:4));

data1=csvread(Cond_file_names(1),1,0);
data2=csvread(Cond_file_names(2),1,0);
data3=csvread(Cond_file_names(3),1,0);
data4=csvread(Cond_file_names(4),1,0);
data=[data1;data2;data3;data4];
data=data(:,6)./data(:,1).*10;


figure(FM_all)%subplot(7,1,i+1)
histogram(data,edges,'FaceColor',color(i).h(20,:),'normalization','probability','FaceAlpha',1);
set(gca,'XScale','log') 
set(gca,'box','off')
xlim([-1,3000])   
ylim([0,.2]) 
set(gca,'linewidth',1.5,'ticklength',[0.01 0.01])

figure(FM_subplot)
subplot(7,1,i+1)
histogram(data,edges,'FaceColor',color(i).h(20,:),'normalization','probability','FaceAlpha',1);
set(gca,'XScale','log') 
set(gca,'box','off')
xlim([-1,3000])   
ylim([0,.2]) 
end
saveas(FM_all,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/FM_all.png')
%saveas(FM_subplot,'Histograms/FM_subplot.png')
%for AM
Amps=[6e9 1.2e10 4e10 6e10];
AM_all=figure;
hold on
histogram(data_0(:,6)./data_0(:,1).*10,edges,'FaceColor','k','normalization','probability');
AM_subplot=figure;
subplot(5,1,1)
histogram(data_0(:,6)./data_0(:,1).*10,edges,'FaceColor','k','normalization','probability');
set(gca,'XScale','log')
set(gca,'box','off')
xlim([-1,3000])   
ylim([0,.2]) 
for i=1:4
   temp=names(PW==3600 & amplitude==Amps(i) & inverseFrequency==3877);
        temp1=date(PW==3600 & amplitude==Amps(i) & inverseFrequency==3877);
        temp2=plateNumber(PW==3600 & amplitude==Amps(i) & inverseFrequency==3877);
        Cond_file_names=strcat(string(temp1(1:4)),P,string(temp2(1:4)),S,temp(1:4));
data1=csvread(Cond_file_names(1),1,0);
data2=csvread(Cond_file_names(2),1,0);
data3=csvread(Cond_file_names(3),1,0);
%data4=load(Cond_file_names(4));
data=[data1;data2;data3;data4];
data=data(:,6)./data(:,1).*10;
figure(AM_all)
histogram(data,edges,'FaceColor',color(i).h(20,:),'normalization','probability','FaceAlpha',1);
set(gca,'XScale','log')
set(gca,'box','off')
 xlim([-1,3000])   
ylim([0,.2])   
set(gca,'linewidth',1.5,'ticklength',[0.01 0.01])
 figure(AM_subplot)
 subplot(5,1,i+1)
 histogram(data,edges,'FaceColor',color(i).h(20,:),'normalization','probability','FaceAlpha',1);
set(gca,'XScale','log')
set(gca,'box','off')
 xlim([-1,3000])   
ylim([0,.2])  
end
saveas(AM_all,'/Volumes/GoogleDrive/My Drive/Shared folder/YeastLightExperiments/VP16 focused matrix/AM_all.png')
%saveas(AM_subplot,'Histograms/AM_subplot.png')
%% Makes graph of Imax for all modes of modulation vs number of inputs.
Imax_all=[1.347274334	1.361798327	1.462319823	1.416147635	1.565576562	1.656174108	1.656174108	1.687627996	1.680238153	1.671035697	1.696118076	1.692920716
1.455673356	1.259930832	1.454493269	1.458941472	1.58890556	1.671260256	1.671429641	1.694932894	1.72039312	1.69813451	1.701036742	1.708930465
1.536501741	1.472827571	1.538377251	1.568235752	1.581833694	1.66586968	1.666916592	1.689905788	1.699995031	1.691144733	1.694927881	1.6936303
1.430906588	1.360902791	1.459580273	1.489925037	1.608963582	1.701206138	1.701206139	1.732247089	1.744179986	1.726764036	1.736835216	1.720146774]; %Imax results from spreadsheet (which were calculated in "VP16Analysis_allData.m")
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
errorbar(stats_MI.number,stats_MI.mean_MI,stats_MI.sem_MI,'Linewidth',1,'color','k','linestyle','none','capsize',0)

plot(stats_MI.number,stats_MI.mean_MI,'.','color',[0.13,.25,.6],'Markersize',20)
plot(n,Imax_all,'.','color',[.5,.5,.5],'Markersize',10)
set(gca,'linewidth',1.5,'ticklength',[0.01 0.01])
%% heat maps
FM_table=table(Imax_FM_re1',PW_FM',Amp_FM','VariableNames',{'MI_FM','PW','Amplitude'});
figure
h=heatmap(FM_table,'PW','Amplitude','ColorVariable','MI_FM','ColorMethod','mean');
AM_table=table(Imax_AM_re',PW_AM',1./infreq_AM','VariableNames',{'MI_AM','PW','Frequency'});
AM_table=AM_table(~isnan(AM_table.MI_AM),:);
% for i=2:length(list_of_PWs)
%     indices=AM_table.PW==list_of_PWs(i) & AM_table.Frequency<=1/list_of_PWs(i);
%     c=cell(sum(indices),1);
%     c(:)={'Not possible'};
% AM_table.MI_AM(indices,:)=c;
% end
figure
h1=heatmap(AM_table,'PW','Frequency','ColorVariable','MI_AM','ColorMethod','mean');
PWM_table=table(Imax_PWM_re',amp_PWM',1./infreq_PWM','VariableNames',{'MI_PWM','Amplitude','Frequency'});
figure
h3=heatmap(PWM_table,'Amplitude','Frequency','ColorVariable','MI_PWM','ColorMethod','mean');
