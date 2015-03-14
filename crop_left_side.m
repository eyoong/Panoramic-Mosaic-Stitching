function [images] = crop_left_side(images,t)

for i=1:length(images)
   image=images{i};
   image=image(:,t:size(image,2),:);
   images{i}=image;
end