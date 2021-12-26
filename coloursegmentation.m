%https://www.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html%

%run activcontoursegmentation.m before runnning this script

lab_image = rgb2lab(dentalmodel);
ab = lab_image(:,:,2:3);
ab = im2single(ab);
nColors = 3;
% repeat the clustering 3 times to avoid local minima
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);

% figure(2);
% imshow(pixel_labels,[])
% hold on
% visboundaries(maskdental,'Color','b');
% title('Image Labeled by Cluster Index');


% figure(3);
mask1 = pixel_labels==1;
cluster1 = dentalmodel .* uint8(mask1);
% imshow(cluster1)
% hold on
% visboundaries(maskdental,'Color','b');
% title('Objects in Cluster 1');

% figure(4);
mask2 = pixel_labels==2;
cluster2 = dentalmodel .* uint8(mask2);
% imshow(cluster2)
% hold on
% visboundaries(maskdental,'Color','b');
% title('Objects in Cluster 2');

% figure(5);
mask3 = pixel_labels==3;
cluster3 = dentalmodel .* uint8(mask3);
%%imshow(cluster3)
%%hold on
%%visboundaries(maskdental,'Color','b');
%%title('Objects in Cluster 3');

