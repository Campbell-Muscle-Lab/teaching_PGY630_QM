function anova_demo_1
% Run a simple one-way ANOVA

% Variables
data_file_string = '../data/example_data.xlsx';

% Code

% Read data
t = readtable(data_file_string);

% Run ANOVA
[p, tbl, stats] = anova1(t.y, t.letter, 'off');

% Show how the ANOVA table is constructed
grand_mean = mean(t.y)

% Calculate sum of squares total
ss_total = sum((t.y-grand_mean).^2)

% Calculate ss_error
unique_groups = unique(t.letter);
ss_error = 0;
for i = 1 : numel(unique_groups)
    vi = find(strcmp(t.letter, unique_groups{i}));
    ss_error = ss_error + sum((t.y(vi) - mean(t.y(vi))).^2);
end
ss_error = ss_error

% Calculate p value from F statistic
p = fcdf(40.833, 2, 5, 'upper');

% Run the post-hoc tests
[c,m,h,gnames] = multcompare(stats)
