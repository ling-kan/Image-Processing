% MATLAB script for Assessment Item-1
% Task-1
clear; close all; clc;

% Step-1: Load input image
I = imread('Zebra.jpg');
figure;
imshow(I);
title('Step-1: Load input image');

% Step-2: Conversion of input image to grey-scale image
Igray = rgb2gray(I);
figure;
imshow(Igray);
title('Step-2: Conversion of input image to greyscale');

%Step-3: Enlarge image using nearest neighbour 
%Number of rows and columns in the original gray image
row1=size(Igray,1);
col1=size(Igray,2);

%Enlarged image of rows and columns 
row2=1668; 
col2=1836;

%the size of the nns output images 
nns = zeros (row2,col2);

%The scale in row and column 
scalerow=(row2./row1)+0.1;
scalecol=(col2./col1)+0.1;

for x = 1:row2
    for y = 1:col2
        %Calculate the position in input image, and choose the nearest
        %neighbour to i and j 
        rows = 1+round(x./scalerow);
        cols = 1+round(y./scalecol);
        
        nns(x,y)= Igray(rows,cols);
    end
end
nns = uint8(nns);
figure, imshow(nns), title('Step 3: Nearest Neighbour Interpolation');


%Step-4: Billinear Interpolation
%Making the ratio of the old 
row3 = row1;
col3 = col1;

%Finding how much the image should resize
resizeX = row3./(row1-1);
resizeY = col3./(col1-1);

%Creating a location for the output image to make it faster
Bilinear = zeros(row3,col3);

 for i = 0:row3-1
    for j = 0:col3-1
     
     %Finding position of pixels when the image is enlarged
     xposition = i/resizeX;
     yposition = j/resizeY;
     
     %Calculating the four neighbouring pixels 
     %Floor finding thie lower pixels
     Fx=floor(xposition);
     Fy=floor(yposition);
     %ceil for the high pixels
     Cy=ceil(yposition);
     Cx=ceil(xposition);
        
     %Rem -Reminder after division 
     %Finding the average distance/position  
     scalex = rem(xposition,1);
     scaley = rem(yposition,1);

     %Finding the location and placing it the right place
     LowerL = Igray(1+Fx,1+Fy);
     LowerR = Igray(1+Cx,1+Fy);
     UpperL = Igray(1+Fx,1+Cy);
     UpperR = Igray(1+Cx,1+Cy);
       
     a=(1-scalex) *LowerR;
     b=(1-scalex) *UpperR;
     c=(scalex)   *LowerL;
     d=(scalex)   *UpperL;
     
    %Linear inteprolation 
     inter1 = a + c;
     inter2 = b + d;
     Bilinear (i+1,j+1) =  inter1 * (scaley)  + inter2 * (1-scaley);
 
    end
 end
Bilinear = uint8(Bilinear);
figure, imshow(Bilinear), title('Step-4: Bilinear Interpolation');


%Testing results are the same
NnsF = imresize(Igray,[1668 1836] , 'nearest');
BiF = imresize(Igray,[1668 1836] , 'bilinear');

figure,
subplot(2,2,1), imshow(NnsF), title('Test: Nearest Neighbour ');
subplot(2,2,2), imshow(BiF), title('Test: Bilinear');
subplot(2,2,3), imshow(nns), title ('Nearest Neighbour Interpolation');
subplot(2,2,4), imshow(Bilinear),title ('Billinear Interpolation');
truesize;


