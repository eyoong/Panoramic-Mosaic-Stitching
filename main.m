run('/Users/eyoong/Downloads/vlfeat/toolbox/vl_setup');

image1 = imread('/Users/eyoong/Downloads/testingImages/100NIKON-DSCN0008_DSCN0008.JPG');
image2 = imread('/Users/eyoong/Downloads/testingImages/100NIKON-DSCN0009_DSCN0009.JPG');
image1 = cylindrical(image1, 595);
image2 = cylindrical(image1, 595);
%imshow(cylindrical(image1,200));
[ maxinlierhom ]  = siftransac(image1,image2,40,100, 30);
 