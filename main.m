%clc;
%clearvars;

%specify directory and extension type
directory='Test_Images/'; extension='JPG';

%load images
[images] = load_images(directory, extension);

%image = images{1};
image1 = images{5};
image2 = images{6};
x_offset = -200; % shift x pixels right
y_offset =  0; % shift y pixels up
focal_length=595; % pixels

image = alpha_blend(image1, image2, x_offset, y_offset);

figure
imshow(image);

%size(image)
%size(image,1)

%figure
%imshow(image);
%title(['Image Title);
%imwrite(image,'filename.png');

