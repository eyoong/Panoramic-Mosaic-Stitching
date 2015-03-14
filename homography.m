function [ hom ] = homography( i1matches, i2matches )
%HOMOGRAPHY Summary of this function goes here
%   Detailed explanation goes here

A = zeros(size(i1matches,2)*3,9);
b = zeros(size(i2matches,2)*3,1);

for i = 1:size(i1matches,2)
    for offset=1:3
        A(3 * (i-1) + offset, 3*(offset-1) + 1) = i1matches(1,i);
        A(3 * (i-1) + offset, 3*(offset-1) + 2) = i1matches(2,i);
        A(3 * (i-1) + offset, 3*(offset-1) + 3) = 1;
    end
end
for j=1:size(i2matches,2)
    b(3 * (j-1) + 1) = i2matches(1,j);
    b(3 * (j-1) + 2) = i2matches(2,j);
    b(3 * (j-1) + 3) = 1;
end
h = A\b;
k = 1;
hom = zeros(3);
for i = 1:3
    for j = 1:3
        hom(i,j) = h(k);
        k = k + 1;
    end
end
end

