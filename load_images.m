function[images] = load_images(directory, extension)
% This function reads in a directory containing a series of images and 
% returns a cell array containing the images. 

% read the filenames
files = dir([directory, '*.', extension]);

% read the images into a cell array
number_of_pictures = length(files);
for i=1:number_of_pictures
    images{i}=imread([directory, files(i).name]);
end

