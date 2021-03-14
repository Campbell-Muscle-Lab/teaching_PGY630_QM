function anova_demo_1
% Run a simple two-way ANOVA

% Variables
data_file_string = '../data/example_data_2.xlsx';

% Code

% Read data
t = readtable(data_file_string);

% Run the 2 way ANOVA
[p, tbl, stats] = anovan(t.y, {t.letter, t.color}, ...
    'model', 'interaction', ...
    'varnames', {'Letter', 'Color'})

% Run the multiple comparison test
[c,m,h,gnames] = multcompare(stats, 'Dimension',[1 2])
