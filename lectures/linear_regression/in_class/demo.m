function figure_demo

repeats = 25
y = [2 3 4] + 0.5*(rand(repeats,3)-0.5);
x = repmat([1 2 3], [repeats, 1]);
x = x(:);
x = x + 0.3*(rand(numel(x),1)-0.5);
y = y(:)

% Fit a straight line
line_model = fitlm(x, y)

coefficients = line_model.Coefficients;
intercept = coefficients.Estimate(1);
slope = coefficients.Estimate(2);

r_squared = line_model.Rsquared.Ordinary;

x_fit = linspace(0,5,100);

[~, y_line_bounds] = predict(line_model, x_fit', ...
    'Prediction', 'curve');

[~, y_data_bounds] = predict(line_model, x_fit', ...
    'Prediction', 'observation');

r_squared = line_model.Rsquared.Ordinary;


figure(4);
clf
hold on

plot(x, y, 'bo');
y_fit = intercept + slope*x_fit;
plot(x_fit, y_fit, 'k-')
xlabel('Protein Concentration')
ylabel('Optical Density')
plot(x_fit, y_line_bounds, 'b--');
plot(x_fit, y_data_bounds, 'r--');
text(1, 6, sprintf('r^2 = %.3f', r_squared))