%clc;
%clearvars;

%specify directory and extension type
directory='Test_Images/'; extension='JPG';

%load images
[images] = load_images(directory, extension);

%image = images{1};
image1 = images{1};
image2 = images{2};
x_offset = -210; % shift x pixels right
y_offset =  5; % shift y pixels up
focal_length=595; % pixels

image3 = alpha_blend(image1, image2, x_offset, y_offset);
x_offset = -218;
%image4 = alpha_blend(image3, images{7}, x_offset, y_offset);

figure
imshow(image3);

%size(image)
%size(image,1)

%figure
%imshow(image);
%title(['Image Title);
%imwrite(image,'filename.png');

