vid = VideoReader('C:\Users\ChakShun\Uni\[2014-2015]Q2\Beeldverwerking\Eindproject\Beeldverwerking\Resources\Trainingsvideo.avi');
%frame 1
frame = read(vid,1);
plaat = frame(313:321,335:344,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
figure, scatter(S(:),V(:)); 
xlabel('H'); ylabel('V');
hold on;

%frame 101
frame = read(vid,101);
plaat = frame(267:280,412:423,:); 
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 

%frame 201
frame = read(vid,201);
plaat = frame(328:344,353:363,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 

%frame 301
frame = read(vid,301);
plaat = frame(282:295,248:260,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 

%frame 401
frame = read(vid,401);
plaat = frame(320:354,270:340,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 

%frame 501
frame = read(vid,501);
plaat = frame(420:430,355:370,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 

%frame 601
frame = read(vid,601);
plaat = frame(365:380,497:508,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 

%frame 701
frame = read(vid,701);
plaat = frame(275:292,335:353,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 

%frame 801
frame = read(vid,801);
plaat = frame(350:377,325:330,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 

% %frame 901
% frame = read(vid,901);
% plaat = frame(254:260,174:182,:);
% F = rgb2hsv(plaat);
% H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
% scatter(H(:),S

%frame 1001
frame = read(vid,1001);
plaat = frame(345:355,514:525,:);
F = rgb2hsv(plaat);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
scatter(S(:),V(:)); 