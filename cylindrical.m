function [ cylin ] = cylindrical( image, f )

xc = size(image,2)/2; %x-coordinate is columns
yc = size(image,1)/2; %y-coordinate is rows
cylin = zeros(2*xc, 2*yc,3);

for i=1:(2*yc)
    for j=1:(2*xc)
        theta = atan((j - xc)/f);
        h = (i - yc)/sqrt((j - xc)^2 + f^2);
        cyrow = floor(f*theta+xc);
        cycol = floor(f*h+yc);
        cylin(cycol,cyrow,:) = image(i,j,:);
    end
end

cylin = uint8(cylin);


end

