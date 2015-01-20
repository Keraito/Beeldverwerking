p = 1;
%73,74
tic;
for(k = 1:2:100)
frame=read(vid,k);
kenteken = run(frame);
if length(kenteken)>1
    results{p,1} = kenteken;
    results{p,2} = k;
    time = toc;
    results{p,3} = time; 
    p = p + 1;
end
end