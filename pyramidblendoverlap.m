function [ blended ] = pyramidblendoverlap( image1, image2, level, overlapstart, overlapend )
% implemented with ideas from Wiggin's pyramid blending 

image1=im2double(image1);
image2=im2double(image2);

% R = zeros(size(image1,1),size(image1,2),3);
% R(:,overlapstart:overlapend,:) = 1;
% gaussianR = makepyramid(R, level, 'gauss');

i1laplacian = makepyramid(image1,level, 'laplacian'); 
i2laplacian = makepyramid(image2,level,'laplacian');

left = zeros(size(image1,1), size(image1,2),size(image1,3));

% Weighted so left side is image1's Laplacian, right is image2's Laplacian
% and overlap strip is the average of both image's Laplacian.
left(:, 1:overlapstart, :) = 1;
left(:, overlapstart:overlapend, :) = 1/2;
right = 1 - left;
%right(:, overlapstart:overlapend,:) = 1;

blend = cell(level,1);
for i = 1: level
    leftblend  = imresize(left, [size(i1laplacian{i},1) size(i1laplacian{i},2)]);
    rightblend  = imresize(right, [size(i2laplacian{i},1) size(i2laplacian{i},2)]);
    
    %Rblend = imresize(R, [size(i1laplacian{i},1) size(i1laplacian{i},2)]);
    %gaussianR{i} = imresize(gaussianR{i}, [size(i1laplacian{i},1) size(i1laplacian{i},2)]);
    %blend{i} = i1laplacian{i}.*leftblend.*(eps+gaussianR{i}.*Rblend) + i2laplacian{i}.*rightblend.*(1-(gaussianR{i}.*Rblend));
    
    blend{i} = i1laplacian{i}.*leftblend + i2laplacian{i}.*rightblend;

end

% Image is reconstructed from the Laplacian pyramid.
for i=level-1:-1:1
    blend{i} = blend{i} + impyramid(blend{i+1},'expand');
end

blended = blend{1};
end

