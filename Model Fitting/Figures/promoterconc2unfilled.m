%% Timecourse input 2
[data,names]=xlsread('promoterconclight.xlsx');
lightA=data(:,1);lightB=data(:,2);lightC=data(:,3);lightD=data(:,4);lightE=data(:,5);
lightF=data(:,6);lightG=data(:,7);light71=data(:,8);light78=data(:,9);light96=data(:,10);
lightH=data(:,11);lightI=data(:,12);lightJ=data(:,13);lightK=data(:,14);lightL=data(:,15);
lightM=data(:,16);lightN=data(:,17);light77=data(:,18);light95=data(:,19);lightO=data(:,20);
lightP=data(:,21);lightQ=data(:,22);lightR=data(:,23);lightS=data(:,24);light44=data(:,25);
lightT=data(:,26);light68=data(:,27);light75=data(:,28);light93=data(:,29);lightU=data(:,30);
lightV=data(:,31);lightW=data(:,32);light38=data(:,33);lightX=data(:,34);lightY=data(:,35);
light62=data(:,36);lightZ=data(:,37);lightAB=data(:,38);lightAA=data(:,39);light111=data(:,40);

[data,names]=xlsread('Puout.xlsx');
PuA=data(:,1);PuB=data(:,2);PuC=data(:,3);PuD=data(:,4);PuE=data(:,5);
PuF=data(:,6);PuG=data(:,7);Pu71=data(:,8);Pu78=data(:,9);Pu96=data(:,10);
PuH=data(:,11);PuI=data(:,12);PuJ=data(:,13);PuK=data(:,14);PuL=data(:,15);
PuM=data(:,16);PuN=data(:,17);Pu77=data(:,18);Pu95=data(:,19);PuO=data(:,20);
PuP=data(:,21);PuQ=data(:,22);PuR=data(:,23);PuS=data(:,24);Pu44=data(:,25);
PuT=data(:,26);Pu68=data(:,27);Pu75=data(:,28);Pu93=data(:,29);PuU=data(:,30);
PuV=data(:,31);PuW=data(:,32);Pu38=data(:,33);PuX=data(:,34);PuY=data(:,35);
Pu62=data(:,36);PuZ=data(:,37);PuAB=data(:,38);PuAA=data(:,39);Pu111=data(:,40);

[data,names]=xlsread('Pbout.xlsx');
PbA=data(:,1);PbB=data(:,2);PbC=data(:,3);PbD=data(:,4);PbE=data(:,5);
PbF=data(:,6);PbG=data(:,7);Pb71=data(:,8);Pb78=data(:,9);Pb96=data(:,10);
PbH=data(:,11);PbI=data(:,12);PbJ=data(:,13);PbK=data(:,14);PbL=data(:,15);
PbM=data(:,16);PbN=data(:,17);Pb77=data(:,18);Pb95=data(:,19);PbO=data(:,20);
PbP=data(:,21);PbQ=data(:,22);PbR=data(:,23);PbS=data(:,24);Pb44=data(:,25);
PbT=data(:,26);Pb68=data(:,27);Pb75=data(:,28);Pb93=data(:,29);PbU=data(:,30);
PbV=data(:,31);PbW=data(:,32);Pb38=data(:,33);PbX=data(:,34);PbY=data(:,35);
Pb62=data(:,36);PbZ=data(:,37);PbAB=data(:,38);PbAA=data(:,39);Pb111=data(:,40);

[data,names]=xlsread('Piout.xlsx');
PiA=data(:,1);PiB=data(:,2);PiC=data(:,3);PiD=data(:,4);PiE=data(:,5);
PiF=data(:,6);PiG=data(:,7);Pi71=data(:,8);Pi78=data(:,9);Pi96=data(:,10);
PiH=data(:,11);PiI=data(:,12);PiJ=data(:,13);PiK=data(:,14);PiL=data(:,15);
PiM=data(:,16);PiN=data(:,17);Pi77=data(:,18);Pi95=data(:,19);PiO=data(:,20);
PiP=data(:,21);PiQ=data(:,22);PiR=data(:,23);PiS=data(:,24);Pi44=data(:,25);
PiT=data(:,26);Pi68=data(:,27);Pi75=data(:,28);Pi93=data(:,29);PiU=data(:,30);
PiV=data(:,31);PiW=data(:,32);Pi38=data(:,33);PiX=data(:,34);PiY=data(:,35);
Pi62=data(:,36);PiZ=data(:,37);PiAB=data(:,38);PiAA=data(:,39);Pi111=data(:,40);
%%
[data,names]=xlsread('Paout.xlsx');
PaA=data(:,1);PaB=data(:,2);PaC=data(:,3);PaD=data(:,4);PaE=data(:,5);
PaF=data(:,6);PaG=data(:,7);Pa71=data(:,8);Pa78=data(:,9);Pa96=data(:,10);
PaH=data(:,11);PaI=data(:,12);PaJ=data(:,13);PaK=data(:,14);PaL=data(:,15);
PaM=data(:,16);PaN=data(:,17);Pa77=data(:,18);Pa95=data(:,19);PaO=data(:,20);
PaP=data(:,21);PaQ=data(:,22);PaR=data(:,23);PaS=data(:,24);Pa44=data(:,25);
PaT=data(:,26);Pa68=data(:,27);Pa75=data(:,28);Pa93=data(:,29);PaU=data(:,30);
PaV=data(:,31);PaW=data(:,32);Pa38=data(:,33);PaX=data(:,34);PaY=data(:,35);
Pa62=data(:,36);PaZ=data(:,37);PaAB=data(:,38);PaAA=data(:,39);Pa111=data(:,40);

[data,names]=xlsread('mRNAout.xlsx');
mRNAA=data(:,1);mRNAB=data(:,2);mRNAC=data(:,3);mRNAD=data(:,4);mRNAE=data(:,5);
mRNAF=data(:,6);mRNAG=data(:,7);mRNA71=data(:,8);mRNA78=data(:,9);mRNA96=data(:,10);
mRNAH=data(:,11);mRNAI=data(:,12);mRNAJ=data(:,13);mRNAK=data(:,14);mRNAL=data(:,15);
mRNAM=data(:,16);mRNAN=data(:,17);mRNA77=data(:,18);mRNA95=data(:,19);mRNAO=data(:,20);
mRNAP=data(:,21);mRNAQ=data(:,22);mRNAR=data(:,23);mRNAS=data(:,24);mRNA44=data(:,25);
mRNAT=data(:,26);mRNA68=data(:,27);mRNA75=data(:,28);mRNA93=data(:,29);mRNAU=data(:,30);
mRNAV=data(:,31);mRNAW=data(:,32);mRNA38=data(:,33);mRNAX=data(:,34);mRNAY=data(:,35);
mRNA62=data(:,36);mRNAZ=data(:,37);mRNAAB=data(:,38);mRNAAA=data(:,39);mRNA111=data(:,40);

[data,names]=xlsread('mCherry2out.xlsx');
mCherryA=data(:,1);mCherryB=data(:,2);mCherryC=data(:,3);mCherryD=data(:,4);mCherryE=data(:,5);
mCherryF=data(:,6);mCherryG=data(:,7);mCherry71=data(:,8);mCherry78=data(:,9);mCherry96=data(:,10);
mCherryH=data(:,11);mCherryI=data(:,12);mCherryJ=data(:,13);mCherryK=data(:,14);mCherryL=data(:,15);
mCherryM=data(:,16);mCherryN=data(:,17);mCherry77=data(:,18);mCherry95=data(:,19);mCherryO=data(:,20);
mCherryP=data(:,21);mCherryQ=data(:,22);mCherryR=data(:,23);mCherryS=data(:,24);mCherry44=data(:,25);
mCherryT=data(:,26);mCherry68=data(:,27);mCherry75=data(:,28);mCherry93=data(:,29);mCherryU=data(:,30);
mCherryV=data(:,31);mCherryW=data(:,32);mCherry38=data(:,33);mCherryX=data(:,34);mCherryY=data(:,35);
mCherry62=data(:,36);mCherryZ=data(:,37);mCherryAB=data(:,38);mCherryAA=data(:,39);mCherry111=data(:,40);

t = (0:5:50395)';
%% New timecourse plots with integration **Light**
%light - AUC=60
figure
subplot(5,1,1)
plot(t,lightA,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,lightA);
%text(5000,0.2,['total U = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,600]);
subplot(5,1,2)
plot(t,lightB,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,lightB);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,600]);
subplot(5,1,3)
plot(t,lightC,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,lightC);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,600]);
subplot(5,1,4)
plot(t,lightD,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,lightD);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,600]);
subplot(5,1,5)
plot(t,lightE,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,lightE);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,600]);

figure
subplot(5,1,1)
plot(t,lightF,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,lightF);
%text(5000,0.2,['total U = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,600]);
subplot(5,1,2)
plot(t,lightG,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,lightG);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,600]);
subplot(5,1,3)
plot(t,light71,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,light71);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,600]);
subplot(5,1,4)
plot(t,light78,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,light78);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,600]);
subplot(5,1,5)
plot(t,light96,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,light96);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,600]);

%U - AUC=120
figure
subplot(5,1,1)
plot(t,lightH,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,lightH);
%text(5000,0.2,['total U = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,1200]);
subplot(5,1,2)
plot(t,lightI,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,lightI);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1200]);
subplot(5,1,3)
plot(t,lightJ,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,lightJ);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1200]);
subplot(5,1,4)
plot(t,lightK,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,lightK);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1200]);
subplot(5,1,5)
plot(t,lightL,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,lightL);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1200]);

figure
subplot(5,1,1)
plot(t,lightM,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,lightM);
%text(5000,0.2,['total U = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,1200]);
subplot(5,1,2)
plot(t,lightN,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,lightN);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1200]);
subplot(5,1,3)
plot(t,light77,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,light77);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1200]);
subplot(5,1,4)
plot(t,light95,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,light95);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1200]);
subplot(5,1,5)
plot(t,lightO,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,lightO);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1200]);

%U - AUC=420
figure
subplot(5,1,1)
plot(t,lightP,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,lightP);
%text(5000,0.2,['total U = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,2)
plot(t,lightQ,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,lightQ);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,3)
plot(t,lightR,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,lightR);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,4)
plot(t,lightS,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,lightS);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,5)
plot(t,light44,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,light44);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);

figure
subplot(5,1,1)
plot(t,lightT,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,lightT);
%text(5000,0.2,['total U = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,2)
plot(t,light68,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,light68);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,3)
plot(t,light75,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,light75);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,4)
plot(t,light93,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,light93);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,5)
plot(t,lightU,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,lightU);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);


%U - AUC=4200
figure
subplot(5,1,1)
plot(t,lightV,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,lightV);
%text(5000,0.2,['total U = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,2)
plot(t,lightW,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,lightW);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,3)
plot(t,light38,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,light38);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,4)
plot(t,lightX,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,lightX);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,5)
plot(t,lightY,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,lightY);
%text(5000,0.2,['total U = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,3600]);

figure
subplot(5,1,1)
plot(t,light62,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,light62);
title('4200 AUC')
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,2)
plot(t,lightZ,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,lightZ);
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,3)
plot(t,lightAB,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,lightAB);
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,4)
plot(t,lightAA,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,lightAA);
xlim([0,7200]);
ylim([0,3600]);
subplot(5,1,5)
plot(t,light111,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,light111);
xlim([0,7200]);
ylim([0,3600]);

%% New timecourse plots with integration **1ST STATE**
%Pu - AUC=60
figure
subplot(5,1,1)
plot(t,PuA,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PuA);
text(5000,0.2,['total Pu = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PuB,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PuB);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,PuC,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PuC);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PuD,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PuD);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PuE,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PuE);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

figure
subplot(5,1,1)
plot(t,PuF,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PuF);
text(5000,0.2,['total Pu = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PuG,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PuG);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,Pu71,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pu71);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,Pu78,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pu78);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,Pu96,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pu96);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

%Pu - AUC=120
figure
subplot(5,1,1)
plot(t,PuH,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PuH);
text(5000,0.2,['total Pu = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PuI,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PuI);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,PuJ,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PuJ);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PuK,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PuK);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PuL,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PuL);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

figure
subplot(5,1,1)
plot(t,PuM,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PuM);
text(5000,0.2,['total Pu = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PuN,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PuN);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,Pu77,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pu77);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,Pu95,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pu95);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PuO,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PuO);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

%U - AUC=420
figure
subplot(5,1,1)
plot(t,PuP,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PuP);
text(5000,0.2,['total Pu = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PuQ,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PuQ);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,PuR,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PuR);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PuS,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PuS);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,Pu44,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,Pu44);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

figure
subplot(5,1,1)
plot(t,PuT,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PuT);
text(5000,0.2,['total Pu = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,Pu68,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pu68);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,Pu75,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pu75);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,Pu93,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pu93);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PuU,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PuU);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);


%U - AUC=4200
figure
subplot(5,1,1)
plot(t,PuV,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PuV);
text(5000,0.2,['total Pu = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PuW,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PuW);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,Pu38,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,Pu38);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PuX,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PuX);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PuY,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PuY);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

figure
subplot(5,1,1)
plot(t,Pu62,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,Pu62);
text(5000,0.2,['total Pu = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PuZ,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PuZ);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,PuAB,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PuAB);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PuAA,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PuAA);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,Pu111,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pu111);
text(5000,0.2,['total Pu = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

%% New timecourse plots with integration **2ND STATE**
%Pb - AUC=60
figure
subplot(5,1,1)
plot(t,PbA,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PbA);
text(5000,0.2,['total Pb = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PbB,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PbB);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,PbC,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PbC);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PbD,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PbD);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PbE,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PbE);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

figure
subplot(5,1,1)
plot(t,PbF,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PbF);
text(5000,0.2,['total Pb = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PbG,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PbG);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,Pb71,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pb71);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,Pb78,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pb78);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,Pb96,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pb96);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

%Pb - AUC=120
figure
subplot(5,1,1)
plot(t,PbH,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PbH);
text(5000,0.2,['total Pb = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PbI,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PbI);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,PbJ,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PbJ);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PbK,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PbK);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PbL,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PbL);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

figure
subplot(5,1,1)
plot(t,PbM,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PbM);
text(5000,0.2,['total Pb = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PbN,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PbN);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,Pb77,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pb77);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,Pb95,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pb95);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PbO,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PbO);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

%Pb - AUC=420
figure
subplot(5,1,1)
plot(t,PbP,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PbP);
text(5000,0.2,['total Pb = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PbQ,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PbQ);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,PbR,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PbR);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PbS,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PbS);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,Pb44,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,Pb44);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

figure
subplot(5,1,1)
plot(t,PbT,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PbT);
text(5000,0.2,['total Pb = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,Pb68,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pb68);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,Pb75,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pb75);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,Pb93,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pb93);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PbU,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PbU);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);


%Pb - AUC=4200
figure
subplot(5,1,1)
plot(t,PbV,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PbV);
text(5000,0.2,['total Pb = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PbW,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PbW);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,Pb38,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,Pb38);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PbX,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PbX);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,PbY,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PbY);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

figure
subplot(5,1,1)
plot(t,Pb62,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,Pb62);
text(5000,0.2,['total Pb = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,2)
plot(t,PbZ,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PbZ);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,3)
plot(t,PbAB,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PbAB);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,4)
plot(t,PbAA,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PbAA);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);
subplot(5,1,5)
plot(t,Pb111,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pb111);
text(5000,0.2,['total Pb = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,1]);

%% New timecourse plots with integration **3RD STATE**
%Pi - AUC=60
figure
subplot(5,1,1)
plot(t,PiA,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PiA);
text(5000,0.04,['total Pi = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PiB,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PiB);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,PiC,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PiC);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PiD,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PiD);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PiE,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PiE);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,PiF,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PiF);
text(5000,0.04,['total Pi = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PiG,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PiG);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,Pi71,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pi71);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,Pi78,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pi78);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,Pi96,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pi96);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

%Pi - AUC=120
figure
subplot(5,1,1)
plot(t,PiH,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PiH);
text(5000,0.04,['total Pi = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PiI,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PiI);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,PiJ,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PiJ);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PiK,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PiK);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PiL,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PiL);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,PiM,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PiM);
text(5000,0.04,['total Pi = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PiN,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PiN);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,Pi77,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pi77);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,Pi95,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pi95);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PiO,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PiO);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

%Pi - AUC=420
figure
subplot(5,1,1)
plot(t,PiP,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PiP);
text(5000,0.04,['total Pi = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PiQ,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PiQ);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,PiR,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PiR);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PiS,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PiS);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,Pi44,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,Pi44);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,PiT,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PiT);
text(5000,0.04,['total Pi = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,Pi68,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pi68);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,Pi75,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pi75);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,Pi93,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pi93);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PiU,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PiU);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);


%Pi - AUC=4200
figure
subplot(5,1,1)
plot(t,PiV,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PiV);
text(5000,0.04,['total Pi = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PiW,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PiW);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,Pi38,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,Pi38);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PiX,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PiX);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PiY,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PiY);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,Pi62,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,Pi62);
text(5000,0.04,['total Pi = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PiZ,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PiZ);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,PiAB,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PiAB);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PiAA,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PiAA);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,Pi111,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pi111);
text(5000,0.04,['total Pi = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

%% New timecourse plots with integration **4TH STATE**
%Pa - AUC=60
figure
subplot(5,1,1)
plot(t,PaA,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PaA);
text(5000,0.04,['total Pa = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PaB,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PaB);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,PaC,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PaC);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PaD,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PaD);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PaE,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PaE);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,PaF,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PaF);
text(5000,0.04,['total Pa = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PaG,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PaG);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,Pa71,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pa71);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,Pa78,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pa78);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,Pa96,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pa96);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

%Pa - AUC=120
figure
subplot(5,1,1)
plot(t,PaH,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PaH);
text(5000,0.04,['total Pa = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PaI,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PaI);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,PaJ,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PaJ);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PaK,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PaK);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PaL,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PaL);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,PaM,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PaM);
text(5000,0.04,['total Pa = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PaN,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PaN);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,Pa77,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pa77);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,Pa95,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pa95);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PaO,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PaO);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

%Pa - AUC=420
figure
subplot(5,1,1)
plot(t,PaP,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PaP);
text(5000,0.04,['total Pa = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PaQ,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PaQ);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,PaR,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PaR);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PaS,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PaS);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,Pa44,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,Pa44);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,PaT,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PaT);
text(5000,0.04,['total Pa = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,Pa68,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pa68);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,Pa75,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,Pa75);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,Pa93,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pa93);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PaU,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PaU);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);


%Pa - AUC=4200
figure
subplot(5,1,1)
plot(t,PaV,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,PaV);
text(5000,0.04,['total Pa = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PaW,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,PaW);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,Pa38,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,Pa38);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PaX,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PaX);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,PaY,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,PaY);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,Pa62,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,Pa62);
text(5000,0.04,['total Pa = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,PaZ,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PaZ);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,PaAB,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,PaAB);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,PaAA,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,PaAA);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,Pa111,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,Pa111);
text(5000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

%% New timecourse plots with integration **mRNA**
%mRNA - AUC=60
figure
subplot(5,1,1)
plot(t,mRNAA,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mRNAA);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,mRNAB,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mRNAB);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,mRNAC,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNAC);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,mRNAD,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNAD);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,mRNAE,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNAE);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,mRNAF,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNAF);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,mRNAG,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNAG);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,mRNA71,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mRNA71);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,mRNA78,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mRNA78);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,mRNA96,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mRNA96);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

%mRNA - AUC=120
figure
subplot(5,1,1)
plot(t,mRNAH,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mRNAH);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,mRNAI,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mRNAI);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,mRNAJ,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNAJ);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,mRNAK,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNAK);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,mRNAL,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNAL);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,mRNAM,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNAM);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,mRNAN,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mRNAN);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,mRNA77,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mRNA77);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,mRNA95,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mRNA95);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,mRNAO,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mRNAO);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

%mRNA - AUC=420
figure
subplot(5,1,1)
plot(t,mRNAP,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mRNAP);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,mRNAQ,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mRNAQ);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,mRNAR,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNAR);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,mRNAS,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNAS);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,mRNA44,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNA44);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,mRNAT,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNAT);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,mRNA68,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mRNA68);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,mRNA75,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mRNA75);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,mRNA93,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mRNA93);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,mRNAU,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mRNAU);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);


%mRNA - AUC=4200
figure
subplot(5,1,1)
plot(t,mRNAV,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mRNAV);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,mRNAW,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNAW);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,mRNA38,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mRNA38);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,mRNAX,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNAX);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,mRNAY,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNAY);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
plot(t,mRNA62,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mRNA62);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
plot(t,mRNAZ,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mRNAZ);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
plot(t,mRNAAB,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mRNAAB);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
plot(t,mRNAAA,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mRNAAA);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
plot(t,mRNA111,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mRNA111);
text(4000,0.04,['total mRNA = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);


%% New timecourse plots with integration **mCherry**
%mCherry - AUC=60
figure
subplot(5,1,1)
plot(t,mCherryA,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mCherryA);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
title('60 AUC')
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,2)
plot(t,mCherryB,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mCherryB);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,3)
plot(t,mCherryC,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherryC);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,4)
plot(t,mCherryD,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherryD);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,5)
plot(t,mCherryE,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherryE);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);

figure
subplot(5,1,1)
plot(t,mCherryF,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherryF);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
title('60 AUC')
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,2)
plot(t,mCherryG,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherryG);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,3)
plot(t,mCherry71,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mCherry71);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,4)
plot(t,mCherry78,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mCherry78);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,5)
plot(t,mCherry96,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mCherry96);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);

%mCherry - AUC=120
figure
subplot(5,1,1)
plot(t,mCherryH,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mCherryH);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
title('120 AUC')
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,2)
plot(t,mCherryI,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mCherryI);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,3)
plot(t,mCherryJ,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherryJ);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,4)
plot(t,mCherryK,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherryK);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,5)
plot(t,mCherryL,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherryL);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);

figure
subplot(5,1,1)
plot(t,mCherryM,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherryM);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
title('120 AUC')
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,2)
plot(t,mCherryN,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mCherryN);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,3)
plot(t,mCherry77,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mCherry77);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,4)
plot(t,mCherry95,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mCherry95);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,5)
plot(t,mCherryO,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mCherryO);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);

%mCherry - AUC=420
figure
subplot(5,1,1)
plot(t,mCherryP,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mCherryP);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
title('420 AUC')
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,2)
plot(t,mCherryQ,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mCherryQ);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,3)
plot(t,mCherryR,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherryR);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,4)
plot(t,mCherryS,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherryS);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,5)
plot(t,mCherry44,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherry44);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);

figure
subplot(5,1,1)
plot(t,mCherryT,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherryT);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
title('420 AUC')
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,2)
plot(t,mCherry68,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mCherry68);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,3)
plot(t,mCherry75,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mCherry75);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,4)
plot(t,mCherry93,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mCherry93);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,5)
plot(t,mCherryU,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mCherryU);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);


%mCherry - AUC=4200
figure
subplot(5,1,1)
plot(t,mCherryV,'LineWidth',1.5,'color',[0,0,0.29])
Integral = trapz(t,mCherryV);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
title('4200 AUC')
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,2)
plot(t,mCherryW,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherryW);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,3)
plot(t,mCherry38,'LineWidth',1.5,'color',[0.13,.25,.6])
Integral = trapz(t,mCherry38);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,4)
plot(t,mCherryX,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherryX);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,5)
plot(t,mCherryY,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherryY);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);

figure
subplot(5,1,1)
plot(t,mCherry62,'LineWidth',1.5,'color',[.3,.56,.35])
Integral = trapz(t,mCherry62);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
title('4200 AUC')
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,2)
plot(t,mCherryZ,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mCherryZ);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,3)
plot(t,mCherryAB,'LineWidth',1.5,'color',[.99,0.68,.38])
Integral = trapz(t,mCherryAB);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,4)
plot(t,mCherryAA,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mCherryAA);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);
subplot(5,1,5)
plot(t,mCherry111,'LineWidth',1.5,'color',[.74,.12,.18])
Integral = trapz(t,mCherry111);
text(4000,0.04,['total mCherry = ',num2str(Integral)])
xlim([0,50400]); 
ylim([0,75]);

%% New timecourse plots with integration **Pa** FILLED
%Pa - AUC=60
figure
subplot(5,1,1)
a=area(t,PaA);
a.FaceColor=[0,0,0.29];
a.EdgeColor=[0,0,0.29];
Integral = trapz(t,PaA);
text(4000,0.02,['total Pa = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,0.02]);
subplot(5,1,2)
a=area(t,PaB);
a.FaceColor=[0,0,0.29];
a.EdgeColor=[0,0,0.29];
Integral = trapz(t,PaB);
text(4000,0.02,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.02]);
subplot(5,1,3)
a=area(t,PaC);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,PaC);
text(4000,0.02,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.02]);
subplot(5,1,4)
a=area(t,PaD);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,PaD);
text(4000,0.02,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.02]);
subplot(5,1,5)
a=area(t,PaE);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,PaE);
text(4000,0.02,['total Pa = ',num2str(Integral)])
ylim([0,0.02]);
xlim([0,7200]);

figure
subplot(5,1,1)
a=area(t,PaF);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,PaF);
text(4000,0.02,['total Pa = ',num2str(Integral)])
title('60 AUC')
xlim([0,7200]);
ylim([0,0.02]);
subplot(5,1,2)
a=area(t,PaG);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,PaG);
text(4000,0.02,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.02]);
subplot(5,1,3)
a=area(t,Pa71);
a.FaceColor=[.99,0.68,.38];
a.EdgeColor=[.99,0.68,.38];
Integral = trapz(t,Pa71);
text(4000,0.02,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.02]);
subplot(5,1,4)
a=area(t,Pa78);
a.FaceColor=[.99,0.68,.38];
a.EdgeColor=[.99,0.68,.38];
Integral = trapz(t,Pa78);
text(4000,0.02,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.02]);
subplot(5,1,5)
a=area(t,Pa96);
a.FaceColor=[.74,.12,.18];
a.EdgeColor=[.74,.12,.18];
Integral = trapz(t,Pa96);
text(4000,0.02,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.02]);
%%
%Pa - AUC=120
figure
subplot(5,1,1)
a=area(t,PaH);
a.FaceColor=[0,0,0.29];
a.EdgeColor=[0,0,0.29];
Integral = trapz(t,PaH);
text(4000,0.007,['total Pa = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,2)
a=area(t,PaI);
a.FaceColor=[0,0,0.29];
a.EdgeColor=[0,0,0.29];
Integral = trapz(t,PaI);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,3)
a=area(t,PaJ);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,PaJ);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,4)
a=area(t,PaK);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,PaK);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,5)
a=area(t,PaL);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,PaL);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);

figure
subplot(5,1,1)
a=area(t,PaM);
PaM(isnan(PaM))=0.0000000001;
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,PaM);
text(4000,0.007,['total Pa = ',num2str(Integral)])
title('120 AUC')
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,2)
a=area(t,PaN);
a.FaceColor=[.99,0.68,.38];
a.EdgeColor=[.99,0.68,.38];
Integral = trapz(t,PaN);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,3)
a=area(t,Pa77);
a.FaceColor=[.99,0.68,.38];
a.EdgeColor=[.99,0.68,.38];
Integral = trapz(t,Pa77);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,4)
a=area(t,Pa95);
a.FaceColor=[.74,.12,.18];
a.EdgeColor=[.74,.12,.18];
Integral = trapz(t,Pa95);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,5)
PaO(isnan(PaO))=0.0000000001;
a=area(t,PaO);
a.FaceColor=[.74,.12,.18];
a.EdgeColor=[.74,.12,.18];
Integral = trapz(t,PaO);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
%%
%Pa - AUC=420
figure
subplot(5,1,1)
a=area(t,PaP);
a.FaceColor=[0,0,0.29];
a.EdgeColor=[0,0,0.29];
Integral = trapz(t,PaP);
text(4000,0.007,['total Pa = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,2)
a=area(t,PaQ);
a.FaceColor=[0,0,0.29];
a.EdgeColor=[0,0,0.29];
Integral = trapz(t,PaQ);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,3)
a=area(t,PaR);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,PaR);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,4)
a=area(t,PaS);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,PaD);
text(4000,0.007,['total Pa = ',num2str(Integral)])
ylim([0,0.01]);
xlim([0,7200]);
subplot(5,1,5)
a=area(t,Pa44);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,Pa44);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);

figure
subplot(5,1,1)
a=area(t,PaT);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,PaT);
text(4000,0.007,['total Pa = ',num2str(Integral)])
title('420 AUC')
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,2)
a=area(t,Pa68);
a.FaceColor=[.99,0.68,.38];
a.EdgeColor=[.99,0.68,.38];
Integral = trapz(t,Pa68);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,3)
a=area(t,Pa75);
a.FaceColor=[.99,0.68,.38];
a.EdgeColor=[.99,0.68,.38];
Integral = trapz(t,Pa75);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,4)
a=area(t,Pa93);
a.FaceColor=[.74,.12,.18];
a.EdgeColor=[.74,.12,.18];
Integral = trapz(t,Pa93);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(5,1,5)
a=area(t,PaU);
a.FaceColor=[.74,.12,.18];
a.EdgeColor=[.74,.12,.18];
Integral = trapz(t,PaU);
text(4000,0.007,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.01]);
%%

%Pa - AUC=4200
figure
subplot(5,1,1)
a=area(t,PaV);
a.FaceColor=[0,0,0.29];
a.EdgeColor=[0,0,0.29];
Integral = trapz(t,PaV);
text(4000,0.04,['total Pa = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
a=area(t,PaW);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,PaW);
text(4000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
a=area(t,Pa38);
a.FaceColor=[0.13,.25,.6];
a.EdgeColor=[0.13,.25,.6];
Integral = trapz(t,Pa38);
text(4000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
a=area(t,PaX);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,PaX);
text(4000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
a=area(t,PaY);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,PaY);
text(4000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);

figure
subplot(5,1,1)
a=area(t,Pa62);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,Pa62);
text(4000,0.04,['total Pa = ',num2str(Integral)])
title('4200 AUC')
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,2)
a=area(t,PaZ);
a.FaceColor=[.99,0.68,.38];
a.EdgeColor=[.99,0.68,.38];
Integral = trapz(t,PaZ);
text(4000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,3)
a=area(t,PaAB);
a.FaceColor=[.99,0.68,.38];
a.EdgeColor=[.99,0.68,.38];
Integral = trapz(t,PaAB);
text(4000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,4)
a=area(t,PaAA);
a.FaceColor=[.74,.12,.18];
a.EdgeColor=[.74,.12,.18];
Integral = trapz(t,PaAA);
text(4000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);
subplot(5,1,5)
a=area(t,Pa111);
a.FaceColor=[.74,.12,.18];
a.EdgeColor=[.74,.12,.18];
Integral = trapz(t,Pa111);
text(4000,0.04,['total Pa = ',num2str(Integral)])
xlim([0,7200]);
ylim([0,0.05]);



%% AUC 420 filled for fig3v4
%Pa - AUC=420
figure
subplot(3,1,1)
a=area(t,PaQ);
a.FaceColor=[0,0,0.29];
a.EdgeColor=[0,0,0.29];
Integral = trapz(t,PaQ);
text(1500,0.004,['Integrated Pa = ',num2str(Integral,3)])
title('420 AUC') 
xlim([0,7200]);
ylim([0,0.01]);
subplot(3,1,2)
a=area(t,PaT);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,PaT);
text(1500,0.004,['Integrated Pa = ',num2str(Integral,3)])
xlim([0,7200]);
ylim([0,0.01]);
subplot(3,1,3)
a=area(t,Pa44);
a.FaceColor=[.3,.56,.35];
a.EdgeColor=[.3,.56,.35];
Integral = trapz(t,Pa44);
text(4500,0.04,['Integrated Pa = ',num2str(Integral,3)])
xlim([0,7200]);
ylim([0,0.01]);

%%
figure
plot(t,lightC,t,lightS,t,lightR,t,lightJ,t,lightK,t,lightW)
legend("60","120","300","600","900","3000")
xlim([25000,26000])

figure
plot(t,PuC,t,PuS,t,PuR,t,PuJ,t,PuK,t,PuW)
legend("60","120","300","600","900","3000")
xlim([25000,26000])
ylim([0,1])

figure
plot(t,PbC,t,PbS,t,PbR,t,PbJ,t,PbK,t,PbW)
legend("60","120","300","600","900","3000")
xlim([25000,26000])
ylim([0,1])

figure
plot(t,PiC,t,PiS,t,PiR,t,PiJ,t,PiK,t,PiW)
legend("60","120","300","600","900","3000")
xlim([25000,26000])
ylim([0,0.05])

figure
plot(t,PaC,t,PaS,t,PaR,t,PaJ,t,PaK,t,PaW)
legend("60","120","300","600","900","3000")
xlim([25000,26000])
ylim([0,0.05])