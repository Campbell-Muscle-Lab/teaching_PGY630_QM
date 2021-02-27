function generate_noisy_exponential
% Generates a noisy exponential decay and writes to file

% Variables
output_file_string = '../data/noisy_data.xlsx';

% Code

t = linspace(0, 5, 100);
y = 2.3 + 5.4 * exp(-1.2*t) + 0.3*randn(1, numel(t));

figure(1);
clf
plot(t,y,'o');

d = table(t',y', 'VariableNames',{'t','y'});

try
    delete(output_file_string);
end
writetable(d, output_file_string);