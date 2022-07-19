directory = dir("1_photos/*.jpg");

 for i = 1:length(directory)
      image_path = strcat("1_photos/",directory(i).name);
      img = rgb2gray(imread(image_path));
      imhist(img);
      % increases contrast: below 20 = 0, above 240 = 255
      im1 = histNormal(img,20,240);
    
      % median filter, reduces noise 
      im2 = medfilt2(im1);
      % sobel edge, creates binary mask of regions w/ extreme contrast
      edged = im2uint8(edge(im2,"sobel"));
     
      % take binary values of binary mask & apply morphological closing 
      % to fill gaps between edges. Finds general tumor region
      tumorMask = isolateTumor(edged);
      % superimpose mask on black background 
      im1(tumorMask == 0) = 0;
      newpath = strcat("2_edge/",directory(i).name);
      imwrite(edged,newpath);
      newpath = strcat("2_tumorMaskTest/",directory(i).name);
      imwrite(im1,newpath);
      % Value above 80 become 255. Gauss filter removes noise. 
      im1 = imgaussfilt(histNormal(im1,0,80),5);
      newpath = strcat("3_gauss/",directory(i).name);
      % eh?
      im1 = imsharpen(im1,"Amount",2);
      % adds black 2x2 border to images 
      im1 = padarray(im1,[2 2],0,"both");
      img = padarray(img,[2 2],0,"both");
      imwrite(im1,newpath);
      % uses imclearborder & morphological operations to remove border.
      tumorMask = seggers(im1);
      im1(tumorMask == 0) = 0;
      finalTumorMask = finalcutt(im1);
      % below 40 = 0, above 110 = 255
      % identifies living as white, dead as black
      img2 = histNormal(img, 40 ,110);
      % values of 0 in mask become 0 in image.
      img2(finalTumorMask == 0) = 0;
      newpath = strcat("4_normalized/",directory(i).name);
      imwrite(img2,newpath);
      newpath = strcat("5_binarized/",directory(i).name);
      imwrite(finalTumorMask,newpath);
      % image area identification
%       img = histNormal(img,40,130);
%       RGB = repmat(img, [1, 1, 3]);
%       [R,G,B] = imsplit(RGB);
%       B(finalTumorMask == 0) = 255;
%       RGB = cat(3,R,G,B);
%       newpath = strcat("6_colored/",directory(i).name);
%       imwrite(RGB,newpath);
%       segmask = imsegkmeans(RGB,4);
%       image = labeloverlay(RGB,segmask);
%       newpath = strcat("7_kmeans/",directory(i).name);
%       imwrite(image,newpath);   

      % Otsus method to choose global threshold on predetermined contrast 
      BW2 = imbinarize(img2);
      newpath = strcat("5_binarizedTest/",directory(i).name);
      imwrite(BW2,newpath);
      
      
      % Sums all living tumor cells in image
     % numWhitePixels = sum(sum(BW2));
      % Sums tumor region 
     % numPixelsTum = sum(sum(finalTumorMask));
      % subtracts living region from whole tumor to find dying area 
      % tumor area
     % dead_area = abs(numPixelsTum - numWhitePixels);
     % dead_percent = (dead_area/numWhitePixels)*100;
     % disp(strcat("dead tumor area is ~ ",string(dead_area)," pixel^2 and ", string(dead_percent),"% of the original tumor"))

 end

 