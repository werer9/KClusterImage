function [cluster] = AssignToClusters(img, pixels)
%ASSIGNTOCLUSTERS Assigns a pixel to a cluster
% INPUTS:
%	img: a 3D array containg RGB image information
% 	pixels: RGB pixels at the center of each cluster
% OUTPUTS:
% 	cluster: 2D array with cluster allocations for each pixel in img array
% Author: Caelan Murch

% Get image dimensions
[x, y] = size(img(:, :, 1));

% Create 2d array, cluster, with 2d dimensions of image
cluster = zeros(x, y);

% Get number of clusters stored in variable c
[c] = size(pixels, 1);
pixels = reshape(pixels, [c 3]);

% Loop through all 2D coordinates in image
for i = 1:x
	for j = 1:y
		% Array to track square distance from each cluster
		dist = zeros(c, 1);
		
		% Loop for number of clusters and calculate distance from each
        % cluster
		for k = 1:length(dist)
			dist(k) = SquaredDistance(img(i, j, :),...
				pixels(k,:));
		end
		
		% find last index of minimum square distance
		mindist = min(dist);
		minidx = find(dist == mindist, 1);
		
		% allocate pixel to cluster with minimum square distance
		cluster(i, j) = minidx;
	end
end

end

