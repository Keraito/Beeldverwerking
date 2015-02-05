%vid = VideoReader('Trainingsvideo.avi');
p = 1;
%73,74
tic;
for(k = 1801)%1:4:vid.NumberofFrames)
frame=read(vid,k);
kenteken = run(frame);
%if length(kenteken)>1
for(n = 1:length(kenteken))
    if(length(kenteken(n)) > 1)
        results{p,1} = kenteken;
        results{p,2} = k;
        time = toc;
        results{p,3} = time; 
        p = p + 1;
    end
end
end