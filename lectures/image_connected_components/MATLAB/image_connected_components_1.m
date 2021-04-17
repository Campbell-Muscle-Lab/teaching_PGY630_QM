function image_connected_components_1
% Demos making a labeled image

% Variables
im_file_string = '../data/rice.png';

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
subplot(rows, cols, 2);
imagesc(im_bin);
title('Binary image');
colorbar;

% Create the label image
im_label = bwlabel(im_bin);
subplot(rows, cols, 3);
imagesc(im_label);
title('Labeled image');
colorbar;

% Make it a randomly shuffled image
im_shuffle = label2rgb(im_label, 'jet', [1 1 1], 'shuffle');

% Display the shuffled image
subplot(rows, cols, 4);
imagesc(im_shuffle);
title('Blobs in random colors');
colorbar;
