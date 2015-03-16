function [ blended ] = pyramidblend( image1, image2, level )
% implemented with ideas from Wiggin's pyramid blending 

image1=im2double(image1);
image2=im2double(image2);
i1laplacian = makepyramid(image1,level); 
i2laplacian = makepyramid(image2,level);

% This is the centerline of both images. Images are assumed to be the same
% size as in the paper.
split = size(image1,2)/2; 

left = zeros(size(image1,1), size(image1,2),size(image1,3));

% Weighted so left side is image1's Laplacian, right is image2's Laplacian
% and center line is the average of both image's Laplacian as in the paper.
left(:, 1:split-1, :) = 1;
left(:, split, :) = 1/2;
right = 1 - left;

blend = cell(level,1);
for i = 1: level
    leftblend  = imresize(left, [size(i1laplacian{i},1) size(i1laplacian{i},2)]);
    rightblend  = imresize(right, [size(i2laplacian{i},1) size(i2laplacian{i},2)]);
    blend{i} = i1laplacian{i}.*leftblend + i2laplacian{i}.*rightblend;
end

% Image is reconstructed from the Laplacian pyramid.
for i=level-1:-1:1
    blend{i} = blend{i} + impyramid(blend{i+1},'expand');
end

blended = blend{1};
end

