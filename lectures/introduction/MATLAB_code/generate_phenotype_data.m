function generate_data_files
% Generates two Excel files, one with phenotypic and one with inventory
% data

% Variables
no_of_mice = 20;
max_no_of_samples = 5;
sexes = {'Male','Female'};
genotypes = {'WT','KO'};
sample_states = {'Available','Used'};

phenotype_file_string = '../data/phenotype.xlsx';
inventory_file_string = '../data/inventory.xlsx';

% Code

% Reset random number generator for reproducibility
rng(1);

inventory_counter = 1;
for mouse_counter = 1 : no_of_mice
    
    % Generate information about the mice
    mouse_id{mouse_counter} = sprintf('Mouse_%i', mouse_counter);
    mouse_sex{mouse_counter} = sexes{1+(rand>=0.5)};
    mouse_genotype{mouse_counter} = genotypes{1+(rand>=0.5)};
    mouse_weight(mouse_counter) = 10 + (10 * rand);
    mouse_blood_glucose(mouse_counter) = 120 + (120 * rand);
    
    % Generate information about the samples
    for sample_counter = 1 : randi(max_no_of_samples)
        sample_id{inventory_counter} = mouse_id{mouse_counter};
        sample_box(inventory_counter) = randi(5);
        sample_row{inventory_counter} = sprintf('%c',64+randi(10));
        sample_col(inventory_counter) = randi(10);
        sample_status{inventory_counter} = sample_states{1+(rand>=0.5)};
        inventory_counter = inventory_counter + 1;
    end
end

% Create the tables
table_phenotype = table(mouse_id', mouse_sex', mouse_genotype', ...
                        mouse_weight', mouse_blood_glucose', ...
                    'VariableNames',{'ID', 'Sex', 'Genotype', 'Weight', ...
                        'Blood_glucose'});
table_inventory = table(sample_id', sample_box', sample_row', ...
                        sample_col', sample_status', ...
                    'VariableNames',{'ID','Box','Sample_Row', ...
                        'Sample_Col','Status'});

% Write the tables
writetable(table_phenotype, phenotype_file_string);
writetable(table_inventory, inventory_file_string);
