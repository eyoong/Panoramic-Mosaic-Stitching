function [panorama] = merge_images_second_try(images, numsamples, iterations, threshold, alpha_blend)
%

panorama=images{1};
for t = 2:length(images)
    r1=size(panorama,1)
    c1=size(panorama,2)
    r2=size(images{t},1)
    c2=size(images{t},2)
    r1+2*r2
    c1+2*c2
    v=r2:r2+r1-1;
    length(v)
    x=2
    big = zeros(r1+2*r2, c1+2*c2,3);
    big(r2:(r2+r1-1),c2:(c2+c1-1),:)=panorama;
    big=uint8(big);
       
    M = siftransac(images{t}, big, numsamples, iterations, threshold)
    
    %M_inverse=inv(M);
    for i=1:size(big,1)
        for j=1:size(big,2)
            %p=floor(M_inverse*[i;j;1]);
            p=[i-M(2,3),j-M(1,3),1];
            p=floor(p);
            if (p(1)>0 && p(1)<r2 && p(2)>0 && p(2) < c2)
                big(i,j,:)=images{t}(p(1),p(2),:);
            end
        end
    end
    
    figure
    imshow(panorama);
    figure
    imshow(uint8(big));
    
    
    
    % [image, row_offset, column_offset]=transform_image(M, images{i});
    % panorama=blending_function(panorama, image, row_offset, column_offset);
end



% perform SIFT and RANSAC to compute transformation matrix
% sift_ransac (images_set, numsamples (min 4), iterations of RANSAC, threshold (distance to be considered an inlier))
% returns a set of matrices to transform an image into the coordinate
% system of the previous set of merged images
% [M, image1] = sift_ransac_image_set(images, 4, 100, 30);

% [M, image] = sift_ransac_image_set(images, numsamples, iterations, threshold)
