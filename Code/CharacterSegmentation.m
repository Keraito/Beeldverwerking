% NOTE: Be sure to load Trainingsvideo and characters_33x33.png in
% workspace
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
 % Measure min and max coordinates of the labeled objects.
 msr = measure(g,[],{'Minimum','Maximum'},[],Inf,0,0);
 % data layout: [ labelID  minimumX  maximumX  minimumY maximumY ]
 data = [ [msr.ID]' [msr.Minimum(1,:)]' [msr.Maximum(1,:)]' [msr.Minimum(2,:)]' [msr.Maximum(2,:)]' ];
 % Sort the matrix by ascending minimum X value, because we read the 
 % license plates from left to right.
 data = sortrows(data, 2); 
 
 % The order of the characters in the image is: A t/m Z 0 t/m 9 and -
 reference = imread('characters_33x33.png');
 dictionary = ['A':'Z' '0':'9' '-'];
 char = 1:33:1221; % there are 37 characters of 33px wide, hence 37*33 = 1221 is the maximum
 n = data(:,1); % The order in which the labels should be viewed
 %correlations = zeros(length(n));
 % NOTE: please remove for-loops!!!!! Otherwise for the actual program an
 % additional for loop is needed at the correlation part, because this is
 % just for 1 match.
 for i = 1:1%:length(n)
     xRange = data(i,2):data(i,3);
     yRange = data(i,4):data(i,5);
     sample = uint8(~f); % ~f because the character should be black, background white as is our reference
     scaledSample = imresize(sample(yRange,xRange), [33 33]);
     %NOTE: should not forget to make a binary image of reference!!!! now
     %only 1 of 3 color channels is used!!!
     z = 1;
     for j = char    
     correlations(z) = corr2(scaledSample, reference(1:33,j:j+32));
     z = z+1;
     end
     [max_value, index] = max(correlations);
     % Unfortunately the following line won't work:
     %correlations = corr2(scaledSample, reference(1:33,char:char+32));
 end
 %character = 1;
 %min = 1 + (character - 1) * 33;
 %xRange = [min:1:min+32];
 %yRange = [1:1:33];
 %image(reference(yRange,xRange));
 % match segmented objects with the dictionary. 
 % use the correlation coefficient to determine the closest match between
 % object and character.

 
 % OLD SNIPPETS
 %sharp = smooth - (2 * laplace(smooth)); % to accentuate te difference between characters and background
 %binaryNumberPlate = sharp > 5 & sharp < 100 % create a binary image which shows the characters
 %seed = erosion(binaryNumberPlate,5,'elliptic');
 %mask = binaryNumberPlate;
 %characters = bpropagation(seed,binaryNumberPlate,Inf,1,0)