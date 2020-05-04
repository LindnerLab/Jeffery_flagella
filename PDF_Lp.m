function PDF_Lp(Lp)
%CREATEFIT    Create plot of datasets and fits
%   CREATEFIT(LP)
%   Creates a plot, similar to the plot in the main distribution fitter
%   window, using the data that you provide as input.  You can
%   apply this function to the same data you used with dfittool
%   or with different data.  You may want to edit the function to
%   customize the code and this help message.
%
%   Number of datasets:  1
%   Number of fits:  0
%
%   See also FITDIST.

% This function was automatically generated on 04-May-2020 12:42:57

% Data from dataset "Lp data":
%    Y = Lp

% Force all inputs to be column vectors
Lp = Lp(:);

% Prepare figure
clf;
hold on;
%LegHandles = []; LegText = {};


% --- Plot data originally in dataset "Lp data"
[CdfF,CdfX] = ecdf(Lp,'Function','cdf');  % compute empirical cdf
BinInfo.rule = 1;
[~,BinEdge] = internal.stats.histbins(Lp,[],[],BinInfo,CdfF,CdfX);
[BinHeight,BinCenter] = ecdfhist(CdfF,CdfX,'edges',BinEdge);
hLine = bar(BinCenter,BinHeight,'hist');
set(hLine,'FaceColor','none','EdgeColor',[0.333333 0 0.666667],...
    'LineStyle','-', 'LineWidth',1);
title('Distribution of Lp (�m)')
xlabel('Lp (�m)');
ylabel('PDF(Lp)')
%LegHandles(end+1) = hLine;
%LegText{end+1} = 'Lp data';

% Create grid where function will be computed
XLim = get(gca,'XLim');
XLim = XLim + [-1 1] * 0.01 * diff(XLim);
XGrid = linspace(XLim(1),XLim(2),100);


% Adjust figure
box on;
hold off;

% Create legend from accumulated handles and labels
% hLegend = legend(LegHandles,LegText,'Orientation', 'vertical', 'FontSize', 9, 'Location', 'northeast');
% set(hLegend,'Interpreter','none');