function [ zscore_metric ] = zscore_subject( participant, metric )
% zscore_subject Computes the z-score of non-nan values for a given metric for 
%                  each participant. 
% INPUTS
% participant: a 1-D array of participant numbers aligned with a metric
% metric: a 1-D array of metric values aligned with the particpant number
%
% OUPUT
% zscore_metric: a 1-D array of the metric values where the z-score has
%   been computed for each participant's scores


zscore_metric = nan * metric;

for iPart = 1:49
    iPartInd = logical(participant == iPart);
    iPartMetric = ~isnan(metric);
    zscore_metric(iPartInd & iPartMetric,:) = zscore(metric(iPartInd & ...
                                                            iPartMetric,:));

end

end