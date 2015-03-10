function [ cylin ] = cylindrical( image, f )

xc = size(image,2)/2; %x-coordinate is columns
yc = size(image,1)/2; %y-coordinate is rows
cylin = zeros(2*xc, 2*yc,2);
maxtheta = 0;
maxh = 0;

for i=1:(2*yc)
    for j=1:(2*xc)
        theta = atan((j - xc)/f);
        h = (i - yc)/sqrt((j - xc)^2 + f^2);
        if theta > maxtheta
            maxtheta = theta;
        end
        if h > maxh
            maxh = h;
        end
        cyrow = round(f*theta + xc);
        cycol = round(f*h + yc);
        cylin(i,j,1) = cycol;
        cylin(i,j,2) = cyrow;
    end
end

crop = zeros(f*round(maxh)+yc, f*round(maxtheta)+xc, 3);
for i=1:(2*yc)
    for j=1:(2*xc)
        crop(cylin(i,j,1),cylin(i,j,2),:) = image(i,j,:);
    end
end
cylin = crop;
cylin = uint8(cylin);

end

