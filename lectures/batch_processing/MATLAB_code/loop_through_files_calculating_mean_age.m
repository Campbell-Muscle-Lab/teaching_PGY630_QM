function loop_through_files
% Loop through files in a directory

% Variables
search_string = '../data/*.xlsx';
output_file_string = '../output/mean_age_in_file.xlsx';

% Code

% Find excel files in the data directory
dir_data = dir(search_string)

% Looping through the files
for file_counter = 1 : numel(dir_data)
    
    % Pick off the folder and file names
    folder_name = dir_data(file_counter).folder;
    file_name = dir_data(file_counter).name;
    
    % Join folder and file to create a complete name
    full_name = fullfile(folder_name, file_name);
    
    % Use another function to return the mean age
    mean_age(file_counter) = ...
        calculate_mean_age_in_excel_file(full_name);
    
    % What was the sample type
    sample_type{file_counter} = file_name(1:(end-5));
end

% Make a new table with the summary data
summary_table = table(sample_type', mean_age', ...
                    'VariableNames', {'Type','Mean age'})

% Write new table
try
    delete(output_file_string)
end
writetable(summary_table, output_file_string);
