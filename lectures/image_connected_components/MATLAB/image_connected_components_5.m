function image_connected_components_5
% Shows how to separate touching objects with watershed

% Variables
min_distance = 2;

% Load in prior data
d = load('../data/zoom.mat')

im_zoom = d.im_zoom;

% Make a figure
figure(2);
clf
rows = 2;
cols = 3;
subplot(rows, cols, 1);
imagesc(im_zoom);
title('Touching blobs');
colorbar;

% Pad the array so blobs don't touch edges
im_padded = padarray(im_zoom, [1 1]);
subplot(rows, cols, 2);
imagesc(im_padded);
title('Padded');
colorbar;

% Form the image complement
im_complement = imcomplement(im_padded);
subplot(rows,cols, 3);
imagesc(im_complement);
title('Complement');
colorbar;

% Form the distance image
im_distance = -bwdist(im_complement);
im_distance(im_complement) = -inf;
im_distance(im_distance < -min_distance) = -min_distance;

subplot(rows, cols, 4);
imagesc(im_distance);
title('Distance image');
colorbar

% Apply the watershed algorithm
im_watershed = watershed(im_distance);

subplot(rows, cols, 5);
imagesc(im_watershed);
colorbar;
title('After watershed');