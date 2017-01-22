function [PtLoc1, PtLoc2] = identify_data_indices(Data, participant, ...
                                                  taskname, runtype,...
                                                  Fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   j is either CFT/COG (1), MATB (2), or SIM (3)

    base = '~/Box Sync/Nasa Flight Data/GitHub_General/';
    load([base 'GitHub_Matt/Data/trials_information_table_v1.mat']);
    
    addpath([base 'GitHub_Matt/Data'])
    addpath([base 'GitHub_Matt/Algorithms'])

    base = '~/Box Sync/Nasa Flight Data/';
    gitFld = 'GitHub_General/';
    load([base gitFld 'SharedDataExport/' 'TimeStampsIn.mat'])
    
    if strcmp (computer('arch'),'maci64') 
        pec_data_path2 = '~/Box Sync/Nasa Flight Data/PEC Study data/';
    else
        pec_data_path2 = 'C:\Users\Nick1Nap\Box Sync\Nasa Flight Data\PEC Study data\';
    end
    addpath(pec_data_path2);



    if (strncmpi(taskname, 'cft', 3) == true) | (strncmpi(taskname, 'cog', 3) == true)
            taskSessionNum = 2;
    elseif strncmpi(taskname, 'matb', 3)
            taskSessionNum = 3;
    elseif strcmpi(taskname, 'sim')
            taskSessionNum = 4;
    end

    if runtype == 1
        [PtLoc1, PtLoc2, ErrorI] = ...
            PreprocessingPoints(TrainS{participant, taskSessionNum},...
                                Data(:,27), Fs);
    elseif runtype == 2
        [PtLoc1, PtLoc2, ErrorI] = ...
            PreprocessingPoints(NonHypoxiaS{participant,taskSessionNum},...
                                Data(:,27), Fs);
    elseif runtype == 3
        [PtLoc1, PtLoc2, ErrorI] = ...
            PreprocessingPoints(HypoxiaS{participant,taskSessionNum},...
                                Data(:,27), Fs);
    end
end