function [panorama] = merge_images_third_try(images, numsamples, iterations, threshold, alpha_blend)
%

panorama=images{1};
for t = 2:length(images)
    t
    M = siftransac(images{t}, panorama, numsamples, iterations, threshold);
    x_offset=floor((1)*M(1,3));
    y_offset=floor((-1)*M(2,3));
    panorama = alpha_blend(panorama, images{t}, x_offset, y_offset);
      
end