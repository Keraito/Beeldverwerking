% Extract a frame:
%
%[FILENAME, PATHNAME] = uigetfile(sprintf('%s/*.avi',strrep(mfilename('fullpath'),mfilename(),'')));
% Load the video object.
%video = VideoReader(sprintf('%s%s',PATHNAME,FILENAME));
%frame = read(video, 1);
%

% Create a scatterplot of License Plate and Background
%
background = imread('Trainingsvideo_Background1.jpg');
licensePlate = imread('Trainingsvideo_LicensePlate1.jpg');

% Put R G and B images in seperate variables for convenience.
Bsize = size(background);
Br = reshape(background(:,:,1), [1, Bsize(1) * Bsize(2)]);
Bg = reshape(background(:,:,2), [1, Bsize(1) * Bsize(2)]);
Bb = reshape(background(:,:,3), [1, Bsize(1) * Bsize(2)]);
Lsize = size(licensePlate);
Lr = reshape(licensePlate (:,:,1), [1, Lsize(1) * Lsize(2)]);
Lg = reshape(licensePlate (:,:,2), [1, Lsize(1) * Lsize(2)]);
Lb = reshape(licensePlate (:,:,3), [1, Lsize(1) * Lsize(2)]);

%scatter green vs blue
figure(1);
hold on
scatter(Bb, Bg, [], 'blue', '.', 'DisplayName', 'Background')
scatter(Lb, Lg, [], 'red', '.', 'DisplayName', 'Licenseplate')
xlabel('Blue');ylabel('Green');legend('show');title('Scatterplot Green versus Blue');
hold off

%scatter blue vs red
figure(2);
hold on
scatter(Br, Bb, [], 'blue', '.', 'DisplayName', 'Background')
scatter(Lr, Lb, [], 'red', '.', 'DisplayName', 'Licenseplate')
xlabel('Red');ylabel('Blue');legend('show');title('Scatterplot Blue versus Red');
hold off

%scatter green vs red
figure(3);
hold on
scatter(Br, Bg, [], 'blue', '.', 'DisplayName', 'Background')
scatter(Lr, Lg, [], 'red', '.', 'DisplayName', 'Licenseplate')
xlabel('Red');ylabel('Green');legend('show');title('Scatterplot Green versus Red');
hold off
%