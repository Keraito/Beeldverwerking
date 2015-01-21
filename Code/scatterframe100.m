frame = read(vid,100);
plaat = frame(250:280,335:465,:); 
bg = frame(50:250,50:250,:);

red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
rood = bg(:,:,1); groen = bg(:,:,2); blauw = bg(:,:,3);

figure,
scatter(green(:),blue(:)); xlabel('groen'); ylabel('blauw');
hold on;
scatter(groen(:),blauw(:),'red'); 

figure, scatter(blue(:),red(:)); xlabel('blauw');ylabel('rood');
hold on;
scatter(blauw(:),rood(:), 'red');

figure, scatter(red(:),green(:)); xlabel('blauw');ylabel('rood');
hold on;
scatter(rood(:),groen(:), 'red');