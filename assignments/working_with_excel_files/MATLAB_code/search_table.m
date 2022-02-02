function search_table(...
    file_string, col_name, search_string)
% Function returns number of names beginning with a

t1 = datetime('now');

% Read table
t = readtable(file_string);
t_col_names = t.Properties.VariableNames'

first_birthdate = t.BirthDate(1)


% 
% n = sum(startsWith(t.(col_name), search_string))
% 
% t2 = datetime('now');
% first_method = between(t1, t2)
% 
% counter = 0
% for i = 1 : numel(t.(col_name))
%     single_last_name = t.(col_name){i};
%     initial_char = single_last_name(1);
%     if (initial_char == search_string)
%         counter = counter + 1;
%         single_last_name;
%     end
% end
% 
% counter
% 
% t3 = datetime('now');
% second_method = between(t2, t3)