 
clear; close all; clc;

% Step-1: Load input image
I = imread('Starfish.jpg');

% Step-2: Convert into grey scale
Igray = rgb2gray(I);

%Step-3: Noisy filter using function -- Median
%Ibw = imnoise(Igray,'salt & pepper');
I3 = medfilt2(Igray);

%Step-4: Enhance image
I4 = imadjust(I3);
I4 = imsharpen(I4,'Radius',40);

%Step-5: Binary Segmentation
%I5a = false(size(Ibw4)); 
I5= imbinarize(I4);

%Step-6: Invert Image 
I6 = imcomplement(I5); 

%Step-7: Morphology Function
%Remove anything more than 100 pixels
st1 = strel('disk',4);
I7 = imclose(I6,st1);

%Step-8: Remove all small objects that contain less than 50pixels 
I8 = bwareaopen(I7,99);
l = bwlabel(I8);

%Step-9: Star Recognition  
rp = regionprops(l,'Area','Perimeter');
  %finding the roundness of the object
  metric=zeros(1,25);
  area = [rp.Area];
  perimeter= [rp.Perimeter];
  for i = 1 : length(metric)
        metric(i) = 4*pi*area(i)/perimeter(i)^2;
  end
% Find all starfish obejcts based on roundness metric range and move
% to another image
star = find(( metric >= 0.18)  & (metric <= 0.26));
%Return array that contains true
I9 = ismember(l, star);
%Filter image therefore only retain 5 of the largest objects
I9 = bwareafilt(I9,5);

%Display
figure, 
subplot(3,3,1),  imshow(I), title('Step-1: Load input image');
subplot(3,3,2),  imshow(Igray), title ('Step-2: Conversion of input image to greyscale');
subplot(3,3,3), imshow(I3),title('Step-3: Remove noise');
subplot(3,3,4),  imshow(I4),title('Step-4: Enhance Image');
subplot(3,3,5),  imshow(I5),title('Step-5: Binary Segmentation');
subplot(3,3,6),  imshow(I6), title('Step-6: Invert Image');
subplot(3,3,7), imshow(I7),title('Step-7: Morphology Function');
subplot(3,3,8),  imshow(I8),title('Step-8: Remove small objects');
subplot(3,3,9),  imshow(I9), title('Step-9: Final - Star Recognition');
truesize;

figure, imshow(I9), title('Step-9: Final - Star Recognition');
