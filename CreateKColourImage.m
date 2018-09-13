function [img] = CreateKColourImage(clustermap,colours)
%CREATEKCOLOURIMAGE Use K Clustering to produce a k cluster image
%   Inputs:
%		clustermap: 2d array with which cluster each pixel is assigned to
%		colours: colours assigned to each cluster
%	Outputs:
% 		img: image after k clustering is applied

% Create empty 3D image array
img = zeros(length(clustermap(:, 1)), length(clustermap(1, :)), 3);

% Iterate through every pixel in img array
for i = 1:length(clustermap(:, 1))
	for j = 1:length(clustermap(1, :))
		% Assign colour to pixel according to cluster value in cluster map
		img(i, j, :) = colours(clustermap(i, j), 1, :);
	end
end

% Cast image array to unsigned 8-bit integer so it can be saved and shown
img = uint8(img);
end

