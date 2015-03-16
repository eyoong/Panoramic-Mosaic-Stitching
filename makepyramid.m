function [ pyramid ] = makepyramid( image, level )
%PYRBLEND Summary of this function goes here
%   Detailed explanation goes here

pyramid = cell(level,1);
pyramid{1} = image;

% constructs gaussian image pyramids
for i = 2: level
   % using Matlab's native reduce function to obtain the filtered image at
   % level i in the Gaussian pyramid.
   pyramid{i} = impyramid(pyramid{i-1},'reduce');  
end

% if strcmp(type,'gaussian') 
%     return; 
% end

for i = level-1:-1:1
	pyramid{i} = pyramid{i}(1:size(pyramid{i+1},1)*2-1,1:size(pyramid{i+1},2)*2-1,:);
end

%constructs laplacian image pyramids
for i = 1:level-1
    % using Matlab's native expand function to obtain the filtered image at
   % level i in the Laplacian pyramid.
    pyramid{i} = pyramid{i} - impyramid(pyramid{i+1},'expand');
end

end

