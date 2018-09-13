function [squareDistance] = SquaredDistance(point1,point2)
%Calculates the squared distance between 2 points in 3d space
%   Inputs:
%		point1: array representing 1st point
%		point2: array representing 2nd point
%	Outputs:
%		squareDistance: square distance between 2 points
% Author: Caelan Murch

% Calculating squareDistance
squareDistance = (point1(1) - point2(1))^2 + (point1(2) - point2(2))^2 ...
	+ (point1(3) - point2(3))^2;

end

