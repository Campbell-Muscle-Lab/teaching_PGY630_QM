function non_linear_regression_3
% Fits exponential decay to data

% Variables
excel_file_string = '../data/noisy_gaussians.xlsx';

% Code

% Read table
d = readtable(excel_file_string);

figure(1);
clf

for i=1:16
    subplot(4,4,i);
    hold on;
    plot(d.t, d.y, 'b-');
    
    p = polyfit(d.t, d.y, i)
    y_poly = polyval(p, d.t);
    
    plot(d.t, y_poly, 'r-');
    ylabel(sprintf('Poly %i',i))
    
end

figure(2);
clf;
hold on;
plot(d.t, d.y, 'bo');
y_spline = spline(d.t, d.y, d.t);
plot(d.t, y_spline, 'r-');


