function find_last_names_beginning_with_a
% Gets number of last names beginning with a

% Variable
excel_file_string = '../data/faked_inventory.xlsx';
output_file_string = '../output/names_beginning_with_a.xlsx';

% Code

% Read table in
t = readtable(excel_file_string);

no_of_names = sum(startsWith(t.LastName, 'a', 'IgnoreCase', true))




% 
% table_beginning_with_a = ...
%     t(find(startsWith(t.LastName, 'a', 'IgnoreCase', true)),:);
% 
% no_of_names = size(table_beginning_with_a, 1);
% 
% % Write table to file
% try
%     delete(output_file_string)
% end
% writetable(table_beginning_with_a, output_file_string);
% 
