function demo_plotting_2
% Plots lines and makes subplots

% Create some example data
t = linspace(0, 20, 1000);
y_sin = sin(t);
y_cos = cos(t);

% Display on a figure
figure(2);
clf
subplot(2, 2, 1);
plot(t, y_sin, 'r-');
subplot(2, 2, 2)
plot(t, y_cos, 'g--', 'LineWidth', 3);
subplot(2, 2, 3)
plot(t, y_cos, 'b--', 'LineWidth', 2);