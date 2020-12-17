
function [Imax,Imaxrange]=MIfunction(Cond0_file_name,file_names)
Y=NaN*ones(size(file_names,2)+1,20000);
Y1=csvread(Cond0_file_name,1,0);
mCherry=Y1(:,6);
FSC_A=Y1(:,1);
FSC_H=Y1(:,2);
SSC_A=Y1(:,3);
radius=.7;
log_FSC=log10(FSC_A);
log_FSC_H=log10(FSC_H);
log_SSC=log10(SSC_A);
radius=.7;

med_FSC=median(log_FSC);
med_SSC=median(log_SSC);
k=log_SSC./log_FSC;
med_k=median(k);
%Gate=FSC_A>med_FSC-radius & FSC_A<med_FSC+radius;%Gate for FSC-A<=radius au
Gate=(log_FSC-med_FSC).^2+(k-med_k).^2<=radius^2;
Gate2=(log_FSC_H)./log_FSC>median(log_FSC_H./log_FSC)-.1 & (log_FSC_H)./log_FSC<median(log_FSC_H./log_FSC)+.1;
Both_Gates=(Gate+Gate2==2);
mCherry=mCherry(Both_Gates)./FSC_A(Both_Gates).*10;%correct for size
Y(1,1:20000)=(mCherry(1:20000));

for i=1:size(file_names,2)
Y2=csvread(file_names(i),1,0);
mCherry=Y2(:,6);
FSC_A=Y2(:,1);
FSC_H=Y2(:,2);
SSC_A=Y2(:,3);
radius=.7;
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
mCherry=mCherry(Both_Gates)./FSC_A(Both_Gates).*10;%correct for size
if length(mCherry)<20000
    Y(i+1,1:length(mCherry))=mCherry;
else
Y(i+1,1:20000)=mCherry(1:20000);
end

end
number_of_cells=sum(~isnan(Y),2);
Y(number_of_cells<=2000,:)=[]; % remove conditions with less than 2000 cells
%Y=log(Y);
%Discretized data, save as y1
m=size(Y,1);%number of conditions/inputs
%n=[30:10:100];%number of bins
index2=1;
n1=5:1:50;
for n=n1
    index1=1;
    rangeofcells=20000;
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
   

%Remove bins with 0 probability
binProbability=sum(p);
p(:,binProbability==0)=[];
%Run Blahut Arimoto

[C(index1),~]=BlahutArimoto(p);
%cd('Flow cytometry data')
%Run minimization
%[C(index1)]=MaxMutualInfo
index1=index1+1;
    end
    
%    plot(1./rangeofcells,C,'ok');
    b=polyfit(1./rangeofcells,C,1);
    C_hat=polyval(b,[0 1./rangeofcells]);
    
%     hold on
%     plot([0 1./rangeofcells],C_hat)
%     hold off
    

%Find channel capacity,C
index=n/5;
C_unbiased(index2)=b(2);
index2=index2+1;
end



% Calculated MaxI is 0.9415+-0.0012 (800-1000 bins). Below is without using jackknife (used over 15000 cells). PW=5sec. Used samples closest to median of 4 samples. Used single cells only.
% 
% Below. Used logspace to determine bin edges. Imax=0.9031+-0.0011 (average between 25 and 45 bins).
% 





%plot C vs number of bins

plot(n1,C_unbiased)
C_unbiased(C_unbiased==0)=NaN;
C_unbiased(C_unbiased==inf)=NaN;
xlabel('number of bins'), ylabel('Mutual information (bits)')
C2=C_unbiased(21:41);
Imax=nanmean(C2)
Imaxrange=nanstd(C2)

end

