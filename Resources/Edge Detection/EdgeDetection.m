% Canny method:
% As mentioned in: http://www.csjournals.com/IJCSC/PDF2-2/Article%2057.pdf
a = imread('Trainingsvideo_frame1.jpg');

% canny only works on 2D images:
% So combine color channels with weights (approximately those from the
% paper)
a = a(:,:,1) * 0.3 + a(:,:,2) * 0.6 + a(:,:,3) * 0.1;
b = hist_equalize(a,[]); % as mentioned in the paper.
c = canny(b,2,0.5,0.9);
d = fillholes(c,1);

% Vertical edge detection:
% https://fedcsis.org/proceedings/2012/pliks/354.pdf
e = sobelf(a,2);
f = ~(e < 10)