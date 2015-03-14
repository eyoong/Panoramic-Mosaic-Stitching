%clc;
%clearvars;

%specify directory and extension type
directory='Test_Images/'; extension='JPG';

%load images
[images] = load_images(directory, extension);


% cylindrical transform of the entire image set
focal_length = 595;
[images] = cylindrical_transform_image_set(images, focal_length);


%image = images{1};
image1 = images{5};
image2 = images{6};
x_offset = -200; % shift image 2 x pixels right
y_offset =  0; % shift image 2 y pixels up
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

