%We will create a function for the Local Binary Pattern
%f(x, y) is the zero-padded input image
%size of mask = 3x3

function lbp = LBP(f)
    lbp = zeros(size(f)-2);
    for x = 2:(size(f, 1)-1)
        for y = 2:(size(f, 2)-1)
            lbp(x-1, y-1) = lbp_val(x, y, f);
        end
    end
end


function lbp_out = lbp_val(x, y, f)
    lbp_bin = zeros(3, 3);
    exp_mat = [8, 4, 2;
               16, 0, 1;
               32, 64, 128];
    for i = 1:3
        for j = 1:3
            lbp_bin(i, j) = (f(x+i-2, y+j-2)>f(x, y)); 
        end
    end
    lbp_mat = exp_mat.*lbp_bin; 
    lbp_out = sum(sum(lbp_mat));
end


