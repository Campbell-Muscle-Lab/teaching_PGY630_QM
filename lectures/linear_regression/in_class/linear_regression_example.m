function linear_regression_example

% Variables
data_file_string = '../data/summarized_mechanics.xlsx';
excel_sheet = 'force_x_patient';
chosen_SL = 2.3;
chosen_pCa = 4.8;

% Code

% Read in data
d = readtable(data_file_string, 'Sheet', excel_sheet);

% Find rows that match chosen SL and pCa
valid_indices = find( ...
                    (d.SL == chosen_SL) & ...
                    (d.pCa == chosen_pCa));

d_regression = d(valid_indices, :);

% Pull out the data
x = d_regression.hydroxy_per_mg_tissue;
y = d_regression.f_mean;

% Fit a straight line
line_model = fitlm(x, y)

coefficients = line_model.Coefficients;
intercept = coefficients.Estimate(1);
slope = coefficients.Estimate(2);

r_squared = line_model.Rsquared.Ordinary;

% Make our own regression line
x_fit = linspace(0,100, 100);
y_fit = (slope * x_fit) + intercept;

% Make a figure
figure(2);
clf
hold on
plot(x, y, 'bo');
plot(x_fit, y_fit, 'k-', 'LineWidth', 2);
text(20, 2.4e4, sprintf('r^2 = %.3f', r_squared));
