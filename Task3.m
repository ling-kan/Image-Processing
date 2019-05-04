% MATLAB script for Assessment Item-1
% Task-3
clear; close all; clc;

% Step-1: Load input image
I = imread('Noisy.png');

% Step-2: Convert into grey scale
Igray = rgb2gray(I);
figure, imshow(Igray), title('Step-1: Conversion of input image to greyscale');

% Step-3: Implement smoothing filter 
%Pad the matrix with 0 
pad=zeros(size(Igray)+4); 
%Create a new image for the median 
newM=zeros(size(Igray));

%input image into matrix 
pad=padarray(Igray,[1,1]);
 
for x= 1:size(pad,1)-5
    for y=1:size(pad,2)-5
        medianf=zeros(25,1);
        counter=1;
        %input matrix of 5x5
        for row=1:5
            for col=1:5
                %Copy matrix into array and sort
                medianf(counter)=pad(x+row-1,y+col-1);
                counter=counter+1;
            end
        end
        %Sort the matrix in order 
        median=sort(medianf);
        %Find the middle value 
        newM(x,y)=median(13);   %13th digit into output of matrix
       
    end
end

%Step-3: Averaging filter 
[row2,col2]=size(Igray);
%Create image for avergaging filter 
newA=zeros(row2,col2);

%Inputting 5x5 Matrix
for x = 1:row2-5
    for y =1:col2-5
        %Finding the mean - add all and divide
          newA(x,y)=mean2(Igray(x:x+5,y:y+5));
    end
end

%Display both median and average filter image
newA=uint8(newA);
newM=uint8(newM);

%Internal to make sure the results are the same using a function
%Noisy filter using function
Average = filter2(fspecial('average',5),Igray)/255;
Median = medfilt2(Igray,[5 5]);
%Displaying results and comparing to the actual filter
figure, 
subplot(2,2,1), imshow(newA), title ('Step-2: Average Filter without functions');
subplot(2,2,2), imshow(newM), title ('Step-3: Median smoothing filter without functions');
subplot(2,2,3), imshow(Average), title ('Test: Average filter using functions');
subplot(2,2,4), imshow(Median),title ('Test: Median filter using a functions');
truesize;


        

