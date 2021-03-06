function statistics_sem_and_one_sample_t_test
% Demos for sd, sem and one-sample t test

% Variables
n_population = 1e7
n_sample = 10
n_repeats = 1e6

mean_hypo = 120

% Code
% Reset random number generator and produce values
rng(1)
systolic_values = mean_hypo + 20*randn(n_population,1);

% Plot figure
figure(1);
clf
subplot(3,1,1)
histogram(systolic_values, linspace(0,240,241))
ylabel('Number of people')
xlabel('Systolic blood pressure')

% Loop, picking n_sample blood pressures each time
sample_bp = [];
sample_t = []
for counter = 1 : n_repeats
    ids = randi(n_population, [n_sample, 1]);
    ids_sbp = systolic_values(ids);
    sample_bp = [sample_bp mean(ids_sbp)];
    
    mean_sample = mean(ids_sbp);
    se_sample = std(ids_sbp) / sqrt(n_sample);
    t_stat = (mean_sample - 120) / se_sample;
    
    sample_t = [sample_t t_stat];
end

    
subplot(3,1,2);
histogram(sample_bp, linspace(0, 240, 241));
ylabel('Number of estimates')
xlabel('Systolic blood pressure');

subplot(3,1,3);
histogram(sample_t, linspace(-10, 10, 210));
ylabel('Number of t values')
xlabel('t statistic');

t_critical = tinv(0.025, (n_sample-1))
vi = sum((sample_t < t_critical) | (sample_t > -t_critical));
p_estimate = sum(vi) / n_repeats



