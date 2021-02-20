function linear_regression_demo_3
% Generates random data and fits line to rows from the data

% Variables
no_of_points = 7;
no_of_trials = 1000;

% Code

% Reset random generator
rng(1);

% Generate some random data
y_all_data = rand(no_of_trials, no_of_points)

y_lowest_p_value = y_all_data(494,:)

% Loop through this a line at a time
x = [1:7];
for counter = 1 : no_of_trials
    y_row = y_all_data(counter, :);
    
    lin_mod = fitlm(x, y_row);
    y_regression = feval(lin_mod, x);

    coef = lin_mod.Coefficients;
    p_value(counter) = coef.pValue(2);
    
    figure(1);
    clf
    hold on;
    plot(x, y_row, 'bo');
    plot(x, y_regression, 'r-');
    pause(1)
    
    if (counter > 10)
        break
    end
end

figure(3);
clf;
plot(p_value, 'bo');
ylabel('p value')
xlabel('Row number');