clear; % clean workspace
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
 labels = segmentCharacters(result);
 
 % Character matching
 % Keep this outside matchCharacters, This has to be initialised at the
 % start of the program!!!
 % The order of the characters in the image is: A t/m Z 0 t/m 9 and -
 reference = imread('Reference.png');
 % begin x (note data in dip starts 0,0 matrix starts 1,1 so +1)
 lookup = [1 22 42 65 84 106 128 145 167 186 214 236 257 279 300 321 344 367 391 414 434 457 467 487 507 529 551 572 592 614 636];
 dictionary = ['B' 'C' 'D' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'P' 'R' 'S' 'T' 'V' 'W' 'X' 'Y' 'Z' '0':'9'];
 licensePlate = matchCharacters(labels, reference, lookup, dictionary)
 