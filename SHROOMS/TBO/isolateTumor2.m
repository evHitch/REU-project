function [BW,maskedImage] = isolateTumor2(X)
% Threshold image - manual threshold
BW = X > 155;

% Close mask with disk
radius = 61;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Dilate mask with disk
radius = 7;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imdilate(BW, se);

% Active contour
iterations = 100;
BW = activecontour(X, BW, iterations, 'Chan-Vese');

% Close mask with disk
radius = 76;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imclose(BW, se);

% Dilate mask with disk
radius = 5;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imdilate(BW, se);

% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;
end


