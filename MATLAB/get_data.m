function [ Data, PtLoc1, PtLoc2] = get_data(participant, session, run)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here

% Given Subject, Trial (or Run and Session), TimeSegment
% Start from trial initial time index
% Find indices of appropriate time segment
% Produce graphic of raw signal
% Produce graphic of extracted feature from that signal


    base = '~/Box Sync/Nasa Flight Data/GitHub_General/';
    load([base 'GitHub_Matt/Data/trials_information_table_v1.mat']);
    
    addpath([base 'GitHub_Matt/Data'])
    addpath([base 'GitHub_Matt/Algorithms'])
    
    dataRow = Trials(Trials.Participant == participant &  ...
                          Trials.Session == session & ...
                          Trials.Run == run, :);
                      
    Datafile = dataRow.Filename;
    taskname = dataRow.TaskName;
    runtype = dataRow.RunType;
    
    base = '~/Box Sync/Nasa Flight Data/PEC Study data/';
    filename = strcat(base, Datafile);

    load(filename{1})

    Data = ans';
    Data(:,36) = Data(:,7);
    

    if strcmp (computer('arch'),'maci64') 
        pec_data_path2 = '~/Box Sync/Nasa Flight Data/PEC Study data/';
    else
        pec_data_path2 = 'C:\Users\Nick1Nap\Box Sync\Nasa Flight Data\PEC Study data\';
    end
    addpath(pec_data_path2);

    Fs = 256;
    [LP, HP] = make_filters(Fs);
    TempEKG = filtfilt(HP, Data(:,7));
    Data(:,7) = filtfilt(LP, TempEKG);
    
    [PtLoc1, PtLoc2] = identify_data_indices(Data, participant, ...
                                             taskname, ...
                                             runtype,...
                                             Fs);
end


function [ FeatureM ] = compute_feature(featExtData, Timing)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    %% Data to Feed into the Feature Extractor
    featExtData = Data(PtLoc1:PtLoc2, [7, 8, 31, 33, 36]);

    Timing=0:120:600;
    %% HR COMPLEXITY TIMING 
    ThresStd = 0.2;
    M_C = [2, 2]; 
    T_C = [1,1];
    ThresStdR = 0.15;
    M_HR = 2;
    M_Resp = 2;

    %% Calculate R-R Intervals Prior
    [hrv, R_t,R_Amp, R_index, S_t,S_Amp]  = rpeakdetectNapoli(featExtData(:,1),Fs);

    %% Respiration Vol Mean
    FeatureM = zeros(length(Timing) - 1, 5);
    RawM = zeros;
    for i=1:length(Timing)-1
        %-------- Timing Relative to EKG ---------
        [Pt1,~]=min(find(R_t>=Timing(i)));
        [Pt2,~]=max(find(R_t<=Timing(i+1)));
        Temp = featExtData(R_index(Pt1:Pt2),2);
        % Feature # 23
        FeatureM(i,1) = R_index(Pt1);
        FeatureM(i,2) = R_index(Pt2);
        FeatureM(i,3) = mean(Temp);
        FeatureM(i,4) = std(Temp);
    end
end




