<<<<<<< HEAD
vid = VideoReader('Trainingsvideo.avi');
p = 1;
%73,74
%796
for(k = 700)
frame=read(vid,k);
kenteken = run(frame);
if length(kenteken)>1
    results{p,1} = kenteken;
    results{p,2} = k;
    results{p,3} = 0;
    p = p + 1;
end
=======
p = 1;
%73,74
for(k = 700)
frame=read(vid,k);
kenteken = run(frame);
if length(kenteken)>1
    results{p,1} = kenteken;
    results{p,2} = k;
    time = toc;
    results{p,3} = time; 
    p = p + 1;
end
>>>>>>> master
end