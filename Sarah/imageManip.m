% directory = dir("photos/*.jpg");

% % crop
%  for i = 1:length(directory)
%       %Finds original image and converts to grayscale
%       image_path = strcat("photos/",directory(i).name);
%       img = rgb2gray(imread(image_path));
%       % Crops to a 509 x 461 image and writes to new file
%       cropped = imcrop(img,[20,75,520,709]);
%       [x,y] = findCenterOfMass(cropped);
%       cropped2 = imcrop(cropped,[round(x)-200,round(y)-200,400,400]);
%       new_file_path_d = strcat("cropped/",directory(i).name);
%       imwrite(cropped2,new_file_path_d);
%  end

 % Histogram Normalization
%  for j = 1 : length(directory)
      % Finds original image and converts to grayscale
%       image_path = strcat("cropped/",directory(i).name);
%       img = imread(image_path);
%       hNorm = histNormal(img, 30, 250);
%       imtool(hNorm,[]);
%       myHist = histogram(img);
%       imhist(hNorm);
     
%       segTest = segmentImageTest(hNorm);
%       img(segTest==0)=0;
%       new_file_path = strcat("segmentTest/",directory(i).name);
%       imwrite(img,new_file_path);

%       new_file_path = strcat("normalized/",directory(i).name);
%       imwrite(hNorm,new_file_path);
%       Gauss = imgaussfilt(hNorm,10);
%       new_file_path = strcat("gauss/",directory(i).name);
%       imwrite(Gauss,new_file_path);

cropd_directory = dir("cropped_dark/*.jpg");
 for j = 1 : length(cropd_directory)
      % dark
      image_path = strcat("cropped_dark/",cropd_directory(j).name);
      img_d = imread(image_path);
      hNorm_d = histNormal(img_d, 30, 250);
      imtool(hNorm_d,[]);
      myHist_d = histogram(img_d);
      hist_d = imhist(hNorm);
      new_file_path_d = strcat("histNorm_dark/",cropd_directory(j).name);
      imwrite(hist_d,new_file_path_d);

      new_file_path_d = strcat("histNorm_dark/",cropd_directory(j).name);
      imwrite(hNorm_d,new_file_path_d);
      Gauss_d = imgaussfilt(hNorm_d,10);
      new_file_path_d = strcat("gauss_dark/",cropd_directory(j).name);
      imwrite(Gauss_d,new_file_path_d);

      segTest_d = segmentImageTest(hNorm_d);
      img_d(segTest_d == 0) = 0;
      new_file_path_d = strcat("segmentTest_dark/",cropd_directory(j).name);
      imwrite(img_d,new_file_path_d);
 end

 cropl_directory = dir("cropped_light/*.jpg");
 for j = 1 : length(cropl_directory)
      % light
      image_path_l = strcat("cropped_light/",cropl_directory(j).name);
      img_l = imread(image_path_l);
      hNorm_l = histNormal(img_l, 30, 250);
      imtool(hNorm_l,[]);
      myHist_l = histogram(img_l);
      hist_l = imhist(hNorm);
      new_file_path_l = strcat("histNorm_light/",cropl_directory(j).name);
      imwrite(hist_l,new_file_path_l);

      new_file_path_l = strcat("histNorm_light/",cropl_directory(j).name);
      imwrite(hNorm_l,new_file_path_l);
      Gauss_l = imgaussfilt(hNorm_l,10);
      new_file_path_l = strcat("gauss_light/",cropl_directory(j).name);
      imwrite(Gauss_l,new_file_path_l);

      segTest_l = segmentImageLight(hNorm_l);
      img_l(segTest_l==0)=0;
      new_file_path_l = strcat("segmentTest_light/",cropl_directory(j).name);
      imwrite(img_l,new_file_path_l);


 end
