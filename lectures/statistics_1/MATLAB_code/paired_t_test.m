function paired_t_test
% Demos a paired t-test

% Variables
data_file_string = '../data/paired_samples.xlsx';

% Code
d = readtable(data_file_string);

% Plot data
before = d.Before;
after = d.After;

figure(3);
clf
hold on;
for counter = 1 : numel(before)
    plot(1, before(counter), 'bo');
    plot(2, after(counter), 'rs');
    plot([1 2], [before(counter) after(counter)], 'm-');
end
xticks([0:3]);
xticklabels({'','Before','After',''})
ylim([0 2]);
xlim([0 3]);

% Run a 2-sample t-test
[h, p, ci, stats] = ttest2(before, after);

% Run a paired t-test
[h, p, ci, stats] = ttest(before, after)