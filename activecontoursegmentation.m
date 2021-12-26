%% https://www.mathworks.com/help/images/ref/activecontour.html

load('03_11_21_WS_withModel.mat')
I = frame;
imshow(I);
title('Original Image')
%%
contsize = 420 %to determine size of rectangle for initial contour
BW = rgb2gray(I);
imagesize = size(BW)
maskinitcont = zeros(imagesize);
maskinitcont(contsize:end,contsize:end-contsize) = 1;
figure
imshow(I)
hold on 
visboundaries(maskinitcont,'Color','r');
maskdental = activecontour(BW,maskinitcont,600,'edge');
visboundaries(maskdental,'Color','b');

%%
dentalmodel = I.*uint8(maskdental);
figure
imshow(dentalmodel)