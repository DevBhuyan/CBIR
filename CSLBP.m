%function for CSLBP

function cslbp = CSLBP(f)
    cslbp = zeros(size(f)-2);
    for x = 2:(size(f, 1)-1)
        for y = 2:(size(f, 2)-1)
            cslbp(x-1, y-1) = cslbp_val(x, y, f);
        end
    end
end

function cslbp_out = cslbp_val(x, y, f)
    cslbp_bin = zeros(3, 3);
    exp_mat = [8, 4, 2;
               16, 0, 1;
               32, 64, 128];

    cslbp_bin(1, 1) = (f(x-2+1, y-2+1)>f(x+2-1, y+2-1));
    cslbp_bin(1, 2) = (f(x-2+1, y-2+2)>f(x+2-1, y+2-2));
    cslbp_bin(1, 3) = (f(x-2+1, y-2+3)>f(x+2-1, y+2-3));
    cslbp_bin(2, 3) = (f(x-2+2, y-2+3)>f(x+2-2, y+2-3));
    cslbp_mat = exp_mat.*cslbp_bin; 
    cslbp_out = sum(sum(cslbp_mat));
end