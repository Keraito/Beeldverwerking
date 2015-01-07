vid = VideoReader('C:\Users\ChakShun\Uni\[2014-2015]Q2\Beeldverwerking\Eindproject\Beeldverwerking\Resources\Trainingsvideo.avi');
%frame 1
frame = read(vid,1);
plaat = frame(300:325,310:400,:);
red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);

figure,scatter(blue(:),red(:)); xlabel('Blauw'); ylabel('Red');
figure,scatter(red(:),green(:)); xlabel('rood'); ylabel('groen');
figure,scatter(green(:),blue(:)); xlabel('groen'); ylabel('blauw');

%frame 101
frame = read(vid,101);
plaat = frame(250:280,335:465,:); 

%frame 201
frame = read(vid,201);
plaat = frame(325:360,300:420,:);

% %frame 301
% frame = read(vid,301);
% plaat = frame(250:330,210:350,:);

%frame 401
frame = read(vid,401);
plaat = frame(320:420,120:620,:);

%frame 501
frame = read(vid,501);
plaat = frame(400:450,250:420,:);

%frame 601
frame = read(vid,601);
plaat = frame(340:390,355:545,:);

%frame 801
frame = read(vid,801);
plaat = frame(345:390,230:440,:);

%frame 901
frame = read(vid,901);
plaat = frame(235:270,80:200,:);

