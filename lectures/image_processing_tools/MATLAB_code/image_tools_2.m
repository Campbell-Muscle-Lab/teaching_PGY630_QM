function image_tools_2
% Demo of cropping, resizing, and rotating images

% Load in test image
im = imread('../data/rice.png');

% Make a figure and display rice
figure(1);
clf
subplot(2, 3, 1);
imagesc(im)
colorbar;
title('Original');

% Crop it
im_cropped = imcrop(im, [50, 100, 75, 125]);
% Display it
subplot(2, 3, 2);
imagesc(im_cropped);
colorbar;
title('Cropped');

% Shrink the original
im_shrunk = imresize(im, 0.1);
% Display
subplot(2, 3, 3);
imagesc(im_shrunk);
colorbar;
title('Shrunk');

% Enlarge the original
im_enlarge = imresize(im, 10);
% Display
subplot(2, 3, 4);
imagesc(im_enlarge);
colorbar;
title('Enlarge');

% Rotate the original
im_rotate_1 = imrotate(im, 45)
% Display
subplot(2, 3, 5);
imagesc(im_rotate_1);
colorbar;
title('Rotate');

% Rotate the original and crop
im_rotate_2 = imrotate(im, 45, 'crop')
% Display
subplot(2, 3, 6);
imagesc(im_rotate_2);
colorbar;
title('Rotate and crop');
