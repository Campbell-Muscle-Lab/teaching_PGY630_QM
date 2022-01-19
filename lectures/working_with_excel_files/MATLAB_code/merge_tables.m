function merge_tables
% Function merges two tables

% Variables
inventory_file_string = '../data/inventory.xlsx';
phenotype_file_string = '../data/phenotype.xlsx';
output_file_string = '../output/merged_table.xlsx';

% Code
inventory_table = readtable(inventory_file_string);
phenotype_table = readtable(phenotype_file_string);

% Merge the tables
merged_table = outerjoin(inventory_table, phenotype_table);

% Write the merged table to file
try
    delete(output_file_string);
end
writetable(merged_table, output_file_string);