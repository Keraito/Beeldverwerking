
function [ lplate ] = ExtractLicensePlate( frame )
% Split in RGB channels.
rgeheel = frame(:,:,1); ggeheel = frame(:,:,2); bgeheel = frame(:,:,3);
F = rgb2hsv(frame);
% Split in HSV channels.
H = F(:,:,1); S = F(:,:,2); V = F(:,:,3);

% Threshold the image into possible candidates regions of being a license
% plate.
a = dip_image(H<0.112 & S >0.14 & (bgeheel<(160/180)*ggeheel-25));

% First apply closing to fill up broken pieces of the license plate
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
labels = unique(uint8(e));


if( max(labels) > 0)
    for( index = 2:length(labels))
        f = e == labels(index);
        angle = regionprops(uint8(f),'Orientation');

        g = closing(f,15,'rectangular');
        msr2 = measure(uint8(g),[],{'Minimum','Maximum'},[],Inf,0,0);
        %e = e==2;
        cut = frame((msr2.Minimum(2)+1):(msr2.Maximum(2)+1), (msr2.Minimum(1)+1):(msr2.Maximum(1)+1), : );
        lplate{index-1} = imrotate(cut,-angle.Orientation,'bilinear','crop');
    end
else
    lplate{1} = 0;
end

end