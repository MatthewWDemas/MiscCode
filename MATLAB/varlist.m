function varlist(varargin)
%    fprintf('Number of arguments: %d\n',nargin)
%    celldisp(varargin)

% You have provided the following valid arguments.
% You have provided the following invalid arguments, they will be ignored.

    named_vars = varargin(1:2:length(varargin));
    [~, ind] = ismember('methodPermEn', named_vars);
    try
        methodPermEn = varargin{2*ind}
    catch
        methodPermEn = 'order'
    end

    [~, ind] = ismember('dim', named_vars);
    try
        dim = varargin{2*ind}
    catch
        dim = 2
    end

    [~, ind] = ismember('tau', named_vars);
    try
        tau = varargin{2*ind}
    catch
        tau = 1
    end

    [~, ind] = ismember('ThresEn', named_vars);
    try
        ThresEn = varargin{2*ind}
    catch
        ThresEn = 0.2
    end

    [~, ind] = ismember('nPermEn', named_vars);
    try
        nPermEn = varargin{2*ind}
    catch
        nPermEn = 3
    end
    
end

% TODO: This process takes up a lot of space! I may look further into how
% to generate a function to accept a list of desired possible named
% arguments and output the 