function [ FeatureM ] = compute_hr_sampen(featExtData, PtLoc1, PtLoc2, Timing, Fs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


    %% Data to Feed into the Feature Extractor
%     featExtData = featExtData(PtLoc1:PtLoc2, [7, 8, 31, 33, 36]);
    featExtData = featExtData(PtLoc1:PtLoc2, [7, 8, 31, 34, 36]);

%     Timing=0:120:600;
    %% HR COMPLEXITY TIMING 
    ThresStd = 0.2;
    M_C = [2, 2]; 
    T_C = [1, 1];
    ThresStdR = 0.15;
    M_HR = 2;
    M_Resp = 2;

    %% Calculate R-R Intervals Prior
    [hrv, R_t,R_Amp, R_index, S_t,S_Amp]  = rpeakdetectNapoli(featExtData(:,1),Fs);
    
    hrvE = zscore(hrv);
    %% Respiration Vol Mean
    FeatureM = zeros(length(Timing) - 1, 5);
    RawM = zeros;
    for i=1:length(Timing)-1
        %-------- Timing Relative to EKG ---------
        [Pt1,~] = min(find(R_t>=Timing(i)));
        [Pt2,~] = max(find(R_t<=Timing(i+1)));

        % Feature # 23
        FeatureM(i,1) = R_index(Pt1);
        FeatureM(i,2) = R_index(Pt2);
        %------ Sample Entropy R-R Total Series-----
        Temp=((hrvE(Pt1:Pt2-1)));
        FeatureM(i,3) = SampEn(M_HR,ThresStd,Temp);          
        %------ R-R Sample Entropy Segment Series ------
        Temp = zscore(diff(R_t(Pt1:Pt2)));
        FeatureM(i,4) = SampEn(M_HR,ThresStd,Temp);
    end
    
end

