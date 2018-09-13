clc;
clear;
% Script to run 7 functions
% Author: Caelan Murch

% Choose image to cluster and make clocktower.jpg default if no image
% name is entered
imgname = input('Enter image name: ');
if isempty(imgname)
	imgname = 'clocktower.jpg';
end

% Choose max number of iterations to run
iterations = input('Enter maximum iterations: ');

% Enter k cluster value
k = input('Enter K value: ');

% Read image into an array
img = imread(imgname);

% Implements all 7 functions and then displays image generated
% by the functions
points = SelectKRandomPoints(img, k);
means = GetRGBValuesForPoints(img, points);
[map, info] = KMeansRGB(img, means, iterations);
newimg = CreateKColourImage(map, info);
imshow(newimg);