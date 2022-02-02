function homework_find_names_beginning_with_given_string(...
    file_string, search_string)
% Function returns number of names beginning with a

% Read table
t = readtable(file_string);
t_col_names = t.Properties.VariableNames';

% Get last names
last_names_as_capitals = upper(t.LastName);

logical_starts_with = startsWith(last_names_as_capitals, search_string)

number_of_names_starting_with = sum(logical_starts_with)