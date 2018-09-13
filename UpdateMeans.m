function [means] = UpdateMeans(img,c,clusters)
%UPDATEMEANS Calculate mean value for each cluster
%   Inputs:
%		img: 3D array storing image
%		c: Number of clusters
%		clusters: 2d array specifying cluster of each pixel
%	Outputs:
%		means: 3D array for means of RGB values in each cluster

% array storing means
means = zeros(c, 1, 3);

for i = 1:c
	% Find coordinates of pixels in cluster
	[X, Y] = find(clusters == i);
	
	% Store coordinates in matrix
	points = cat(2, X, Y);
	
	% Retrieve RGB value at each point
	vals = GetRGBValuesForPoints(img, points);
	
	% Store mean in means array
	means(i, 1, 1) = double(mean(vals(:, 1, 1)));
	means(i, 1, 2) = double(mean(vals(:, 1, 2)));
	means(i, 1, 3) = double(mean(vals(:, 1, 3)));
	
end

end


