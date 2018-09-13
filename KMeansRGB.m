function [clustermap,clusterinfo] = KMeansRGB(img,seedmeans,max)
%KMEANSRGB Assign points in image into K-Cluster using k-means algorithm
%   Inputs:
%		img: 3D image array
%		seedmeans: means to initiate algorithm. Dimensions: k,1,3
%		max: max number of iterations
%	Outputs:
% 		clustermap: 2D array representing cluster assignments
% 		clusterinfo: 3D array with means of each cluster

% Cast image to double type to make squared distance function work
img = double(img);

% Create 2d array assigning each pixel to a cluster
clustermap = AssignToClusters(img, seedmeans);

% Calculate number of different cluster based of length of seedmeans
clustercount = length(seedmeans(:, 1, 1));

% store means in clusterinfo and make infoold different to clusterinfo for
% loop
clusterinfo = seedmeans;
infoold = clusterinfo./2;

% Loop until max iterations are met or means do not change
for i = 1:max
	
	% Update the clusterinfo (means)
	clusterinfo = UpdateMeans(img, clustercount, clustermap);
	
	% Assign each pixel with a cluster
	clustermap = AssignToClusters(img, clusterinfo);
	
	% Inform user of how many iterations have been completed
	fprintf('Iteration: %d\n', i);
	
	% Check if algorithm is complete and inform use
	if (isequal(infoold, clusterinfo))
		disp('Converged');
		return;
	end
	
	% Assign infoold to current clusterinfo before update for comaprison
	infoold = clusterinfo;
end
end

