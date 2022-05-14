%this patch will create GLCM feature vectors of the CSLBP, vectorize them,
%then store it in a single matrix to be processed [database part]
%forming for each dataset separately

folder = 'E:\Curious Dev B\MINI PROJECT\tcia - medical\'
filelist = dir(fullfile(folder, '*.png'));
for i= (height(readtable('E:\Curious Dev B\MINI PROJECT\tcia - medical\ftr_db.csv', 'ReadVariableNames', false))+1):numel(filelist)
    file = fullfile(folder, filelist(i).name)
    ip = imread(file);
    glcm_ftr =  FTR_VECT_BUILD(ip);
    dlmwrite('E:\Curious Dev B\MINI PROJECT\tcia - medical\ftr_db.csv', glcm_ftr, 'delimiter', ',', '-append')
end
