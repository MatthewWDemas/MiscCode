function [ ] = plot_trial_data(data_table, time_var, plot_var, trial_var, ...
                                  notable_subj, xlab, ylab, desc)

% data_table
% time_var
% plot_var
% notable_subj
% xlab, ylab, desc

% cm1 = 0.8 * colormap('hsv');
% cm = cm1(1:49,:);
cm0 = 0.8 * colormap('hsv');
cm1 = cm0(1:2:48,:);
cm2 = cm0(2:2:50,:);
cm = [cm1; cm2];

Part = unique(data_table.Participant);

for i = 1:length(Part)
    for j = 1:max(data_table{:, trial_var})
        tmpX = data_table(data_table.Participant == Part(i) & ...
                      data_table{:, trial_var} == j, :);
        plot(tmpX{:, time_var}, tmpX{:, plot_var}, 'Color', [0.8 0.8 0.8])
        hold on
    end
end

for i = 1:length(notable_subj)
    for j = 1:max(data_table{:, trial_var})
        tmpX = data_table(data_table.Participant == notable_subj(i) & ...
                      data_table{:, trial_var} == j, :);
        plot(tmpX{:, time_var}, tmpX{:, plot_var}, 'Color', cm(notable_subj(i),:))
        hold on
    end
end

% [Part ismember(Part, notable_subj) cm(ismember(Part, notable_subj),:)]

notable_subj_ind = ismember(data_table.Participant, notable_subj);

g1 = gscatter(data_table{notable_subj_ind, time_var},...
              data_table{notable_subj_ind, plot_var}, ...
              data_table{notable_subj_ind, 'Participant'}, ...
              cm(ismember(Part, notable_subj),:));
xlabel(xlab)
ylabel(ylab)
title(desc)
legend(g1, 'Location', 'bestoutside')

end

