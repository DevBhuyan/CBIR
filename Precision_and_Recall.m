folder = 'E:\Curious Dev B\MINI PROJECT\ORL all renamed tif\'
pos_dbase = csvread(strcat(folder, 'pos_db_normalized.csv'));

%Brodatz_max = 70
%ORL_max = 10
%precision(n, i) = no. of relevant-retrieved/retrieved; n imgs ret; i is
%img number
%recall(n, i) = no. of rel-ret/rel

%these below are the averages for each category of images
%prec_avg(n, j) = (1/N)*sum(precision(n, i), from 1 to N)
%rec_avg(n, j) = (1/N)*sum(recall(n, i), from 1 to N)
%N is no of imgs in each categories; j is category no.

%these are the final values
%prec_tot(n) = (1/N2)*sum(prec_avg(n, j), from 1 to N2)
%rec_tot(n) = (1/N2)*sum(rec_avg(n, j), from 1 to N2)
%N2 is total no of categories in the database

%first build for 10 imgs

precision = [];
recall = [];
prec_avg = [];
rec_avg = [];
prec_tot = [];
rec_tot = [];
rel = 10;   %25 for brodatz
for ret = 1:10
    for i = 1:size(pos_dbase, 1)
        rel_ret = 0;
        cat = ceil(i/rel);
        for j = 1:ret
            if ceil(pos_dbase(i, j)/rel) == cat
                rel_ret = rel_ret+1;
            end
        end
        precision(ret, i) = rel_ret/ret;
        recall(ret, i) = rel_ret/rel;
    end

    for cat = 1:size(pos_dbase, 1)/rel
        sum = 0;
        sum2 = 0;
        for i = 1:rel
            sum = sum + precision(ret, (cat-1)*rel+i);
            sum2 = sum2 + recall(ret, (cat-1)*rel+i);
        end
        prec_avg(ret, cat) = sum/rel;
        rec_avg(ret, cat) = sum2/rel;
    end

    sum = 0;
    sum2 = 0;
    for cat = 1:size(pos_dbase, 1)/rel
        sum = sum + prec_avg(ret, cat);
        sum2 = sum2 + rec_avg(ret, cat);
    end

    prec_tot(ret) = sum/(size(pos_dbase, 1)/rel);
    rec_tot(ret) = sum2/(size(pos_dbase, 1)/rel);
end

index = 1:10;
dlmwrite(strcat(folder, 'precision and recall vs imgs retrieved.csv'), index)
dlmwrite(strcat(folder, 'precision and recall vs imgs retrieved.csv'), prec_tot, 'delimiter', ',', '-append')
dlmwrite(strcat(folder, 'precision and recall vs imgs retrieved.csv'), rec_tot, 'delimiter', ',', '-append')
