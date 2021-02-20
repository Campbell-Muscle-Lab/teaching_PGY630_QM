function linear_regression_demo_1
% Code shows how to fit a straight line to data

% Variables
x = 1:7;
y = [0.2474 0.18532 0.28638 0.58132 0.54259 0.72938 0.71378];

% Code

% Make a guess for slope and intercept
slope = 0.5;
intercept = 1;
g = [slope, intercept];

% Use optimization to find the best fit
[g_best, best_fit_error] = fminsearch(@calculate_fit_error, g, [], x, y)

end


function y_fit = calculate_line(x_fit, slope, intercept)
    y_fit = (slope * x_fit) + intercept;
end

function fit_error = calculate_fit_error(g, x_data, y_data)
    % Returns least-squares error for linear regression to x and y
    
    guess_slope = g(1);
    guess_intercept = g(2);
    
    y_guess = calculate_line(x_data, guess_slope, guess_intercept);
    
    % Calculate sum of squares error
    fit_error = 0;
    for counter = 1 : numel(x_data)
        fit_error = fit_error + (y_guess(counter) - y_data(counter))^2;
    end
    
    figure(2);
    clf
    hold on;
    plot(x_data, y_data, 'bo');
    plot(x_data, y_guess, 'r-');
    for counter = 1 : numel(x_data)
        plot([x_data(counter) x_data(counter)], ...
            [y_data(counter) y_guess(counter)], 'm-');
    end
    xlim([0 8]);
end