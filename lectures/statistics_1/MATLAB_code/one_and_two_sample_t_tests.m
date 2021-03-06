function one_and_two_sample_t_tests
% Demonstrates t-tests

% Variables
data_file_string = '../data/deidentified_clinical_data.xlsx';

% Code
d = readtable(data_file_string);
field_names = d.Properties.VariableNames';

% Pull of BMI
bmi = d.mh_bmi;
% Discard NaN values
bmi(isnan(bmi))=[]

% Create an x column with same number of values as bmi
x = ones(numel(bmi),1);

% Run a one-sample t-test comparing to 0
[h,p,ci,stats] = ttest(bmi);

% Run a one-sample t-test comparing to 25
[h,p,ci,stats] = ttest(bmi, 25);


% Compare male and female BMI
% Take data, prune to valid BMI and male or female
d = d(~isnan(d.mh_bmi),:);
x= [];
bmi = []
for counter = 1 : 2
    if (counter==1)
        vi = find(strcmp(d.demo_sex,'Male'));
    else
        vi = find(strcmp(d.demo_sex,'Female'))
    end
    x = [x ; counter*ones(numel(vi),1)];
    if (counter==2)
        offset = 0;
    else
        offset = 0;
    end
    y{counter} = offset + d.mh_bmi(vi);
    bmi = [bmi ; y{counter}]
end

% Run the t-test
[h, p, ci, stats] = ttest2(y{1}, y{2})



figure(2);
clf
swarmchart(x, bmi)

