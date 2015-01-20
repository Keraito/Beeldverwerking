p = 1;
%73,74
for(k = 1200:1205)
frame=read(vid,k);
kenteken = run(frame);
if length(kenteken)>1
    results{p,1} = kenteken;
    results{p,2} = k;
    results{p,3} = 0;
    p = p + 1;
end
end