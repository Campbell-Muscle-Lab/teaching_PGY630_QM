function demo_plotting_1
% Demo to make some figures

figure(1)
hold on
plot(2, 3, 'ro', 'MarkerSize', 20)
plot(3, 3.5, 'gd')
xlim([0 5])
xlabel('Fiona (arbitrary units)')
ylim([0 4])
ylabel('Tucker units')