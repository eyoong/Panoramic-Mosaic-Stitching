panorama=imread(['aligned_lecture_hall_panorama.png']);
space_image=imread(['Space_Picture/alien-planet-55-cancri-e-artist-view-earth.jpg']);

size(panorama)
size(space_image)

panorama_points = [100, 3000,1 ; 100, 3500, 1; 400, 3500, 1; 400, 3000, 1]
space_image_points = [200, 300, 1; 200, 800, 1; 400, 800, 1; 400, 300, 1]
x=50;
p = [100, 3000+x,1 ; 100, 3500+x, 1; 400, 3500+x, 1; 400, 3000+x, 1]

H = homography(space_image_points', panorama_points')
[result, row_offset, column_offset]=transform_image(H, space_image);

imshow(result)




