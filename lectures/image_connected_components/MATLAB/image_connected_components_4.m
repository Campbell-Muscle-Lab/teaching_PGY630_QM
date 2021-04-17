function image_connected_components_4
% Demos showing largest blob

% Variables
im_file_string = '../data/rice.png';
min_grain_size = 100;

% Code
im = imread(im_file_string);

% Make a figure
figure(1);
clf;
rows = 2;
cols = 2;

% Original image
subplot(rows, cols, 1);
imagesc(im);
title('Original');
colorbar;

% Display binary image
im_bin = imbinarize(im, 'adaptive');

% Filter the im_bin by size
im_bin = bwareafilt(im_bin, [min_grain_size inf]);

% Clear grains from edges
im_bin = imclearborder(im_bin);

subplot(rows, cols, 2);
imagesc(im_bin);
title('Binary image, filtered by size', 'clear borders');
colorbar;

% Pull off the centroid and the area of each 
% connected component
blob_data = regionprops(im_bin, {'Area','Centroid'});
areas = cat(1, blob_data.Area);
centroids = cat(1, blob_data.Centroid);

% Make the labeled image
im_label = bwlabel(im_bin);
[max_area, max_index] = max(areas);

im_largest = im_label;
im_largest(im_label ~= max_index) = 0;
im_largest(im_largest > 0) = 1;

% Show labeled image
subplot(rows, cols, 3);
imagesc(im_largest);
title('Largest blob');
colorbar

% Create a image of the largest blob
temp = regionprops(im_largest, 'Image');
im_zoom = temp.Image;

subplot(rows, cols, 4);
imagesc(im_zoom);
title('Zoomed blob');

% Save the current workspace
save('../data/zoom');