% License plate acquisition
vid = VideoReader('Trainingsvideo.avi');
frame = read(vid,100);
rgeheel = frame(:,:,1); ggeheel = frame(:,:,2); bgeheel = frame(:,:,3);
 a = dip_image((bgeheel<(160/180)*ggeheel - 20));
 b = label(a,Inf,1400,0);
 c = closing(b,8,'elliptic');
 msr = measure(c,[],{'Minimum','Maximum'},1,Inf,0,0);
 result = uint8(frame*c);
 %result = result(msr.Minimum(2):msr.Maximum(2), msr.Minimum(1):msr.Maximum(1), :);
 %figure;image(result);
 
 % Character segmentation
 licensePlate = result;
 smooth = medif(licensePlate,3,'elliptic'); % to remove noise
 % basic threshold to seperate characters from the backround
 % The tresholds have to be tweaked by taking more samples. Maybe one of
 % the color channels can be dropped as well. NOTE: Be sure d is mxnx1
 % matrix and not mxnx3. Labeling will fail otherwise.
 d = smooth(:,:,0) < 80 & smooth(:,:,1) < 80 & smooth(:,:,2) < 80; 
 e = closing(~d,15,'elliptic');
 f = e & d; % this results in the characters as foreground objects.
 g = label(f);
 
 % Character matching
 % The order of the characters in the image is: A t/m Z 0 t/m 9 and -
 dictionary = imread('characters_33x33.png');
 character = 1;
 min = 1 + (character - 1) * 33;
 xRange = [min:1:min+32];
 yRange = [1:1:33];
 image(dictionary(yRange,xRange));
 % match segmented objects with the dictionary. 
 % use the correlation coefficient to determine the closest match between
 % object and character.

 
 % OLD SNIPPETS
 %sharp = smooth - (2 * laplace(smooth)); % to accentuate te difference between characters and background
 %binaryNumberPlate = sharp > 5 & sharp < 100 % create a binary image which shows the characters
 %seed = erosion(binaryNumberPlate,5,'elliptic');
 %mask = binaryNumberPlate;
 %characters = bpropagation(seed,binaryNumberPlate,Inf,1,0)