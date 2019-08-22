classdef adjustBox < handle
%adjustBoxDim 自动调整图片大小与比例
%   调整图片大小与比例
%   部分内容借鉴Plot Class.
%   Returns a plot object which can be used for subsequent property 
%   changes.
%   How to run:
%   plt = adjustBoxDim;
% Properties:
%   BoxDim:       vector [width, height]: size of the axes box in inches; 
%                 default: [6, 2.5]
%   ShowBox:      'on' = show or 'off' = hide bounding box
%   FontName:     string: font name; default: 'Helvetica'
%   FontSize:     integer; default: 26
%   LineWidth:    vector [width1, width2, ..]: element i changes the 
%                 property of i-th dataset; default: 2
%   LineStyle:    cell array {'style1', 'style2', ..}: element i changes 
%                 the property of i-th dataset; default: '-'
%   LineCount:    Number of plots (readonly)
%   Markers:      cell array {'marker1', 'marker2', ..}: element i changes 
%                 the property of i-th dataset; default: 'None'
%   MarkerSpacing:vector [space1, space2, ..]: element i changes the 
%                 property of i-th dataset; default: 0
%   Colors:       3xN matrix, [red, green, blue] where N is the number of 
%                 datasets.
%   AxisColor:    axis color, [red, green, blue]; default black.
%   AxisLineWidth:axis line width, number; default 2.
%   XLabel:       X axis label
%   YLabel:       Y axis label
%   ZLabel:       Z axis label
%   XTick:        [tick1, tick2, ..]: major ticks for X axis.
%   YTick:        [tick1, tick2, ..]: major ticks for Y axis.
%   ZTick:        [tick1, tick2, ..]: major ticks for Z axis.
%   XMinorTick:   'on' or 'off': show X minor tick?
%   YMinorTick:   'on' or 'off': show Y minor tick?
%   ZMinorTick:   'on' or 'off': show Z minor tick?
%   TickDir:      tick direction: 'in' or 'out'; default: 'in'
%   TickLength:   tick length; default: [0.02, 0.02]
%   XLim:         [min, max]: X axis limit.
%   YLim:         [min, max]: Y axis limit.
%   ZLim:         [min, max]: Z axis limit.
%   XScale:       'linear' or 'log': X axis scale.
%   YScale:       'linear' or 'log': Y axis scale.
%   ZScale:       'linear' or 'log': Z axis scale.
%   XGrid:        'on' or 'off': show grid in X axis?
%   YGrid:        'on' or 'off': show grid in Y axis?
%   ZGrid:        'on' or 'off': show grid in Z axis?
%   XDir:         'in' or 'out': X axis tick direction
%   YDir:         'in' or 'out': Y axis tick direction
%   ZDir:         'in' or 'out': Z axis tick direction
%   Legend:       {'legend1','legend2',...}
%   LegendBox:    bounding box of legend: 'on'/'off'; default: 'off'
%   LegendBoxColor: color of the bounding box of legend; default: 'none'
%   LegendTextColor: color of the legend text; default: [0,0,0]
%   LegendEdgeColor: color of the legend edges; default: [0,0,0]
%   LegendLoc:    'NorthEast', ..., 'SouthWest': legend location
%   LegendOrientation:  'horizontal' or 'vertical: 'Orientation of the legend; default: 'vertical'
%   Title:        plot title, string
%   Resolution:   Resolution (dpi) for bitmapped file. Default:600.
%   HoldLines:    true/false. true == only modify axes settings, do not 
%                 touch plot lines/surfaces. Default false.
%
%
    
   
      % Private properties
    properties(Hidden, SetAccess = private, GetAccess = private)
        % Handles
        hfig        % Figure
        haxes       % Axes
        
        htitle      % Title
        
        hxlabel     % XLabel
        hylabel     % YLabel
        hzlabel     % ZLabel
        
        hp          % plot handle
        hm          % plot handle for marker plots
        hfm         % plot handle for fake marker plots
        N           % number of plots
        xdata       % x coordinates of the plots
        ydata       % y coordinates of the plots
        zdata       % z coordinates of the plots
        
        holdLines   % if true, do not change existing plots.
        
        % private helper members
        boxDim      % The box dimension, private member. Needed since matlab changes the box dimension when fonts are changed.
        legendText  % legend text cell-array
        hlegend     % legend handle
        lineWidth   % line width
        lineStyle   % line style
        markers     % markers
        markerSpacing % marker spacing
        colors      % line colors
        legendBox          % legend box, on/off
        legendBoxColor     % legend box color
        legendTextColor    % legend text color
        
        xMinorGrid
        yMinorGrid
        zMinorGrid

    end
    methods
        % Constructor
        function obj =  adjustBox(handle)
            obj.hfig = handle;
            obj.haxes = get(obj.hfig, 'CurrentAxes');
            obj.adjust()
        end
    end
    methods
        function adjust(obj)
            obj.hfig.Units = 'inches';
            obj.hfig.Position = [7 4.1250 7.3125 3.8094];
            obj.haxes.FontName = 'Arial';
            obj.haxes.FontSize = 20;
            obj.haxes.Units = 'inches';
            obj.haxes.Position = [0.7583 0.4813 6 3];
            obj.haxes.Box = 'on';
            obj.haxes.LineWidth = 1.5;
            
        end
    end
end

