% Extract a frame:
%[FILENAME, PATHNAME] = uigetfile(sprintf('%s/*.avi',strrep(mfilename('fullpath'),mfilename(),'')));
% Load the video object.
%video = VideoReader(sprintf('%s%s',PATHNAME,FILENAME));
%frame = read(video, 1);

% Create a scatterplot of License Plate and Background
background = imread('Trainingsvideo_Background1.jpg');
licensePlate = imread('Trainingvideo_LicensePlate1.jpg');

% Put R G and B images in seperate variables for convenience.
Br = reshape(background(:,:,1);
Bg = background(:,:,2);
Bb = background(:,:,3);
Lr = licensePlate (:,:,1);
Lg = licensePlate (:,:,2);
Lb = licensePlate (:,:,3);

%scatter green vs blue
figure(1);
hold on
scatter(reshape(Bb, [1,100*100]), reshape(background(:,:,2), [1,100*100]), [], 'blue', '.', 'DisplayName', 'Background')
scatter(reshape(green_apple(:,:,3), [1,100*100]), reshape(green_apple(:,:,2), [1,100*100]),'green', '.', 'DisplayName', 'Green Apple')