directory = dir("1_photos/*.jpg");

% crop
 for i = 1:length(directory)
      image_path = strcat("1_photos/",directory(i).name);
      img = rgb2gray(imread(image_path));
      im1 = histNormal(img,20,240);
      im2 = medfilt2(im1);
      edged = im2uint8(edge(im2,"sobel"));
      tumorMask = isolateTumor(edged);
      imshow(tumorMask);
      im1(tumorMask == 0) = 0;
      newpath = strcat("2_cropped/",directory(i).name);
      imwrite(edged,newpath);
      im1 = imgaussfilt(histNormal(im1,20,120),4);
      newpath = strcat("3_normalized/",directory(i).name);
      imwrite(im1,newpath);
      tumorMask = isolateTumor2(im1);
      im1(tumorMask == 0) = 0;
      finalTumorMask = finalcutt(im1);
      img(finalTumorMask == 0) = 0;
      newpath = strcat("4_gauss/",directory(i).name);
      imwrite(img,newpath);
      newpath = strcat("5_new/",directory(i).name);
      imwrite(tumorMask,newpath);
      img = histNormal(img,40,130);
      RGB = repmat(img, [1, 1, 3]);
      [R,G,B] = imsplit(RGB);
      B(tumorMask == 0) = 255;
      RGB = cat(3,R,G,B);
      newpath = strcat("6_colored/",directory(i).name);
      imwrite(RGB,newpath);
      segmask = imsegkmeans(RGB,4);
      image = labeloverlay(RGB,segmask);
      newpath = strcat("7_kmeans/",directory(i).name);
      imwrite(image,newpath);
     
      

 end
 


 
