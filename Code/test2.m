vid = VideoReader('C:\Users\ChakShun\Uni\[2014-2015]Q2\Beeldverwerking\Eindproject\Beeldverwerking\Resources\Trainingsvideo.avi');
for(i=1:50)
    frame = read(vid,i*2);
    image(rgb2hsv(frame));
end;
