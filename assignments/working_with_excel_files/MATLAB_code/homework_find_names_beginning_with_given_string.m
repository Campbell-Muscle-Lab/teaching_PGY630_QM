function search_table(...
    file_string, col_name, search_string)
% Function returns number of names beginning with a

% Read table
t = readtable(file_string);
t_col_names = t.Properties.VariableNames';

n = sum(startsWith(t.(col_name), search_string))
