directory = dir("photos/*.jpg");
directory2 = dir("normalized/*.jpg");


% Crop 
 for i = 1:length(directory)
      %Finds original image and converts to grayscale
      image_path = strcat("photos/",directory(i).name);
      img = rgb2gray(imread(image_path));
      %Crops to a 509 x 461 image and writes to new file
      cropped = imcrop(img,[16,200,508,460]);
      new_file_path = strcat("cropped/",directory(i).name);
      imwrite(cropped,new_file_path);

end  
      

% Histogram Normalization
 for i = 1:length(directory)
      %Finds original image and converts to grayscale
      image_path = strcat("photos/",directory(i).name);
      img = imread(image_path);
      k1 = rgb2gray(img);
      imtool(k1, []);
      imhist(k1);
      
      min = 30;
      max = 250;

      k2 = double(k1);
      k3 = (k2-min)./(max-min);
      k4 = k3.*255;
      k5=uint8(k4);
      imtool(k5,[]);
      imhist(k5);
      myHist = histogram(img);
      new_file_path = strcat("normalized/",directory(i).name);
      imwrite(k5,new_file_path);
 end


%gaussian filter 
% gFilter = dir("normalized/*.jpg");
%  for j = 1 : length(gFilter)
%       %Finds image
%       image_path = strcat("normalized/", gFilter(j).name);
%       img = imread(image_path);
%       %filters and writes to new folder
%       filtered = imgaussfilt(img,2);
%       new_file_path = strcat("norm_then_gauss/",gFilter(j).name);
%       imwrite(filtered,new_file_path);
%  end

%watershed segmentation
%  wFilter = dir("normalized/*.jpg");
%  for j = 1:length(wFilter);
%      image_path = strcat("normalized/", wFilter(j).name);
%      img = imread(image_path);
%      % revisit imtophat()
%      mtransform = imtophat(img,strel('disk', 10));
%      level = graythresh(img);
%      %change to im2bw?
%      bwimg = im2bw(img, level);
%      filtered = watershed(bwimg);
%      imshow(bwimg);
%      new_file_path = strcat("norm_then_watershed/", wFilter(j).name);
%      imwrite(filtered, new_file_path);
%      
%  end
