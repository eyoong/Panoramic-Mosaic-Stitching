image=imread(['aligned_lecture_hall_panorama.png']);
x=160;
image=image(1:size(image,1)-x,:,:);
figure
imshow(image)
title(['Cropped']);
imwrite(panorama,'cropped_aligned_lecture_hall_panorama.png');

image=imread(['aligned_conference_room_panorama_1.png']);
x=278;
image=image(1:size(image,1)-x,:,:);
figure
imshow(image)
title(['Cropped']);
imwrite(panorama,'cropped_aligned_conference_room_panorama.png');


image=imread(['aligned_lobby_panorama_1.png']);
x=240;
image=image(1:size(image,1)-x,:,:);
figure
imshow(image)
title(['Cropped']);
imwrite(panorama,'cropped_aligned_lobby_panorama.png');


image=imread(['aligned_test_panorama.png']);
x=50;
image=image(1:size(image,1)-x,:,:);
figure
imshow(image)
title(['Cropped']);
imwrite(panorama,'cropped_aligned_test_panorama.png');