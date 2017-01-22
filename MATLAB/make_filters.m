function [LP, HP] = make_filters(Fs)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here

    %% ----Filter Design for the EKG Signals-----------------------------------
    LP = designfilt('lowpassfir', 'FilterOrder', 100, 'CutoffFrequency', 30, ...
                    'StopbandAttenuation', 80, 'SampleRate', Fs);
    HP = designfilt('highpassfir', 'FilterOrder', 250, 'CutoffFrequency', 5.5,...
                    'StopbandAttenuation', 90, 'SampleRate', Fs);
end