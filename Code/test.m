% License plate acquisition
vid = VideoReader('C:\Users\ChakShun\Uni\[2014-2015]Q2\Beeldverwerking\Eindproject\Beeldverwerking\Resources\Trainingsvideo.avi');
frame = read(vid,200);
% rgeheel = frame(:,:,1); ggeheel = frame(:,:,2); bgeheel = frame(:,:,3);
%  a = dip_image((bgeheel<(160/180)*ggeheel - 20));
%  b = label(a,Inf,1400,0);
%  c = closing(b,8,'elliptic');
%  msr = measure(c,[],{'Minimum','Maximum'},1,Inf,0,0);
%  result = uint8(frame*c);
%  %result = result(msr.Minimum(2):msr.Maximum(2), msr.Minimum(1):msr.Maximum(1), : );
%  %figure;image(result);
%  
%  % Character segmentation
%  licensePlate = result;
%  smooth = medif(licensePlate,3,'elliptic'); % to remove noise
%  d = smooth < 80;
%  e = closing(~d,15,'elliptic');
%  f = e & d
f = rgb2gray(frame);
figure; image(f);
g = edge(f,'sobel');
G = transpose(g);
h = sum(G);
H = transpose(h);
plot(H);