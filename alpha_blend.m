function result_image = alpha_blend(image1, image2, x_offset, y_offset)
% blend two images together using alpha blending / feathering technique
% from lecture slides
% offsets are how much the second image moves relative to the first
% positive values are to the right and up
% linear blend across x direction

if (x_offset)<0
   temp = image1;
   image1=image2;
   image2=temp;
   x_offset=x_offset*(-1);
   y_offset=y_offset*(-1);
end

rows1 = size(image1, 1);
rows2 = size(image2, 1);
columns1 = size(image1,2);
columns2 = size(image2,2);

% result image dimensions
result_columns=columns2 + x_offset;
result_rows = max(rows1,rows2+y_offset);
if y_offset > 0
     result_rows = max(rows2,rows1+y_offset);
end

result_image = zeros(result_rows,result_columns,3);
%result_image=result_image+255;

% copy image_1 into result_image
h=0;
if (y_offset > 0) 
    h=y_offset;
end
for (i=1:rows1)
    for (j=1:columns1)
        result_image(i+h,j,1)=image1(i,j,1);
        result_image(i+h,j,2)=image1(i,j,2);
        result_image(i+h,j,3)=image1(i,j,3);
    end
end

% copy image_2 into result_image
h=0;
if (y_offset < 0) 
    h=y_offset*(-1);
end
for i=1:rows1
    for j=1:columns1
        result_image(i+h,j+x_offset,1)=image2(i,j,1);
        result_image(i+h,j+x_offset,2)=image2(i,j,2);
        result_image(i+h,j+x_offset,3)=image2(i,j,3);
    end
end

% redo overlap region with blending
% left image
h=0;
if (y_offset > 0) 
    h=y_offset;
end
for i=1:rows1
    for j=(x_offset+1):columns1
        alpha = 1-(j-x_offset)/(columns1-x_offset);
        result_image(i+h,j,1)=image1(i,j,1)*alpha;
        result_image(i+h,j,2)=image1(i,j,2)*alpha;
        result_image(i+h,j,3)=image1(i,j,3)*alpha;
    end
end

%right image
h=0;
if (y_offset < 0) 
    h=y_offset*(-1);
end
for i=1:rows1
    for j=1:columns1-x_offset
        alpha = j/(columns1-x_offset);
        result_image(i+h,j+x_offset,1)=image2(i,j,1)*alpha+result_image(i+h,j+x_offset,1);
        result_image(i+h,j+x_offset,2)=image2(i,j,2)*alpha+result_image(i+h,j+x_offset,2);
        result_image(i+h,j+x_offset,3)=image2(i,j,3)*alpha+result_image(i+h,j+x_offset,3);
    end
end


result_image=uint8(result_image);






