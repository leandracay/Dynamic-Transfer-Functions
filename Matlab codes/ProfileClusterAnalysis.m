function [cidx,CRs,D,ctrs]=ProfileClusterAnalysis(CRs,ind_variable,dep_variable,numb_clusters)

corrDist=pdist(dep_variable,'corr');
clusterTree=linkage(corrDist,'average');
clusters=cluster(clusterTree,'maxclust',8);
figure

face_color=[0,0,0.29;
    0.13,.25,.6;
    .3,.56,.35;
    .99,0.68,.38;
    .74,.12,.18;
    .61,.4,.65;
    0,0,0;
    0,.8,1;
    0,1,0;];
positions_profile_plots=[.13,.5456,.23,.32;.4,.5456,.23,.32;.69,.5456,.23,.32;.13,.15,.23,.32;.4,.15,.23,.32;.69,.15,.23,.32];
axes_positions=[.05,.7567, .45,.1683;.5203,.7565,.45,.1683;
                .05,.456,.45,.1683;  .5203,.456,.45,.1683;
                .05,.1554,.45,.1683; .5203,.1554,.45,.1683];
% for c=1:8
%     subplot(3,3,c);
%     plot(ind_variable,dep_variable((clusters==c),:)');
%     axis tight
% end
% suptitle('Hierachical Clustering of Profiles')
rng('default')
n=2:20;
s=zeros(length(n),1);
for i=1:length(n)
[cidx1,ctrs]=kmeans(dep_variable,n(i),'dist','corr','rep',20,'disp','final');
s(i)=mean(silhouette(dep_variable,cidx1));
end
figure
plot(n,s)
xlabel('Number of k-mean clusters')
ylabel('Silhouette coefficient')
figure
set(gcf,'position',[440,225,560,570]);
[cidx,ctrs,J,D]=kmeans(dep_variable,numb_clusters,'dist','corr','rep',20,'disp','final');
for c=1:numb_clusters
    subplot(3,2,c);
    %set(gca,'position',positions_profile_plots(c,:))
    %plot((ind_variable),(dep_variable(cidx==c,:))','color',face_color(c,:),'linewidth',3);
    plot((ind_variable),(ctrs(c,:))','color',face_color(c,:),'linewidth',3);
    axis tight
    set(gca,'position',axes_positions(c,:))
    %ylim([-.8,.8])
    set(gca,'yticklabel','')
end
%suptitle('K-Means Clustering of Profiles');
%clustergram(log(dep_variable(:,2:end)),'RowLabels',CRs,'ColumnLabels',ind_variable(:,2:end))



end