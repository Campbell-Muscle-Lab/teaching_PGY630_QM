function mean_age = calculate_mean_age_in_excel_file(excel_file_string)
% Function takes file name as input, opens file and calculates mean age
% returns that result

% Code

% Open table
t = readtable(excel_file_string);

% Get the birthdates

birth_dates = t.BirthDate;
collection_dates = t.CollectionDate;

age_as_datetime = between(birth_dates, collection_dates);
age_in_years = split(age_as_datetime, 'years');

% Calculate mean age
mean_age = mean(age_in_years,'omitnan')




