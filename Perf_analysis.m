%for each query image at q_ip

folder = 'E:\Curious Dev B\MINI PROJECT\tcia - medical\'
filelist = dir(fullfile(folder, '*.png'));
dbase = csvread(strcat(folder, 'ftr_db.csv'));

%ORL all renamed tif\111.tif

for i=(height(readtable(strcat(folder, 'pos_db.csv'), 'ReadVariableNames', false))+1):size(filelist)
    q_ip = imread(strcat(folder, num2str(i), '.png'));
    q = FTR_VECT_BUILD(q_ip);   %is the feature vector for the query image

    dist = [];
    for j = 1:size(dbase, 1)
        dist(j) = D1(q, dbase(j, :));
    end

    file_num = [];
    srt = sort(dist);
    for j = 1:size(dbase, 1) 
        pos(i, j) = find(dist==srt(j)); %pos will also indicate file_pos numbers
        f_pos = str2num(filelist(pos(i, j)).name(1:size(filelist(pos(i, j)).name, 2)-4));
        file_num(j) = f_pos;
    end
    i
    dlmwrite(strcat(folder, 'pos_db.csv'), file_num, 'delimiter', ',', '-append')
end
