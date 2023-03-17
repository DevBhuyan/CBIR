%implementing the distance function

q_ip = imread('E:\Curious Dev B\MINI PROJECT\ORL all renamed tif\ORL all renamed tif\100.tif');
q = FTR_VECT_BUILD(q_ip);   %is the feature vector for the query image

dbase = csvread('E:\Curious Dev B\MINI PROJECT\ORL all renamed tif\ftr_db.csv');
for i = 1:size(dbase, 1)
    dist(i) = D1(q, dbase(i, :));
end

dist
srt = sort(dist);
srt