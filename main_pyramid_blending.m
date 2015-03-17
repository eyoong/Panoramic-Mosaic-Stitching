image1=imread('Faces/IMG_4909.JPG');
image2=imread('Faces/IMG_4910.JPG');

%figure 
%imshow(image1);
% figure
% imshow(image2);

size(image1)
size(image2)

image2=image2(1:size(image2,1)-35,:,:);
image2=imresize(image2, [480,640]);

size(image2)

x=30

image=pyramidblendoverlap(image1, image2, 5, size(image1,2)/2-x, size(image1,2)/2+x);
figure

imshow(image);
imwrite(image,'merged_faces.png');
