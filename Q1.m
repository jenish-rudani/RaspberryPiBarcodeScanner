bernieImageFileName = "Bernie1.pgm";
harborImageFileName = "Harbor1.pgm";


fileID = fopen(bernieImageFileName, 'r');


% Looking for magic number to indentify ASCII or Binary Coding
[ str, count ] = fscanf( fileID, '%s', 1 );

if count==1
  disp("Found Magic Number : "+ str)
end
ftell(fileID)

imageSpecs = fscanf( fileID, '%d %d %d', 3);
ftell(fileID)

columns = imageSpecs(1);
rows = imageSpecs(2);
maxBrightness = imageSpecs(3);

pixels = rows*columns;                     % Number of pixels in image.


[ data, count ] = fread( fileID, pixels, 'uint8' );

X = zeros( columns, rows );     % Initialize intensity matrix.
X(1:count) = data;           % Fill read data into matrix.
X = X'/maxBrightness;               % Map values to [0,1] interval.

imshow(X)


% A = fread(fileID,8,'uint8','ieee-be');
% 
% imageUsingImRead = imread(bernieImageFileName);
% % imshow(imageUsingImRead)
fclose(fileID);
% % imshow(imageUsingImRead)