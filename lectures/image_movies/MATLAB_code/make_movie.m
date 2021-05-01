function make_movie
% Demo that makes a movie

% Variables
output_file_string = '../output/test_movie.avi';

% Make a 100 x 100 x 100 multilayered image with a dark block that
% grows in successive frames

n = 100;
im = ones(n, n, n);
for i = 1 : n
    im(1:i, 1:i, i) = 0;
end

% Create a video
v = VideoWriter(output_file_string);
open(v);

% Figure
figure(1);
clf
colormap(gray);
for i = 1 : n
    cla
    imagesc(im(:, :, i));
    pause(0.01);
    
    % Get the frame and add to movie
    frame = getframe(gcf);
    writeVideo(v, frame);
end

% Close the video
close(v);
