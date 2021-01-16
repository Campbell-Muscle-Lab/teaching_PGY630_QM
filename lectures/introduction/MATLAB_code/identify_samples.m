function identify_samples
% Finds samples that meet criteria

% Variables
phenotype_file_string = '../data/phenotype.xlsx';
inventory_file_string = '../data/inventory.xlsx';
output_file_string = '../output/identified_samples.xlsx';

status_required = 'Available';
genotype_required = 'KO';
blood_glucose_threshold = 180;

% Code

% Load in tables and merge

table_phenotype = readtable(phenotype_file_string);
table_inventory = readtable(inventory_file_string);

table_merge = outerjoin(table_phenotype, table_inventory, 'Key', 'ID');

% Find available samples from KO mice that have blood glucose > 180
sample_rows = find( ...
                strcmp(table_merge.Status, status_required) & ...
                strcmp(table_merge.Genotype, genotype_required) & ...
                (table_merge.Blood_glucose > blood_glucose_threshold));

table_output = table_merge(sample_rows, :);

% Write result to file
writetable(table_output, output_file_string);