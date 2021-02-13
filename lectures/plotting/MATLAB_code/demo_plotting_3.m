function demo_plotting_3
% plots data from excel file

% Variables
data_file_string = '../data/dog_treats.xlsx';

% Code
t = readtable(data_file_string);

% Use findgroups command to partition the table
[t.g, id] = findgroups(t.Breed);

mean_values = splitapply(@mean, t.Treats_per_day, t.g);
std_values = splitapply(@std, t.Treats_per_day, t.g);

% Make a figure
figure(3);
clf
% Simple bar chart
subplot(3, 1, 1);
bar(mean_values);
ylabel('Treats per day');
xticklabels(id);

% Error bar
subplot(3, 1, 2);
errorbar(mean_values, std_values, 'bd', 'MarkerSize', 10);
ylabel('Treats per day');
xticks([1:3])
xticklabels(id);
ylim([0 10]);

% Swarmchart
subplot(3, 1, 3);
swarmchart(t.g, t.Treats_per_day, 'Filled')

