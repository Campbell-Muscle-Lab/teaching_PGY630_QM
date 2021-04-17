function image_connected_components_3
% Demos showing filtering of blobs by size

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

% Display area on top of each blob
subplot(rows, cols, 3);
imagesc(im_bin);
hold on;
for i = 1 : numel(blob_data)
    plot(centroids(i,1), centroids(i,2), 'r+');
    text(centroids(i,1)+2, centroids(i,2)+2, ...
        sprintf('%i', areas(i)), ...
        'Color',[0.5 0.5 0.5], ...
        'FontSize',12);
end

% Make a histrogram of the areas
subplot(rows, cols, 4);
histogram(areas, 100);
xlim([0 450]);
xlabel('Blob area');
ylabel('Number of blobs');
title('Many blobs with','few pixels')

end