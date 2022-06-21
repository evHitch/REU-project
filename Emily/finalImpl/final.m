directory = dir("1_photos/*.jpg");


 for i = 1:length(directory)
      image_path = strcat("1_photos/",directory(i).name);
      img = rgb2gray(imread(image_path));
      im1 = histNormal(img,20,240);
      im2 = medfilt2(im1);
      edged = im2uint8(edge(im2,"sobel"));
      tumorMask = isolateTumor(edged);
      im1(tumorMask == 0) = 0;
      newpath = strcat("2_edge/",directory(i).name);
      imwrite(edged,newpath);
      im1 = imgaussfilt(histNormal(im1,0,80),5);
      newpath = strcat("3_gauss/",directory(i).name);
      im1 = imsharpen(im1,"Amount",2);
      im1 = padarray(im1,[2 2],0,"both");
      img = padarray(img,[2 2],0,"both");
      imwrite(im1,newpath);
      tumorMask = seggers(im1);
      im1(tumorMask == 0) = 0;
      finalTumorMask = finalcutt(im1);
      img2 = histNormal(img, 40 ,110);
      img2(finalTumorMask == 0) = 0;
      newpath = strcat("4_normalized/",directory(i).name);
      imwrite(img2,newpath);
      newpath = strcat("5_binarized/",directory(i).name);
      imwrite(finalTumorMask,newpath);
      img = histNormal(img,40,130);
      RGB = repmat(img, [1, 1, 3]);
      [R,G,B] = imsplit(RGB);
      B(finalTumorMask == 0) = 255;
      RGB = cat(3,R,G,B);
      newpath = strcat("6_colored/",directory(i).name);
      imwrite(RGB,newpath);
      segmask = imsegkmeans(RGB,4);
      image = labeloverlay(RGB,segmask);
      newpath = strcat("7_kmeans/",directory(i).name);
      imwrite(image,newpath);   

  
      BW2 = imbinarize(img2);
      numWhitePixels = sum(sum(BW2));
      numPixelsTum = sum(sum(finalTumorMask));
      area = (numWhitePixels);
      area2 = (numPixelsTum);
      dead_area = abs(area2 - area);
      disp(strcat("tumor area is ~ ",string(dead_area)," pixel^2"))
 end

 
