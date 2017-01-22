function [ acceptNull, confint, bootstrapStat ] = ttest2boot( x1, x2, nReps, alpha, desc)
%ttest2boot Computes bootstrapped two-sample t-test for difference in means
%   Copied from http://courses.washington.edu/matlab1/Bootstrap_examples.html
% INPUT:
%   x1: 1-D array of numbers (sample 1).
%   x2: 1-D array of numbers (sample 2).
%   nReps: integer describing # of boostrap replicates.
%   alpha: real number describing the significance level.
%   desc: string containing title description.
% OUTPUT:
%   H: binary 1 = failed to reject null; 0 = rejected the null
%   CI: 1x2 array of confidence interval of test statistic.
%   bootstrapStat: 1xnReps array of test statistic values.



%% Define Replicates
% nReps = 100000;
n1 = length(x1);            %sample size 1
n2 = length(x2);            %sample size 2
% alpha = 0.05;               %alpha value

%% define the statistic as the difference between means
myStatistic = @(x1,x2) mean(x1)-mean(x2);

sampStat = myStatistic(x1,x2);
bootstrapStat = zeros(nReps,1);
for i=1:nReps
    sampX1 = x1(ceil(rand(n1,1)*n1));
    sampX2 = x2(ceil(rand(n2,1)*n2));
    bootstrapStat(i) = myStatistic(sampX1,sampX2);
end

%% Calculate the confidence interval (I could make a function out of this...)
confint = prctile(bootstrapStat,[100*alpha/2,100*(1-alpha/2)]);

%% Hypothesis test: Does the confidence interval cover zero?
acceptNull = confint(1)>0 | confint(2)<0;

%% Draw a histogram of the sampled statistic

% clf
figure
xx = min(bootstrapStat):.01:max(bootstrapStat);
histogram(bootstrapStat,xx);
hold on
ylim = get(gca,'YLim');
h1=plot(sampStat*[1,1],ylim,'y-','LineWidth',2);
h2=plot(confint(1)*[1,1],ylim,'r-','LineWidth',2);
plot(confint(2)*[1,1],ylim,'r-','LineWidth',2);
h3=plot([0,0],ylim,'b-','LineWidth',2);
xlabel('Difference between means');

decision = {'Fail to reject H0','Reject H0'};
title([desc decision(acceptNull+1) ' -- ' int2str(nReps)]);
legend([h1,h2,h3],...
       {'Sample mean', sprintf('%2.0f%% CI', 100 * alpha), 'H0 mean'},...
       'Location','NorthWest');
end
