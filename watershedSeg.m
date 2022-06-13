 wFilter = dir("normalized/*.jpg");
 for j = 1:length(wFilter);
     image_path = strcat("normalized/", wFilter(j).name);
     img = imread(image_path);
     % revisit imtophat()
     mtransform = imtophat(img,strel('disk', 10));
     level = graythresh(img);
     %change to im2bw?
     bwimg = im2bw(img, level);
     filtered = watershed(bwimg);
     imshow(bwimg);
     new_file_path = strcat("norm_then_watershed/", wFilter(j).name);
     imwrite(filtered, new_file_path);
     
 end
