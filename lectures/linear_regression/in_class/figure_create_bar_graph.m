function figure_create_bar_graph

figure(1);
clf

subplot(4,1,1)
y = [1 2 3]
bar(y)

subplot(4,1,2)
y2 = [10 11 12]'
bar(y2)

subplot(4,1,3);
y3 = [1 2 3 ; 4 5 6]
bar(y3)

subplot(4,1,4);
bar(y3, 'stacked')

text(1, 10, {'Ken','r^2 = 0._{98}'}, ...
    'FontSize', 12, ...
    'HorizontalAlignment', 'center')