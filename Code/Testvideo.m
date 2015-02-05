
%vid = VideoReader('Trainingsvideo.avi');
p = 1;
%73,74
tic;
for(k = 1:100:1901)%1:4:vid.NumberofFrames)
frame=read(vid,k);
kentekenarray = run(frame);
%if length(kenteken)>1
for(n = 1:length(kentekenarray))
    if(length(kentekenarray{n}) > 1)
        results{p,1} = kentekenarray{n};
        results{p,2} = k;
        time = toc;
        results{p,3} = time; 
        p = p + 1;
    end
end

end