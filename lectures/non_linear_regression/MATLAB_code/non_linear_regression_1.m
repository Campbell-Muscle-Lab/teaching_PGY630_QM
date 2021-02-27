function non_linear_regression_1
% Fits exponential decay to data

% Variables
excel_file_string = '../data/noisy_data.xlsx';

% Code

% Read table
d = readtable(excel_file_string);

% Make a guess
base =2
amp = 5
rate = 2
g = [base, amp, rate]

% Use optimization to find the best fit
[g_best, best_fit_error] = ...
    fminsearch(@calculate_fit_error, g, [], d.t, d.y)

end

function y_exp = calculate_exponential_decay(t, base, amp, rate)
    y_exp = base + amp * exp(-rate * t);
end

function fit_error = calculate_fit_error(g, t, y_data)
% Returns least-squares error for single exponential

guess_base = g(1);
guess_amp = g(2);
guess_rate = g(3);

y_guess = calculate_exponential_decay(t, guess_base, guess_amp, guess_rate);

% Calculate sum of squares error
fit_error = 0;
for counter = 1 : numel(t)
    fit_error = fit_error + (y_guess(counter)-y_data(counter))^2;
end

figure(2);
clf;
hold on;
plot(t, y_data, 'bo');
plot(t, y_guess, 'r-');
for counter = 1 : numel(t)
    plot([t(counter) t(counter)],[y_guess(counter) y_data(counter)],'k-');
end

end