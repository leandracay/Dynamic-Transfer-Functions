[allData,names]=xlsread('matlabplot.xlsx');

condition=allData(:,1);
mCherryExp=allData(:,2);
foldChangeExp=allData(:,3);
mCherryModel=allData(:,4);
foldChangeModel=allData(:,5);
inverseFrequency=allData(:,6);
PW=allData(:,7);
amplitude=allData(:,8);
AUC=allData(:,9);

condition(inverseFrequency==1)=NaN;
foldChangeExp(inverseFrequency==1)=NaN;%remove always on condition
mCherryExp(inverseFrequency==1)=NaN;
foldChangeModel(inverseFrequency==1)=NaN;
mCherryModel(inverseFrequency==1)=NaN;
PW(inverseFrequency==1)=NaN;
amplitude(inverseFrequency==1)=NaN;
AUC(inverseFrequency==1)=NaN;
inverseFrequency(inverseFrequency==1)=NaN;
foldChangeNew=foldChangeExp;

Frequency=1./inverseFrequency;


color=[0,0,0.29;
  0.13,.25,.6;
  .3,.56,.35;
  .99,0.68,.38;
  .74,.12,.18;
  .61,.4,.65;
  0,0,0;
  0,.8,1;
  0,1,0;];
size_marker=NaN*ones(length(Frequency),1);
size_marker(amplitude==60)=100;
size_marker(amplitude==120)=100;
size_marker(amplitude==400)=100;
size_marker(amplitude==1800)=100;

%shape_marker=[];
shape_marker(1)='-';
shape_marker(2)='o';
shape_marker(3)='o';
shape_marker(4)='o';
shape_marker(5)='o';

%Figure 13
figure
set(gca,'FontName','Arial')
%subplot(2,2,1)
hold on
plot(Frequency(PW==5 & amplitude==60),foldChangeModel(PW==5 & amplitude==60),'-','color',[0,0,0.29],'LineWidth',1)
plot(Frequency(PW==5 & amplitude==60),foldChangeExp(PW==5 & amplitude==60),'.','color',[0,0,0.29],'MarkerSize',20)
plot(Frequency(PW==120 & amplitude==60),foldChangeModel(PW==120 & amplitude==60),'-','color',[0.13,.25,.6],'LineWidth',1)
plot(Frequency(PW==120 & amplitude==60),foldChangeExp(PW==120 & amplitude==60),'.','color',[0.13,.25,.6],'MarkerSize',20)
plot(Frequency(PW==600 & amplitude==60),foldChangeModel(PW==600 & amplitude==60),'-','color',[.3,.56,.35],'LineWidth',1)
plot(Frequency(PW==600 & amplitude==60),foldChangeExp(PW==600 & amplitude==60),'.','color',[.3,.56,.35],'MarkerSize',20)
plot(Frequency(PW==1800 & amplitude==60),foldChangeModel(PW==1800 & amplitude==60),'-','color',[.99,0.68,.38],'LineWidth',1)
plot(Frequency(PW==1800 & amplitude==60),foldChangeExp(PW==1800 & amplitude==60),'.','color',[.99,0.68,.38],'MarkerSize',20)
plot(Frequency(PW==3600 & amplitude==60),foldChangeModel(PW==3600 & amplitude==60),'-','color',[.74,.12,.18],'LineWidth',1)
plot(Frequency(PW==3600 & amplitude==60),foldChangeExp(PW==3600 & amplitude==60),'.','color',[.74,.12,.18],'MarkerSize',20)
xlabel('Frequency (1/s)'), ylabel('Fold change')
set(gca,'XScale','log')
set(gca,'YScale','log')
%legend('Model','Experimental')
grid on
xlim([0.00001, 0.1])
ylim([1,200])
title('Amplitude = 60 (a.u.)')
hold off

%subplot(2,2,2)
figure
hold on
set(gca,'FontName','Arial')

plot(Frequency(PW==5 & amplitude==120),foldChangeModel(PW==5 & amplitude==120),'-','color',[0,0,0.29],'LineWidth',1.5)
plot(Frequency(PW==5 & amplitude==120),foldChangeExp(PW==5 & amplitude==120),'.','color',[0,0,0.29],'MarkerSize',25)
plot(Frequency(PW==120 & amplitude==120),foldChangeModel(PW==120 & amplitude==120),'-','color',[0.13,.25,.6],'LineWidth',1.5)
plot(Frequency(PW==120 & amplitude==120),foldChangeExp(PW==120 & amplitude==120),'.','color',[0.13,.25,.6],'MarkerSize',25)
plot(Frequency(PW==600 & amplitude==120),foldChangeModel(PW==600 & amplitude==120),'-','color',[.3,.56,.35],'LineWidth',1.5)
plot(Frequency(PW==600 & amplitude==120),foldChangeExp(PW==600 & amplitude==120),'.','color',[.3,.56,.35],'MarkerSize',25)
plot(Frequency(PW==1800 & amplitude==120),foldChangeModel(PW==1800 & amplitude==120),'-','color',[0.99,0.68,0.38],'LineWidth',1.5)
plot(Frequency(PW==1800 & amplitude==120),foldChangeExp(PW==1800 & amplitude==120),'.','color',[0.99,0.68,0.38],'MarkerSize',25)
plot(Frequency(PW==3600 & amplitude==120),foldChangeModel(PW==3600 & amplitude==120),'-','color',[.74,.12,.18],'LineWidth',1.5)
plot(Frequency(PW==3600 & amplitude==120),foldChangeExp(PW==3600 & amplitude==120),'.','color',[.74,.12,.18],'MarkerSize',25)
xlabel('Frequency (1/s)')
grid on 

title('Amplitude = 120 (a.u.)')
set(gca,'XScale','log')
set(gca,'YScale','log')
xlim([0.00001, 0.1])
ylim([1,200])
hold off

%subplot(2,2,3)
figure
hold on
set(gca,'FontName','Arial')

plot(Frequency(PW==5 & amplitude==400),foldChangeModel(PW==5 & amplitude==400),'-','color',[0,0,0.29],'LineWidth',2)
plot(Frequency(PW==5 & amplitude==400),foldChangeExp(PW==5 & amplitude==400),'.','color',[0,0,0.29],'MarkerSize',30)
plot(Frequency(PW==120 & amplitude==400),foldChangeModel(PW==120 & amplitude==400),'-','color',[0.13,.25,.6],'LineWidth',2)
plot(Frequency(PW==120 & amplitude==400),foldChangeExp(PW==120 & amplitude==400),'.','color',[0.13,.25,.6],'MarkerSize',30)
plot(Frequency(PW==600 & amplitude==400),foldChangeModel(PW==600 & amplitude==400),'-','color',[.3,.56,.35],'LineWidth',2)
plot(Frequency(PW==600 & amplitude==400),foldChangeExp(PW==600 & amplitude==400),'.','color',[.3,.56,.35],'MarkerSize',30)
plot(Frequency(PW==1800 & amplitude==400),foldChangeModel(PW==1800 & amplitude==400),'-','color',[0.99,0.68,0.38],'LineWidth',2)
plot(Frequency(PW==1800 & amplitude==400),foldChangeExp(PW==1800 & amplitude==400),'.','color',[0.99,0.68,0.38],'MarkerSize',30)
plot(Frequency(PW==3600 & amplitude==400),foldChangeModel(PW==3600 & amplitude==400),'-','color',[.74,.12,.18],'LineWidth',2)
plot(Frequency(PW==3600 & amplitude==400),foldChangeExp(PW==3600 & amplitude==400),'.','color',[.74,.12,.18],'MarkerSize',30)
xlabel('Frequency (1/s)'),ylabel('Fold change')
grid on 
set(gca,'XScale','log')
set(gca,'YScale','log')
title('Amplitude = 400 (a.u.)')
xlim([0.00001, 0.1])
ylim([1,200])
hold off

%subplot(2,2,4)
figure
hold on
set(gca,'FontName','Arial')

plot(Frequency(PW==5 & amplitude==600),foldChangeModel(PW==5 & amplitude==600),'-','color',[0,0,0.29],'LineWidth',2.5)
plot(Frequency(PW==5 & amplitude==600),foldChangeExp(PW==5 & amplitude==600),'.','color',[0,0,0.29],'MarkerSize',35)
plot(Frequency(PW==120 & amplitude==600),foldChangeModel(PW==120 & amplitude==600),'-','color',[0.13,.25,.6],'LineWidth',2.5)
plot(Frequency(PW==120 & amplitude==600),foldChangeExp(PW==120 & amplitude==600),'.','color',[0.13,.25,.6],'MarkerSize',35)
plot(Frequency(PW==600 & amplitude==600),foldChangeModel(PW==600 & amplitude==600),'-','color',[.3,.56,.35],'LineWidth',2.5)
plot(Frequency(PW==600 & amplitude==600),foldChangeExp(PW==600 & amplitude==600),'.','color',[.3,.56,.35],'MarkerSize',35)
plot(Frequency(PW==1800 & amplitude==600),foldChangeModel(PW==1800 & amplitude==600),'-','color',[0.99,0.68,0.38],'LineWidth',2.5)
plot(Frequency(PW==1800 & amplitude==600),foldChangeExp(PW==1800 & amplitude==600),'.','color',[0.99,0.68,0.38],'MarkerSize',35)
plot(Frequency(PW==3600 & amplitude==600),foldChangeModel(PW==3600 & amplitude==600),'-','color',[.74,.12,.18],'LineWidth',2.5)
plot(Frequency(PW==3600 & amplitude==600),foldChangeExp(PW==3600 & amplitude==600),'.','color',[.74,.12,.18],'MarkerSize',35)
xlabel('Frequency (1/s)')
set(gca,'XScale','log')
set(gca,'YScale','log')
grid on
title('Amplitude = 600 (a.u.)')
xlim([0.00001, 0.1])
ylim([1,200])
hold off
saveas(gcf,'ModelvsExpAmplog.png')

