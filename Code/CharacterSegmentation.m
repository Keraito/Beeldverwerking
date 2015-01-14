% NOTE: Be sure to load Trainingsvideo and characters_33x33.png in
% workspace
% License plate acquisition
vid = VideoReader('Trainingsvideo.avi');
frame = read(vid,100);
rgeheel = frame(:,:,1); ggeheel = frame(:,:,2); bgeheel = frame(:,:,3);
 a = dip_image((bgeheel<(160/180)*ggeheel - 20));
 b = label(a,Inf,1400,0);
 c = closing(b,8,'elliptic');
 result = uint8(frame*c);
 
 % Character segmentation
 licensePlate = result;
 smooth = medif(licensePlate,3,'elliptic'); % to remove noise
 % basic threshold to seperate characters from the backround
 % The tresholds have to be tweaked by taking more samples. Maybe one of
 % the color channels can be dropped as well. NOTE: Be sure d is mxnx1
 % matrix and not mxnx3. Labeling will fail otherwise.
 d = smooth(:,:,0) < 80 & smooth(:,:,1) < 80 & smooth(:,:,2) < 80; 
 %d = smooth(:,:) < 80;
 e = closing(~d,15,'elliptic'); 
 f = e & d; % this results in the characters as foreground objects.
 g = label(f,Inf,10,0);
 
 % Character matching
 % Measure min and max coordinates of the labeled objects.
 msr = measure(g,[],{'Minimum','Maximum'},[],Inf,0,0);
 % data layout: [ labelID  minimumX  maximumX  minimumY maximumY ]
 data = [ [msr.ID]' [msr.Minimum(1,:)]' [msr.Maximum(1,:)]' [msr.Minimum(2,:)]' [msr.Maximum(2,:)]' ];
 % Sort the matrix by ascending minimum X value, because we read the 
 % license plates from left to right.
 data = sortrows(data, 2); 
 
 % The order of the characters in the image is: A t/m Z 0 t/m 9 and -
 reference = imread('Reference.png');
 % begin x (note data in dip starts 0,0 matrix starts 1,1 so +1)
 lookup = [1 22 42 65 84 106 128 145 167 186 214 236 257 279 300 321 344 367 391 414 434 457 467 487 507 529 551 572 592 614 636];
 %bReference = rgb2gray(reference); %reference(:,:,1) + reference(:,:,2) + reference(:,:,3);
 dictionary = ['B' 'C' 'D' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'P' 'R' 'S' 'T' 'V' 'W' 'X' 'Y' 'Z' '0':'9'];
 n = data(:,1); % The order in which the labels should be viewed
 % NOTE: please remove for-loops!!!!!
 sample = uint8(~f); % ~f because the character should be black, background white as is our reference
 licensePlate = '';
 for i = 1:length(n)
     xRange = (data(i,2):data(i,3)) +1;
     yRange = (data(i,4):data(i,5)) +1;
     for j = 1:length(dictionary)
        refChar = rgb2gray(reference(1:33,lookup(j):lookup(j+1)-1,:));
        scaledSample = imresize(sample(yRange,xRange,:), size(refChar));
        correlations(j) = corr2(scaledSample, refChar);
     end
     correlations
     [max_value, index] = max(correlations);
     licensePlate = strcat(licensePlate, dictionary(index));
     % Unfortunately the following line won't work:
     %correlations = corr2(scaledSample, reference(1:33,char:char+32));
 end
 licensePlate