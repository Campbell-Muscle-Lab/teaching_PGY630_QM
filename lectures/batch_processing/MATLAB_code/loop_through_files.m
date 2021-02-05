function loop_through_files
% Loop through files in a directory

% Variables
search_string = '../data/*.xlsx';
output_file_string = '../output/number_of_samples_per_type.xlsx';

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
    
    % Open the file
    t = readtable(full_name);
    
    % How many samples
    [no_of_samples(file_counter), ~] = size(t);
    
    % What was the sample type
    sample_type{file_counter} = file_name(1:(end-5));
end

% Make a new table with the summary data
summary_table = table(sample_type', no_of_samples', ...
                    'VariableNames', {'Type','Number'})

% Write new table
try
    delete(output_file_string)
end
writetable(summary_table, output_file_string);
