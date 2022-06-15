directory = dir("1_photos/*.jpg");

% crop
 for i = 1:length(directory)
      %Finds original image and converts to grayscale
      image_path = strcat("1_photos/",directory(i).name);
      img = rgb2gray(imread(image_path));
      % Crops to a 509 x 461 image and writes to new file
      cropped = imcrop(img,[20,75,520,709]);
      [x,y] = findCenterOfMass(cropped);
      cropped2 = imcrop(cropped,[round(x)-200,round(y)-200,400,400]);
      new_file_path = strcat("2_cropped/",directory(i).name);
      imwrite(cropped2,new_file_path);
 end

 % Histogram Normalization
 for i = 1:length(directory)
      % Finds original image and converts to grayscale
      image_path = strcat("2_cropped/",directory(i).name);
      img = imread(image_path);
      hNorm = histNormal(img, 30, 250);
      imtool(hNorm,[]);
      myHist = histogram(img);
      imhist(hNorm);
      
      new_file_path = strcat("3_normalized/",directory(i).name);
      imwrite(hNorm,new_file_path);
      Gauss = imgaussfilt(hNorm,10);
      new_file_path = strcat("4_gauss/",directory(i).name);
      imwrite(Gauss,new_file_path);

 end

 





%  subplot(1,2,1);
%  imshow('MRI-9.jpg');
%  title('stuff!');