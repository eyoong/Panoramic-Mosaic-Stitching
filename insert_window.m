image=imread(['patrick.jpg']);
window=imread(['Space_Picture/alien-planet-55-cancri-e-artist-view-earth.jpg']);

size(image)
size(window)

%figure
%imshow(window)

image_points = [   200, 200, 1; 
                    1, size(image,2), 1;
                    size(image,1), size(image,2), 1;
                    size(image,1), 1, 1];

window_points = [   1, 1, 1; 
                    1, size(window,2), 1;
                    size(window,1), size(window,2), 1;
                    size(window,1), 1, 1];

H = homography(window_points', image_points')
% H_inverse=inv(H);
% for i=1:size(image,1)
%     for j=1:size(image,2)
%        p=int32(H_inverse*[i,j,1]');
%        if (p(1)>1 && p(1) < size(window, 1) && p(2) > 1 && p(2) < size(window, 2))
%            image(i,j,:)=window(p(1),p(2),:);
%        end
%     end
% end

H_inverse=inv(H);
for i=1:size(window,1)
    for j=1:size(window,2)
       p=floor(H*[i,j,1]');
       if (p(1) > 1 && p(1) < size(window,1) && p(2) > 1 && p(2) < size(window,2))
            image(p(1),p(2),:)=window(i,j,:);
       end
    end
end

image = uint8(image);
%figure
imshow(image)




