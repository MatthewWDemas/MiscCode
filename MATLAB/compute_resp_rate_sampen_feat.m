function [FeatureM] = compute_resp_rate_sampen_feat(Timing,...
                                                    Avg_RR, RespComplSEn,...
                                                    MidPoint, R_index, R_t)
%% Respiration Vol Mean
%     Timing = 0:120:600;
    FeatureM = zeros(length(Timing) - 1, 8);
    
    for i=1:length(Timing)-1
        %-------- Timing Relative to EKG ---------
        [Pt1,~] = min(find(R_t >= Timing(i)));
        [Pt2,~] = max(find(R_t <= Timing(i+1)));
        FeatureM(i,1) = R_index(Pt1);
        FeatureM(i,2) = R_index(Pt2);
        RespInd = logical(MidPoint > R_index(Pt1)) & ...
                  logical(MidPoint < R_index(Pt2));
        
        % Approximate Respiration Rate Features
        tmpFeat = Avg_RR(RespInd);
        FeatureM(i,3)= mean(tmpFeat);
        FeatureM(i,4)= std(tmpFeat);
        
        % Sample Entropy Features 1st and 3rd Derivative
        tmpFeat = RespComplSEn(RespInd, 1);
        FeatureM(i,5)= mean(tmpFeat);
        FeatureM(i,6)= std(tmpFeat);
        tmpFeat = RespComplSEn(RespInd, 2);
        FeatureM(i,7)= mean(tmpFeat);
        FeatureM(i,8)= std(tmpFeat);
    end
    

    
end
    
% %%
% timeInd = [];
% sigma_hat = [];
% mu_hat = [];
% 
% for i = 1:length(Timing)-1
%     timeInd = [timeInd; t(FeatureM(i,1)); t(FeatureM(i,2))];
%     sigma_hat = [sigma_hat; FeatureM(i,4); FeatureM(i,4)];
%     mu_hat = [mu_hat; FeatureM(i,3); FeatureM(i,3)];
% end
% 
% % Form for rectanlge plot: [t1 mu_hat - sigma_hat t2 - t1
% % 2*sigma_hat]
% feat_block = [];
% for i = 1:length(Timing)-1
%     feat_block = [feat_block; t(FeatureM(i,1)) ...
%                         FeatureM(i,3) - FeatureM(i,4) ...
%                         t(FeatureM(i,2)) - t(FeatureM(i,1))...
%                         2 * FeatureM(i,4)];
% end

