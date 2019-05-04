% MATLAB script for Assessment Item-1
% Task-2
clear; close all; clc;

% Step-1: Load input image
I = imread('SC.png');

newI = I;
[row,col] = size(I);
% Values
A=80;
B=100;
C=220;

for x = 1:row
    for y = 1:col
        %If the pixel intensity in the image is between A and B then
        %convert it into 220 if not do not change
        if I(x,y)>=A && I(x,y)<=B 
             newI(x,y)= C;
        else
            newI(x,y)= I(x,y);
        end 
    end
end

figure, 
subplot(1,2,1), imshow(I), title('Step-1: Load input image');
subplot(1,2,2), imshow(newI), title ('Step-2: Piecewise-Linear transformation function');
truesize;


