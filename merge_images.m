function [panorama] = merge_images(images, numsamples, iterations, threshold, blending_function)
% 

panorama=images{1};
for i = 2:length(images)
    M = siftransac(images{i}, panorama, numsamples, iterations, threshold);
    [image, row_offset, column_offset]=transform_image(M, images{i});
    panorama=blending_function(panorama, image, row_offset, column_offset);
end



% perform SIFT and RANSAC to compute transformation matrix
% sift_ransac (images_set, numsamples (min 4), iterations of RANSAC, threshold (distance to be considered an inlier))
% returns a set of matrices to transform an image into the coordinate
% system of the previous set of merged images
% [M, image1] = sift_ransac_image_set(images, 4, 100, 30);

% [M, image] = sift_ransac_image_set(images, numsamples, iterations, threshold)