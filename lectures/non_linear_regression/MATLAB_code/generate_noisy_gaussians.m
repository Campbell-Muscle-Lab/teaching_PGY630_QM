function generate_noisy_gaussians
% Generates noisy gaussians and writes to file

% Variables
output_file_string = '../data/noisy_gaussians.xlsx';

% Code

t = linspace(0, 20, 100)
y = 4 + 2*exp(-1*(t-3).^2) + 3*exp(-0.5*(t-11).^2);

figure(1);
clf
plot(t,y,'o');

d = table(t',y', 'VariableNames',{'t','y'});

try
    delete(output_file_string);
end
writetable(d, output_file_string);