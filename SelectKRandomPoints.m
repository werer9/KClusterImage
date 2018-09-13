function [points] = SelectKRandomPoints(imgArray,pointCount)
%SelectKRandomPoints: Generate array of random points to start k-clustering
%   Inputs: 
%		imgArray: 3D array of the pixels of an image
%		pointCount: the number of points to perform k-clustering with
%	Outputs: 
%		points: 2D array with pointCount rows
% Author: Caelan Murch

% Get x and y dimensions of the matrix
x = size(imgArray, 1);
y = size(imgArray, 2);

% Referred to code at following link:
% https://au.mathworks.com/matlabcentral/answers/325160-get-a-set-of-10000-unique-random-2-d-coordinates

% Generate a list the length of the point count with number from 1 to the 
% array size without any repeated numbers
indices = randperm(x * y, pointCount);

% Convert the indices to 2d coordinates
[rows, columns] = ind2sub(size(imgArray), indices);

% store the generates 2d coordinates in a matrix
points = [rows(:), columns(:)];


end

