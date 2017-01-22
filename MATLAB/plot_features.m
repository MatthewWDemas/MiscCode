function [  ] = plot_features(featExtData, FeatureM, Timing, DataCol)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %% Plot Raw and Feature Data
    timeInd = [];
    sigma_hat = [];
    mu_hat = [];

    for i = 1:length(Timing)-1
        timeInd = [timeInd; FeatureM(i,1); FeatureM(i,2)];
        sigma_hat = [sigma_hat; FeatureM(i,4); FeatureM(i,4)];
        mu_hat = [mu_hat; FeatureM(i,3); FeatureM(i,3)];
    end

    figure;
    area(timeInd, mu_hat + sigma_hat, 'FaceColor', [0.9 0.9 0.9], ...
                                      'LineStyle', '-.',...
                                      'EdgeColor', [1 1 1],...
                                      'FaceAlpha', 0.5)
    hold on
    area(timeInd, mu_hat - sigma_hat, 'FaceColor', [0.9 0.9 0.9], ...
                                      'LineStyle', '-.',...
                                      'EdgeColor', [1 1 1],...
                                      'FaceAlpha', 0.5)

    plot(featExtData(:,DataCol), 'Color', [0.7 0.7 0.7], 'LineStyle', '-')

    hold on
    for iTimeSeg = 1:length(Timing)-1
        line([FeatureM(iTimeSeg,1) FeatureM(iTimeSeg,2)], ...
             [FeatureM(iTimeSeg,3) FeatureM(iTimeSeg,3)]);
    end

end