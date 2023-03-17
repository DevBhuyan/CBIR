folder = 'E:\Curious Dev B\MINI PROJECT\ORL all renamed tif\'
filelist = dir(fullfile(folder, '*.tif'));
dbase = csvread(strcat(folder, 'ftr_db.csv'));
dbh = size(dbase, 1);

norm = 100;
dbase = dbase./norm;
file_num = [];

for i=(height(readtable(strcat(folder, 'pos_db_normalized.csv'), 'ReadVariableNames', false))+1):dbh
    for ps = 1:dbh
        if(str2num(filelist(ps).name(1:size(filelist(ps).name, 2)-4)) == i)
            q = dbase(ps, :);
            break;
        end
    end
    
    dist = [];
    for j = 1:dbh
        dist(j) = D1(q, dbase(j, :));
    end

    srt = sort(dist);
    for j = 1:70 
        pos(i, j) = find(dist==srt(j)); %pos will also indicate position in database
        f_pos = str2num(filelist(pos(i, j)).name(1:size(filelist(pos(i, j)).name, 2)-4));
        file_num(i, j) = f_pos;
    end
    i
    dlmwrite(strcat(folder, 'pos_db_normalized.csv'), file_num(i, :), 'delimiter', ',', '-append')
end
