%%
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
  .61,.4,.65;];
size_marker=NaN*ones(length(Frequency),1);
size_marker(amplitude==60)=100;
size_marker(amplitude==120)=100;
size_marker(amplitude==180)=100;
size_marker(amplitude==300)=100;
size_marker(amplitude==400)=100;
size_marker(amplitude==600)=100;
size_marker(amplitude==800)=100;
size_marker(amplitude==900)=100;
size_marker(amplitude==1200)=100;
size_marker(amplitude==3000)=100;
size_marker(amplitude==3600)=100;

%shape_marker=[];
shape_marker(1)='o';
shape_marker(2)='o';
shape_marker(3)='o';
shape_marker(4)='o';
shape_marker(5)='o';
%%
%Figure 2: FC vs intensity
figure
hold on
unique_PW=[5,120,600,1800,3600];
for i=1:5
scatter(amplitude(PW==unique_PW(i)),foldChangeModel(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
xlabel('Light intensity (au)','fontweight','bold'), ylabel('Fold change')
grid on
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.2,200])
xlim([50,10000])

saveas(gcf,'all_FCvsIntensity.png')
hold off

% Figure 4: Fold change vs AUC 
figure 
hold on
log_AUC=log10(AUC);
log_foldChange=log10(foldChangeExp);

for i=1:5
scatter(AUC(PW==unique_PW(i)),foldChangeExp(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
set(gca,'XScale','log')
set(gca,'YScale','log')
xlabel('AUC','fontweight','bold'), ylabel('Fold Change','fontweight','bold')
ylim([.2,200])
xlim([1,80000])
grid on
saveas(gcf,'all_FCvsAUC.png')
hold off

%% fig4v7 scatter plot
unique_PW=[5,120,600,1800,3600];

figure
hold on
set(gca,'XScale','log')
set(gca,'YScale','log')

scatter(AUC(PW==5),foldChangeExp(PW==5),80,'filled','MarkerFaceColor',[0,0,0.29]);
%left=10^2.58;
%right=10^2.682;
%bottom=10^-2;
%top=10^2.3;
%x=[left left right right];
%y=[bottom top top bottom];
%fill(x,y,[0.95,0.95,0.95],'EdgeColor',[0.95,0.95,0.95])

scatter(AUC(PW==5),foldChangeExp(PW==5),80,'filled','MarkerFaceColor',[0,0,0.29]);
scatter(AUC(PW==120),foldChangeExp(PW==120),80,'filled','MarkerFaceColor',[0.13,.25,.6]);
scatter(AUC(PW==600),foldChangeExp(PW==600),80,'filled','MarkerFaceColor',[.3,.56,.35]);
scatter(AUC(PW==1800),foldChangeExp(PW==1800),80,'filled','MarkerFaceColor',[.99,0.68,.38]);
scatter(AUC(PW==3600),foldChangeExp(PW==3600),80,'filled','MarkerFaceColor',[.74,.12,.18]);

xlabel('AUC','fontweight','bold'), ylabel('Fold Change','fontweight','bold')
ylim([0.01,200])
xlim([10,100000])
grid off
hold off
%% fig4v7 scatter plot just new conditions
unique_PW=[5,120,600,1800,3600];

figure
hold on
set(gca,'XScale','log')
set(gca,'YScale','log')

scatter(AUC(PW==5),foldChangeModel(PW==5),80,'filled','MarkerFaceColor',[0,0,0.29]);
left=10^2.03;
right=10^2.12;
bottom=10^-2;
top=10^2.3;
x=[left left right right];
y=[bottom top top bottom];
fill(x,y,[0.95,0.95,0.95],'EdgeColor',[0.95,0.95,0.95])

scatter(AUC(PW==5),foldChangeModel(PW==5),80,'filled','MarkerFaceColor',[0,0,0.29]);
scatter(AUC(PW==120),foldChangeModel(PW==120),80,'filled','MarkerFaceColor',[0.13,.25,.6]);
scatter(AUC(PW==600),foldChangeModel(PW==600),80,'filled','MarkerFaceColor',[.3,.56,.35]);
scatter(AUC(PW==1800),foldChangeModel(PW==1800),80,'filled','MarkerFaceColor',[.99,0.68,.38]);
scatter(AUC(PW==3600),foldChangeModel(PW==3600),80,'filled','MarkerFaceColor',[.74,.12,.18]);

xlabel('AUC','fontweight','bold'), ylabel('Fold Change','fontweight','bold')
ylim([0.01,200])
xlim([1,80000])
grid off
hold off


%% fig4v8 arrow plot for albert
figure
hold on
set(gca,'XScale','log')
set(gca,'YScale','log')
mCherryExp(inverseFrequency==50400)=NaN;
mCherryModel(inverseFrequency==50400)=NaN;

%scatter(AUC(PW==5),mCherryModel(PW==5),80,'MarkerEdgeColor',[0,0,0.29]);
%scatter(AUC(PW==120),mCherryModel(PW==120),80,'MarkerEdgeColor',[0.13,.25,.6]);
%scatter(AUC(PW==600),mCherryModel(PW==600),80,'MarkerEdgeColor',[.3,.56,.35]);
%scatter(AUC(PW==1800),mCherryModel(PW==1800),80,'MarkerEdgeColor',[.99,0.68,.38]);
%scatter(AUC(PW==3600),mCherryModel(PW==3600),80,'MarkerEdgeColor',[.74,.12,.18]);
%scatter(AUC(PW==5),mCherryExp(PW==5),80,'filled','MarkerFaceColor',[0,0,0.29]);
%scatter(AUC(PW==120),mCherryExp(PW==120),80,'filled','MarkerFaceColor',[0.13,.25,.6]);
%scatter(AUC(PW==600),mCherryExp(PW==600),80,'filled','MarkerFaceColor',[.3,.56,.35]);
%scatter(AUC(PW==1800),mCherryExp(PW==1800),80,'filled','MarkerFaceColor',[.99,0.68,.38]);
%scatter(AUC(PW==3600),mCherryExp(PW==3600),80,'filled','MarkerFaceColor',[.74,.12,.18]);
unique_PW = [5,120,600,1800,3600];
for i=1:5
arrow([AUC(PW==unique_PW(i)),mCherryExp(PW==unique_PW(i))],[AUC(PW==unique_PW(i)),mCherryModel(PW==unique_PW(i))],5,'TipAngle',15,'EdgeColor',color(i,:),'FaceColor',color(i,:))
end
arrow([AUC(PW==5),mCherryExp(PW==5)],[AUC(PW==5),mCherryModel(PW==5)],5,'TipAngle',15,'EdgeColor',[0,0,0.29],'FaceColor',[0,0,0.29])
ylim([1,3000])

xlabel('AUC','fontweight','bold'), ylabel('Fluorescence','fontweight','bold')
grid off
hold off

%% fig4v8 arrow plot for jessica
subplot(6,6,[1 2 3 4 7 8 9 10 13 14 15 16 19 20 21 22])
hold on
set(gca,'XScale','log')
scatter(AUC(PW==5),mCherryModel(PW==5),50,'MarkerEdgeColor',[0,0,0.29]);
scatter(AUC(PW==120),mCherryModel(PW==120),50,'MarkerEdgeColor',[0.13,.25,.6]);
scatter(AUC(PW==600),mCherryModel(PW==600),50,'MarkerEdgeColor',[.3,.56,.35]);
scatter(AUC(PW==1800),mCherryModel(PW==1800),50,'MarkerEdgeColor',[.99,0.68,.38]);
scatter(AUC(PW==3600),mCherryModel(PW==3600),50,'MarkerEdgeColor',[.74,.12,.18]);
scatter(AUC(PW==5),mCherryExp(PW==5),50,'filled','MarkerFaceColor',[0,0,0.29]);
scatter(AUC(PW==120),mCherryExp(PW==120),50,'filled','MarkerFaceColor',[0.13,.25,.6]);
scatter(AUC(PW==600),mCherryExp(PW==600),50,'filled','MarkerFaceColor',[.3,.56,.35]);
scatter(AUC(PW==1800),mCherryExp(PW==1800),50,'filled','MarkerFaceColor',[.99,0.68,.38]);
scatter(AUC(PW==3600),mCherryExp(PW==3600),50,'filled','MarkerFaceColor',[.74,.12,.18]);
%ylim([.2,200])
%xlim([1,80000])
grid off
hold off
ylabel('Fluorescence (au)')
subplot(6,6,[5 6 11 12])
hold on
set(gca,'XScale','log')
%set(gca,'YScale','log')
scatter(AUC(PW==5),mCherryModel(PW==5),50,'MarkerEdgeColor',[0,0,0.29]);
scatter(AUC(PW==5),mCherryExp(PW==5),50,'filled','MarkerFaceColor',[0,0,0.29]);
unique_cond = (1:20);
for i=1:20
arrow([AUC(condition==unique_cond(i)),mCherryExp(condition==unique_cond(i))],[AUC(condition==unique_cond(i)),mCherryModel(condition==unique_cond(i))],3,'TipAngle',15)
end

%xlim([1,80000])
grid off
hold off

subplot(6,6,[17 18 23 24])
hold on
set(gca,'XScale','log')
%set(gca,'YScale','log')
scatter(AUC(PW==120),mCherryModel(PW==120),50,'MarkerEdgeColor',[0.13,.25,.6]);
scatter(AUC(PW==120),mCherryExp(PW==120),50,'filled','MarkerFaceColor',[0.13,.25,.6]);
unique_cond = (21:42);
for i=1:22
arrow([AUC(condition==unique_cond(i)),mCherryExp(condition==unique_cond(i))],[AUC(condition==unique_cond(i)),mCherryModel(condition==unique_cond(i))],3,'TipAngle',15)
end
%ylim([.2,200])
%xlim([1,80000])
grid off
hold off

subplot(6,6,[25 26 31 32])
hold on
set(gca,'XScale','log')
%set(gca,'YScale','log')
scatter(AUC(PW==600),mCherryModel(PW==600),50,'MarkerEdgeColor',[.3,.56,.35]);
scatter(AUC(PW==600),mCherryExp(PW==600),50,'filled','MarkerFaceColor',[.3,.56,.35]);
unique_cond = (43:66);
for i=1:24
arrow([AUC(condition==unique_cond(i)),mCherryExp(condition==unique_cond(i))],[AUC(condition==unique_cond(i)),mCherryModel(condition==unique_cond(i))],3,'TipAngle',15)
end
%ylim([.2,200])
%xlim([1,80000])
grid off
hold off
ylabel('Fluorescence (au)')
xlabel('AUC (au)')
subplot(6,6,[27 28 33 34])
hold on
set(gca,'XScale','log')
%set(gca,'YScale','log')
scatter(AUC(PW==1800),mCherryModel(PW==1800),50,'MarkerEdgeColor',[.99,0.68,.38]);
scatter(AUC(PW==1800),mCherryExp(PW==1800),50,'filled','MarkerFaceColor',[.99,0.68,.38]);
unique_cond = (67:90);
for i=1:24
arrow([AUC(condition==unique_cond(i)),mCherryExp(condition==unique_cond(i))],[AUC(condition==unique_cond(i)),mCherryModel(condition==unique_cond(i))],3,'TipAngle',15)
end

%ylim([.2,200])
%xlim([1,80000])
grid off
hold off
xlabel('AUC (au)')

subplot(6,6,[29 30 35 36])
hold on
set(gca,'XScale','log')
%set(gca,'YScale','log')
scatter(AUC(PW==3600),mCherryModel(PW==3600),50,'MarkerEdgeColor',[.74,.12,.18]);
scatter(AUC(PW==3600),mCherryExp(PW==3600),50,'filled','MarkerFaceColor',[.74,.12,.18]);
%ylim([.2,200])
%xlim([1,80000])
unique_cond = (91:114);
for i=1:24
arrow([AUC(condition==unique_cond(i)),mCherryExp(condition==unique_cond(i))],[AUC(condition==unique_cond(i)),mCherryModel(condition==unique_cond(i))],3,'TipAngle',15)
end
xlabel('AUC (au)')

grid off
hold off



%%

%Figure 6 fold change vs frequency
figure
hold on
for i=1:5
scatter(Frequency(PW==unique_PW(i)),foldChangeModel(PW==unique_PW(i)),size_marker(PW==unique_PW(i)),color(i,:),shape_marker(i),'filled')
end
xlabel('Frequency (sec^-^1)','fontweight','bold'), ylabel('Fold change','fontweight','bold')
set(gca,'XScale','log')
set(gca,'YScale','log')
ylim([.2,200])
xlim([.5e-5,1])

grid on
saveas(gcf,'all_FCvsFreq.png')
hold off


