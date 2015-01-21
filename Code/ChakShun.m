vid = VideoReader('C:\Users\ChakShun\Uni\[2014-2015]Q2\Beeldverwerking\Eindproject\Beeldverwerking\Resources\Trainingsvideo.avi');
for(l = 1:100:201)
frame = read(vid,l);
% image(frame);
rgeheel = frame(:,:,1); ggeheel = frame(:,:,2); bgeheel = frame(:,:,3);
% Create Scatterplot
%figure, hold on, scatter(bgeheel(:),rgeheel(:)), 
 %   scatter(blue(:),red(:),'red'); xlabel('Blauw'); ylabel('Red');

    %a = dip_image((bgeheel<(160/180)*ggeheel - 20)& rgeheel<150);
 %a = dip_image( rgeheel<250 & bgeheel<55 & ggeheel<120 &(rgeheel<(200/300)*bgeheel+200) & (rgeheel>(300/250)*bgeheel) & (ggeheel<(350-40)/400 * rgeheel+40) & (bgeheel<(300/250)*ggeheel+25)& (bgeheel<(160/180)*ggeheel - 20) );
    %b = label(a,Inf,1400,0);
    %c = closing(b,8,'elliptic');
 %2000
%msr = measure(c,[],{'Minimum','Maximum'},1,Inf,0,0);
    %result = uint8(frame*c);
  %result = result(msr.Minimum(2):msr.Maximum(2), msr.Minimum(1):msr.Maximum(1), : );
    %figure;image(result);
    %image(result);

F = rgb2hsv(frame);
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);
% a = dip_image((S > ((0.73-0.55)/0.14) * H + 0.40) & (S>((0.78-0.4)/0.06)*(H-0.08)))
% a = dip_image(V>((0.48-0.7)/0.14)*H+0.48 & (bgeheel<(160/180)*ggeheel - 20) & H<0.14)
%a = dip_image((ggeheel > (225/400-75)*(rgeheel-75)) & (ggeheel<((400-15)/400)*rgeheel+15) & (bgeheel<(160/180)*ggeheel - 20)& rgeheel < 250 & ggeheel < 200 & V>((0.48-0.58)/0.14)*H+0.48 & H<0.14)
%a = dip_image(V>((0.48-0.58)/0.14)*H+0.48 & H<0.14 & (S > (0.78-0.4)/0.14*(H-0.08)) & H<0.9 )
%b = label(a,Inf,1000,0);
a = dip_image(H<0.112 & S >0.14 & (bgeheel<(160/180)*ggeheel-25));
% msr = measure(b,[],{'Minimum','Maximum'},[],Inf,0,0);
% for(l = 1:1:length(msr))
%     division = (msr.Maximum(l*2-1) - msr.Minimum(l*2-1))/(msr.Maximum(l*2) - msr.Minimum(l*2));
%     if(~(division > 2.0 && division < 5.0))
%         b = b - l*(b==l);
%     end;
% end;
% b
%msr = measure(b,[],{'CartesianBox'},[],Inf,0,0)
%  b = bopening(a,1,-1,0)
%  
%  c = bclosing(b,5,-1,1);
%  d = bopening(c,3,-1,0)

% 
 b = bclosing(a,5,-1,1);
 c = bopening(b,2,1,0);
 d = bclosing(c,5,-1,1);
 e = label(d,Inf,500,0);
 msr = measure(e,[],{'CartesianBox'},[],Inf,0,0);
 for k = 1:1:length(msr)
     division = msr.CartesianBox(k*2-1)/(msr.CartesianBox(k*2));
     if( ~(division > 2.03 && division < 4.8) )
         e = e - k * (e==k);
     end;
 end;
 e = closing(e,15,'rectangular');
 figure,image(uint8(frame * (e/e)))
%label(c,Inf,0,0)
end;
 
