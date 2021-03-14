function in_class_demo_of_fitting_histogram

% Variables
data_file_string = '../data/deidentified_clinical_data.xlsx';

% Code

% Read in table
t = readtable(data_file_string);
table_names = t.Properties.VariableNames';

% Pull off age
raw_ages = t.demo_age;
nan_indices = isnan(raw_ages);
raw_ages(nan_indices)=[];

filtered_ages = raw_ages;

% Take ages and count them in bins
x_edges =[0:101];
x_bins = x_edges(1:(end-1));
y_bins = histcounts(filtered_ages, x_edges);

figure(1)
clf
bar(x_bins, y_bins, 1);

% Now fit the Guassian
% Make a guess
g =[50 0.01 10]

% Use optimization to find the best fit
[g_best, best_fit_error] = ...
    fminsearch(@calculate_fit_error, g, [], x_bins, y_bins)

end

function y_one_gaussian = ...
    calculate_one_gaussian(x_data, x_center, wid, amp)
    y_one_gaussian = amp*exp(-wid*(x_data - x_center).^2);
end

function fit_error = calculate_fit_error(g, t, y_data)
% Returns least-squares error for single exponential

    guess_x_center = g(1);
    guess_x_width = g(2);
    guess_amp = g(3);

    y_guess = calculate_one_gaussian(t, guess_x_center, guess_x_width, guess_amp);

    % Calculate sum of squares error
    fit_error = 0;
    for counter = 1 : numel(t)
        fit_error = fit_error + (y_guess(counter)-y_data(counter))^2;
    end

    figure(2);
    clf;
    hold on;
    plot(t, y_data, 'bo-');
    plot(t, y_guess, 'r-');

end