vid = VideoReader('C:\Users\ChakShun\Uni\[2014-2015]Q2\Beeldverwerking\Eindproject\Beeldverwerking\Resources\Trainingsvideo.avi');
%frame 1
frame = read(vid,1);
plaat = frame(300:325,310:400,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
figure, scatter(S(:),V(:));
xlabel('S'); ylabel('V');
hold on;
%frame 101
frame = read(vid,101);
plaat = frame(250:280,335:465,:); 
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
%frame 201
frame = read(vid,201);
plaat = frame(325:360,300:420,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
% %frame 301
% frame = read(vid,301);
% plaat = frame(250:330,210:350,:);
%frame 401
frame = read(vid,401);
plaat = frame(320:420,120:620,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
%frame 501
frame = read(vid,501);
plaat = frame(400:450,250:420,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
%frame 601
frame = read(vid,601);
plaat = frame(340:390,355:545,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
%frame 801
frame = read(vid,801);
plaat = frame(345:390,230:440,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
%frame 901
frame = read(vid,901);
plaat = frame(235:270,80:200,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
%frame 1001
frame = read(vid,1001);
plaat = frame(315:360,405:565,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
%frame 1201
frame = read(vid,1201);
plaat = frame(340:375,260:415,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
%frame 1301
frame = read(vid,1301);
plot = frame(295:330,300:450,:);
F = rgb2hsv(plaat); H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);scatter(S(:),V(:));
