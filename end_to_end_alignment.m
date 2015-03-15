function [image] = end_to_end_alignment(panorama, num_pixels, numsamples, iterations, threshold)
% adjusts y values so that the left and right ends of the panorama align
% assumes that the left and right ends of the image are of the same scene

left_image = panorama(:, 1:num_pixels, :);
right_image = panorama(:, (size(panorama,2)-num_pixels):size(panorama,2), :);
M = siftransac(left_image, right_image, numsamples, iterations, threshold);

row_offset = int32(M(1,3))*(-1);  % change the sign of this if slope is going down vs. up

if row_offset == 0 
    image = panorama;
else
    image = zeros(size(panorama,1),size(panorama,2),3);
    block_size=abs(size(panorama,2)/row_offset);
    for block=0:abs(row_offset)
        left=floor(block*block_size+1);
        right=min(floor((block+1)*block_size), size(panorama,2));
        if row_offset>0
            top=block+1;
        end
        if row_offset<0
            top=floor((-1)*row_offset)-block+1;
        end
        bottom=top+size(panorama,1)-abs(row_offset);
        image(1:bottom-top, left:right, :) = panorama(top:bottom-1,left:right,:);
    end
end
image=uint8(image);