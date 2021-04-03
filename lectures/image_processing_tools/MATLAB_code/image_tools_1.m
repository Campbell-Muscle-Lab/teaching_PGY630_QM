function image_tools_1
% Demo gray-scale images, colormaps, and image formats

% Make a test image
im = zeros(10, 10);
im(:, 6:10) = 1;
im(6:10, :) = im(6:10, :) + 0.5;

% Normalize this image to a max of 1
im = im./max(im(:));

% Display grid as an image
figure(1);
clf
imagesc(im)
colorbar

% Make a new figure
figure(2);
clf
subplot(1,3,1);
imagesc(im);
title('Original image');

% Save the image as a png
imwrite(im, '../output/test.png')
% Open the image from file and display it
im_png = imread('../output/test.png');
subplot(1,3,2);
imagesc(im_png);
title('PNG');

% Save the image as a png
imwrite(im, '../output/test.jpg')
% Open the image from file and display it
im_jpg = imread('../output/test.jpg');
subplot(1,3,3);
imagesc(im_jpg);
title('JPG');
