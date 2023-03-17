%this patch will create GLCM feature vectors of the CSLBP, vectorize them,
%then store it in a single matrix to be processed [database part]
%forming for each dataset separately

folder = 'E:\Curious Dev B\MINI PROJECT\Brodatz_database\'
filelist = dir(fullfile(folder, '*.tif'));
for i= (height(readtable('E:\Curious Dev B\MINI PROJECT\Brodatz_database\cslbp_ftr_db.csv', 'ReadVariableNames', false))+1):numel(filelist)
    file = fullfile(folder, filelist(i).name)
    ip = uint8(imread(file));
    [ct, gl] = imhist(uint8(CSLBP(ip)));
    cslbp_ftr = ct(1:16)';
    dlmwrite('E:\Curious Dev B\MINI PROJECT\Brodatz_database\cslbp_ftr_db.csv', cslbp_ftr, 'delimiter', ',', '-append')
end
