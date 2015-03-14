%

%run('/Users/eyoong/Downloads/vlfeat/toolbox/vl_setup');
run('VLFeat/vlfeat-0.9.20/toolbox/vl_setup');

%image1 = imread('/Users/eyoong/Downloads/testingImages/100NIKON-DSCN0008_DSCN0008.JPG');
%image2 = imread('/Users/eyoong/Downloads/testingImages/100NIKON-DSCN0009_DSCN0009.JPG');

%specify directory and extension type
directory='Test_Images/'; extension='JPG';

%load images
[images] = load_images(directory, extension);

image1 = images{1};
image2 = images{2};


image1 = cylindrical(image1, 595);
image2 = cylindrical(image2, 595);
imshow(image1);

[maxinlierhom]  = siftransac(image1,image2,40,100, 30)
 