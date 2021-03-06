function linear_regression_demo

n = 100;
x = linspace(0,10,n);
y = 3 + 0.3*x + (rand(1,n)-0.5);


lm = fit_linear_model(x,y, 'figure_handle',1)