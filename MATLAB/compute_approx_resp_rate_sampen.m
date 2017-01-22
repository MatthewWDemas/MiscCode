function [Avg_RR, RespComplSEn, MidPoint, t] = ...
                                compute_approx_resp_rate_sampen(Temp, Fs, ...
                                                                window_size,...
                                                                SF, FFreq)

%%
%----- Initialize Parameters---------
% Fs = 256;   % Sampling Frequency
FT = (window_size/60); % Fraction of Time (10 seconds)
TSeg = 60*Fs*FT; % Windowed Length 

N = floor(length(Temp)/TSeg); % Number of Segments 
t = 0:1/Fs:length(Temp)/Fs-(1/Fs); % Timing 

%-------------------------------------------------------------------------
%-------- Calculate Estimate Respiration Over Time Time Segments-----------
%-------------------------------------------------------------------------

parfor i=1:N;
    % Windowed Time Segment
    TempN = Temp((i-1)*TSeg+1:i*TSeg);                            
    % Approximate Mid Point
    MidPoint(i) = floor((i-1)*TSeg+1+(TSeg/2) );                  
    % Estimate of the Respiration
    [Avg_RR(i)]=Resp_EstMoment(TempN,Fs,SF);                     
    % Respiration Entropy
    [RespComplSEn(i,:)]=RespComplex_SEn(TempN,[1 3], .15, 2) ;   
end