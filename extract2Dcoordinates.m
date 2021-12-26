clear all

% Filter out dental model using active contour segmentation
activecontoursegmentation

% Filter out tooth region using K-Means colour segmentation
coloursegmentation

% Segment out individual tooth using watershed transformation
watershedtransform

% Extract 2D coordinates
%%https://www.mathworks.com/help/images/ref/regionprops.html
s = regionprops(bw2,'centroid');
centroids =(cat(1,s.Centroid));
centroids = round(centroids);

imshow(bw2)
hold on
plot(centroids(:,1),centroids(:,2),'b+','MarkerSize',10,'linewidth',2)

imshow(I)
hold on
plot(centroids(:,1),centroids(:,2),'b+','MarkerSize',10,'linewidth',2)