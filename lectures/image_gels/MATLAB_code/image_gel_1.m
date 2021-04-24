function image_gel_1
% Load image of gel and show a band profile

% Variables
image_file_string = '../data/warren_fig_3_practice_rbg.png'
x_start = 310;
x_width = 0;
y_start = 150;
y_height = 200;

% Code

% Load and display image
im_color = imread(image_file_string);
imfinfo(image_file_string);

% Convert it to gray
im = im2gray(im_color);

size_im = size(im)

figure(1);
colormap(gray);
subplot(3, 1, 1);
imagesc(im);
hold on
rectangle('Position',[x_start y_start x_width y_height], ...
    'EdgeColor', 'y');
title('Original image');
    
% Crop and display band
im_band = imcrop(im, [x_start y_start x_width y_height]);
subplot(3, 1, 2);
imagesc(im_band);
title('Bands');

% Calculate and plot the profile
profile = flip(mean(im_band, 2));
subplot(3, 1, 3);
plot(profile, 0:y_height, 'b-');
title('Band profile');