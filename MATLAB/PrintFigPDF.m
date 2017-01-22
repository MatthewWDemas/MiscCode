function  PrintFigPDF( fig_name, file_name, orientation)
%PrintFigPDF Takes in a figure handle and filename and prints a PDF of the
%figure to that location.
%   I was duplicating this section of code too often, so I bundled it into
%   a function.

    if nargin < 3;
      orientation = 'landscape';
    end

    fig = fig_name;
%     fig.PaperUnits = 'inches';
    fig.PaperOrientation = orientation;
%     fig.PaperPositionMode = 'manual';
%     if strcmpi(orientation, 'portrait')
%         fig.PaperSize = [8.5 11];
%         fig.PaperPosition = [0 0 8.5 11];
%     else
%         fig.PaperSize = [11 8.5];
%         fig.PaperPosition = [0 0 11 8.5];
%     end
    fig.PaperUnits = 'normalized';
    fig.PaperPosition = [0 0 1 1];
%     fig.PaperPositionMode = 'auto';

    print(fig, file_name,...
        '-dpdf', '-r600')
end

