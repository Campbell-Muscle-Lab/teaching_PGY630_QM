function image_segmentation_1
% Demonstrates simple segmentation

% Variables
image_file_string = '../data/rice.png';
threshold = 0.5;

% Load that image
im = imread(image_file_string);

% Convert the image into a double array with max value of 1
im = double(im) / 255;

% Make a figure
figure(1);
clf
colormap(gray)
subplot(2, 2, 1)
imagesc(im);
colorbar
title('Original image');

% Show the image histogram
[counts, intensities] = histcounts(im, linspace(0,1,101));
subplot(2, 2, 2);
bar(intensities(1:(end-1)), counts)
xlabel('Intensity');
ylabel('Counts');

% Create a logical mask that shows values above a threshold
im_mask = zeros(size(im), 'logical');
im_mask(im > threshold) = true;
subplot(2, 2, 3)
imagesc(im_mask);
title('Mask');
colorbar;

% Overlay on the original to get a better comparison
subplot(2, 2, 4);
im_overlay = imoverlay(im, im_mask, 'cyan');
imagesc(im_overlay);
title('Overlay');
