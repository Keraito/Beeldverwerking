vid = VideoReader('C:\Users\ChakShun\Uni\[2014-2015]Q2\Beeldverwerking\Eindproject\Beeldverwerking\Resources\Trainingsvideo.avi');
frame = read(vid,400);
image(frame);
rgeheel = frame(:,:,1); ggeheel = frame(:,:,2); bgeheel = frame(:,:,3);

% Kentekenplaat eruit halen.
%plaat = frame(250:280,335:465,:); 
%image(plaat);
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);

% Create Scatterplot
%figure, hold on, scatter(bgeheel(:),rgeheel(:)), 
%    scatter(blue(:),red(:),'red'); xlabel('Blauw'); ylabel('Red');

 a = dip_image((bgeheel<(160/180)*ggeheel - 20));
 b = label(a,Inf,1400,0);
 c = closing(b,8,'elliptic');
 %2000
 result = uint8(frame*c);
 figure;image(result);
 %I = find(b == 1);
 %max(I)
 %min(I)

%I = find(k==1);
%s = [length(k(:,1)) length(k(1,:))];
%[x,y] = ind2sub(s,I); 