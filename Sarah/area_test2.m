BW = imbinarize(image);
      BW2 = imbinarize(img);
      numWhitePixels = sum(BW(:));
      numBlackPixelsTum = sum(BW2);
      area = (numWhitePixels*.26)/256;
      area2 = (numBlackPixelsTum*.26)/256;
      tum_area = abs(area2 - area);
      disp(strcat("tumor area is ~ ",string(tum_area)," pixel^2"))
