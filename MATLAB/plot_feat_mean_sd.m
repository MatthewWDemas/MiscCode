function [] = plot_feat_mean_sd(Timing, FeatureM, t)

    % Form for rectanlge plot: [t1 mu_hat - sigma_hat t2 - t1
    % 2*sigma_hat]

for iTimeSeg = 1:length(Timing)-1
    startTime =  t(FeatureM(iTimeSeg,1));
    deltaTime = t(FeatureM(iTimeSeg,2)) - t(FeatureM(iTimeSeg,1));
    mu = FeatureM(iTimeSeg,3);
    sigma = FeatureM(iTimeSeg,4);
    feat_rect_upper = [startTime mu deltaTime sigma];
    feat_rect_lower = [startTime mu-sigma deltaTime sigma];
    
    rectangle('Position', feat_rect_upper, ...
              'FaceColor', [0.9 0.9 0.9], ...
              'LineStyle', '-.',...
              'EdgeColor', [1 1 1])
    hold on
    rectangle('Position', feat_rect_lower, ...
              'FaceColor', [0.9 0.9 0.9], ...
              'LineStyle', '-.',...
              'EdgeColor', [1 1 1])
end

end