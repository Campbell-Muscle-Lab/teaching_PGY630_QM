function image_tools_3
% Demo demonstrating brightness and contrast

% Load in test image
im = imread('../data/rice.png');

% Convert to a double
im = double(im)./256;

% Make a figure
figure(1);
clf;
colormap(gray);

% Loop through 6 cases
for i = 1 : 6
    switch i
        case 1
            im_processed = im;
            title_string = 'Original';
            
        case 2
            im_processed = imadjust(im, [0 1], [0.5 1]);
            title_string = 'Brighten';
            
        case 3
            im_processed = imadjust(im, [0 1], [0 0.5]);
            title_string = 'Darken';
        
        case 4
            im_processed = imadjust(im);
            title_string = 'Maximize contrast';
        
        case 5
            im_processed = imadjust(im, [0 1], [0 1], 0.02);
            title_string = 'Low gamma';
            
        case 6
            im_processed = imadjust(im, [0 1], [0 1], 5);
            title_string = 'High gamma';            
    end
    
    subplot(2, 6, i);
    imagesc(im_processed, [0 1]);
    title(title_string);
    
    % Create the image histogram
    [counts, edges] = histcounts(im_processed, linspace(0,1,101));
    subplot(2, 6, i+6);
    bar(edges(1:(end-1)), counts);
    ylabel('Number of pixels');
    xlabel('Pixel intensity');
end