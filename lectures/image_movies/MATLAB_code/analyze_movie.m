function analyze_movie
% Demo showing analysis of stretched myocyte

% Variables
movie_file_string = '../data/myocyte_stretch.avi';
horizontal_line = 215;
z_threshold = 120;

% Use VideoReader to open the file
v = VideoReader(movie_file_string);

% Create a structure to hold the image data
vid_height = v.Height;
vid_width = v.Width;
vid_bpp = v.BitsPerPixel;

s = struct('cdata', zeros(vid_height, vid_width, 3, 'uint8'), ...
    'colormap',[]);

% Read the video into memory
k = 1;
while (hasFrame(v))
    s(k).cdata = readFrame(v);
    k = k+1;
end

% Make a figure
figure(1);
clf;

frame_indices = 1 : 10 : numel(s);
t=[];

% Loop through the frames
for i = 1 : numel(frame_indices);
    
    im = rgb2gray(s(frame_indices(i)).cdata);
   
    % Get and plot a horizontal profile
    z_profile = im(horizontal_line, :);
    x = 1 : numel(z_profile);
    left_pin(i) = find(z_profile > z_threshold, 1, 'first');
    right_pin(i) = find(z_profile > z_threshold, 1, 'last');

    % Show the image
    subplot(2,2,1);
    cla;
    hold on
    imagesc(im);
    colorbar;
    plot(left_pin(i), horizontal_line, 'go', 'MarkerSize', 10, ...
        'MarkerFaceColor', [0 1 0]);
    plot(right_pin(i), horizontal_line, 'md', 'MarkerSize', 10, ...
        'MarkerFaceColor', [1 0 1]);
    
    % Draw profile
    subplot(2,2,3);
    cla
    hold on
    plot(x, z_profile, 'b-');
    plot(left_pin(i), z_threshold, 'go');
    plot(right_pin(i), z_threshold, 'md');
    
    % Plot pin positions over time
    t = [t frame_indices(i)];
    subplot(2,2,2);
    cla
    hold on
    plot(t, left_pin, 'g-');
    plot(t, right_pin, 'm-');
    ylabel('Pin positions');
    xlabel('Frame number');
    
    % Show progress
    i=i
    drawnow;
end



