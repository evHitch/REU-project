%gaussian filter 
 gFilter = dir("normalized/*.jpg");
  for j = 1 : length(gFilter)
       %Finds image
       image_path = strcat("normalized/", gFilter(j).name);
       img = imread(image_path);
       %filters and writes to new folder
       filtered = imgaussfilt(img,2);
       new_file_path = strcat("norm_then_gauss/",gFilter(j).name);
       imwrite(filtered,new_file_path);
  end
