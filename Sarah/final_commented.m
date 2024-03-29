% assign where images will be pulled from - manually cropped images
directory = dir("1_photos/*.jpg");

 for i = 1:length(directory)
      image_path = strcat("1_photos/",directory(i).name);
      img = rgb2gray(imread(image_path));
      % increases the contrast between cutoffs (pixel values: 20-240) -
      % anything between 20 and 240 becomes 0 
      % anything above 240 becomes 255
      im1 = histNormal(img,20,240);
      % median filter - applied blur and reduces noise
      im2 = medfilt2(im1);
      % apply sobel edge. 
      % creates binary mask of regions with extreme contrast
      edged = im2uint8(edge(im2,"sobel"));
      % take binary values of binary mask and then apply morphological
      % closing to fill in the gaps between edges
      % creates general tumor region
      tumorMask = isolateTumor(edged);
      % superimpse mask on black background
      im1(tumorMask == 0) = 0;
      newpath = strcat("2_edge/",directory(i).name);
      imwrite(edged,newpath);
      % anything that is considered bright (above 80) is forced to 255
      % apply gauss filter to reduce noise and creates halo effect for
      % contouring
      im1 = imgaussfilt(histNormal(im1,0,80),5);
      newpath = strcat("3_gauss/",directory(i).name);
      im1 = imsharpen(im1,"Amount",2);
      % creates 2x2 border of black pixels for creating edges
      im1 = padarray(im1,[2 2],0,"both");
      img = padarray(img,[2 2],0,"both");
      imwrite(im1,newpath);
      % refining tumor mask by trimming the border using imclearborder and
      % morphological closing
      tumorMask = seggers(im1);
      % anywhere where tumorMask is 0(black), im1 will also be 0(black)
      im1(tumorMask == 0) = 0;
      % trims away at tumor to get the right tumor region
      finalTumorMask = finalcutt(im1);
      % change contrast to make bright pixels above 110 be 255 
      % everything below 40 becomes 0
      % clearly identifies living as white and dead as black
      img2 = histNormal(img, 40 ,110);
      img2(finalTumorMask == 0) = 0;
      newpath = strcat("4_normalized/",directory(i).name);
      imwrite(img2,newpath);
      newpath = strcat("5_binarized/",directory(i).name);
      imwrite(finalTumorMask,newpath);
%       % image area identification
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

      % Otsus method to choose global threshold on pre-determined contrast
      BW2 = imbinarize(img2);
      % Sums all living tumor cells in image (white pixels)
      numWhitePixels = sum(sum(BW2));
      % Sums only tumor region
      numPixelsTum = sum(sum(finalTumorMask));
      % subtracts living tumor cells from entire tumor region to give dead
      % tumor area
      dead_area = abs(numPixelsTum - numWhitePixels);
      disp(strcat("dead tumor area is ~ ",string(dead_area)," pixel^2"))
 end
