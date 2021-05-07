%% main fig Pu

cdata1 = [4.654;4.677;4.677;4.681;4.682;4.682;4.688;4.691;4.694;4.696];
cdata2 = [4.609;4.636;4.657;4.661;4.661;4.679;4.679;4.694;4.696;4.698];
cdata3 = [4.528;4.535;4.537;4.540;4.585;4.590;4.604;4.616;4.642;4.656];
cdata4 = [4.286;4.310;4.393;4.468;4.483;4.537;4.580;4.604;4.653;4.670];

colormap = colorGradient([1,1,1],[0.16,0.16,0.52],256);

figure
subplot(2,2,1)
yvalues = {'C','D','F','c71','c96','B','E','c78','G','A'};
xvalues = {'Total Pu'};
h = heatmap(xvalues,yvalues,cdata1,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.ColorbarVisible='off';
h.CellLabelColor='none';
%h.YLabel = 'AUC = 60 (a.u.)';
caxis(h,[4.286,4.698]);

subplot(2,2,2)
yvalues={'O','N','c95','L','c77','I','J','M','K','H'};
xvalues = {'Total Pu'};
h = heatmap(xvalues,yvalues,cdata2,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
caxis(h,[4.286,4.701]);

subplot(2,2,3)
yvalues={'S','c44','c68','c93','R','U','c75','P','T','Q'};
xvalues = {'Total Pu'};
h = heatmap(xvalues,yvalues,cdata3,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.ColorbarVisible='off';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));
%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
caxis(h,[4.286,4.701]);

subplot(2,2,4)
yvalues={'X','c38','V','AA','c62','c111','W','AB','Z','Y'};
xvalues = {'Total Pu'};
h = heatmap(xvalues,yvalues,cdata4,'Colormap',colormap);
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));
%h.ColorScaling = 'scaledcolumns';
%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
h.ColorbarVisible='off';
caxis(h,[4.286,4.701]);

%% Main fig Pa
cdata1 = [1.666;1.412;1.395;1.315;1.300;1.297;1.155;1.050;0.910;0.799];
cdata2 = [1.927;1.794;1.637;1.601;1.598;1.368;1.351;0.939;0.814;0.643];
cdata3 = [2.160;2.145;2.142;2.136;2.016;2.000;1.949;1.895;1.755;1.643];
cdata4 = [2.430;2.414;2.348;2.261;2.238;2.142;2.031;1.949;1.672;1.495];

figure
subplot(2,2,1)
yvalues = {'C','D','F','c71','c96','B','E','c78','G','A'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata1,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.ColorbarVisible='off';
h.CellLabelColor='none';
h.YLabel = 'AUC = 60 (a.u.)';
caxis(h,[0.643,2.430]);

subplot(2,2,2)
yvalues={'O','N','c95','L','c77','I','J','M','K','H'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata2,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
caxis(h,[0.643,2.430]);

subplot(2,2,3)
yvalues={'S','c44','c68','c93','R','U','c75','P','T','Q'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata3,'Colormap',colormap);
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%h.ColorScaling = 'scaledcolumns';
h.ColorbarVisible='off';
%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
caxis(h,[0.643,2.430]);

subplot(2,2,4)
yvalues={'X','c38','V','AA','c62','c111','W','AB','Z','Y'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata4,'Colormap',colormap);
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));
%h.ColorScaling = 'scaledcolumns';
%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
h.ColorbarVisible='off';
caxis(h,[0.643,2.430]);

%% Main fig int mCherry
cdata1 = [5.539;5.276;5.276;5.230;5.271;5.294;5.045;5.048;4.882;4.716];
cdata2 = [5.799;5.666;5.452;5.531;5.565;5.283;5.321;4.783;4.731;4.579];
cdata3 = [6.036;6.028;6.035;6.009;5.888;5.874;5.822;5.798;5.644;5.522];
cdata4 = [6.304;6.287;6.220;6.137;6.131;6.010;5.904;5.851;5.550;5.404];

figure
subplot(2,2,1)
yvalues = {'C','D','F','c71','c96','B','E','c78','G','A'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata1,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.ColorbarVisible='off';
h.CellLabelColor='none';
h.YLabel = 'AUC = 60 (a.u.)';
caxis(h,[4.579,6.304]);

subplot(2,2,2)
yvalues={'O','N','c95','L','c77','I','J','M','K','H'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata2,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
caxis(h,[4.579,6.304]);

subplot(2,2,3)
yvalues={'S','c44','c68','c93','R','U','c75','P','T','Q'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata3,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));
h.ColorbarVisible='off';
%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
caxis(h,[4.579,6.304]);

subplot(2,2,4)
yvalues={'X','c38','V','AA','c62','c111','W','AB','Z','Y'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata4,'Colormap',colormap);
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));
%h.ColorScaling = 'scaledcolumns';
%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
h.ColorbarVisible='off';
caxis(h,[4.579,6.304]);


%% Supp fig mCherry endpt
cdata1 = [0.963;0.699;0.692;0.546;0.145;-0.572;0.446;-0.856;-0.270;0.021];
cdata2 = [1.223;1.091;1.123;0.766;0.480;0.598;0.195;0.385;0.036;-0.226];
cdata3 = [1.457;1.445;1.437;1.433;1.313;1.296;1.291;1.167;1.049;0.940];
cdata4 = [1.727;1.701;1.644;1.558;1.533;1.421;1.328;1.220;0.969;0.747];

figure
subplot(2,2,1)
yvalues = {'C','D','F','c71','c96','B','E','c78','G','A'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata1,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.ColorbarVisible='off';
h.CellLabelColor='none';
h.YLabel = 'AUC = 60 (a.u.)';
caxis(h,[-0.856,1.727]);

subplot(2,2,2)
yvalues={'O','N','c95','L','c77','I','J','M','K','H'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata2,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
caxis(h,[-0.856,1.727]);

subplot(2,2,3)
yvalues={'S','c44','c68','c93','R','U','c75','P','T','Q'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata3,'Colormap',colormap);
%h.ColorScaling = 'scaledcolumns';
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));
h.ColorbarVisible='off';
%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
caxis(h,[-0.856,1.727]);

subplot(2,2,4)
yvalues={'X','c38','V','AA','c62','c111','W','AB','Z','Y'};
xvalues = {'Total Pa'};
h = heatmap(xvalues,yvalues,cdata4,'Colormap',colormap);
h.XDisplayLabels = nan(size(h.XDisplayData));
h.YDisplayLabels = nan(size(h.YDisplayData));
%h.ColorScaling = 'scaledcolumns';
%pos(1) = 0.13;
%pos(2) = 0.46;
%set(h,'Position',pos);
%pos = get(h,'Position');
h.CellLabelColor='none';
h.ColorbarVisible='off';
caxis(h,[-0.856,1.727]);
