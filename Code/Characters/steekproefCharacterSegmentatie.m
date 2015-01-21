vid = VideoReader('Trainingsvideo.avi');
%frame 1
frame = read(vid,1);
plaat = frame(300:325,310:400,:);
%dip_image(segmentCharacters(plaat))
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%figure,scatter(blue(:),red(:)); xlabel('Blauw'); ylabel('Red');
%figure,scatter(red(:),green(:)); xlabel('rood'); ylabel('groen');
%figure,scatter(green(:),blue(:)); xlabel('groen'); ylabel('blauw');
%hold on

%frame 101
frame = read(vid,101);
plaat = frame(250:280,335:465,:); 
%dip_image(segmentCharacters(plaat))

%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))

%frame 201
frame = read(vid,201);
plaat = frame(325:360,300:420,:);
%dip_image(segmentCharacters(plaat))

%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))
%frame 301
%frame = read(vid,301);
%plaat = frame(250:330,210:350,:);

%frame 401
frame = read(vid,401);
plaat = frame(320:420,120:620,:);
%dip_image(segmentCharacters(plaat))
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))

%frame 501
frame = read(vid,501);
plaat = frame(400:450,250:420,:);
dip_image(segmentCharacters(plaat))
%dip_image(cl)
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))

%frame 601
frame = read(vid,601);
plaat = frame(340:390,355:545,:);
dip_image(segmentCharacters(plaat))
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))

%frame 801
frame = read(vid,801);
plaat = frame(345:390,230:440,:);
dip_image(segmentCharacters(plaat))
%scatter(green(:),blue(:))

%frame 901
frame = read(vid,901);
plaat = frame(235:270,80:200,:);
dip_image(segmentCharacters(plaat))
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))

%frame 1001
frame = read(vid,1001);
plaat = frame(315:360,405:565,:);
dip_image(segmentCharacters(plaat))
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))

%frame 1201
frame = read(vid,1201);
plaat = frame(340:375,260:415,:);
dip_image(segmentCharacters(plaat))
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))

%frame 1301
frame = read(vid,1301);
%plot = frame(295:330,300:450,:);
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);
%scatter(green(:),blue(:))

