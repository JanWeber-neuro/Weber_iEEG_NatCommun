function plot_fig_4f_ipi(path)

cb =  {'#008450', '#EFB700', '#B81D13'};

% load data 
tbl = readtable(fullfile(path.data, 'SourceData.xlsx'), 'sheet', 'Fig_4f');

ga_0  = tbl.Var1(2:end);
ga_25 = tbl.Var2(2:end);
ga_75 = tbl.Var3(2:end);

figure;

h = rm_raincloud({ga_0, ga_25, ga_75}', [1 0 0], 0, 'ks', 0.2);

% admin
for Icond = 1:3

    % change density plot color
    h.p{Icond,1}.FaceColor        = cb{Icond};
    h.p{Icond,1}.EdgeColor        = cb{Icond};
    h.p{Icond,1}.FaceAlpha        = 0.8;

    % change color for indiv. dots
    h.s{Icond,1}.MarkerFaceColor  = cb{Icond};
    h.s{Icond,1}.MarkerFaceAlpha  = 0.8;
    h.s{Icond,1}.SizeData         = 40;

    % change mean dots
    h.m(Icond).MarkerFaceColor    = cb{Icond};
    h.m(Icond).SizeData           = 80;

end

h.l(1).Color    = [0.7 0.7 0.7];
h.l(2).Color    = [0.7 0.7 0.7];

% general figure settings
tmpxticks = yticks; % due to rotation is different
yticks(tmpxticks);
yticklabels(fliplr({'0%', '25%', '75%'}));
ylabel('Likelihood of Stop')
xlabel('IPI [Hz]')
set(gca, 'linewidth', 3, 'fontsize', 13);
box off

set(gcf, 'Position', [510 356 291 230]);
