% The order of the image is: A t/m Z 0 t/m 9 and -
dictionary = imread('characters_33x33.png');
character = 1;
min = 1 + (character - 1) * 33;
xRange = [min:1:min+32];
yRange = [1:1:33];
image(dictionary(yRange,xRange));