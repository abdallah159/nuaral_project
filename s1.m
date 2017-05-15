function input
RGB = imread(path);
c = [1 12 146];
r = [1 104 156];
pixels = impixel(RGB,c,r);
s1 = sum(pixels);
YCBCR = rgb2ycbcr(im);
s2 = size(YCBCR);
input = s1-s2;
