%https://blogs.mathworks.com/steve/2013/11/19/watershed-transform-question-from-tech-support/
%run coloursegmentation before running this script

Io=rgb2gray(cluster2);
bw1 = bwareaopen(Io, 20);
%imshow(bw1)
%% Distance transform
D = -bwdist(~Io);
%imshow(D,[])
centremask = imextendedmin(D,1);
%imshowpair(bw1,centremask,'blend')
%% Watershed transform
D2 = imimposemin(D,centremask);
Ld = watershed(D2);
bw2 = bw1;
bw2(Ld == 0) = 0;
%imshow(bw3)
%%


