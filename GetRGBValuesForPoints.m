function [pixels] = GetRGBValuesForPoints(imgArray,points)
%Takes points from selectkrandompoints and retrieves colors at each point
%   Input:
%		imgArray: 3D array storing image data
%		points: array containing points to extract colors from
%	Output:
%		pixels: 3D array with colours at each selected point

% Getting length of x-axis to find number of points
[x, ~] = size(points);
pixels = zeros(x, 1, 3);

for i = 1:x
	% Storing R, G and B points in pixels array which contains RGB values
	pixels(i, 1, 1) = imgArray(points(i, 1), points(i, 2), 1);
	pixels(i, 1, 2) = imgArray(points(i, 1), points(i, 2), 2);
	pixels(i, 1, 3) = imgArray(points(i, 1), points(i, 2), 3);
end

end


