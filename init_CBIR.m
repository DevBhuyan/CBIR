%choose the query image at q_ip

folder = 'E:\Curious Dev B\MINI PROJECT\ORL all renamed tif\'
filelist = dir(fullfile(folder, '*.tif'));

%ORL all renamed tif\111.tif

q_ip = imread(strcat(folder, '211.tif'));
q = FTR_VECT_BUILD(q_ip);   %is the feature vector for the query image
q = q/100;

dbase = csvread(strcat(folder, 'ftr_db.csv'));
dbase = dbase./100;

dist = [];
for i = 1:size(dbase, 1)
    dist(i) = D1(q, dbase(i, :));
end

srt = sort(dist);
n = input('number of results you want to see : ');
for i = 1:n
    pos = find(dist == srt(i));
    file = fullfile(folder, filelist(pos).name)
    subplot(ceil(n/5), 5, i)
    imshow(imread(file))
end
