vid = VideoReader('C:\Users\ChakShun\Uni\[2014-2015]Q2\Beeldverwerking\Eindproject\Beeldverwerking\Resources\Trainingsvideo.avi');
frame = read(vid,800);
image(frame);
rgeheel = frame(:,:,1); ggeheel = frame(:,:,2); bgeheel = frame(:,:,3);

% Kentekenplaat eruit halen.
%plaat = frame(250:280,335:465,:); 
%image(plaat);
%red = plaat(:,:,1); green = plaat(:,:,2); blue = plaat(:,:,3);



% Create Scatterplot
%figure, hold on, scatter(bgeheel(:),rgeheel(:)), 
 %   scatter(blue(:),red(:),'red'); xlabel('Blauw'); ylabel('Red');

    a = dip_image((bgeheel<(160/180)*ggeheel - 20));
 %a = dip_image( rgeheel<250 & bgeheel<55 & ggeheel<120 &(rgeheel<(200/300)*bgeheel+200) & (rgeheel>(300/250)*bgeheel) & (ggeheel<(350-40)/400 * rgeheel+40) & (bgeheel<(300/250)*ggeheel+25)& (bgeheel<(160/180)*ggeheel - 20) );
    b = label(a,Inf,1400,0);
    c = closing(b,8,'elliptic');
 %2000
%msr = measure(c,[],{'Minimum','Maximum'},1,Inf,0,0);
    result = uint8(frame*c);
  %result = result(msr.Minimum(2):msr.Maximum(2), msr.Minimum(1):msr.Maximum(1), : );
    %figure;image(result);
    image(result);

% F = rgb2hsv(frame);
% H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
% a = dip_image((S>(1/0.3)*H) &H>0.08& H<0.15 & V>0.15 &V<0.55 & (V>-0.3*S+0.4) & S > 0.42);