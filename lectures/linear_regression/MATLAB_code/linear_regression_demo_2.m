function linear_regression_demo_2
% Code shows how to fit a straight line to data

% Variables
x = 1:7;
y = [0.2474 0.18532 0.28638 0.58132 0.54259 0.72938 0.71378];

% Fit linear model
lin_mod = fitlm(x, y);
y_regression = feval(lin_mod, x);

% Pull out the slope and the intercept
coef = lin_mod.Coefficients;
intercept = coef.Estimate(1)
slope = coef.Estimate(2)

p_value = coef.pValue(2)
r_squared = lin_mod.Rsquared.Ordinary

% Pull out confidence limits for the data
[~, y_data_bounds] = predict(lin_mod, x', ...
    'Prediction', 'observation');

% Pull out confidence limits for the regression
[~, y_line_bounds] = predict(lin_mod, x', ...
    'Prediction', 'curve');


% Make a plot to show the fit

figure(1);
clf
hold on;
plot(x, y, 'bo');
plot(x, y_regression, 'rs-');
text(2, 0.7, sprintf('p = %.3f', p_value))
text(2, 0.6, sprintf('r squared = %.3f', r_squared));
plot(x, y_data_bounds, 'm--');
plot(x, y_line_bounds, 'k-');