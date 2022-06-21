BW = imbinarize(image);
      numWhitePixels = sum(BW(:));
      area = (numWhitePixels*.26)/256;