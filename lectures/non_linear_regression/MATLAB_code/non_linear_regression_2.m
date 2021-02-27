function non_linear_regression_2
% Fits exponential decay to data

% Variables
excel_file_string = '../data/noisy_gaussians.xlsx';

% Code

% Read table
d = readtable(excel_file_string);

% Make a guess
g =[2 4 1 1 10 1 1]

% Use optimization to find the best fit
[g_best, best_fit_error] = ...
    fminsearch(@calculate_fit_error, g, [], d.t, d.y)

end

function y_two_gaussians = ...
    calculate_two_gaussians(t, base, x1, w1, a1, x2, w2, a2)
    y_two_gaussians = base + ...
        a1*exp(-w1*(t-x1).^2) + a2*exp(-w2*(t-x2).^2);
end

function fit_error = calculate_fit_error(g, t, y_data)
% Returns least-squares error for single exponential

guess_base = g(1);
guess_x1 = g(2);
guess_w1 = g(3);
guess_a1 = g(4);
guess_x2 = g(5);
guess_w2 = g(6);
guess_a2 = g(7);

y_guess = calculate_two_gaussians(t, guess_base, guess_x1, guess_w1, guess_a1, ...
    guess_x2, guess_w2, guess_a2);

% Calculate sum of squares error
fit_error = 0;
for counter = 1 : numel(t)
    fit_error = fit_error + (y_guess(counter)-y_data(counter))^2;
end

figure(2);
% clf;
hold on;
plot(t, y_data, 'bo');
plot(t, y_guess, 'r-');
for counter = 1 : numel(t)
    plot([t(counter) t(counter)],[y_guess(counter) y_data(counter)],'k-');
end

end