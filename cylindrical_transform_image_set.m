function [images] = cylindrical_transform_image_set(images, f)
% transform an entire set of images to cylindrical coordinates
% f is the focal length

for i=1:length(images)
    images{i} = cylindrical(images{i}, f);
end


