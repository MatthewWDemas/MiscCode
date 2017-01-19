function varlist(varargin)
   fprintf('Number of arguments: %d\n',nargin)
   celldisp(varargin)
   
    named_vars = varargin(1:2:length(varargin));
    
%     [bool, ind] = ismember('methodPermEn', named_vars);
%     if ~bool
%         methodPermEn = 'order';
%     else
%         methodPermEn = varargin{2*ind};
%     end
% 
%     [bool, ind] = ismember('dim', named_vars);
%     if ~bool
%         dim = 2;
%     else
%         dim = varargin{2*ind};
%     end
% 
%     [bool, ind] = ismember('tau', named_vars);
%     if ~bool
%         tau = 1;
%     else
%         tau = varargin{2*ind};
%     end
% 
%     [bool, ind] = ismember('ThresEn', named_vars);
%     if ~bool
%         ThresEn = 0.2;
%     else
%         ThresEn = varargin{2*ind};
%     end
% 
%     [bool, ind] = ismember('nPermEn', named_vars);
%     if ~bool
%         nPermEn = 3;
%     else
%         nPermEn = varargin{2*ind};
%     end
   
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    varargs = {'methodPermEn', 'dim', 'tau', 'ThresEn', 'nPermEn'};
    [bool, ind] = ismember(varargs, named_vars)
    
    try
        methodPermEn = varargin{2*ind(1)};
    catch
        methodPermEn = 'order';
    end
    

    [bool, ind] = ismember('dim', named_vars);
    if ~bool
        dim = 2;
    else
        dim = varargin{2*ind};
    end

    [bool, ind] = ismember('tau', named_vars);
    if ~bool
        tau = 1;
    else
        tau = varargin{2*ind};
    end

    [bool, ind] = ismember('ThresEn', named_vars);
    if ~bool
        ThresEn = 0.2;
    else
        ThresEn = varargin{2*ind};
    end

    [bool, ind] = ismember('nPermEn', named_vars);
    if ~bool
        nPermEn = 3;
    else
        nPermEn = varargin{2*ind};
    end
    
end