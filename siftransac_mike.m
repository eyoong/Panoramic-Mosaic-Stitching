function [ maxinlierhom ] = siftransac( image1, image2, numsamples, iterations, threshold )
% SIFTRANSAC computes homography transform matrix for two images

gray1 = single(rgb2gray(image1));
gray2 = single(rgb2gray(image2));

[feat1,d1] = vl_sift(gray1);
[feat2,d2] = vl_sift(gray2);

[matches, scores] = vl_ubcmatch(d1,d2);
max = 0;
maxinlierhom = zeros(3);
%RANSAC
for i = 1:iterations
     samp = datasample(matches,numsamples,2);
     i1samp = zeros(2,size(samp,2));
     i2samp = zeros(2,size(samp,2));
     i1samp(1,:) = feat1(1,samp(1,:));
     i1samp(2,:) = feat1(2,samp(1,:));
     i2samp(1,:) = feat2(1,samp(2,:));
     i2samp(2,:) = feat2(2,samp(2,:));
     [ hom ] = homography(i1samp,i2samp);
     inliers = 0;
     for j=1:size(matches,2)
        point1 = zeros(3,1); point2 = zeros(3,1);
        point1 = feat1(1:2,matches(1,j));
        point1(3) = 1;
        point2 = feat2(1:2,matches(2,j));
        point2(3) = 1;

        point2hom = hom*point1;
        distance = norm(point2hom - point2);
        if (distance < threshold)
            inliers = inliers + 1;
        end
        if (inliers > max) 
            max = inliers;
            maxinlierhom = hom;
        end
     end
end

