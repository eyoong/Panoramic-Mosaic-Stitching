% test homography

% VLFeat is used to extract SIFT features
% run('/Users/eyoong/Downloads/vlfeat/toolbox/vl_setup');
run('VLFeat/vlfeat-0.9.20/toolbox/vl_setup');

% specify directory and extension type
directory='Test_Images/'; extension='JPG';

% load images
[images] = load_images(directory, extension);

image=images{1};
rows=size(image,1);
columns=size(image,2);

test1=uint8(image(1:floor(rows*(2/3)),:,:));
test2=uint8(image(floor(rows/3):rows,:,:));

figure
imshow(image);
figure
imshow(test1);
figure
imshow(test2);


% SIFT RANSAC parameters
numsamples = 4; % min 4
iterations = 2000;    % more is better but takes longer O(n)
threshold = 4;    % how close do the inliers need to be to be considered inliers

M = siftransac(test1, test2, numsamples, iterations, threshold);
M

% end test




