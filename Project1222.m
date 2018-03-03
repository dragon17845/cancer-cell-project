
% [P,F] = uigetfile();
 F =  '/Users/TortugaTurley/Desktop/Engineering Final 122/';
 P =  'C0303384-Polyploid_giant_cancer_cell_.jpg';

filename = fullfile(F,P);

I = imread(filename);
imagesc(I)

Red = I(:,:,1);
imagesc(Red)
Green = I(:,:,2);
Blue = I(:,:,3);
imagesc([Red,Green,Blue])

%% Binarize Images 

bRed = Red>170;
bGreen = Green>130;
bBlue = Blue >100;
imagesc([bRed,bGreen,bBlue])

%% Imopen, Imclose 
bRed = imopen(bRed,strel('disk',1));

distRed = bwdist(bRed);
imagesc(distRed)
imagesc([bRed,mat2gray(distRed)])

dRedGreen = distRed;
dRedGreen(~bGreen) = 0;
imagesc([distRed,dRedGreen])


FR = getframe();

FR = FR.cdata;
imwrite(FR,'testout.jpg')

figure(2)

Red = I(:,:,1);
imagesc(Red)
Green = I(:,:,2);
Blue = I(:,:,3);
imagesc([Red,Green,Blue])

bRed = imopen(bRed,strel('disk',1));

distRed = bwdist(bRed);
imagesc(distRed)
imagesc([bRed,mat2gray(distRed)])

dGreenBlue=distRed;
dGreenBlue(~bBlue)=0;
imagesc([distRed,dGreenBlue])


