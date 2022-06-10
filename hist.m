directory = dir("photos/*.jpg");

 for i = 1:length(directory)
      %Finds original image and converts to grayscale
      image_path = strcat("photos/",directory(i).name);
      img = imread(image_path);
      k1 = rgb2gray(img);
      imtool(k1, []);
      imhist(k1);
      
      min = 45;
      max = 180;

      k2 = double(k1);
      k3 = (k2-min)./(max-min);
      k4 = k3.*255;
      k5=uint8(k4);
      imtool(k5,[]);
      imhist(k5);
      imshow(img);
      myHist = histogram(img);
 end
